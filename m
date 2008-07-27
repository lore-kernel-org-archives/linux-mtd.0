Received: from ti-out-0910.google.com ([209.85.142.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KMzkG-0006ea-KG
	for linux-mtd@lists.infradead.org; Sun, 27 Jul 2008 06:28:40 +0000
Received: by ti-out-0910.google.com with SMTP id a21so2000666tia.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 26 Jul 2008 23:28:40 -0700 (PDT)
From: Bryan Wu <cooloney@kernel.org>
To: dwmw2@infradead.org,
	akpm@linux-foundation.org
Subject: [PATCH 2/7] [MTD] Blackfin NFC Driver: fix bug - hw ecc calc by
	making sure we extract 11 bits from each register instead of 10
Date: Sun, 27 Jul 2008 14:27:54 +0800
Message-Id: <1217140079-20014-3-git-send-email-cooloney@kernel.org>
In-Reply-To: <1217140079-20014-1-git-send-email-cooloney@kernel.org>
References: <1217140079-20014-1-git-send-email-cooloney@kernel.org>
Sender: Bryan Wu <cooloney.lkml@gmail.com>
Cc: Bryan Wu <cooloney@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/nand/bf5xx_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 3254348..fc58afe 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -298,7 +298,7 @@ static int bf5xx_nand_calculate_ecc(struct mtd_info *mtd,
 	ecc0 = bfin_read_NFC_ECC0();
 	ecc1 = bfin_read_NFC_ECC1();
 
-	code[0] = (ecc0 & 0x3FF) | ((ecc1 & 0x3FF) << 11);
+	code[0] = (ecc0 & 0x7ff) | ((ecc1 & 0x7ff) << 11);
 
 	dev_dbg(info->device, "returning ecc 0x%08x\n", code[0]);
 
@@ -310,7 +310,7 @@ static int bf5xx_nand_calculate_ecc(struct mtd_info *mtd,
 	if (page_size == 512) {
 		ecc0 = bfin_read_NFC_ECC2();
 		ecc1 = bfin_read_NFC_ECC3();
-		code[1] = (ecc0 & 0x3FF) | ((ecc1 & 0x3FF) << 11);
+		code[1] = (ecc0 & 0x7ff) | ((ecc1 & 0x7ff) << 11);
 
 		/* second 3 bytes in ecc_code for second 256
 		 * bytes of 512 page size
-- 
1.5.6
