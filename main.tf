terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "ganesha87"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "oktaGrpMgmt"
    }
  }
  
  required_providers {
    okta = {
      source = "okta/okta"
      version = "~> 3.40"
    }
  }
}

resource "okta_group_rule" "Approvers-AWS-Shadow-Group-Membership" {
  name              = "Approvers-AWS-Shadow-Group-Membership"
  status            = "ACTIVE"
  group_assignments = ["00g80na5mivZs5mwQ5d7"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "user.division==\"Developers\" AND user.department==\"Engineering\" AND isMemberOfAnyGroup(\"00g80o66wsa2rCK5z5d7\")"
}
resource "okta_group_rule" "Developers-Shadow-AWS-Group-Membership" {
  name              = "Developers-Shadow-AWS-Group-Membership"
  status            = "ACTIVE"
  group_assignments = ["00g80na5mivZs5mwQ5d7"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "user.division==\"Developers\" AND user.department==\"Engineering\" AND isMemberOfAnyGroup(\"00g80o66wsa2rCK5z5d7\")"
}
resource "okta_group_rule" "Engineering-Team-Membership" {
  name              = "Engineering Team Membership"
  status            = "ACTIVE"
  group_assignments = ["00g80o66wsa2rCK5z5d7"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "user.department==\"Engineering\""
}
resource "okta_group_rule" "Engineering-Admins-AWS-Shadow-Group-Membership" {
  name              = "Engineering-Admins-AWS-Shadow-Group-Membership"
  status            = "ACTIVE"
  group_assignments = ["00g80ome3zI84xO6d5d7"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "user.department==\"Engineering\" AND user.userType==\"manager\""
}
resource "okta_group_rule" "Engineering-Powerusers-AWS-Shadow-Group-Membership" {
  name              = "Engineering-Powerusers-AWS-Shadow-Group-Membership"
  status            = "ACTIVE"
  group_assignments = ["00g80oq2jtIIvdWzu5d7"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "user.costCenter==\"l2\" AND user.department==\"Engineering\""
}
resource "okta_group_rule" "Operations-Group-Membership" {
  name              = "Operations-Group-Membership"
  status            = "ACTIVE"
  group_assignments = ["00g80n8l6gMFvO4UL5d7"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "user.department==\"Operations\""
}
resource "okta_group_rule" "Pay-Admins-AWS-Shadow-group-Membership-Management" {
  name              = "Pay Admins AWS Shadow group Membership Management"
  status            = "ACTIVE"
  group_assignments = ["00g814tnjtXF8OnQW5d7"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "isMemberOfAnyGroup(\"00g814t0shQjXRlwm5d7\") AND user.userType == \"manager\""
}
resource "okta_group_rule" "Pay-Auditors-Group-Membership-Management" {
  name              = "Pay Auditors Group Membership Management"
  status            = "ACTIVE"
  group_assignments = ["00g814tgcd4raP6IR5d7"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "user.division==\"Audit\" AND isMemberOfAnyGroup(\"00g814t0shQjXRlwm5d7\") "
}
resource "okta_group_rule" "Pay-Powerusers-AWS-Shadow-Group-Members-management" {
  name              = "Pay Powerusers AWS Shadow Group Members management"
  status            = "ACTIVE"
  group_assignments = ["00g814xogmjSFWzWv5d7"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "isMemberOfAnyGroup(\"00g814t0shQjXRlwm5d7\") and costCenter == \"l2\""
}
resource "okta_group_rule" "Pay-Team-Group-Membership-management" {
  name              = "Pay Team Group Membership management"
  status            = "ACTIVE"
  group_assignments = ["00g814t0shQjXRlwm5d7"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "user.department==\"Pay\""
}

resource "okta_group_rule" "Research-AWS-Shadow-Group-Membership" {
  name              = "Research-AWS-Shadow-Group-Membership"
  status            = "ACTIVE"
  group_assignments = ["00g80n99lmFtH7CGz5d7"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "user.division==\"Research\" AND user.department==\"Engineering\""
}
resource "okta_group_rule" "Rule-Test" {
  name              = "Rule-Test"
  status            = "INACTIVE"
  group_assignments = ["00g80ome3zI84xO6d5d7"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "isMemberOfAnyGroup(\"00g80o66wsa2rCK5z5d7\",\"00g80n8l6gMFvO4UL5d7\")"
}

resource "okta_group_rule" "Test-Shadow-AWS-Group-Membership"{
  name              = "Test-Shadow-AWS-Group-Membership"
  group_assignments = ["00g80oxv2bTl0XYnT5d7"]
  expression_value  = "user.division==\"Approvers\" AND user.department==\"Pay\""
  status            = "ACTIVE"
  expression_type   = "urn:okta:expression:1.0"
}

resource "okta_group_rule" "Testers-Shadow-AWS-Group-Membership"{
  name              = "Testers-Shadow-AWS-Group-Membership"
  group_assignments = ["00g80n8p061TuyZc25d7"]
  expression_value  = "user.division==\"Testers\" AND user.department==\"Engineering\" AND isMemberOfAnyGroup(\"00g80o66wsa2rCK5z5d7\") "
  status            = "ACTIVE"
  expression_type   = "urn:okta:expression:1.0"
}

resource "okta_group_rule" "Preview-Shadow-AWS-Group-Membership"{
  name              = "Preview-Shadow-AWS-Group-Membership"
  group_assignments = ["00g80n8p061TuyZc25d7"]
  expression_value  = "user.division==\"Preview\" AND user.department==\"Engineering\" AND isMemberOfAnyGroup(\"00g80o66wsa2rCK5z5d7\") "
  status            = "ACTIVE"
  expression_type   = "urn:okta:expression:1.0"
}
