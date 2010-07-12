Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYHqR-0000jP-Jp
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2010 12:10:48 +0000
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
To: "Woodhouse, David" <david.woodhouse@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 12 Jul 2010 17:04:20 +0800
Subject: [PATCH 3/5]mtd/nand/denali.c: enabled multi connected NAND feature
Message-ID: <5D8008F58939784290FAB48F549751981D09B718B5@shsmsx502.ccr.corp.intel.com>
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_5D8008F58939784290FAB48F549751981D09B718B5shsmsx502ccrc_"
MIME-Version: 1.0
Cc: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>, "Gao,
	Yunpeng" <yunpeng.gao@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--_002_5D8008F58939784290FAB48F549751981D09B718B5shsmsx502ccrc_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>From e82af5ab049d25233709f998464f7813f4fc2ca1 Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Mon, 21 Jun 2010 18:34:30 +0800
Subject: [PATCH 3/5] [MTD/denali] enabled multi connected NAND feature

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   28 +++++++++++++++++++++++++---
 drivers/mtd/nand/denali.h |    2 ++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index fbdd9f0..57818eb 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1415,8 +1415,9 @@ static bool handle_ecc(struct denali_nand_info *denal=
i, uint8_t *buf,
 				   sector number * sector size + offset in
 				   sector
 				 */
-				int offset =3D err_sector * ECC_SECTOR_SIZE +
-								err_byte;
+				int offset =3D (err_sector * ECC_SECTOR_SIZE +
+						err_byte) * denali->devnum +
+						err_device;
 				if (offset < denali->mtd.writesize) {
 					/* correct the ECC error */
 					buf[offset] ^=3D err_correction_value;
@@ -2032,6 +2033,27 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
 		goto failed_nand;
 	}
=20
+	/* support for multi nand
+	 * MTD known nothing about multi nand,
+	 * so we should tell it the real pagesize
+	 * and anything necessery,
+	 * Some NAND chip has a spectial OOB size, so here do
+	 * a recheck */
+	denali->mtd.oobsize =3D ioread32(denali->flash_reg +
+						DEVICE_SPARE_AREA_SIZE);
+	denali->devnum =3D ioread32(denali->flash_reg + DEVICES_CONNECTED);
+	denali->nand.chipsize <<=3D (denali->devnum - 1);
+	denali->nand.page_shift +=3D (denali->devnum - 1);
+	denali->nand.pagemask =3D (denali->nand.chipsize >>
+						denali->nand.page_shift) - 1;
+	denali->nand.bbt_erase_shift +=3D (denali->devnum - 1);
+	denali->nand.phys_erase_shift =3D denali->nand.bbt_erase_shift;
+	denali->nand.chip_shift +=3D (denali->devnum - 1);
+	denali->mtd.writesize <<=3D (denali->devnum - 1);
+	denali->mtd.oobsize <<=3D (denali->devnum - 1);
+	denali->mtd.erasesize <<=3D (denali->devnum - 1);
+	denali->mtd.size =3D denali->nand.numchips * denali->nand.chipsize;
+
 	/* second stage of the NAND scan
 	 * this stage requires information regarding ECC and
 	 * bad block management. */
@@ -2060,7 +2082,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 	denali->nand.ecc.hwctl =3D denali_ecc_hwctl;
=20
 	/* override the default read operations */
-	denali->nand.ecc.size =3D denali->mtd.writesize;
+	denali->nand.ecc.size =3D denali->mtd.writesize * denali->devnum;
 	denali->nand.ecc.read_page =3D denali_read_page;
 	denali->nand.ecc.read_page_raw =3D denali_read_page_raw;
 	denali->nand.ecc.write_page =3D denali_write_page;
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index fc6be39..2bee4cb 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -802,6 +802,8 @@ struct denali_nand_info {
 	uint32_t irq_status;
 	int irq_debug_array[32];
 	int idx;
+
+	uint32_t devnum;	/* represent how many nands connected */
 };
=20
 #endif /*_LLD_NAND_*/
--=20
1.6.6.1


--_002_5D8008F58939784290FAB48F549751981D09B718B5shsmsx502ccrc_
Content-Type: application/octet-stream;
	name="0003-MTD-denali-enabled-multi-connected-NAND-feature.patch"
Content-Description: 0003-MTD-denali-enabled-multi-connected-NAND-feature.patch
Content-Disposition: attachment;
	filename="0003-MTD-denali-enabled-multi-connected-NAND-feature.patch";
	size=3098; creation-date="Mon, 21 Jun 2010 18:56:23 GMT";
	modification-date="Mon, 21 Jun 2010 18:56:23 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlODJhZjVhYjA0OWQyNTIzMzcwOWY5OTg0NjRmNzgxM2Y0ZmMyY2ExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaHVhbnhpYW8gRG9uZyA8Y2h1YW54aWFvLmRvbmdAaW50ZWwu
Y29tPgpEYXRlOiBNb24sIDIxIEp1biAyMDEwIDE4OjM0OjMwICswODAwClN1YmplY3Q6IFtQQVRD
SCAzLzVdIFtNVEQvZGVuYWxpXSBlbmFibGVkIG11bHRpIGNvbm5lY3RlZCBOQU5EIGZlYXR1cmUK
ClNpZ25lZC1vZmYtYnk6IENodWFueGlhbyBEb25nIDxjaHVhbnhpYW8uZG9uZ0BpbnRlbC5jb20+
Ci0tLQogZHJpdmVycy9tdGQvbmFuZC9kZW5hbGkuYyB8ICAgMjggKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLQogZHJpdmVycy9tdGQvbmFuZC9kZW5hbGkuaCB8ICAgIDIgKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL2RlbmFsaS5jIGIvZHJpdmVycy9tdGQvbmFuZC9kZW5hbGkuYwppbmRl
eCBmYmRkOWYwLi41NzgxOGViIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL2RlbmFsaS5j
CisrKyBiL2RyaXZlcnMvbXRkL25hbmQvZGVuYWxpLmMKQEAgLTE0MTUsOCArMTQxNSw5IEBAIHN0
YXRpYyBib29sIGhhbmRsZV9lY2Moc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSwgdWlu
dDhfdCAqYnVmLAogCQkJCSAgIHNlY3RvciBudW1iZXIgKiBzZWN0b3Igc2l6ZSArIG9mZnNldCBp
bgogCQkJCSAgIHNlY3RvcgogCQkJCSAqLwotCQkJCWludCBvZmZzZXQgPSBlcnJfc2VjdG9yICog
RUNDX1NFQ1RPUl9TSVpFICsKLQkJCQkJCQkJZXJyX2J5dGU7CisJCQkJaW50IG9mZnNldCA9IChl
cnJfc2VjdG9yICogRUNDX1NFQ1RPUl9TSVpFICsKKwkJCQkJCWVycl9ieXRlKSAqIGRlbmFsaS0+
ZGV2bnVtICsKKwkJCQkJCWVycl9kZXZpY2U7CiAJCQkJaWYgKG9mZnNldCA8IGRlbmFsaS0+bXRk
LndyaXRlc2l6ZSkgewogCQkJCQkvKiBjb3JyZWN0IHRoZSBFQ0MgZXJyb3IgKi8KIAkJCQkJYnVm
W29mZnNldF0gXj0gZXJyX2NvcnJlY3Rpb25fdmFsdWU7CkBAIC0yMDMyLDYgKzIwMzMsMjcgQEAg
c3RhdGljIGludCBkZW5hbGlfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpkZXYsIGNvbnN0IHN0
cnVjdCBwY2lfZGV2aWNlX2lkICppZCkKIAkJZ290byBmYWlsZWRfbmFuZDsKIAl9CiAKKwkvKiBz
dXBwb3J0IGZvciBtdWx0aSBuYW5kCisJICogTVREIGtub3duIG5vdGhpbmcgYWJvdXQgbXVsdGkg
bmFuZCwKKwkgKiBzbyB3ZSBzaG91bGQgdGVsbCBpdCB0aGUgcmVhbCBwYWdlc2l6ZQorCSAqIGFu
ZCBhbnl0aGluZyBuZWNlc3NlcnksCisJICogU29tZSBOQU5EIGNoaXAgaGFzIGEgc3BlY3RpYWwg
T09CIHNpemUsIHNvIGhlcmUgZG8KKwkgKiBhIHJlY2hlY2sgKi8KKwlkZW5hbGktPm10ZC5vb2Jz
aXplID0gaW9yZWFkMzIoZGVuYWxpLT5mbGFzaF9yZWcgKworCQkJCQkJREVWSUNFX1NQQVJFX0FS
RUFfU0laRSk7CisJZGVuYWxpLT5kZXZudW0gPSBpb3JlYWQzMihkZW5hbGktPmZsYXNoX3JlZyAr
IERFVklDRVNfQ09OTkVDVEVEKTsKKwlkZW5hbGktPm5hbmQuY2hpcHNpemUgPDw9IChkZW5hbGkt
PmRldm51bSAtIDEpOworCWRlbmFsaS0+bmFuZC5wYWdlX3NoaWZ0ICs9IChkZW5hbGktPmRldm51
bSAtIDEpOworCWRlbmFsaS0+bmFuZC5wYWdlbWFzayA9IChkZW5hbGktPm5hbmQuY2hpcHNpemUg
Pj4KKwkJCQkJCWRlbmFsaS0+bmFuZC5wYWdlX3NoaWZ0KSAtIDE7CisJZGVuYWxpLT5uYW5kLmJi
dF9lcmFzZV9zaGlmdCArPSAoZGVuYWxpLT5kZXZudW0gLSAxKTsKKwlkZW5hbGktPm5hbmQucGh5
c19lcmFzZV9zaGlmdCA9IGRlbmFsaS0+bmFuZC5iYnRfZXJhc2Vfc2hpZnQ7CisJZGVuYWxpLT5u
YW5kLmNoaXBfc2hpZnQgKz0gKGRlbmFsaS0+ZGV2bnVtIC0gMSk7CisJZGVuYWxpLT5tdGQud3Jp
dGVzaXplIDw8PSAoZGVuYWxpLT5kZXZudW0gLSAxKTsKKwlkZW5hbGktPm10ZC5vb2JzaXplIDw8
PSAoZGVuYWxpLT5kZXZudW0gLSAxKTsKKwlkZW5hbGktPm10ZC5lcmFzZXNpemUgPDw9IChkZW5h
bGktPmRldm51bSAtIDEpOworCWRlbmFsaS0+bXRkLnNpemUgPSBkZW5hbGktPm5hbmQubnVtY2hp
cHMgKiBkZW5hbGktPm5hbmQuY2hpcHNpemU7CisKIAkvKiBzZWNvbmQgc3RhZ2Ugb2YgdGhlIE5B
TkQgc2NhbgogCSAqIHRoaXMgc3RhZ2UgcmVxdWlyZXMgaW5mb3JtYXRpb24gcmVnYXJkaW5nIEVD
QyBhbmQKIAkgKiBiYWQgYmxvY2sgbWFuYWdlbWVudC4gKi8KQEAgLTIwNjAsNyArMjA4Miw3IEBA
IHN0YXRpYyBpbnQgZGVuYWxpX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBjb25zdCBz
dHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCiAJZGVuYWxpLT5uYW5kLmVjYy5od2N0bCA9IGRlbmFs
aV9lY2NfaHdjdGw7CiAKIAkvKiBvdmVycmlkZSB0aGUgZGVmYXVsdCByZWFkIG9wZXJhdGlvbnMg
Ki8KLQlkZW5hbGktPm5hbmQuZWNjLnNpemUgPSBkZW5hbGktPm10ZC53cml0ZXNpemU7CisJZGVu
YWxpLT5uYW5kLmVjYy5zaXplID0gZGVuYWxpLT5tdGQud3JpdGVzaXplICogZGVuYWxpLT5kZXZu
dW07CiAJZGVuYWxpLT5uYW5kLmVjYy5yZWFkX3BhZ2UgPSBkZW5hbGlfcmVhZF9wYWdlOwogCWRl
bmFsaS0+bmFuZC5lY2MucmVhZF9wYWdlX3JhdyA9IGRlbmFsaV9yZWFkX3BhZ2VfcmF3OwogCWRl
bmFsaS0+bmFuZC5lY2Mud3JpdGVfcGFnZSA9IGRlbmFsaV93cml0ZV9wYWdlOwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9kZW5hbGkuaCBiL2RyaXZlcnMvbXRkL25hbmQvZGVuYWxpLmgK
aW5kZXggZmM2YmUzOS4uMmJlZTRjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9kZW5h
bGkuaAorKysgYi9kcml2ZXJzL210ZC9uYW5kL2RlbmFsaS5oCkBAIC04MDIsNiArODAyLDggQEAg
c3RydWN0IGRlbmFsaV9uYW5kX2luZm8gewogCXVpbnQzMl90IGlycV9zdGF0dXM7CiAJaW50IGly
cV9kZWJ1Z19hcnJheVszMl07CiAJaW50IGlkeDsKKworCXVpbnQzMl90IGRldm51bTsJLyogcmVw
cmVzZW50IGhvdyBtYW55IG5hbmRzIGNvbm5lY3RlZCAqLwogfTsKIAogI2VuZGlmIC8qX0xMRF9O
QU5EXyovCi0tIAoxLjYuNi4xCgo=

--_002_5D8008F58939784290FAB48F549751981D09B718B5shsmsx502ccrc_--
