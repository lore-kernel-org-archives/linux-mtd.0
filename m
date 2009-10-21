Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0cAR-0004LD-PN
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:28:00 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/19] mxc nand: remove dead code
Date: Wed, 21 Oct 2009 16:13:14 +0200
Message-Id: <1256134406-25251-8-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-7-git-send-email-s.hauer@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-2-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-3-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-4-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-5-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-6-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-7-git-send-email-s.hauer@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Eric Benard <ebenard@eukrea.com>,
	Vladimir Barinov <vova.barinov@gmail.com>,
	mathieu.berland@eads.com, jbe@pengutronix.de, sha@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |   17 -----------------
 1 files changed, 0 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index cd09196..74c5dbc 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -620,23 +620,6 @@ static void mxc_nand_select_chip(struct mtd_info *mtd, int chip)
 	struct nand_chip *nand_chip = mtd->priv;
 	struct mxc_nand_host *host = nand_chip->priv;
 
-#ifdef CONFIG_MTD_NAND_MXC_FORCE_CE
-	if (chip > 0) {
-		DEBUG(MTD_DEBUG_LEVEL0,
-		      "ERROR:  Illegal chip select (chip = %d)\n", chip);
-		return;
-	}
-
-	if (chip == -1) {
-		writew(readw(host->regs + NFC_CONFIG1) & ~NFC_CE,
-				host->regs + NFC_CONFIG1);
-		return;
-	}
-
-	writew(readw(host->regs + NFC_CONFIG1) | NFC_CE,
-			host->regs + NFC_CONFIG1);
-#endif
-
 	switch (chip) {
 	case -1:
 		/* Disable the NFC clock */
-- 
1.6.5
