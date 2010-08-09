Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OiSHi-0000dB-Tp
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 13:21:01 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/12] mxc_nand: Do not do byte accesses to the NFC buffer.
Date: Mon,  9 Aug 2010 15:20:53 +0200
Message-Id: <1281360053-8386-10-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1281360053-8386-1-git-send-email-s.hauer@pengutronix.de>
References: <1281360053-8386-1-git-send-email-s.hauer@pengutronix.de>
Cc: Baruch Siach <baruch@tkos.co.il>, Sascha Hauer <s.hauer@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: John Ogness <john.ogness@linutronix.de>

This patch avoids byte access to the NFC buffer. Byte access to the
NFC is not allowed.

The patch is against linux-next 20100618.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index d88f0fa..a85b60a 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -402,16 +402,16 @@ static void send_read_id_v1_v2(struct mxc_nand_host *host)
 	/* Wait for operation to complete */
 	wait_op_done(host, true);
 
+	memcpy(host->data_buf, host->main_area0, 16);
+
 	if (this->options & NAND_BUSWIDTH_16) {
-		void __iomem *main_buf = host->main_area0;
 		/* compress the ID info */
-		writeb(readb(main_buf + 2), main_buf + 1);
-		writeb(readb(main_buf + 4), main_buf + 2);
-		writeb(readb(main_buf + 6), main_buf + 3);
-		writeb(readb(main_buf + 8), main_buf + 4);
-		writeb(readb(main_buf + 10), main_buf + 5);
+		host->data_buf[1] = host->data_buf[2];
+		host->data_buf[2] = host->data_buf[4];
+		host->data_buf[3] = host->data_buf[6];
+		host->data_buf[4] = host->data_buf[8];
+		host->data_buf[5] = host->data_buf[10];
 	}
-	memcpy(host->data_buf, host->main_area0, 16);
 }
 
 static uint16_t get_dev_status_v3(struct mxc_nand_host *host)
-- 
1.7.1
