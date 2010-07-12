Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYHqQ-0000jP-Cx
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2010 12:10:47 +0000
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
To: "Woodhouse, David" <david.woodhouse@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 12 Jul 2010 17:04:31 +0800
Subject: [PATCH 4/5]mtd/nand/denali.c: fixed ecc handler bug
Message-ID: <5D8008F58939784290FAB48F549751981D09B718B6@shsmsx502.ccr.corp.intel.com>
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_5D8008F58939784290FAB48F549751981D09B718B6shsmsx502ccrc_"
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

--_002_5D8008F58939784290FAB48F549751981D09B718B6shsmsx502ccrc_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>From b70213faa45ffd432d17b2f3c45c68621f15281b Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Mon, 21 Jun 2010 18:46:10 +0800
Subject: [PATCH 4/5] [MTD/denali] Fixed ECC handler bug
 1. when found ecc errors while reading, handler only process these errors =
in MAIN area,
    just ignore these ecc errors in spare area
 2. corrected some wrong defines

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   28 +++++++++++++++++-----------
 1 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 57818eb..1555921 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1382,12 +1382,12 @@ bool is_erased(uint8_t *buf, int len)
 #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
 #define ECC_BYTE(x)	(((x) & ECC_ERROR_ADDRESS__OFFSET))
 #define ECC_CORRECTION_VALUE(x) ((x) & ERR_CORRECTION_INFO__BYTEMASK)
-#define ECC_ERROR_CORRECTABLE(x) (!((x) & ERR_CORRECTION_INFO))
-#define ECC_ERR_DEVICE(x)	((x) & ERR_CORRECTION_INFO__DEVICE_NR >> 8)
+#define ECC_ERROR_CORRECTABLE(x) (!((x) & ERR_CORRECTION_INFO__ERROR_TYPE)=
)
+#define ECC_ERR_DEVICE(x)	(((x) & ERR_CORRECTION_INFO__DEVICE_NR) >> 8)
 #define ECC_LAST_ERR(x)		((x) & ERR_CORRECTION_INFO__LAST_ERR_INFO)
=20
 static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
