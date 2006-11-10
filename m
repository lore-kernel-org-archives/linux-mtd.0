Received: from www.sohosted5.com ([193.138.249.49] helo=server5.sohosted.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GiUPw-0003m3-Go
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 06:19:33 -0500
From: Stefan Roese <ml@stefan-roese.de>
To: MTD mail list <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] NAND: Fix endianess bug in ndfc.c
Date: Fri, 10 Nov 2006 12:19:32 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200611101219.33579.ml@stefan-roese.de>
Cc: Josh Boyer <jwboyer@gmail.com>, Frank Haverkamp <haver@vnet.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [MTD] NAND: Fix endianess bug in ndfc.c

The writel() call accidentally clears all bits in the NDFC_CCR
register (endianess problem). Now __raw_writel() is used instead.

Tested on Bamboo with NAND on chip select 0 and chip select 1.

Signed-off-by: Stefan Roese <sr@denx.de>

---
commit 0330ccb7b7c1cdb0b9b24a305c456590184e08ca
tree 0b82605a0620160b49ce61621ee0fda76cdd9678
parent a52e107be42f85bdd2931bf8d3676cfbde418226
author Stefan Roese <sr@denx.de> Thu, 09 Nov 2006 16:50:54 +0100
committer Stefan Roese <sr@denx.de> Thu, 09 Nov 2006 16:50:54 +0100

 drivers/mtd/nand/ndfc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 039c759..fd7a8d5 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -56,7 +56,7 @@ static void ndfc_select_chip(struct mtd_
 		ccr |= NDFC_CCR_BS(chip + pchip->chip_offset);
 	} else
 		ccr |= NDFC_CCR_RESET_CE;
-	writel(ccr, ndfc->ndfcbase + NDFC_CCR);
+	__raw_writel(ccr, ndfc->ndfcbase + NDFC_CCR);
 }
 
 static void ndfc_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
