From: chuanxiao.dong@intel.com (Chuanxiao Dong)
Date: Mon, 21 Jun 2010 18:31:32 +0800
Subject: [PATCH 2/5] [MTD/denali] renamed functions which is named by using=
 capitals
Message-ID: <mailman.66.1278925445.27306.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   22 +++++++++++-----------
 drivers/mtd/nand/denali.h |    5 -----
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 4e255ff..fbdd9f0 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -220,7 +220,7 @@ static void reset_bank(struct denali_nand_info *denali)
 }
=20
 /* Reset the flash controller */
-static uint16_t NAND_Flash_Reset(struct denali_nand_info *denali)
+static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 {
 	uint32_t i;
=20
@@ -256,7 +256,7 @@ static uint16_t NAND_Flash_Reset(struct denali_nand_inf=
o *denali)
  * the clocking register accordingly. The mode is determined by the
  * get_onfi_nand_para routine.
  */
-static void NAND_ONFi_Timing_Mode(struct denali_nand_info *denali,
+static void nand_onfi_timing_set(struct denali_nand_info *denali,
 								uint16_t mode)
 {
 	uint16_t Trea[6] =3D {40, 30, 25, 20, 20, 16};
@@ -487,7 +487,7 @@ static uint16_t get_onfi_nand_para(struct denali_nand_i=
nfo *denali)
 			break;
 	}
=20
-	NAND_ONFi_Timing_Mode(denali, i);
+	nand_onfi_timing_set(denali, i);
=20
 	index_addr(denali, MODE_11 | 0, 0x90);
 	index_addr(denali, MODE_11 | 1, 0);
@@ -802,7 +802,7 @@ static void dump_device_info(struct denali_nand_info *d=
enali)
 		denali->dev_info.nBitsInBlockDataSize);
 }
=20
-static uint16_t NAND_Read_Device_ID(struct denali_nand_info *denali)
+static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 {
 	uint16_t status =3D PASS;
 	uint8_t no_of_planes;
@@ -927,12 +927,12 @@ static uint16_t NAND_Read_Device_ID(struct denali_nan=
d_info *denali)
 	 * with a specific ONFI mode, we apply those changes here.
 	 */
 	if (onfi_timing_mode !=3D NAND_DEFAULT_TIMINGS)
-		NAND_ONFi_Timing_Mode(denali, onfi_timing_mode);
+		nand_onfi_timing_set(denali, onfi_timing_mode);
=20
 	return status;
 }
