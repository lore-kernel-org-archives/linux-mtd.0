Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JSTZR-0001AE-P7
	for linux-mtd@lists.infradead.org; Fri, 22 Feb 2008 08:47:54 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e6.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m1M8nZEY000307
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2008 03:49:35 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m1M8lc5Z247714
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2008 03:47:38 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m1M8lb1H005999
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2008 03:47:38 -0500
Subject: [PATCH] ubi-utils: Fixup pddcustomize
From: Frank Haverkamp <haver@vnet.ibm.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-Lbob4LMCE50kWm+ZRP9Z"
Date: Fri, 22 Feb 2008 09:47:35 +0100
Message-Id: <1203670055.8489.4.camel@august>
Mime-Version: 1.0
Cc: Josh Boyer <jwboyer@linux.ibm.com>,
	Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	"Monte K. Copeland" <catboat@texas.net>, Andreas Arnez <arnez@de.ibm.com>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, haver@vnet.ibm.com
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Lbob4LMCE50kWm+ZRP9Z
Content-Type: multipart/mixed; boundary="=-zvNRfttPRkJ8u41eY4xn"


--=-zvNRfttPRkJ8u41eY4xn
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Subject: ubi-utils: pddcustomize fixup update volume
From: Frank Haverkamp <haver@vnet.ibm.com>

Somehow calling ubi_update_start was forgotten and caused the
tool not to write but silently ignore the write.

Signed-off-by: Frank Haverkamp <haver@vnet.ibm.com>
---
 ubi-utils/src/bootenv.c      |    2 +-
 ubi-utils/src/pddcustomize.c |   16 ++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

--- mtd-utils.git.orig/ubi-utils/src/bootenv.c
+++ mtd-utils.git/ubi-utils/src/bootenv.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) International Business Machines Corp., 2006
+ * Copyright (c) International Business Machines Corp., 2008
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
--- mtd-utils.git.orig/ubi-utils/src/pddcustomize.c
+++ mtd-utils.git/ubi-utils/src/pddcustomize.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) International Business Machines Corp., 2006
+ * Copyright (c) International Business Machines Corp., 2008
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -46,7 +46,7 @@
 #include "libubi.h"
 #include "ubimirror.h"
=20
-#define PROGRAM_VERSION "1.5"
+#define PROGRAM_VERSION "1.6"
=20
 #define DEFAULT_DEV_PATTERN    "/dev/ubi%d"
 #define DEFAULT_VOL_PATTERN    "/dev/ubi%d_%d"
