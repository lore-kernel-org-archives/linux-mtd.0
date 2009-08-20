From: s.hauer@pengutronix.de (Sascha Hauer)
Date: Thu, 20 Aug 2009 14:52:32 +0200
Subject: [PATCH] mxc_nand: disable interrupts
Message-ID: <mailman.1.1250773093.2229.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 76beea4..bcc5929 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -175,6 +175,8 @@ static void wait_op_done(struct mxc_nand_host *host, int max_retries,
 {
 	uint32_t tmp;
 
+	useirq = 0;
+
 	if (useirq) {
 		if ((readw(host->regs + NFC_CONFIG2) & NFC_INT) == 0) {
 
-- 
1.6.3.3

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
