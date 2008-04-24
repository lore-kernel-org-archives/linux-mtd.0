Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jp2mM-0004xr-2x
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 14:50:30 +0000
Date: Thu, 24 Apr 2008 23:51:29 +0900 (JST)
Message-Id: <20080424.235129.82088339.anemo@mba.ocn.ne.jp>
To: Andrew Victor <andrew@sanpeople.com>
Subject: [PATCH] at91_nand: control NCE signal
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver did not control NCE signal during normal operations (only
enable NCE on probing and disable NCE on removing).  This patch make
NCE signal inactive on idle state.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
 drivers/mtd/nand/at91_nand.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/at91_nand.c b/drivers/mtd/nand/at91_nand.c
index c9fb2ac..c96812f 100644
--- a/drivers/mtd/nand/at91_nand.c
+++ b/drivers/mtd/nand/at91_nand.c
@@ -44,6 +44,12 @@ static void at91_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	struct nand_chip *nand_chip = mtd->priv;
 	struct at91_nand_host *host = nand_chip->priv;
 
+	if (host->board->enable_pin && (ctrl & NAND_CTRL_CHANGE)) {
+		if (ctrl & NAND_NCE)
+			at91_set_gpio_value(host->board->enable_pin, 0);
+		else
+			at91_set_gpio_value(host->board->enable_pin, 1);
+	}
 	if (cmd == NAND_CMD_NONE)
 		return;
 
