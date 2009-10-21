Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0c2A-0003K2-0h
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:19:26 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/19] mxc_nand: remove unused defines
Date: Wed, 21 Oct 2009 16:13:19 +0200
Message-Id: <1256134406-25251-13-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-12-git-send-email-s.hauer@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-2-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-3-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-4-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-5-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-6-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-7-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-8-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-9-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-10-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-11-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-12-git-send-email-s.hauer@pengutronix.de>
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
 drivers/mtd/nand/mxc_nand.c |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 04b2bf2..2988f1d 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -122,13 +122,6 @@ struct mxc_nand_host {
 
 /* Define delays in microsec for NAND device operations */
 #define TROP_US_DELAY   2000
-/* Macros to get byte and bit positions of ECC */
-#define COLPOS(x)  ((x) >> 3)
-#define BITPOS(x) ((x) & 0xf)
-
-/* Define single bit Error positions in Main & Spare area */
-#define MAIN_SINGLEBIT_ERROR 0x4
-#define SPARE_SINGLEBIT_ERROR 0x1
 
 /* OOB placement block for use with hardware ecc generation */
 static struct nand_ecclayout nand_hw_eccoob_smallpage = {
-- 
1.6.5
