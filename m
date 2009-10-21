Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0bzY-0006kN-2s
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:16:44 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/19] mxc_nand: introduce mxc_do_addr_cycle
Date: Wed, 21 Oct 2009 16:13:12 +0200
Message-Id: <1256134406-25251-6-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-5-git-send-email-s.hauer@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-2-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-3-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-4-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-5-git-send-email-s.hauer@pengutronix.de>
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

This factors the address cycle to a seperate function. This
becomes useful in a later patch where we can simplify the
command processing by making use of this function.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |   87 +++++++++++++++++++++++--------------------
 1 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 56db5ac..325c5be 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -658,6 +658,52 @@ static void mxc_nand_select_chip(struct mtd_info *mtd, int chip)
 	}
 }
 
+static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
+{
+	struct nand_chip *nand_chip = mtd->priv;
+	struct mxc_nand_host *host = nand_chip->priv;
+
+	/* Write out column address, if necessary */
+	if (column != -1) {
+		/*
+		 * MXC NANDFC can only perform full page+spare or
+		 * spare-only read/write.  When the upper layers
+		 * layers perform a read/write buf operation,
+		 * we will used the saved column adress to index into
+		 * the full page.
+		 */
+		send_addr(host, 0, page_addr == -1);
+		if (host->pagesize_2k)
+			/* another col addr cycle for 2k page */
+			send_addr(host, 0, false);
+	}
+
+	/* Write out page address, if necessary */
+	if (page_addr != -1) {
+		/* paddr_0 - p_addr_7 */
+		send_addr(host, (page_addr & 0xff), false);
+
+		if (host->pagesize_2k) {
+			if (mtd->size >= 0x10000000) {
+				/* paddr_8 - paddr_15 */
+				send_addr(host, (page_addr >> 8) & 0xff, false);
+				send_addr(host, (page_addr >> 16) & 0xff, true);
+			} else
+				/* paddr_8 - paddr_15 */
+				send_addr(host, (page_addr >> 8) & 0xff, true);
+		} else {
+			/* One more address cycle for higher density devices */
+			if (mtd->size >= 0x4000000) {
+				/* paddr_8 - paddr_15 */
+				send_addr(host, (page_addr >> 8) & 0xff, false);
+				send_addr(host, (page_addr >> 16) & 0xff, true);
+			} else
+				/* paddr_8 - paddr_15 */
+				send_addr(host, (page_addr >> 8) & 0xff, true);
+		}
+	}
+}
+
 /* Used by the upper layer to write command to NAND Flash for
  * different operations to be carried out on NAND Flash */
 static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
@@ -746,46 +792,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 
 	/* Write out the command to the device. */
 	send_cmd(host, command, useirq);
-
-	/* Write out column address, if necessary */
-	if (column != -1) {
-		/*
-		 * MXC NANDFC can only perform full page+spare or
-		 * spare-only read/write.  When the upper layers
-		 * layers perform a read/write buf operation,
-		 * we will used the saved column adress to index into
-		 * the full page.
-		 */
-		send_addr(host, 0, page_addr == -1);
-		if (host->pagesize_2k)
-			/* another col addr cycle for 2k page */
-			send_addr(host, 0, false);
-	}
-
-	/* Write out page address, if necessary */
-	if (page_addr != -1) {
-		/* paddr_0 - p_addr_7 */
-		send_addr(host, (page_addr & 0xff), false);
-
-		if (host->pagesize_2k) {
-			if (mtd->size >= 0x10000000) {
-				/* paddr_8 - paddr_15 */
-				send_addr(host, (page_addr >> 8) & 0xff, false);
-				send_addr(host, (page_addr >> 16) & 0xff, true);
-			} else
-				/* paddr_8 - paddr_15 */
-				send_addr(host, (page_addr >> 8) & 0xff, true);
-		} else {
-			/* One more address cycle for higher density devices */
-			if (mtd->size >= 0x4000000) {
-				/* paddr_8 - paddr_15 */
-				send_addr(host, (page_addr >> 8) & 0xff, false);
-				send_addr(host, (page_addr >> 16) & 0xff, true);
-			} else
-				/* paddr_8 - paddr_15 */
-				send_addr(host, (page_addr >> 8) & 0xff, true);
-		}
-	}
+	mxc_do_addr_cycle(mtd, column, page_addr);
 
 	/* Command post-processing step */
 	switch (command) {
-- 
1.6.5
