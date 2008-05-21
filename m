Received: from yw-out-1718.google.com ([74.125.46.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jyke4-0001nU-O9
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 09:30:04 +0000
Received: by yw-out-1718.google.com with SMTP id 5so2574977ywm.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 May 2008 02:30:03 -0700 (PDT)
Message-ID: <f17812d70805210230u62b25c1drc3d9120fae7de6a2@mail.gmail.com>
Date: Wed, 21 May 2008 17:30:03 +0800
From: "eric miao" <eric.y.miao@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] pxa: fix the incorrect calling of pxa3xx_nand_config() on
	resume path
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_5158_6207219.1211362203794"
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_5158_6207219.1211362203794
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>From b23139b5e9d39b5fea306f4429bcaa6d075d284b Mon Sep 17 00:00:00 2001
From: Eric Miao <eric.miao@marvell.com>
Date: Wed, 21 May 2008 17:26:15 +0800
Subject: [PATCH] pxa: fix the incorrect calling of
pxa3xx_nand_config() on resume path

Signed-off-by: Eric Miao <eric.miao@marvell.com>
---

David, this is a fix and I hope this can be merged soon during this
-rc period, thanks.

 drivers/mtd/nand/pxa3xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index fceb468..fe2bc7e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1216,7 +1216,7 @@ static int pxa3xx_nand_resume(struct
platform_device *pdev)

 	clk_enable(info->clk);

-	return pxa3xx_nand_config_flash(info);
+	return pxa3xx_nand_config_flash(info, info->flash_info);
 }
 #else
 #define pxa3xx_nand_suspend	NULL
-- 
1.5.4.3



-- 
Cheers
- eric

------=_Part_5158_6207219.1211362203794
Content-Type: text/x-diff;
	name=0001-pxa-fix-the-incorrect-calling-of-pxa3xx_nand_config.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fghpqh7x0
Content-Disposition: attachment;
	filename=0001-pxa-fix-the-incorrect-calling-of-pxa3xx_nand_config.patch

RnJvbSBiMjMxMzliNWU5ZDM5YjVmZWEzMDZmNDQyOWJjYWE2ZDA3NWQyODRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFcmljIE1pYW8gPGVyaWMubWlhb0BtYXJ2ZWxsLmNvbT4KRGF0
ZTogV2VkLCAyMSBNYXkgMjAwOCAxNzoyNjoxNSArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIHB4YTog
Zml4IHRoZSBpbmNvcnJlY3QgY2FsbGluZyBvZiBweGEzeHhfbmFuZF9jb25maWcoKSBvbiByZXN1
bWUgcGF0aAoKU2lnbmVkLW9mZi1ieTogRXJpYyBNaWFvIDxlcmljLm1pYW9AbWFydmVsbC5jb20+
Ci0tLQogZHJpdmVycy9tdGQvbmFuZC9weGEzeHhfbmFuZC5jIHwgICAgMiArLQogMSBmaWxlcyBj
aGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9weGEzeHhfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9weGEzeHhfbmFu
ZC5jCmluZGV4IGZjZWI0NjguLmZlMmJjN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cHhhM3h4X25hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3B4YTN4eF9uYW5kLmMKQEAgLTEy
MTYsNyArMTIxNiw3IEBAIHN0YXRpYyBpbnQgcHhhM3h4X25hbmRfcmVzdW1lKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAljbGtfZW5hYmxlKGluZm8tPmNsayk7CiAKLQlyZXR1cm4g
cHhhM3h4X25hbmRfY29uZmlnX2ZsYXNoKGluZm8pOworCXJldHVybiBweGEzeHhfbmFuZF9jb25m
aWdfZmxhc2goaW5mbywgaW5mby0+Zmxhc2hfaW5mbyk7CiB9CiAjZWxzZQogI2RlZmluZSBweGEz
eHhfbmFuZF9zdXNwZW5kCU5VTEwKLS0gCjEuNS40LjMKCg==
------=_Part_5158_6207219.1211362203794--
