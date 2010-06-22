From: leiwen@marvell.com (Lei Wen)
Date: Tue, 22 Jun 2010 20:19:35 +0800
Subject: [PATCH 03/06] pxa3xx_nand: fix compile warning
Message-ID: <mailman.187.1282048210.27306.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

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


>From bogus@does.not.exist.com  Sun Jun  6 12:36:48 2010
From: bogus@does.not.exist.com ()
Date: Sun, 06 Jun 2010 16:36:48 -0000
Subject: No subject
Message-ID: <mailman.218.1283367475.27306.linux-mtd@lists.infradead.org>

to reproduce this. Since I do not have your HW I cannot reproduce this,
so the only thing I can do is to ask you to reproduce the problem with
various debugging patches.

CCing Adrian - may be he has ideas.

-- 
Best Regards,
Artem Bityutskiy (???????????????? ??????????)



>From bogus@does.not.exist.com  Sun Jun  6 12:36:48 2010
From: bogus@does.not.exist.com ()
Date: Sun, 06 Jun 2010 16:36:48 -0000
Subject: No subject
Message-ID: <mailman.231.1283515979.27306.linux-mtd@lists.infradead.org>

owner of this part of filetree.
Or did I misused the -r option?

I hope you can give me a comment or some feedback, how to change this behaviour.

Best regards
Arno
