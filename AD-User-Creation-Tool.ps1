# Create the form
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Create New AD User"
$Form.Size = New-Object System.Drawing.Size(400, 300)
$Form.StartPosition = "CenterScreen"
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$Form.MaximizeBox = $false
$Form.MinimizeBox = $false

# Define the labels
$FirstNameLabel = New-Object System.Windows.Forms.Label
$FirstNameLabel.Location = New-Object System.Drawing.Point(20, 20)
$FirstNameLabel.Size = New-Object System.Drawing.Size(100, 20)
$FirstNameLabel.Text = "First Name:"
$Form.Controls.Add($FirstNameLabel)

$LastNameLabel = New-Object System.Windows.Forms.Label
$LastNameLabel.Location = New-Object System.Drawing.Point(20, 50)
$LastNameLabel.Size = New-Object System.Drawing.Size(100, 20)
$LastNameLabel.Text = "Last Name:"
$Form.Controls.Add($LastNameLabel)

$JobTitleLabel = New-Object System.Windows.Forms.Label
$JobTitleLabel.Location = New-Object System.Drawing.Point(20, 80)
$JobTitleLabel.Size = New-Object System.Drawing.Size(100, 20)
$JobTitleLabel.Text = "Job Title:"
$Form.Controls.Add($JobTitleLabel)

$OrganizationLabel = New-Object System.Windows.Forms.Label
$OrganizationLabel.Location = New-Object System.Drawing.Point(20, 110)
$OrganizationLabel.Size = New-Object System.Drawing.Size(100, 20)
$OrganizationLabel.Text = "Organization:"
$Form.Controls.Add($OrganizationLabel)

$PasswordLabel = New-Object System.Windows.Forms.Label
$PasswordLabel.Location = New-Object System.Drawing.Point(20, 140)
$PasswordLabel.Size = New-Object System.Drawing.Size(100, 20)
$PasswordLabel.Text = "Password:"
$Form.Controls.Add($PasswordLabel)

$ConfirmPasswordLabel = New-Object System.Windows.Forms.Label
$ConfirmPasswordLabel.Location = New-Object System.Drawing.Point(20, 170)
$ConfirmPasswordLabel.Size = New-Object System.Drawing.Size(100, 20)
$ConfirmPasswordLabel.Text = "Confirm Password:"
$Form.Controls.Add($ConfirmPasswordLabel)

# Define the textboxes and comboboxes
$FirstNameTextbox = New-Object System.Windows.Forms.TextBox
$FirstNameTextbox.Location = New-Object System.Drawing.Point(130, 20)
$FirstNameTextbox.Size = New-Object System.Drawing.Size(200, 20)
$Form.Controls.Add($FirstNameTextbox)

$LastNameTextbox = New-Object System.Windows.Forms.TextBox
$LastNameTextbox.Location = New-Object System.Drawing.Point(130, 50)
$LastNameTextbox.Size = New-Object System.Drawing.Size(200, 20)
$Form.Controls.Add($LastNameTextbox)

$JobTitleCombobox = New-Object System.Windows.Forms.ComboBox
$JobTitleCombobox.Location = New-Object System.Drawing.Point(130, 80)
$JobTitleCombobox.Size = New-Object System.Drawing.Size(200, 20)
$JobTitleCombobox.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$JobTitleCombobox.Items.AddRange(@("Manager", "Developer", "IT Specialist", "Sales Representative"))
$Form.Controls.Add($JobTitleCombobox)

$OrganizationCombobox = New-Object System.Windows.Forms.ComboBox
$OrganizationCombobox.Location = New-Object System.Drawing.Point(130, 110)
$OrganizationCombobox.Size = New-Object System.Drawing.Size(200, 20)
$OrganizationCombobox.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$OrganizationCombobox.Items.AddRange(@("IT Department", "Sales Department", "Marketing Department", "Human Resources Department"))
$Form.Controls.Add($OrganizationCombobox)

$PasswordTextbox = New-Object System.Windows.Forms.TextBox
$PasswordTextbox.Location = New-Object System.Drawing.Point(130, 140)
$PasswordTextbox.Size = New-Object System.Drawing.Size(200, 20)
$PasswordTextbox.PasswordChar = '*'
$Form.Controls.Add($PasswordTextbox)

$ConfirmPasswordTextbox = New-Object System.Windows.Forms.TextBox
$ConfirmPasswordTextbox.Location = New-Object System.Drawing.Point(130, 170)
$ConfirmPasswordTextbox.Size = New-Object System.Drawing.Size(200, 20)
$ConfirmPasswordTextbox.PasswordChar = '*'
$Form.Controls.Add($ConfirmPasswordTextbox)

# Define the OK and Cancel buttons
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(150, 220)
$OKButton.Size = New-Object System.Drawing.Size(80, 25)
$OKButton.Text = "OK"
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(240, 220)
$CancelButton.Size = New-Object System.Drawing.Size(80, 25)
$CancelButton.Text = "Cancel"
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$Form.Controls.Add($CancelButton)

# Set the default button to OK
$Form.AcceptButton = $OKButton

# Show the form
$Form.ShowDialog() | Out-Null

# Get the values entered by the user
if ($Form.DialogResult -eq [System.Windows.Forms.DialogResult]::OK)
{
    $FirstName = $FirstNameTextbox.Text
    $LastName = $LastNameTextbox.Text
    $JobTitle = $JobTitleCombobox.SelectedItem
    $Organization = $OrganizationCombobox.SelectedItem
    $Password = $PasswordTextbox.Text
    $ConfirmPassword = $ConfirmPasswordTextbox.Text

    # Check if passwords match
    if ($Password -ne $ConfirmPassword)
    {
        [System.Windows.Forms.MessageBox]::Show("Passwords do not match. Please try again.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error) | Out-Null
        exit
    }
}
