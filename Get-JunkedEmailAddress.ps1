﻿Get-Mailbox | Get-MailboxJunkEmailConfiguration | Where-Object {$_.BlockedSendersAndDomains -match "email@beingjunked.com"}