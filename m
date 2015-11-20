Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzgO9-0005Dp-Q2
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 07:45:47 +0000
Received: by wmww144 with SMTP id w144so9831890wmw.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 23:45:24 -0800 (PST)
From: LABBE Corentin <clabbe.montjoie@gmail.com>
To: computersforpeace@gmail.com,
	dwmw2@infradead.org,
	josh.wu@atmel.com
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] mtd: nand: atmel_nand: constify atmel_nand_caps
 structures
Date: Fri, 20 Nov 2015 08:45:16 +0100
Message-Id: <1448005517-26004-2-git-send-email-clabbe.montjoie@gmail.com>
In-Reply-To: <1448005517-26004-1-git-send-email-clabbe.montjoie@gmail.com>
References: <1448005517-26004-1-git-send-email-clabbe.montjoie@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All atmel_nand_caps are never modified, consitify them.

Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/mtd/nand/atmel_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 583cdd9..475c938 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -128,7 +128,7 @@ struct atmel_nand_host {
 
 	struct atmel_nfc	*nfc;
 
-	struct atmel_nand_caps	*caps;
+	const struct atmel_nand_caps	*caps;
 	bool			has_pmecc;
 	u8			pmecc_corr_cap;
 	u16			pmecc_sector_size;
@@ -2304,11 +2304,11 @@ static int atmel_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct atmel_nand_caps at91rm9200_caps = {
+static const struct atmel_nand_caps at91rm9200_caps = {
 	.pmecc_correct_erase_page = false,
 };
 
-static struct atmel_nand_caps sama5d4_caps = {
+static const struct atmel_nand_caps sama5d4_caps = {
 	.pmecc_correct_erase_page = true,
 };
 
-- 
2.4.10