-			uint8_t *oobbuf, uint32_t irq_status)
+			uint32_t irq_status)
 {
 	bool check_erased_page =3D false;
=20
@@ -1412,13 +1412,19 @@ static bool handle_ecc(struct denali_nand_info *den=
ali, uint8_t *buf,
=20
 			if (ECC_ERROR_CORRECTABLE(err_correction_info)) {
 				/* offset in our buffer is computed as:
-				   sector number * sector size + offset in
-				   sector
-				 */
-				int offset =3D (err_sector * ECC_SECTOR_SIZE +
-						err_byte) * denali->devnum +
-						err_device;
-				if (offset < denali->mtd.writesize) {
+				 * sector number * sector size + offset in
+				 * sector + err_device
+				 * If err_byte is larger than ECC_SECTOR_SIZE,
+				 * means error happend in OOB, so we ignore
+				 * it. It's no need for us to correct it
+				 * */
+				if (err_byte < ECC_SECTOR_SIZE) {
+					int offset;
+					offset =3D (err_sector *
+							ECC_SECTOR_SIZE +
+							err_byte) *
+							denali->devnum +
+							err_device;
 					/* correct the ECC error */
 					buf[offset] ^=3D err_correction_value;
 					denali->mtd.ecc_stats.corrected++;
@@ -1604,7 +1610,7 @@ static int denali_read_page(struct mtd_info *mtd, str=
uct nand_chip *chip,
=20
 	memcpy(buf, denali->buf.buf, mtd->writesize);
=20
-	check_erased_page =3D handle_ecc(denali, buf, chip->oob_poi, irq_status);
+	check_erased_page =3D handle_ecc(denali, buf, irq_status);
 	denali_enable_dma(denali, false);
=20
 	if (check_erased_page) {
--=20
1.6.6.1


--_002_5D8008F58939784290FAB48F549751981D09B718B6shsmsx502ccrc_
Content-Type: application/octet-stream;
	name="0004-MTD-denali-Fixed-ECC-handler-bug.patch"
Content-Description: 0004-MTD-denali-Fixed-ECC-handler-bug.patch
Content-Disposition: attachment;
	filename="0004-MTD-denali-Fixed-ECC-handler-bug.patch"; size=2816;
	creation-date="Mon, 21 Jun 2010 18:56:23 GMT";
	modification-date="Mon, 21 Jun 2010 18:56:23 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiNzAyMTNmYWE0NWZmZDQzMmQxN2IyZjNjNDVjNjg2MjFmMTUyODFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaHVhbnhpYW8gRG9uZyA8Y2h1YW54aWFvLmRvbmdAaW50ZWwu
Y29tPgpEYXRlOiBNb24sIDIxIEp1biAyMDEwIDE4OjQ2OjEwICswODAwClN1YmplY3Q6IFtQQVRD
SCA0LzVdIFtNVEQvZGVuYWxpXSBGaXhlZCBFQ0MgaGFuZGxlciBidWcKIDEuIHdoZW4gZm91bmQg
ZWNjIGVycm9ycyB3aGlsZSByZWFkaW5nLCBoYW5kbGVyIG9ubHkgcHJvY2VzcyB0aGVzZSBlcnJv
cnMgaW4gTUFJTiBhcmVhLAogICAganVzdCBpZ25vcmUgdGhlc2UgZWNjIGVycm9ycyBpbiBzcGFy
ZSBhcmVhCiAyLiBjb3JyZWN0ZWQgc29tZSB3cm9uZyBkZWZpbmVzCgpTaWduZWQtb2ZmLWJ5OiBD
aHVhbnhpYW8gRG9uZyA8Y2h1YW54aWFvLmRvbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvbXRk
L25hbmQvZGVuYWxpLmMgfCAgIDI4ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmls
ZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9kZW5hbGkuYyBiL2RyaXZlcnMvbXRkL25hbmQvZGVuYWxpLmMK
aW5kZXggNTc4MThlYi4uMTU1NTkyMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9kZW5h
bGkuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL2RlbmFsaS5jCkBAIC0xMzgyLDEyICsxMzgyLDEy
IEBAIGJvb2wgaXNfZXJhc2VkKHVpbnQ4X3QgKmJ1ZiwgaW50IGxlbikKICNkZWZpbmUgRUNDX1NF
Q1RPUih4KQkoKCh4KSAmIEVDQ19FUlJPUl9BRERSRVNTX19TRUNUT1JfTlIpID4+IDEyKQogI2Rl
ZmluZSBFQ0NfQllURSh4KQkoKCh4KSAmIEVDQ19FUlJPUl9BRERSRVNTX19PRkZTRVQpKQogI2Rl
ZmluZSBFQ0NfQ09SUkVDVElPTl9WQUxVRSh4KSAoKHgpICYgRVJSX0NPUlJFQ1RJT05fSU5GT19f
QllURU1BU0spCi0jZGVmaW5lIEVDQ19FUlJPUl9DT1JSRUNUQUJMRSh4KSAoISgoeCkgJiBFUlJf
Q09SUkVDVElPTl9JTkZPKSkKLSNkZWZpbmUgRUNDX0VSUl9ERVZJQ0UoeCkJKCh4KSAmIEVSUl9D
T1JSRUNUSU9OX0lORk9fX0RFVklDRV9OUiA+PiA4KQorI2RlZmluZSBFQ0NfRVJST1JfQ09SUkVD
VEFCTEUoeCkgKCEoKHgpICYgRVJSX0NPUlJFQ1RJT05fSU5GT19fRVJST1JfVFlQRSkpCisjZGVm
aW5lIEVDQ19FUlJfREVWSUNFKHgpCSgoKHgpICYgRVJSX0NPUlJFQ1RJT05fSU5GT19fREVWSUNF
X05SKSA+PiA4KQogI2RlZmluZSBFQ0NfTEFTVF9FUlIoeCkJCSgoeCkgJiBFUlJfQ09SUkVDVElP
Tl9JTkZPX19MQVNUX0VSUl9JTkZPKQogCiBzdGF0aWMgYm9vbCBoYW5kbGVfZWNjKHN0cnVjdCBk
ZW5hbGlfbmFuZF9pbmZvICpkZW5hbGksIHVpbnQ4X3QgKmJ1ZiwKLQkJCXVpbnQ4X3QgKm9vYmJ1
ZiwgdWludDMyX3QgaXJxX3N0YXR1cykKKwkJCXVpbnQzMl90IGlycV9zdGF0dXMpCiB7CiAJYm9v
bCBjaGVja19lcmFzZWRfcGFnZSA9IGZhbHNlOwogCkBAIC0xNDEyLDEzICsxNDEyLDE5IEBAIHN0
YXRpYyBib29sIGhhbmRsZV9lY2Moc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSwgdWlu
dDhfdCAqYnVmLAogCiAJCQlpZiAoRUNDX0VSUk9SX0NPUlJFQ1RBQkxFKGVycl9jb3JyZWN0aW9u
X2luZm8pKSB7CiAJCQkJLyogb2Zmc2V0IGluIG91ciBidWZmZXIgaXMgY29tcHV0ZWQgYXM6Ci0J
CQkJICAgc2VjdG9yIG51bWJlciAqIHNlY3RvciBzaXplICsgb2Zmc2V0IGluCi0JCQkJICAgc2Vj
dG9yCi0JCQkJICovCi0JCQkJaW50IG9mZnNldCA9IChlcnJfc2VjdG9yICogRUNDX1NFQ1RPUl9T
SVpFICsKLQkJCQkJCWVycl9ieXRlKSAqIGRlbmFsaS0+ZGV2bnVtICsKLQkJCQkJCWVycl9kZXZp
Y2U7Ci0JCQkJaWYgKG9mZnNldCA8IGRlbmFsaS0+bXRkLndyaXRlc2l6ZSkgeworCQkJCSAqIHNl
Y3RvciBudW1iZXIgKiBzZWN0b3Igc2l6ZSArIG9mZnNldCBpbgorCQkJCSAqIHNlY3RvciArIGVy
cl9kZXZpY2UKKwkJCQkgKiBJZiBlcnJfYnl0ZSBpcyBsYXJnZXIgdGhhbiBFQ0NfU0VDVE9SX1NJ
WkUsCisJCQkJICogbWVhbnMgZXJyb3IgaGFwcGVuZCBpbiBPT0IsIHNvIHdlIGlnbm9yZQorCQkJ
CSAqIGl0LiBJdCdzIG5vIG5lZWQgZm9yIHVzIHRvIGNvcnJlY3QgaXQKKwkJCQkgKiAqLworCQkJ
CWlmIChlcnJfYnl0ZSA8IEVDQ19TRUNUT1JfU0laRSkgeworCQkJCQlpbnQgb2Zmc2V0OworCQkJ
CQlvZmZzZXQgPSAoZXJyX3NlY3RvciAqCisJCQkJCQkJRUNDX1NFQ1RPUl9TSVpFICsKKwkJCQkJ
CQllcnJfYnl0ZSkgKgorCQkJCQkJCWRlbmFsaS0+ZGV2bnVtICsKKwkJCQkJCQllcnJfZGV2aWNl
OwogCQkJCQkvKiBjb3JyZWN0IHRoZSBFQ0MgZXJyb3IgKi8KIAkJCQkJYnVmW29mZnNldF0gXj0g
ZXJyX2NvcnJlY3Rpb25fdmFsdWU7CiAJCQkJCWRlbmFsaS0+bXRkLmVjY19zdGF0cy5jb3JyZWN0
ZWQrKzsKQEAgLTE2MDQsNyArMTYxMCw3IEBAIHN0YXRpYyBpbnQgZGVuYWxpX3JlYWRfcGFnZShz
dHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIAogCW1lbWNweShi
dWYsIGRlbmFsaS0+YnVmLmJ1ZiwgbXRkLT53cml0ZXNpemUpOwogCi0JY2hlY2tfZXJhc2VkX3Bh
Z2UgPSBoYW5kbGVfZWNjKGRlbmFsaSwgYnVmLCBjaGlwLT5vb2JfcG9pLCBpcnFfc3RhdHVzKTsK
KwljaGVja19lcmFzZWRfcGFnZSA9IGhhbmRsZV9lY2MoZGVuYWxpLCBidWYsIGlycV9zdGF0dXMp
OwogCWRlbmFsaV9lbmFibGVfZG1hKGRlbmFsaSwgZmFsc2UpOwogCiAJaWYgKGNoZWNrX2VyYXNl
ZF9wYWdlKSB7Ci0tIAoxLjYuNi4xCgo=

--_002_5D8008F58939784290FAB48F549751981D09B718B6shsmsx502ccrc_--
