Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IaXau-0004L5-Et
	for linux-mtd@lists.infradead.org; Wed, 26 Sep 2007 10:10:35 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e4.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l8QEANW3006077
	for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2007 10:10:24 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.5) with ESMTP id
	l8QEAOaN555408
	for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2007 10:10:24 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l8QEANYa011940
	for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2007 10:10:23 -0400
Subject: [PATCH] MTD: NAND: Fix bad-block detection for 8-bit NAND
From: Frank Haverkamp <haver@vnet.ibm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-VtLTg979yECvux0RM4l7"
Date: Wed, 26 Sep 2007 16:10:23 +0200
Message-Id: <1190815823.21594.30.camel@august>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, haver@vnet.ibm.com,
	MTD Mailinglist <linux-mtd@lists.infradead.org>
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-VtLTg979yECvux0RM4l7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

I found the following block in our 128MiB NAND flash:

hexdump vic.img.460=20
0000000 0000 0000 0000 0000 0000 0000 0000 0000
*
0000800 00ff 0000 0000 0000 0000 0000 0000 0000
0000810 0000 0000 0000 0000 0000 0000 0000 0000
*
0001040 00ff 0000 0000 0000 0000 0000 0000 0000
0001050 0000 0000 0000 0000 0000 0000 0000 0000
*
0021000

According to the specification this is a good block, because the bytes
in the 1st two OOB areas at offset 0 are 0xff. Nevertheless it was
detected bad because:

static struct nand_bbt_descr largepage_memorybased =3D {
	.options =3D 0,
	.offs =3D 0,
	.len =3D 2,                    /* <<<< bytes to check!!! */
	.pattern =3D scan_ff_pattern
};

used a len of 2 instead of 1, which I consider to be correct. Here a
potential fix for the problem. Please have a look if it matches your
understanding of the specification.

Signed-off-by: Frank Haverkamp <haver@vnet.ibm.com>
---
 drivers/mtd/nand/nand_bbt.c |   20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

--- ubi-2.6.git.orig/drivers/mtd/nand/nand_bbt.c
+++ ubi-2.6.git/drivers/mtd/nand/nand_bbt.c
@@ -1081,7 +1081,14 @@ static struct nand_bbt_descr smallpage_m
 	.pattern =3D scan_ff_pattern
 };
