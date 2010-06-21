From: chuanxiao.dong@intel.com (Chuanxiao Dong)
Date: Mon, 21 Jun 2010 18:51:19 +0800
Subject: [PATCH 5/5] [MTD/denali] remove set_ecc_config
 	This function only need to set ECC_CORRECTION reg
 	so remove it and set this reg in probe function.
 	For denali nand controller only support 15bits and
 	8bits ecc correction on MRST, here use 15bits ecc
 	correction for MLC NAND and 8bits ecc correction for
 	SLC NAND.
Message-ID: <mailman.71.1278936653.27306.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   44 ++---------------------------------------=
---
 1 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 1555921..d143b0b 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -354,46 +354,6 @@ static void nand_onfi_timing_set(struct denali_nand_in=
fo *denali,
 	denali_write32(cs_cnt, denali->flash_reg + CS_SETUP_CNT);
 }
=20
-/* configures the initial ECC settings for the controller */
-static void set_ecc_config(struct denali_nand_info *denali)
-{
-#if SUPPORT_8BITECC
-	if ((ioread32(denali->flash_reg + DEVICE_MAIN_AREA_SIZE) < 4096) ||
-		(ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE) <=3D 128))
-		denali_write32(8, denali->flash_reg + ECC_CORRECTION);
-#endif
-
-	if ((ioread32(denali->flash_reg + ECC_CORRECTION) &
-				ECC_CORRECTION__VALUE) =3D=3D 1) {
-		denali->dev_info.wECCBytesPerSector =3D 4;
-		denali->dev_info.wECCBytesPerSector *=3D
-			denali->dev_info.wDevicesConnected;
-		denali->dev_info.wNumPageSpareFlag =3D
-			denali->dev_info.wPageSpareSize -
-			denali->dev_info.wPageDataSize /
-			(ECC_SECTOR_SIZE * denali->dev_info.wDevicesConnected) *
-			denali->dev_info.wECCBytesPerSector
-			- denali->dev_info.wSpareSkipBytes;
-	} else {
-		denali->dev_info.wECCBytesPerSector =3D
-			(ioread32(denali->flash_reg + ECC_CORRECTION) &
-			ECC_CORRECTION__VALUE) * 13 / 8;
-		if ((denali->dev_info.wECCBytesPerSector) % 2 =3D=3D 0)
-			denali->dev_info.wECCBytesPerSector +=3D 2;
-		else
-			denali->dev_info.wECCBytesPerSector +=3D 1;
-
-		denali->dev_info.wECCBytesPerSector *=3D
-			denali->dev_info.wDevicesConnected;
-		denali->dev_info.wNumPageSpareFlag =3D
-			denali->dev_info.wPageSpareSize -
-			denali->dev_info.wPageDataSize /
-			(ECC_SECTOR_SIZE * denali->dev_info.wDevicesConnected) *
-			denali->dev_info.wECCBytesPerSector
-			- denali->dev_info.wSpareSkipBytes;
-	}
-}
-
 /* queries the NAND device to see what ONFI modes it supports. */
 static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
 {
@@ -900,8 +860,6 @@ static uint16_t denali_nand_timing_set(struct denali_na=
nd_info *denali)
 	denali->dev_info.nBitsInBlockDataSize =3D
 		ilog2(denali->dev_info.wBlockDataSize);
=20
-	set_ecc_config(denali);
-
 	no_of_planes =3D ioread32(denali->flash_reg + NUMBER_OF_PLANES) &
 		NUMBER_OF_PLANES__VALUE;
=20
@@ -2075,9 +2033,11 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
 	if (denali->dev_info.MLCDevice) {
 		denali->nand.ecc.layout =3D &nand_oob_mlc_14bit;
 		denali->nand.ecc.bytes =3D ECC_BYTES_MLC;
+		denali_write32(15, denali->flash_reg + ECC_CORRECTION);
 	} else { /* SLC */
 		denali->nand.ecc.layout =3D &nand_oob_slc;
 		denali->nand.ecc.bytes =3D ECC_BYTES_SLC;
+		denali_write32(8, denali->flash_reg + ECC_CORRECTION);
 	}
=20
 	/* These functions are required by the NAND core framework, otherwise,
--=20
1.6.6.1


--_002_5D8008F58939784290FAB48F549751981D09B718B7shsmsx502ccrc_
Content-Type: application/octet-stream;
	name="0005-MTD-denali-remove-set_ecc_config.patch"
Content-Description: 0005-MTD-denali-remove-set_ecc_config.patch
Content-Disposition: attachment;
	filename="0005-MTD-denali-remove-set_ecc_config.patch"; size=3545;
	creation-date="Mon, 21 Jun 2010 18:56:23 GMT";
	modification-date="Mon, 21 Jun 2010 19:11:43 GMT"
Content-Transfer-Encoding: base64

RnJvbSAzOTllMjJlOWYxYmMzMjU1ODk2MTM5MWRiMzc3MzA5YjA4ODA2YjI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQ2h1YW54aWFvIERvbmcgPGNodWFueGlhby5kb25nQGludGVs
LmNvbT4NCkRhdGU6IE1vbiwgMjEgSnVuIDIwMTAgMTg6NTE6MTkgKzA4MDANClN1YmplY3Q6IFtQ
QVRDSCA1LzVdIFtNVEQvZGVuYWxpXSByZW1vdmUgc2V0X2VjY19jb25maWcNCiAJVGhpcyBmdW5j
dGlvbiBvbmx5IG5lZWQgdG8gc2V0IEVDQ19DT1JSRUNUSU9OIHJlZw0KIAlzbyByZW1vdmUgaXQg
YW5kIHNldCB0aGlzIHJlZyBpbiBwcm9iZSBmdW5jdGlvbi4NCiAJRm9yIGRlbmFsaSBuYW5kIGNv
bnRyb2xsZXIgb25seSBzdXBwb3J0IDE1Yml0cyBhbmQNCiAJOGJpdHMgZWNjIGNvcnJlY3Rpb24g
b24gTVJTVCwgaGVyZSB1c2UgMTViaXRzIGVjYw0KIAljb3JyZWN0aW9uIGZvciBNTEMgTkFORCBh
bmQgOGJpdHMgZWNjIGNvcnJlY3Rpb24gZm9yDQogCVNMQyBOQU5ELg0KDQpTaWduZWQtb2ZmLWJ5
OiBDaHVhbnhpYW8gRG9uZyA8Y2h1YW54aWFvLmRvbmdAaW50ZWwuY29tPg0KLS0tDQogZHJpdmVy
cy9tdGQvbmFuZC9kZW5hbGkuYyB8ICAgNDQgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCiAxIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDIgZGVs
ZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL2RlbmFsaS5jIGIvZHJp
dmVycy9tdGQvbmFuZC9kZW5hbGkuYw0KaW5kZXggMTU1NTkyMS4uZDE0M2IwYiAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvZGVuYWxpLmMNCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvZGVu
YWxpLmMNCkBAIC0zNTQsNDYgKzM1NCw2IEBAIHN0YXRpYyB2b2lkIG5hbmRfb25maV90aW1pbmdf
c2V0KHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGksDQogCWRlbmFsaV93cml0ZTMyKGNz
X2NudCwgZGVuYWxpLT5mbGFzaF9yZWcgKyBDU19TRVRVUF9DTlQpOw0KIH0NCiANCi0vKiBjb25m
aWd1cmVzIHRoZSBpbml0aWFsIEVDQyBzZXR0aW5ncyBmb3IgdGhlIGNvbnRyb2xsZXIgKi8NCi1z
dGF0aWMgdm9pZCBzZXRfZWNjX2NvbmZpZyhzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxp
KQ0KLXsNCi0jaWYgU1VQUE9SVF84QklURUNDDQotCWlmICgoaW9yZWFkMzIoZGVuYWxpLT5mbGFz
aF9yZWcgKyBERVZJQ0VfTUFJTl9BUkVBX1NJWkUpIDwgNDA5NikgfHwNCi0JCShpb3JlYWQzMihk
ZW5hbGktPmZsYXNoX3JlZyArIERFVklDRV9TUEFSRV9BUkVBX1NJWkUpIDw9IDEyOCkpDQotCQlk
ZW5hbGlfd3JpdGUzMig4LCBkZW5hbGktPmZsYXNoX3JlZyArIEVDQ19DT1JSRUNUSU9OKTsNCi0j
ZW5kaWYNCi0NCi0JaWYgKChpb3JlYWQzMihkZW5hbGktPmZsYXNoX3JlZyArIEVDQ19DT1JSRUNU
SU9OKSAmDQotCQkJCUVDQ19DT1JSRUNUSU9OX19WQUxVRSkgPT0gMSkgew0KLQkJZGVuYWxpLT5k
ZXZfaW5mby53RUNDQnl0ZXNQZXJTZWN0b3IgPSA0Ow0KLQkJZGVuYWxpLT5kZXZfaW5mby53RUND
Qnl0ZXNQZXJTZWN0b3IgKj0NCi0JCQlkZW5hbGktPmRldl9pbmZvLndEZXZpY2VzQ29ubmVjdGVk
Ow0KLQkJZGVuYWxpLT5kZXZfaW5mby53TnVtUGFnZVNwYXJlRmxhZyA9DQotCQkJZGVuYWxpLT5k
ZXZfaW5mby53UGFnZVNwYXJlU2l6ZSAtDQotCQkJZGVuYWxpLT5kZXZfaW5mby53UGFnZURhdGFT
aXplIC8NCi0JCQkoRUNDX1NFQ1RPUl9TSVpFICogZGVuYWxpLT5kZXZfaW5mby53RGV2aWNlc0Nv
bm5lY3RlZCkgKg0KLQkJCWRlbmFsaS0+ZGV2X2luZm8ud0VDQ0J5dGVzUGVyU2VjdG9yDQotCQkJ
LSBkZW5hbGktPmRldl9pbmZvLndTcGFyZVNraXBCeXRlczsNCi0JfSBlbHNlIHsNCi0JCWRlbmFs
aS0+ZGV2X2luZm8ud0VDQ0J5dGVzUGVyU2VjdG9yID0NCi0JCQkoaW9yZWFkMzIoZGVuYWxpLT5m
bGFzaF9yZWcgKyBFQ0NfQ09SUkVDVElPTikgJg0KLQkJCUVDQ19DT1JSRUNUSU9OX19WQUxVRSkg
KiAxMyAvIDg7DQotCQlpZiAoKGRlbmFsaS0+ZGV2X2luZm8ud0VDQ0J5dGVzUGVyU2VjdG9yKSAl
IDIgPT0gMCkNCi0JCQlkZW5hbGktPmRldl9pbmZvLndFQ0NCeXRlc1BlclNlY3RvciArPSAyOw0K
LQkJZWxzZQ0KLQkJCWRlbmFsaS0+ZGV2X2luZm8ud0VDQ0J5dGVzUGVyU2VjdG9yICs9IDE7DQot
DQotCQlkZW5hbGktPmRldl9pbmZvLndFQ0NCeXRlc1BlclNlY3RvciAqPQ0KLQkJCWRlbmFsaS0+
ZGV2X2luZm8ud0RldmljZXNDb25uZWN0ZWQ7DQotCQlkZW5hbGktPmRldl9pbmZvLndOdW1QYWdl
U3BhcmVGbGFnID0NCi0JCQlkZW5hbGktPmRldl9pbmZvLndQYWdlU3BhcmVTaXplIC0NCi0JCQlk
ZW5hbGktPmRldl9pbmZvLndQYWdlRGF0YVNpemUgLw0KLQkJCShFQ0NfU0VDVE9SX1NJWkUgKiBk
ZW5hbGktPmRldl9pbmZvLndEZXZpY2VzQ29ubmVjdGVkKSAqDQotCQkJZGVuYWxpLT5kZXZfaW5m
by53RUNDQnl0ZXNQZXJTZWN0b3INCi0JCQktIGRlbmFsaS0+ZGV2X2luZm8ud1NwYXJlU2tpcEJ5
dGVzOw0KLQl9DQotfQ0KLQ0KIC8qIHF1ZXJpZXMgdGhlIE5BTkQgZGV2aWNlIHRvIHNlZSB3aGF0
IE9ORkkgbW9kZXMgaXQgc3VwcG9ydHMuICovDQogc3RhdGljIHVpbnQxNl90IGdldF9vbmZpX25h
bmRfcGFyYShzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpKQ0KIHsNCkBAIC05MDAsOCAr
ODYwLDYgQEAgc3RhdGljIHVpbnQxNl90IGRlbmFsaV9uYW5kX3RpbWluZ19zZXQoc3RydWN0IGRl
bmFsaV9uYW5kX2luZm8gKmRlbmFsaSkNCiAJZGVuYWxpLT5kZXZfaW5mby5uQml0c0luQmxvY2tE
YXRhU2l6ZSA9DQogCQlpbG9nMihkZW5hbGktPmRldl9pbmZvLndCbG9ja0RhdGFTaXplKTsNCiAN
Ci0Jc2V0X2VjY19jb25maWcoZGVuYWxpKTsNCi0NCiAJbm9fb2ZfcGxhbmVzID0gaW9yZWFkMzIo
ZGVuYWxpLT5mbGFzaF9yZWcgKyBOVU1CRVJfT0ZfUExBTkVTKSAmDQogCQlOVU1CRVJfT0ZfUExB
TkVTX19WQUxVRTsNCiANCkBAIC0yMDc1LDkgKzIwMzMsMTEgQEAgc3RhdGljIGludCBkZW5hbGlf
cGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lk
ICppZCkNCiAJaWYgKGRlbmFsaS0+ZGV2X2luZm8uTUxDRGV2aWNlKSB7DQogCQlkZW5hbGktPm5h
bmQuZWNjLmxheW91dCA9ICZuYW5kX29vYl9tbGNfMTRiaXQ7DQogCQlkZW5hbGktPm5hbmQuZWNj
LmJ5dGVzID0gRUNDX0JZVEVTX01MQzsNCisJCWRlbmFsaV93cml0ZTMyKDE1LCBkZW5hbGktPmZs
YXNoX3JlZyArIEVDQ19DT1JSRUNUSU9OKTsNCiAJfSBlbHNlIHsgLyogU0xDICovDQogCQlkZW5h
bGktPm5hbmQuZWNjLmxheW91dCA9ICZuYW5kX29vYl9zbGM7DQogCQlkZW5hbGktPm5hbmQuZWNj
LmJ5dGVzID0gRUNDX0JZVEVTX1NMQzsNCisJCWRlbmFsaV93cml0ZTMyKDgsIGRlbmFsaS0+Zmxh
c2hfcmVnICsgRUNDX0NPUlJFQ1RJT04pOw0KIAl9DQogDQogCS8qIFRoZXNlIGZ1bmN0aW9ucyBh
cmUgcmVxdWlyZWQgYnkgdGhlIE5BTkQgY29yZSBmcmFtZXdvcmssIG90aGVyd2lzZSwNCi0tIA0K
MS42LjYuMQ0KDQo=

--_002_5D8008F58939784290FAB48F549751981D09B718B7shsmsx502ccrc_--


>From bogus@does.not.exist.com  Sun Jun  6 12:36:48 2010
From: bogus@does.not.exist.com ()
Date: Sun, 06 Jun 2010 16:36:48 -0000
Subject: No subject
Message-ID: <mailman.75.1279191728.27306.linux-mtd@lists.infradead.org>

+       timeo =3D jiffies + usecs_to_jiffies(100);
+       do {
+               ecc_state =3D (davinci_nand_readl(info,
+                               NANDFSR_OFFSET) >> 8) & 0x0f;
+               cpu_relax();
+       } while ((ecc_state < 4) && time_before(jiffies, timeo));
+       spin_unlock_irqrestore(&ecc_spin_lock, flags);

To something like:

+       timeo =3D 0;
+       do {
+               ecc_state =3D (davinci_nand_readl(info,
+                               NANDFSR_OFFSET) >> 8) & 0x0f;
+               if (!timeo)
+                       timeo =3D jiffies + usecs_to_jiffies(100);
+               cpu_relax();
+       } while ((ecc_state < 4) && time_before(jiffies, timeo));

Sorry if my mailer has messed up the formatting. Hopefuly readable.

--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