=20
-static void NAND_LLD_Enable_Disable_Interrupts(struct denali_nand_info *de=
nali,
+static void denali_set_intr_mode(struct denali_nand_info *denali,
 					uint16_t INT_ENABLE)
 {
 	nand_dbg_print(NAND_DBG_TRACE, "%s, Line %d, Function: %s\n",
@@ -957,7 +957,7 @@ static void denali_irq_init(struct denali_nand_info *de=
nali)
 	uint32_t int_mask =3D 0;
=20
 	/* Disable global interrupts */
-	NAND_LLD_Enable_Disable_Interrupts(denali, false);
+	denali_set_intr_mode(denali, false);
=20
 	int_mask =3D DENALI_IRQ_ALL;
=20
@@ -972,7 +972,7 @@ static void denali_irq_init(struct denali_nand_info *de=
nali)
=20
 static void denali_irq_cleanup(int irqnum, struct denali_nand_info *denali=
)
 {
-	NAND_LLD_Enable_Disable_Interrupts(denali, false);
+	denali_set_intr_mode(denali, false);
 	free_irq(irqnum, denali);
 }
=20
@@ -1794,7 +1794,7 @@ static void denali_ecc_hwctl(struct mtd_info *mtd, in=
t mode)
 static void denali_hw_init(struct denali_nand_info *denali)
 {
 	denali_irq_init(denali);
-	NAND_Flash_Reset(denali);
+	denali_nand_reset(denali);
 	denali_write32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
 	denali_write32(CHIP_EN_DONT_CARE__FLAG,
 			denali->flash_reg + CHIP_ENABLE_DONT_CARE);
@@ -1986,11 +1986,11 @@ static int denali_pci_probe(struct pci_dev *dev, co=
nst struct pci_device_id *id)
 	}
=20
 	/* now that our ISR is registered, we can enable interrupts */
-	NAND_LLD_Enable_Disable_Interrupts(denali, true);
+	denali_set_intr_mode(denali, true);
=20
 	pci_set_drvdata(dev, denali);
=20
-	NAND_Read_Device_ID(denali);
+	denali_nand_timing_set(denali);
=20
 	/* MTD supported page sizes vary by kernel. We validate our
 	 * kernel supports the device here.
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index a38c8ae..fc6be39 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -804,9 +804,4 @@ struct denali_nand_info {
 	int idx;
 };
=20
-static uint16_t  NAND_Flash_Reset(struct denali_nand_info *denali);
-static uint16_t  NAND_Read_Device_ID(struct denali_nand_info *denali);
-static void NAND_LLD_Enable_Disable_Interrupts(struct denali_nand_info *de=
nali,
-							uint16_t INT_ENABLE);
-
 #endif /*_LLD_NAND_*/
--=20
1.6.6.1


--_002_5D8008F58939784290FAB48F549751981D09B718B3shsmsx502ccrc_
Content-Type: application/octet-stream;
	name="0002-MTD-denali-renamed-functions-which-is-named-by-using.patch"
Content-Description: 0002-MTD-denali-renamed-functions-which-is-named-by-using.patch
Content-Disposition: attachment;
	filename="0002-MTD-denali-renamed-functions-which-is-named-by-using.patch";
	size=4362; creation-date="Mon, 21 Jun 2010 18:56:23 GMT";
	modification-date="Mon, 21 Jun 2010 18:56:23 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwMTc4YzNmZTI4ZGE5YmI1NjNmNzMzYzM4NWM2OGUxY2U2YTkxNzg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaHVhbnhpYW8gRG9uZyA8Y2h1YW54aWFvLmRvbmdAaW50ZWwu
Y29tPgpEYXRlOiBNb24sIDIxIEp1biAyMDEwIDE4OjMxOjMyICswODAwClN1YmplY3Q6IFtQQVRD
SCAyLzVdIFtNVEQvZGVuYWxpXSByZW5hbWVkIGZ1bmN0aW9ucyB3aGljaCBpcyBuYW1lZCBieSB1
c2luZyBjYXBpdGFscwoKU2lnbmVkLW9mZi1ieTogQ2h1YW54aWFvIERvbmcgPGNodWFueGlhby5k
b25nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL2RlbmFsaS5jIHwgICAyMiArKysr
KysrKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL2RlbmFsaS5oIHwgICAgNSAtLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL2RlbmFsaS5jIGIvZHJpdmVycy9tdGQvbmFuZC9k
ZW5hbGkuYwppbmRleCA0ZTI1NWZmLi5mYmRkOWYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9u
YW5kL2RlbmFsaS5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvZGVuYWxpLmMKQEAgLTIyMCw3ICsy
MjAsNyBAQCBzdGF0aWMgdm9pZCByZXNldF9iYW5rKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpk
ZW5hbGkpCiB9CiAKIC8qIFJlc2V0IHRoZSBmbGFzaCBjb250cm9sbGVyICovCi1zdGF0aWMgdWlu
dDE2X3QgTkFORF9GbGFzaF9SZXNldChzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpKQor
c3RhdGljIHVpbnQxNl90IGRlbmFsaV9uYW5kX3Jlc2V0KHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZv
ICpkZW5hbGkpCiB7CiAJdWludDMyX3QgaTsKIApAQCAtMjU2LDcgKzI1Niw3IEBAIHN0YXRpYyB1
aW50MTZfdCBOQU5EX0ZsYXNoX1Jlc2V0KHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkp
CiAgKiB0aGUgY2xvY2tpbmcgcmVnaXN0ZXIgYWNjb3JkaW5nbHkuIFRoZSBtb2RlIGlzIGRldGVy
bWluZWQgYnkgdGhlCiAgKiBnZXRfb25maV9uYW5kX3BhcmEgcm91dGluZS4KICAqLwotc3RhdGlj
IHZvaWQgTkFORF9PTkZpX1RpbWluZ19Nb2RlKHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5h
bGksCitzdGF0aWMgdm9pZCBuYW5kX29uZmlfdGltaW5nX3NldChzdHJ1Y3QgZGVuYWxpX25hbmRf
aW5mbyAqZGVuYWxpLAogCQkJCQkJCQl1aW50MTZfdCBtb2RlKQogewogCXVpbnQxNl90IFRyZWFb
Nl0gPSB7NDAsIDMwLCAyNSwgMjAsIDIwLCAxNn07CkBAIC00ODcsNyArNDg3LDcgQEAgc3RhdGlj
IHVpbnQxNl90IGdldF9vbmZpX25hbmRfcGFyYShzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVu
YWxpKQogCQkJYnJlYWs7CiAJfQogCi0JTkFORF9PTkZpX1RpbWluZ19Nb2RlKGRlbmFsaSwgaSk7
CisJbmFuZF9vbmZpX3RpbWluZ19zZXQoZGVuYWxpLCBpKTsKIAogCWluZGV4X2FkZHIoZGVuYWxp
LCBNT0RFXzExIHwgMCwgMHg5MCk7CiAJaW5kZXhfYWRkcihkZW5hbGksIE1PREVfMTEgfCAxLCAw
KTsKQEAgLTgwMiw3ICs4MDIsNyBAQCBzdGF0aWMgdm9pZCBkdW1wX2RldmljZV9pbmZvKHN0cnVj
dCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkpCiAJCWRlbmFsaS0+ZGV2X2luZm8ubkJpdHNJbkJs
b2NrRGF0YVNpemUpOwogfQogCi1zdGF0aWMgdWludDE2X3QgTkFORF9SZWFkX0RldmljZV9JRChz
dHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpKQorc3RhdGljIHVpbnQxNl90IGRlbmFsaV9u
YW5kX3RpbWluZ19zZXQoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSkKIHsKIAl1aW50
MTZfdCBzdGF0dXMgPSBQQVNTOwogCXVpbnQ4X3Qgbm9fb2ZfcGxhbmVzOwpAQCAtOTI3LDEyICs5
MjcsMTIgQEAgc3RhdGljIHVpbnQxNl90IE5BTkRfUmVhZF9EZXZpY2VfSUQoc3RydWN0IGRlbmFs
aV9uYW5kX2luZm8gKmRlbmFsaSkKIAkgKiB3aXRoIGEgc3BlY2lmaWMgT05GSSBtb2RlLCB3ZSBh
cHBseSB0aG9zZSBjaGFuZ2VzIGhlcmUuCiAJICovCiAJaWYgKG9uZmlfdGltaW5nX21vZGUgIT0g
TkFORF9ERUZBVUxUX1RJTUlOR1MpCi0JCU5BTkRfT05GaV9UaW1pbmdfTW9kZShkZW5hbGksIG9u
ZmlfdGltaW5nX21vZGUpOworCQluYW5kX29uZmlfdGltaW5nX3NldChkZW5hbGksIG9uZmlfdGlt
aW5nX21vZGUpOwogCiAJcmV0dXJuIHN0YXR1czsKIH0KIAotc3RhdGljIHZvaWQgTkFORF9MTERf
RW5hYmxlX0Rpc2FibGVfSW50ZXJydXB0cyhzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxp
LAorc3RhdGljIHZvaWQgZGVuYWxpX3NldF9pbnRyX21vZGUoc3RydWN0IGRlbmFsaV9uYW5kX2lu
Zm8gKmRlbmFsaSwKIAkJCQkJdWludDE2X3QgSU5UX0VOQUJMRSkKIHsKIAluYW5kX2RiZ19wcmlu
dChOQU5EX0RCR19UUkFDRSwgIiVzLCBMaW5lICVkLCBGdW5jdGlvbjogJXNcbiIsCkBAIC05NTcs
NyArOTU3LDcgQEAgc3RhdGljIHZvaWQgZGVuYWxpX2lycV9pbml0KHN0cnVjdCBkZW5hbGlfbmFu
ZF9pbmZvICpkZW5hbGkpCiAJdWludDMyX3QgaW50X21hc2sgPSAwOwogCiAJLyogRGlzYWJsZSBn
bG9iYWwgaW50ZXJydXB0cyAqLwotCU5BTkRfTExEX0VuYWJsZV9EaXNhYmxlX0ludGVycnVwdHMo
ZGVuYWxpLCBmYWxzZSk7CisJZGVuYWxpX3NldF9pbnRyX21vZGUoZGVuYWxpLCBmYWxzZSk7CiAK
IAlpbnRfbWFzayA9IERFTkFMSV9JUlFfQUxMOwogCkBAIC05NzIsNyArOTcyLDcgQEAgc3RhdGlj
IHZvaWQgZGVuYWxpX2lycV9pbml0KHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkpCiAK
IHN0YXRpYyB2b2lkIGRlbmFsaV9pcnFfY2xlYW51cChpbnQgaXJxbnVtLCBzdHJ1Y3QgZGVuYWxp
X25hbmRfaW5mbyAqZGVuYWxpKQogewotCU5BTkRfTExEX0VuYWJsZV9EaXNhYmxlX0ludGVycnVw
dHMoZGVuYWxpLCBmYWxzZSk7CisJZGVuYWxpX3NldF9pbnRyX21vZGUoZGVuYWxpLCBmYWxzZSk7
CiAJZnJlZV9pcnEoaXJxbnVtLCBkZW5hbGkpOwogfQogCkBAIC0xNzk0LDcgKzE3OTQsNyBAQCBz
dGF0aWMgdm9pZCBkZW5hbGlfZWNjX2h3Y3RsKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgbW9k
ZSkKIHN0YXRpYyB2b2lkIGRlbmFsaV9od19pbml0KHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpk
ZW5hbGkpCiB7CiAJZGVuYWxpX2lycV9pbml0KGRlbmFsaSk7Ci0JTkFORF9GbGFzaF9SZXNldChk
ZW5hbGkpOworCWRlbmFsaV9uYW5kX3Jlc2V0KGRlbmFsaSk7CiAJZGVuYWxpX3dyaXRlMzIoMHgw
RiwgZGVuYWxpLT5mbGFzaF9yZWcgKyBSQl9QSU5fRU5BQkxFRCk7CiAJZGVuYWxpX3dyaXRlMzIo
Q0hJUF9FTl9ET05UX0NBUkVfX0ZMQUcsCiAJCQlkZW5hbGktPmZsYXNoX3JlZyArIENISVBfRU5B
QkxFX0RPTlRfQ0FSRSk7CkBAIC0xOTg2LDExICsxOTg2LDExIEBAIHN0YXRpYyBpbnQgZGVuYWxp
X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9p
ZCAqaWQpCiAJfQogCiAJLyogbm93IHRoYXQgb3VyIElTUiBpcyByZWdpc3RlcmVkLCB3ZSBjYW4g
ZW5hYmxlIGludGVycnVwdHMgKi8KLQlOQU5EX0xMRF9FbmFibGVfRGlzYWJsZV9JbnRlcnJ1cHRz
KGRlbmFsaSwgdHJ1ZSk7CisJZGVuYWxpX3NldF9pbnRyX21vZGUoZGVuYWxpLCB0cnVlKTsKIAog
CXBjaV9zZXRfZHJ2ZGF0YShkZXYsIGRlbmFsaSk7CiAKLQlOQU5EX1JlYWRfRGV2aWNlX0lEKGRl
bmFsaSk7CisJZGVuYWxpX25hbmRfdGltaW5nX3NldChkZW5hbGkpOwogCiAJLyogTVREIHN1cHBv
cnRlZCBwYWdlIHNpemVzIHZhcnkgYnkga2VybmVsLiBXZSB2YWxpZGF0ZSBvdXIKIAkgKiBrZXJu
ZWwgc3VwcG9ydHMgdGhlIGRldmljZSBoZXJlLgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9kZW5hbGkuaCBiL2RyaXZlcnMvbXRkL25hbmQvZGVuYWxpLmgKaW5kZXggYTM4YzhhZS4uZmM2
YmUzOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9kZW5hbGkuaAorKysgYi9kcml2ZXJz
L210ZC9uYW5kL2RlbmFsaS5oCkBAIC04MDQsOSArODA0LDQgQEAgc3RydWN0IGRlbmFsaV9uYW5k
X2luZm8gewogCWludCBpZHg7CiB9OwogCi1zdGF0aWMgdWludDE2X3QgIE5BTkRfRmxhc2hfUmVz
ZXQoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSk7Ci1zdGF0aWMgdWludDE2X3QgIE5B
TkRfUmVhZF9EZXZpY2VfSUQoc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSk7Ci1zdGF0
aWMgdm9pZCBOQU5EX0xMRF9FbmFibGVfRGlzYWJsZV9JbnRlcnJ1cHRzKHN0cnVjdCBkZW5hbGlf
bmFuZF9pbmZvICpkZW5hbGksCi0JCQkJCQkJdWludDE2X3QgSU5UX0VOQUJMRSk7Ci0KICNlbmRp
ZiAvKl9MTERfTkFORF8qLwotLSAKMS42LjYuMQoK

--_002_5D8008F58939784290FAB48F549751981D09B718B3shsmsx502ccrc_--
