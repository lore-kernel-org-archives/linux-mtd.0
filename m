Received: from [203.134.126.54] (helo=mimesweeper.securenet.com.au)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 171zUr-0006Ca-00
	for <linux-mtd@lists.infradead.org>; Mon, 29 Apr 2002 01:58:30 +0100
Received: from AMALTHEA.securenet.com.au (unverified) by mimesweeper.securenet.com.au
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T5a8dc94fa2c0a8655038c@mimesweeper.securenet.com.au> for <linux-mtd@lists.infradead.org>;
 Mon, 29 Apr 2002 10:57:17 +1000
Message-ID: <3CCC9A64.87F68E3@securenet.com.au>
Date: Mon, 29 Apr 2002 10:57:08 +1000
From: John Weston <jweston@securenet.com.au>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Booting from /dev/mtdblock/0
References: <3CC862ED.5030007@yottayotta.com>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------msBADF7C472E296862597832DF"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a cryptographically signed message in MIME format.

--------------msBADF7C472E296862597832DF
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

G'day,

Have not got to the bottom of this yet, but having the same problem. We had
a development board which worked fine using kernel version 2.4.3 but since
updating to 2.4.18 we are now seeing the same problem.

Does anyone know of any required patches for this?

Thanks

John Weston



Mutada Shah wrote:

> Hi,
>
> I'm trying to boot from /dev/mtdblock/0 (root=/dev/mtdblock/0 in cmdline
> options)
>
> When I boot from nfs, I can mount /dev/mtdblock/0 no problem from
> command line & unmount etc.
>
> But if I pass it as the root= option, while booting it gets stuck.
>
> With mtd debug level to 3 I see that it tries mtdblock_open twice...
> which it shouldnt..
>
> "mtdblock_open
> ok
> mtdblock_open
> mtdblock_release"
>
> Then it hangs here for a long time.
> What could be the cause?
>
> Murtada
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--------------msBADF7C472E296862597832DF
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIEXgYJKoZIhvcNAQcCoIIETzCCBEsCAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEHAaCC
ApgwggKUMIIBfKADAgECAgQF9eSxMA0GCSqGSIb3DQEBBAUAMCwxCzAJBgNVBAYTAmF1MR0w
GwYDVQQKExRTZWN1cmVOZXQgQ0EgQ2xhc3MgQjAmFxEwMTExMTUwMDAwMDArMTAwMBcRMDMx
MTE1MjM1OTU5KzEwMDAwaDELMAkGA1UEBhMCYXUxGjAYBgNVBAoTEVNlY3VyZU5ldCBMaW1p
dGVkMRQwEgYDVQQDEwtKb2huIFdlc3RvbjEnMCUGCSqGSIb3DQEJARMYandlc3RvbkBzZWN1
cmVuZXQuY29tLmF1MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvKX59ciAb54MqREhq
9kRQqJHuy06elXkVRJbTOB6BIZ7/WJZac114jU7di99N609ZZgg3A0IcCc9ttRQRsi74ZK+g
dTHgv9wva6zhSrs2nRnDavGLOc3jwPEpZNtFNJrvoceKFZcrWLhNXujAjUrQh1GupQKSfnkV
3ifV2HHOiQIDAQABMA0GCSqGSIb3DQEBBAUAA4IBAQBz6zxBJgvnujFV4cdMEb0w0GIzmonO
8zu57V/FUhOGU9ggCy3OXJg/aX2nqNRVZfVJJ1kAp18ZxIzIeD+MymncLHj1Axw/B5K0odJJ
JdP/qoB0IkunIYqnBLU9u4mfu90bE6zxDT+LmN7yZAVBC+V6ZSAJuupPBTEySbDIksKWIlOJ
5iCwAMX8QGnBFu/KUtbjJiM7gemdixU0A9N3PttzxjKqI25C/pz1Lx1leOKj+3TO0fMyF5xp
vTi0H1Qgjh8GTUazpShtnAVuygtgVafzVnOUwTFsCYi7Yr7UlW3AVsMBEjUMaEqvzMX+nPNc
G5yCwlSnifnxpyRqUTu1TpblMYIBjjCCAYoCAQEwNDAsMQswCQYDVQQGEwJhdTEdMBsGA1UE
ChMUU2VjdXJlTmV0IENBIENsYXNzIEICBAX15LEwCQYFKw4DAhoFAKCBsTAYBgkqhkiG9w0B
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wMjA0MjkwMDU3MDlaMCMGCSqGSIb3
DQEJBDEWBBT1rHWZRiVtPf2brYSYiMGBV4j8jTBSBgkqhkiG9w0BCQ8xRTBDMAoGCCqGSIb3
DQMHMA4GCCqGSIb3DQMCAgIAgDAHBgUrDgMCBzANBggqhkiG9w0DAgIBQDANBggqhkiG9w0D
AgIBKDANBgkqhkiG9w0BAQEFAASBgAnt6fjFbWbFo2uAe6y94l6lHFuH9JO5m+UdFWjPVf6X
SE0FAL4dxTMhiWe4AHP5HjyQbP5gHR3DoMheah/VurjoRqxFFSrtawdoXzGYIaC/Sf7JKLsC
sjxcBOESYTNDCnn7s5LN4hLucXQtqbOTsdb9AwFjqzsiRvCtB4yJgwkL
--------------msBADF7C472E296862597832DF--
