Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e424N-0005jr-BT
 for linux-mtd@lists.infradead.org; Mon, 16 Oct 2017 09:52:25 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 2/2] mtd: nand: mxc: use dev_dbg to print debug messages
Date: Mon, 16 Oct 2017 11:51:55 +0200
Message-Id: <20171016095155.29174-3-s.hauer@pengutronix.de>
In-Reply-To: <20171016095155.29174-1-s.hauer@pengutronix.de>
References: <20171016095155.29174-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When a struct device * is around use dev_dbg instead of pr_debug
to give the messages more context.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index bec9ec5bbb8c..ecef5c2a0e56 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -415,7 +415,7 @@ static void send_cmd_v3(struct mxc_nand_host *host, uint16_t cmd, int useirq)
  * waits for completion. */
 static void send_cmd_v1_v2(struct mxc_nand_host *host, uint16_t cmd, int useirq)
 {
-	pr_debug("send_cmd(host, 0x%x, %d)\n", cmd, useirq);
+	dev_dbg(host->dev, "send_cmd(host, 0x%x, %d)\n", cmd, useirq);
 
 	writew(cmd, NFC_V1_V2_FLASH_CMD);
 	writew(NFC_CMD, NFC_V1_V2_CONFIG2);
@@ -431,7 +431,7 @@ static void send_cmd_v1_v2(struct mxc_nand_host *host, uint16_t cmd, int useirq)
 			udelay(1);
 		}
 		if (max_retries < 0)
-			pr_debug("%s: RESET failed\n", __func__);
+			dev_dbg(host->dev, "%s: RESET failed\n", __func__);
 	} else {
 		/* Wait for operation to complete */
 		wait_op_done(host, useirq);
@@ -454,7 +454,7 @@ static void send_addr_v3(struct mxc_nand_host *host, uint16_t addr, int islast)
  * a NAND command. */
 static void send_addr_v1_v2(struct mxc_nand_host *host, uint16_t addr, int islast)
 {
-	pr_debug("send_addr(host, 0x%x %d)\n", addr, islast);
+	dev_dbg(host->dev, "send_addr(host, 0x%x %d)\n", addr, islast);
 
 	writew(addr, NFC_V1_V2_FLASH_ADDR);
 	writew(NFC_ADDR, NFC_V1_V2_CONFIG2);
@@ -607,7 +607,7 @@ static int mxc_nand_correct_data_v1(struct mtd_info *mtd, u_char *dat,
 	uint16_t ecc_status = get_ecc_status_v1(host);
 
 	if (((ecc_status & 0x3) == 2) || ((ecc_status >> 2) == 2)) {
-		pr_debug("MXC_NAND: HWECC uncorrectable 2-bit ECC error\n");
+		dev_dbg(host->dev, "HWECC uncorrectable 2-bit ECC error\n");
 		return -EBADMSG;
 	}
 
@@ -642,7 +642,7 @@ static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
 		ecc_stat >>= 4;
 	} while (--no_subpages);
 
-	pr_debug("%d Symbol Correctable RS-ECC Error\n", ret);
+	dev_dbg(host->dev, "%d Symbol Correctable RS-ECC Error\n", ret);
 
 	return ret;
 }
@@ -673,7 +673,7 @@ static u_char mxc_nand_read_byte(struct mtd_info *mtd)
 		host->buf_start++;
 	}
 
-	pr_debug("%s: ret=0x%hhx (start=%u)\n", __func__, ret, host->buf_start);
+	dev_dbg(host->dev, "%s: ret=0x%hhx (start=%u)\n", __func__, ret, host->buf_start);
 	return ret;
 }
 
@@ -1212,7 +1212,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 
-	pr_debug("mxc_nand_command (cmd = 0x%x, col = 0x%x, page = 0x%x)\n",
+	dev_dbg(host->dev, "mxc_nand_command (cmd = 0x%x, col = 0x%x, page = 0x%x)\n",
 	      command, column, page_addr);
 
 	/* Reset command state information */
-- 
2.11.0
