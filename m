MIME-Version: 1.0
Date: Tue, 17 Aug 2010 20:29:53 +0800
Message-ID: <AANLkTi=9YKrS+xvuZGq-hRVv9E_oaOS+a7sDD+Y48zoy@mail.gmail.com>
Subject: [PATCH 03/06] pxa3xx_nand: fix compile warning
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary=000e0ce043362ad62d048e041b32
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--000e0ce043362ad62d048e041b32
Content-Type: text/plain; charset=ISO-8859-1

>From f66d45818712a9499458b49b5fc0dda935702f52 Mon Sep 17 00:00:00 2001
From: Lei Wen <leiwen@marvell.com>
Date: Tue, 22 Jun 2010 20:19:35 +0800
Subject: [PATCH 03/06] pxa3xx_nand: fix compile warning

The compile output as below:
WARNING: modpost: Found 1 section mismatch(es).

Signed-off-by: Lei Wen <leiwen@marvell.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 02a4466..e3061bc 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1066,7 +1066,7 @@ static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
 	this->chip_delay = 25;
 }

-static int pxa3xx_nand_probe(struct platform_device *pdev)
+static int __devinit pxa3xx_nand_probe(struct platform_device *pdev)
 {
 	struct pxa3xx_nand_platform_data *pdata;
 	struct pxa3xx_nand_info *info;
-- 
1.7.0.4

--000e0ce043362ad62d048e041b32
Content-Type: text/x-patch; charset=US-ASCII;
	name="0003-pxa3xx_nand-fix-compile-warning.patch"
Content-Disposition: attachment;
	filename="0003-pxa3xx_nand-fix-compile-warning.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gcyq3hvh0

RnJvbSBmNjZkNDU4MTg3MTJhOTQ5OTQ1OGI0OWI1ZmMwZGRhOTM1NzAyZjUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMZWkgV2VuIDxsZWl3ZW5AbWFydmVsbC5jb20+CkRhdGU6IFR1
ZSwgMjIgSnVuIDIwMTAgMjA6MTk6MzUgKzA4MDAKU3ViamVjdDogW1BBVENIIDAzLzEyXSBweGEz
eHhfbmFuZDogZml4IGNvbXBpbGUgd2FybmluZwoKVGhlIGNvbXBpbGUgb3V0cHV0IGFzIGJlbG93
OgpXQVJOSU5HOiBtb2Rwb3N0OiBGb3VuZCAxIHNlY3Rpb24gbWlzbWF0Y2goZXMpLgoKU2lnbmVk
LW9mZi1ieTogTGVpIFdlbiA8bGVpd2VuQG1hcnZlbGwuY29tPgotLS0KIGRyaXZlcnMvbXRkL25h
bmQvcHhhM3h4X25hbmQuYyB8ICAgIDIgKy0KIDEgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcHhhM3h4
X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcHhhM3h4X25hbmQuYwppbmRleCAwMmE0NDY2Li5l
MzA2MWJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3B4YTN4eF9uYW5kLmMKKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9weGEzeHhfbmFuZC5jCkBAIC0xMDY2LDcgKzEwNjYsNyBAQCBzdGF0
aWMgdm9pZCBweGEzeHhfbmFuZF9pbml0X210ZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKIAl0aGlz
LT5jaGlwX2RlbGF5ID0gMjU7CiB9CiAKLXN0YXRpYyBpbnQgcHhhM3h4X25hbmRfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyBpbnQgX19kZXZpbml0IHB4YTN4eF9u
YW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IHB4YTN4
eF9uYW5kX3BsYXRmb3JtX2RhdGEgKnBkYXRhOwogCXN0cnVjdCBweGEzeHhfbmFuZF9pbmZvICpp
bmZvOwotLSAKMS43LjAuNAoK
--000e0ce043362ad62d048e041b32--
