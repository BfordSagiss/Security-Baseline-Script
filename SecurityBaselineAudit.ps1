######################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################

#Connect 365 Services
Connect-AzureAD
Connect-ExchangeOnline
Connect-MsolService

#Deletes any existing txt files that might conflict with this script
If (test-path -path C:\cabs\securitybaseline*.txt) {Remove-Item C:\cabs\securitybaseline*.txt}

"-------------------------Organization Config-------------------------" | out-file C:\cabs\securitybaseline1.txt 
Get-OrganizationConfig|FL publicfoldersenabled,ActivityBasedAuthenticationTimeoutEnabled,ActivityBasedAuthenticationTimeoutWithSingleSignOnEnabled,ActivityBasedAuthenticationTimeoutInterval,MaskClientIpInReceivedHeadersEnabled,IPListBlocked,ExternalCloudAccessEnabled,PublicComputersDetectionEnabled,IntuneManagedStatus,AzurePremiumSubscriptionStatus,MapiHttpEnabled,RealTimeLogServiceEnabled,OAuth2ClientProfileEnabled,ConnectorsEnabled,AuditDisabled,AutoEnableArchiveMailbox,SendFromAliasEnabled,BasicAuthBlockedApps,IsMailboxForcedReplicationDisabled,MailboxDataEncryptionEnabled,DefaultAuthenticationPolicy|out-file C:\cabs\securitybaseline1.txt -Append

"--------------------------Transport Config---------------------------" | out-file C:\cabs\securitybaseline2.txt
Get-TransportConfig |FL SmtpClientAuthenticationDisabled,JournalArchivingEnabled,VoicemailJournalingEnabled,VerifySecureSubmitEnabled,LegacyArchiveJournalingEnabled,AddressBookPolicyRoutingEnabled|out-file C:\cabs\securitybaseline2.txt -Append

"-------------------------AntiPhishing Policy-------------------------" | out-file C:\cabs\securitybaseline3.txt
Get-AntiPhishPolicy |FL Identity,IsValid,IsDefault,EnableSpoofIntelligence,EnableUnauthenticatedSender | out-file C:\cabs\securitybaseline3.txt -Append

"------------------------Admin Audit Log Config-----------------------" | out-file C:\cabs\securitybaseline4.txt
Get-AdminAuditLogConfig|FL AdminAuditLogEnabled,AdminAuditLogAgeLimit | out-file C:\cabs\securitybaseline4.txt -Append

"-------------------Azure ADMS Authorization Policy-------------------" | out-file C:\cabs\securitybaseline5.txt
Get-AzureADMSAuthorizationPolicy |FL DefaultUserRolePermissions,AllowEmailVerifiedUsersToJoinOrganization | out-file C:\cabs\securitybaseline5.txt -append

"---------------------Conditional Access Policies---------------------" | out-file C:\cabs\securitybaseline6.txt
Get-AzureADMSConditionalAccessPolicy |FT displayname,state | out-file C:\cabs\securitybaseline6.txt -append

"--------------------------IRM Configuration--------------------------" | out-file C:\cabs\securitybaseline7.txt
Get-IRMConfiguration |FL EDiscoverySuperUserEnabled,SearchEnabled,ClientAccessServerEnabled,TransportDecryptionSetting | out-file C:\cabs\securitybaseline7.txt -Append

"----------------------Device Registration Policy---------------------" | out-file C:\cabs\securitybaseline8.txt
Get-MsolDeviceRegistrationServicePolicy |FL| out-file C:\cabs\securitybaseline8.txt -append

"-----------------------MSOL Company Information----------------------" | out-file C:\cabs\securitybaseline9.txt
Get-MsolCompanyInformation |FL TechnicalNotificationEmails,SelfServePasswordResetEnabled,UsersPermissionToCreateGroupsEnabled,UsersPermissionToCreateLOBAppsEnabled,UsersPermissionToReadOtherUsersEnabled,UsersPermissionToUserConsentToAppEnabled,DirectorySynchronizationEnabled | out-file C:\cabs\securitybaseline9.txt -append

#Full Report no filtering #################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################
If (test-path -path C:\cabs\baselineFull*.txt) {Remove-Item C:\cabs\baselineFull*.txt}

"----------------------------Organization Config----------------------------" | out-file C:\cabs\baselinefull1.txt 
Get-OrganizationConfig|FL|out-file C:\cabs\baselinefull1.txt -Append

"-----------------------------Transport Config------------------------------" | out-file C:\cabs\baselinefull2.txt
Get-TransportConfig |FL|out-file C:\cabs\baselinefull2.txt -Append

"----------------------------AntiPhishing Policy----------------------------" | out-file C:\cabs\baselinefull3.txt
Get-AntiPhishPolicy |FL| out-file C:\cabs\baselinefull3.txt -Append

"---------------------------Admin Audit Log Config--------------------------" | out-file C:\cabs\baselinefull4.txt
Get-AdminAuditLogConfig|FL| out-file C:\cabs\baselinefull4.txt -Append

"----------------------Azure ADMS Authorization Policy----------------------" | out-file C:\cabs\baselinefull5.txt
Get-AzureADMSAuthorizationPolicy |FL| out-file C:\cabs\baselinefull5.txt -append

"------------------------Conditional Access Policies------------------------" | out-file C:\cabs\baselinefull6.txt
Get-AzureADMSConditionalAccessPolicy |FT| out-file C:\cabs\baselinefull6.txt -append

"-----------------------------IRM Configuration-----------------------------" | out-file C:\cabs\baselinefull7.txt
Get-IRMConfiguration |FL| out-file C:\cabs\baselinefull7.txt -Append

"-------------------------Device Registration Policy------------------------" | out-file C:\cabs\baselinefull8.txt
Get-MsolDeviceRegistrationServicePolicy |FL| out-file C:\cabs\baselinefull8.txt -append

"-------------------------MSOL Company Information--------------------------" | out-file C:\cabs\baselinefull9.txt
Get-MsolCompanyInformation |FL|out-file C:\cabs\baselinefull9.txt -append

"--------------------------Audit Config-------------------------------------" | out-file C:\cabs\baselinefull10.txt
Get-AuditConfig |FL|out-file C:\cabs\baselinefull10.txt -append

"----------------------ActiveSync Organization Settings---------------------" | out-file C:\cabs\baselinefull11.txt
Get-ActiveSyncOrganizationSettings|FL|out-file C:\cabs\baselinefull11.txt -append

"--------------------------Sync Config--------------------------------------" | out-file C:\cabs\baselinefull12.txt
Get-SyncConfig|FL|out-file C:\cabs\baselinefull12.txt -append

"--------------------------Smime Config-------------------------------------" | out-file C:\cabs\baselinefull13.txt
Get-SmimeConfig|FL|out-file C:\cabs\baselinefull13.txt -append

"-------------------------Policy Config-------------------------------------" | out-file C:\cabs\baselinefull14.txt
Get-PolicyConfig|FL|out-file C:\cabs\baselinefull14.txt -append

"--------------------------Azure ADMS Applications--------------------------" | out-file C:\cabs\baselinefull15.txt
Get-AzureADMSApplication|FL|out-file C:\cabs\baselinefull15.txt -append

GC C:\cabs\securitybaseline*.txt |out-file C:\cabs\CloudSecurityAuditLog.txt
GC C:\cabs\baselinefull*.txt |out-file C:\cabs\CloudSecurityAuditLogFull.txt
Remove-Item C:\cabs\securitybaseline*.txt
Remove-item C:\cabs\baselinefull*.txt

######################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################