=20
-static struct nand_bbt_descr largepage_memorybased =3D {
+static struct nand_bbt_descr largepage_memorybased_8bit =3D {
+	.options =3D 0,
+	.offs =3D 0,
+	.len =3D 1,
+	.pattern =3D scan_ff_pattern
+};
+
+static struct nand_bbt_descr largepage_memorybased_16bit =3D {
 	.options =3D 0,
 	.offs =3D 0,
 	.len =3D 2,
@@ -1179,8 +1186,15 @@ int nand_default_bbt(struct mtd_info *mt
 		this->bbt_td =3D NULL;
 		this->bbt_md =3D NULL;
 		if (!this->badblock_pattern) {
-			this->badblock_pattern =3D (mtd->writesize > 512) ?
-			    &largepage_memorybased : &smallpage_memorybased;
+			if (mtd->writesize > 512) {
+				if (this->options & NAND_BUSWIDTH_16)
+					this->badblock_pattern =3D
+						&largepage_memorybased_16bit;
+				else
+					this->badblock_pattern =3D
+					       &largepage_memorybased_8bit;
+			} else
+				this->badblock_pattern =3D &smallpage_memorybased;
 		}
 	}
 	return nand_scan_bbt(mtd, this->badblock_pattern);


--=-VtLTg979yECvux0RM4l7
Content-Type: application/x-pkcs7-signature; name=smime.p7s
Content-Disposition: attachment; filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIP9DCCBSww
ggSVoAMCAQICEDqcN60eyFMWG0XIVQBLNZgwDQYJKoZIhvcNAQEFBQAwgcExCzAJBgNVBAYTAlVT
MRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjE8MDoGA1UECxMzQ2xhc3MgMiBQdWJsaWMgUHJpbWFy
eSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eSAtIEcyMTowOAYDVQQLEzEoYykgMTk5OCBWZXJpU2ln
biwgSW5jLiAtIEZvciBhdXRob3JpemVkIHVzZSBvbmx5MR8wHQYDVQQLExZWZXJpU2lnbiBUcnVz
dCBOZXR3b3JrMB4XDTAzMDUwNjAwMDAwMFoXDTEzMDUwNTIzNTk1OVowgfkxCzAJBgNVBAYTAlVT
MTQwMgYDVQQKEytJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzIENvcnBvcmF0aW9uMR8w
HQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMTswOQYDVQQLEzJUZXJtcyBvZiB1c2UgYXQg
aHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYSAoYykwMzEwMC4GA1UECxMnQ2xhc3MgMiBPblNp
dGUgSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMSQwIgYDVQQDExtJQk0gQ2VydGlmaWNhdGlvbiBB
dXRob3JpdHkwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANVnrTXdoH79V2HWnacXy7mjjSNc
nOi3Z+cXSBh9uSDhCLAUUeuvoHubuA5ImrJI5k/dA+Q0L+WNzR7OZr4TRpw3DOksYS/0o+RZ5+lu
J7ltXcdVgsHU6qqHDpvF1hAegqpNz670JVVfUs4ThC1AafMIBHwmJbqFG4Iy39OH37oBAgMBAAGj
ggHpMIIB5TASBgNVHRMBAf8ECDAGAQH/AgEAMEQGA1UdIAQ9MDswOQYLYIZIAYb4RQEHFwIwKjAo
BggrBgEFBQcCARYcaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYTA0BgNVHR8ELTArMCmgJ6Al
hiNodHRwOi8vY3JsLnZlcmlzaWduLmNvbS9wY2EyLWcyLmNybDALBgNVHQ8EBAMCAQYwEQYJYIZI
AYb4QgEBBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEyNzAd
BgNVHQ4EFgQUkcFzsHPV2ZJ0Z80b8VEUNDG2LFowgegGA1UdIwSB4DCB3aGBx6SBxDCBwTELMAkG
A1UEBhMCVVMxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMTwwOgYDVQQLEzNDbGFzcyAyIFB1Ymxp
YyBQcmltYXJ5IENlcnRpZmljYXRpb24gQXV0aG9yaXR5IC0gRzIxOjA4BgNVBAsTMShjKSAxOTk4
IFZlcmlTaWduLCBJbmMuIC0gRm9yIGF1dGhvcml6ZWQgdXNlIG9ubHkxHzAdBgNVBAsTFlZlcmlT
aWduIFRydXN0IE5ldHdvcmuCEQC5L2DMiJ+hekYJuFtwbIqvMA0GCSqGSIb3DQEBBQUAA4GBAJcM
UE/GM7DSGWSfEaUELX8FdU5Ug5WUfJVLTc4s5xDj+d9P/sxo39ofCYcyBrVFpessapDKDJKKCu6z
bSNwKStMN7smU6TYiyT2FP216Adb5wsu94gxblObFoms2qG/BuGHbFxtbIBAiCNlFcRk69rPUGu/
EOvQeUAR+Ub1NkjPMIIFXjCCBMegAwIBAgIQBx15Uc8dgKRMua0Jq2/yNTANBgkqhkiG9w0BAQQF
ADCB+TELMAkGA1UEBhMCVVMxNDAyBgNVBAoTK0ludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGlu
ZXMgQ29ycG9yYXRpb24xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxOzA5BgNVBAsT
MlRlcm1zIG9mIHVzZSBhdCBodHRwczovL3d3dy52ZXJpc2lnbi5jb20vcnBhIChjKTAzMTAwLgYD
VQQLEydDbGFzcyAyIE9uU2l0ZSBJbmRpdmlkdWFsIFN1YnNjcmliZXIgQ0ExJDAiBgNVBAMTG0lC
TSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0wNzA0MTYwMDAwMDBaFw0wODA0MTUyMzU5NTla
MIGJMS4wLAYDVQQKFCVJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzIENvcnAuMRgwFgYD
VQQDDA9GcmFuayBIYXZlcmthbXAxGTAXBgoJkiaJk/IsZAEBFAkxMjQ2MTQ3MjQxIjAgBgkqhkiG
9w0BCQEWE2hhdmVya2FtQGRlLmlibS5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANqa
0RVcURGtTfJRuKOEaQPrtJrWVAmWFTIA2YdQSiHJDgg+OLG/dnlpyqU0JOfcd3j1ZyQK7EFpoT03
B4Bx4MWBSoWdf3bdbEmKvYIM2BddBVgisGiwhWklRsoGiItckT7xSVK5P3hvLCXjBvcdbxcm4VS2
NRyJfGEyeoGiObLdAgMBAAGjggJTMIICTzAJBgNVHRMEAjAAMAsGA1UdDwQEAwIFoDBmBgNVHR8E
XzBdMFugWaBXhlVodHRwOi8vb25zaXRlY3JsLnZlcmlzaWduLmNvbS9JbnRlcm5hdGlvbmFsQnVz
aW5lc3NNYWNoaW5lc0NvcnBDb3Jwb3JhdGVDSU8vTGF0ZXN0Q1JMMIIBKQYDVR0gBIIBIDCCARww
ggEYBgtghkgBhvhFAQcXAjCCAQcwKwYIKwYBBQUHAgEWH2h0dHBzOi8vd3d3LnZlcmlzaWduLmNv
bS9ycGEta3IwgdcGCCsGAQUFBwICMIHKGoHHTm90aWNlIFRleHQ9Tk9USUNFOiBQcml2YXRlIGtl
eSBtYXkgYmUgcmVjb3ZlcmVkIGJ5IFZlcmlTaWduJ3MgY3VzdG9tZXIgd2hvIG1heSBiZSBhYmxl
IHRvIGRlY3J5cHQgbWVzc2FnZXMgeW91IHNlbmQgdG8gY2VydGlmaWNhdGUgaG9sZGVyLiAgVXNl
IGlzIHN1YmplY3QgdG8gdGVybXMgYXQgaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYS1rcjAf
BgNVHSMEGDAWgBSRwXOwc9XZknRnzRvxURQ0MbYsWjAdBgNVHQ4EFgQUbOeIIYn3x+GgI5Am0KHt
R62Y458wLgYDVR0RBCcwJaAjBgorBgEEAYI3FAIDoBUME2hhdmVya2FtQGRlLmlibS5jb20wHQYD
VR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGCWCGSAGG+EIBAQQEAwIFoDANBgkqhkiG9w0B
AQQFAAOBgQAJ6/At+OSf4q8CRKWRmIxb3m0Sk6YfSTI6gu+YIu6LiOIq3BFH7XhRGiM+KqQaKyKe
9Ar+L/QzI9YQMIShrA9m2eFKVrfsBTeSn2/d+wTYM4rjyYtv24qeYSKF9yqWGMW+Oy9SIjb9TAgF
A0rQrpiAExeGgoIuDAsZFr4+EfUkcDCCBV4wggTHoAMCAQICEAcdeVHPHYCkTLmtCatv8jUwDQYJ
KoZIhvcNAQEEBQAwgfkxCzAJBgNVBAYTAlVTMTQwMgYDVQQKEytJbnRlcm5hdGlvbmFsIEJ1c2lu
ZXNzIE1hY2hpbmVzIENvcnBvcmF0aW9uMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3Jr
MTswOQYDVQQLEzJUZXJtcyBvZiB1c2UgYXQgaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYSAo
YykwMzEwMC4GA1UECxMnQ2xhc3MgMiBPblNpdGUgSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMSQw
IgYDVQQDExtJQk0gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMDcwNDE2MDAwMDAwWhcNMDgw
NDE1MjM1OTU5WjCBiTEuMCwGA1UEChQlSW50ZXJuYXRpb25hbCBCdXNpbmVzcyBNYWNoaW5lcyBD
b3JwLjEYMBYGA1UEAwwPRnJhbmsgSGF2ZXJrYW1wMRkwFwYKCZImiZPyLGQBARQJMTI0NjE0NzI0
MSIwIAYJKoZIhvcNAQkBFhNoYXZlcmthbUBkZS5pYm0uY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GN
ADCBiQKBgQDamtEVXFERrU3yUbijhGkD67Sa1lQJlhUyANmHUEohyQ4IPjixv3Z5acqlNCTn3Hd4
9WckCuxBaaE9NweAceDFgUqFnX923WxJir2CDNgXXQVYIrBosIVpJUbKBoiLXJE+8UlSuT94bywl
4wb3HW8XJuFUtjUciXxhMnqBojmy3QIDAQABo4ICUzCCAk8wCQYDVR0TBAIwADALBgNVHQ8EBAMC
BaAwZgYDVR0fBF8wXTBboFmgV4ZVaHR0cDovL29uc2l0ZWNybC52ZXJpc2lnbi5jb20vSW50ZXJu
YXRpb25hbEJ1c2luZXNzTWFjaGluZXNDb3JwQ29ycG9yYXRlQ0lPL0xhdGVzdENSTDCCASkGA1Ud
IASCASAwggEcMIIBGAYLYIZIAYb4RQEHFwIwggEHMCsGCCsGAQUFBwIBFh9odHRwczovL3d3dy52
ZXJpc2lnbi5jb20vcnBhLWtyMIHXBggrBgEFBQcCAjCByhqBx05vdGljZSBUZXh0PU5PVElDRTog
UHJpdmF0ZSBrZXkgbWF5IGJlIHJlY292ZXJlZCBieSBWZXJpU2lnbidzIGN1c3RvbWVyIHdobyBt
YXkgYmUgYWJsZSB0byBkZWNyeXB0IG1lc3NhZ2VzIHlvdSBzZW5kIHRvIGNlcnRpZmljYXRlIGhv
bGRlci4gIFVzZSBpcyBzdWJqZWN0IHRvIHRlcm1zIGF0IGh0dHBzOi8vd3d3LnZlcmlzaWduLmNv
bS9ycGEta3IwHwYDVR0jBBgwFoAUkcFzsHPV2ZJ0Z80b8VEUNDG2LFowHQYDVR0OBBYEFGzniCGJ
98fhoCOQJtCh7UetmOOfMC4GA1UdEQQnMCWgIwYKKwYBBAGCNxQCA6AVDBNoYXZlcmthbUBkZS5p
Ym0uY29tMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDARBglghkgBhvhCAQEEBAMCBaAw
DQYJKoZIhvcNAQEEBQADgYEACevwLfjkn+KvAkSlkZiMW95tEpOmH0kyOoLvmCLui4jiKtwRR+14
URojPiqkGisinvQK/i/0MyPWEDCEoawPZtnhSla37AU3kp9v3fsE2DOK48mLb9uKnmEihfcqlhjF
vjsvUiI2/UwIBQNK0K6YgBMXhoKCLgwLGRa+PhH1JHAxggRjMIIEXwIBATCCAQ4wgfkxCzAJBgNV
BAYTAlVTMTQwMgYDVQQKEytJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzIENvcnBvcmF0
aW9uMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMTswOQYDVQQLEzJUZXJtcyBvZiB1
c2UgYXQgaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYSAoYykwMzEwMC4GA1UECxMnQ2xhc3Mg
MiBPblNpdGUgSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMSQwIgYDVQQDExtJQk0gQ2VydGlmaWNh
dGlvbiBBdXRob3JpdHkCEAcdeVHPHYCkTLmtCatv8jUwCQYFKw4DAhoFAKCCAqkwGAYJKoZIhvcN
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDcwOTI2MTQxMDIzWjAjBgkqhkiG9w0B
CQQxFgQU6SbU3tU3f69quCTBX4SugN46gEEwggEhBgkrBgEEAYI3EAQxggESMIIBDjCB+TELMAkG
A1UEBhMCVVMxNDAyBgNVBAoTK0ludGVybmF0aW9uYWwgQnVzaW5lc3MgTWFjaGluZXMgQ29ycG9y
YXRpb24xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxOzA5BgNVBAsTMlRlcm1zIG9m
IHVzZSBhdCBodHRwczovL3d3dy52ZXJpc2lnbi5jb20vcnBhIChjKTAzMTAwLgYDVQQLEydDbGFz
cyAyIE9uU2l0ZSBJbmRpdmlkdWFsIFN1YnNjcmliZXIgQ0ExJDAiBgNVBAMTG0lCTSBDZXJ0aWZp
Y2F0aW9uIEF1dGhvcml0eQIQBx15Uc8dgKRMua0Jq2/yNTCCASMGCyqGSIb3DQEJEAILMYIBEqCC
AQ4wgfkxCzAJBgNVBAYTAlVTMTQwMgYDVQQKEytJbnRlcm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hp
bmVzIENvcnBvcmF0aW9uMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMTswOQYDVQQL
EzJUZXJtcyBvZiB1c2UgYXQgaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYSAoYykwMzEwMC4G
A1UECxMnQ2xhc3MgMiBPblNpdGUgSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMSQwIgYDVQQDExtJ
Qk0gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkCEAcdeVHPHYCkTLmtCatv8jUwDQYJKoZIhvcNAQEB
BQAEgYCMp2LgMAv5IQQ9+2UMlUk9pnGaYm9Tp1/8JDi7FKivo2tczL4Vi1LiN25Ti+4dwiigsFLi
Ype3Dd4uBBkVzE97xnywRIFDbsA5RXx4VsI24JvoyAICwLSJd0swfml+1qmEenAMzpVlPxW0kG41
RUFTeF1exyTU6BwtZ1PWp59qvgAAAAAAAA==


--=-VtLTg979yECvux0RM4l7--