@@ -369,7 +369,7 @@ ubi_write_bootenv(uint32_t devno, uint32
 	int rc =3D 0;
 	char path[PATH_MAX];
 	FILE* fp_out =3D NULL;
-	size_t nbytes ;
+	size_t nbytes;
=20
 	rc =3D bootenv_size(env, &nbytes);
 	if (rc) {
@@ -387,6 +387,13 @@ ubi_write_bootenv(uint32_t devno, uint32
 	fp_out =3D fopen(path, "r+");
 	if (fp_out =3D=3D NULL) {
 		err_msg("Cannot fopen volume:%d number:%d\n", devno, id);
+		rc =3D -EBADF;
+		goto err;
+	}
+
+	rc =3D ubi_update_start(ulib, fileno(fp_out), nbytes);
+	if (rc !=3D 0) {
+		err_msg("Cannot start update for %s\n", path);
 		goto err;
 	}
=20
@@ -396,7 +403,6 @@ ubi_write_bootenv(uint32_t devno, uint32
 			devno, id);
 		goto err;
 	}
-
 err:
 	if( fp_out )
 		fclose(fp_out);
@@ -495,6 +501,8 @@ main(int argc, char **argv) {
 		rc =3D write_bootenv(args.file_in, env);
 	else
 		rc =3D ubi_write_bootenv(EXAMPLE_UBI_DEVICE, boot_volno, env);
+
+	printf("rc=3D%d\n", rc);
 	if (rc !=3D 0) {
 		goto err;
 	}

--=20
IBM Deutschland Entwicklung GmbH, Schoenaicher Str. 220, 71032
Boeblingen, Vorsitzender des Aufsichtsrats: Martin Jetter
Gesch=E4ftsf=FChrung: Herbert Kircher, Sitz der Gesellschaft: B=F6blingen,
Registergericht: Amtsgericht Stuttgart, HRB 243294

--=-zvNRfttPRkJ8u41eY4xn
Content-Disposition: attachment;
	filename=001-ubi-utils-fixup-pddcustomize.patch
Content-Type: text/x-patch; name=001-ubi-utils-fixup-pddcustomize.patch;
	charset=ISO-8859-15
Content-Transfer-Encoding: base64

U3ViamVjdDogdWJpLXV0aWxzOiBwZGRjdXN0b21pemUgZml4dXAgdXBkYXRlIHZvbHVtZQ0KRnJv
bTogRnJhbmsgSGF2ZXJrYW1wIDxoYXZlckB2bmV0LmlibS5jb20+DQoNClNvbWVob3cgY2FsbGlu
ZyB1YmlfdXBkYXRlX3N0YXJ0IHdhcyBmb3Jnb3R0ZW4gYW5kIGNhdXNlZCB0aGUNCnRvb2wgbm90
IHRvIHdyaXRlIGJ1dCBzaWxlbnRseSBpZ25vcmUgdGhlIHdyaXRlLg0KDQpTaWduZWQtb2ZmLWJ5
OiBGcmFuayBIYXZlcmthbXAgPGhhdmVyQHZuZXQuaWJtLmNvbT4NCi0tLQ0KIHViaS11dGlscy9z
cmMvYm9vdGVudi5jICAgICAgfCAgICAyICstDQogdWJpLXV0aWxzL3NyYy9wZGRjdXN0b21pemUu
YyB8ICAgMTkgKysrKysrKysrKysrKy0tLS0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCg0KLS0tIG10ZC11dGlscy5naXQub3JpZy91YmktdXRp
bHMvc3JjL2Jvb3RlbnYuYw0KKysrIG10ZC11dGlscy5naXQvdWJpLXV0aWxzL3NyYy9ib290ZW52
LmMNCkBAIC0xLDUgKzEsNSBAQA0KIC8qDQotICogQ29weXJpZ2h0IChjKSBJbnRlcm5hdGlvbmFs
IEJ1c2luZXNzIE1hY2hpbmVzIENvcnAuLCAyMDA2DQorICogQ29weXJpZ2h0IChjKSBJbnRlcm5h
dGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzIENvcnAuLCAyMDA4DQogICoNCiAgKiBUaGlzIHByb2dy
YW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlm
eQ0KICAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgYXMgcHVibGlzaGVkIGJ5DQotLS0gbXRkLXV0aWxzLmdpdC5vcmlnL3ViaS11dGlscy9zcmMv
cGRkY3VzdG9taXplLmMNCisrKyBtdGQtdXRpbHMuZ2l0L3ViaS11dGlscy9zcmMvcGRkY3VzdG9t
aXplLmMNCkBAIC0xLDUgKzEsNSBAQA0KIC8qDQotICogQ29weXJpZ2h0IChjKSBJbnRlcm5hdGlv
bmFsIEJ1c2luZXNzIE1hY2hpbmVzIENvcnAuLCAyMDA2DQorICogQ29weXJpZ2h0IChjKSBJbnRl
cm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzIENvcnAuLCAyMDA4DQogICoNCiAgKiBUaGlzIHBy
b2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1v
ZGlmeQ0KICAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYXMgcHVibGlzaGVkIGJ5DQpAQCAtMjcsNiArMjcsNyBAQA0KICAqIDEuMyBSZW1vdmVk
IGFyZ3AgYmVjYXVzZSB3ZSB3YW50IHRvIHVzZSB1Q2xpYmMuDQogICogMS40IE1pbm9yIGNsZWFu
dXBzDQogICogMS41IE1pZ3JhdGVkIHRvIG5ldyBsaWJ1YmkNCisgKiAxLjYgRml4ZWQgYnJva2Vu
IHZvbHVtZSB1cGRhdGUNCiAgKi8NCiANCiAjaW5jbHVkZSA8c3RkaW8uaD4NCkBAIC00Niw3ICs0
Nyw3IEBADQogI2luY2x1ZGUgImxpYnViaS5oIg0KICNpbmNsdWRlICJ1YmltaXJyb3IuaCINCiAN
Ci0jZGVmaW5lIFBST0dSQU1fVkVSU0lPTiAiMS41Ig0KKyNkZWZpbmUgUFJPR1JBTV9WRVJTSU9O
ICIxLjYiDQogDQogI2RlZmluZSBERUZBVUxUX0RFVl9QQVRURVJOICAgICIvZGV2L3ViaSVkIg0K
ICNkZWZpbmUgREVGQVVMVF9WT0xfUEFUVEVSTiAgICAiL2Rldi91YmklZF8lZCINCkBAIC0zNjks
NyArMzcwLDcgQEAgdWJpX3dyaXRlX2Jvb3RlbnYodWludDMyX3QgZGV2bm8sIHVpbnQzMg0KIAlp
bnQgcmMgPSAwOw0KIAljaGFyIHBhdGhbUEFUSF9NQVhdOw0KIAlGSUxFKiBmcF9vdXQgPSBOVUxM
Ow0KLQlzaXplX3QgbmJ5dGVzIDsNCisJc2l6ZV90IG5ieXRlczsNCiANCiAJcmMgPSBib290ZW52
X3NpemUoZW52LCAmbmJ5dGVzKTsNCiAJaWYgKHJjKSB7DQpAQCAtMzg3LDYgKzM4OCwxMyBAQCB1
Ymlfd3JpdGVfYm9vdGVudih1aW50MzJfdCBkZXZubywgdWludDMyDQogCWZwX291dCA9IGZvcGVu
KHBhdGgsICJyKyIpOw0KIAlpZiAoZnBfb3V0ID09IE5VTEwpIHsNCiAJCWVycl9tc2coIkNhbm5v
dCBmb3BlbiB2b2x1bWU6JWQgbnVtYmVyOiVkXG4iLCBkZXZubywgaWQpOw0KKwkJcmMgPSAtRUJB
REY7DQorCQlnb3RvIGVycjsNCisJfQ0KKw0KKwlyYyA9IHViaV91cGRhdGVfc3RhcnQodWxpYiwg
ZmlsZW5vKGZwX291dCksIG5ieXRlcyk7DQorCWlmIChyYyAhPSAwKSB7DQorCQllcnJfbXNnKCJD
YW5ub3Qgc3RhcnQgdXBkYXRlIGZvciAlc1xuIiwgcGF0aCk7DQogCQlnb3RvIGVycjsNCiAJfQ0K
IA0KQEAgLTM5Niw3ICs0MDQsNiBAQCB1Ymlfd3JpdGVfYm9vdGVudih1aW50MzJfdCBkZXZubywg
dWludDMyDQogCQkJZGV2bm8sIGlkKTsNCiAJCWdvdG8gZXJyOw0KIAl9DQotDQogZXJyOg0KIAlp
ZiggZnBfb3V0ICkNCiAJCWZjbG9zZShmcF9vdXQpOw0KQEAgLTQ5NSw5ICs1MDIsOSBAQCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikgew0KIAkJcmMgPSB3cml0ZV9ib290ZW52KGFyZ3MuZmls
ZV9pbiwgZW52KTsNCiAJZWxzZQ0KIAkJcmMgPSB1Ymlfd3JpdGVfYm9vdGVudihFWEFNUExFX1VC
SV9ERVZJQ0UsIGJvb3Rfdm9sbm8sIGVudik7DQotCWlmIChyYyAhPSAwKSB7DQorCWlmIChyYyAh
PSAwKQ0KIAkJZ290byBlcnI7DQotCX0NCisNCiAJaWYoIGFyZ3MuYm90aCApCQkvKiBObyBzaWRl
IHNwZWNpZmllZCwgdXBkYXRlIGJvdGggKi8NCiAJCXJjID0gZG9fbWlycm9yKGJvb3Rfdm9sbm8p
Ow0KIA0K


--=-zvNRfttPRkJ8u41eY4xn--

--=-Lbob4LMCE50kWm+ZRP9Z
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
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDgwMjIyMDg0NzMxWjAjBgkqhkiG9w0B
CQQxFgQUV6n6cTmI9lJXFmcHs1NviuiDELQwggEhBgkrBgEEAYI3EAQxggESMIIBDjCB+TELMAkG
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
BQAEgYAaCPpR9M0CQFCxwjDZ+vuMIFksf48Npg5TfLDHb9GynReFF16dUDHotcbj6E0ZWp67JjHm
FSwME7vghyqsGKICuKiMI3ch++CrL3OrMnhTH/Zjnw2415dlMxfeI9RKgoRnKnhn0kyO6+KSxyHY
WaQ1/UjMnk1f3XmhWHrawDLh5gAAAAAAAA==


--=-Lbob4LMCE50kWm+ZRP9Z--
