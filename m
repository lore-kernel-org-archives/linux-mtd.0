Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SJuXW-0001pd-NQ
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2012 22:36:56 +0000
Received: by dadn15 with SMTP id n15so9114789dad.16
 for <linux-mtd@lists.infradead.org>; Mon, 16 Apr 2012 15:36:54 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: nand: nand_do_{read,
 write}_ops - pass OOB buffer through
Date: Mon, 16 Apr 2012 15:35:55 -0700
Message-Id: <1334615755-15418-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
Cc: Viresh Kumar <viresh.kumar@st.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Vipin Kumar <vipin.kumar@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 Mike Dunn <mikedunn@newsguy.com>, Bastian Hecht <hechtb@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>, Liu Shuo <b35362@freescale.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that we have a function parameter for the OOB buffer, we can pass the OOB
buffer as an argument to the nand_ecc_ctrl functions. This allows drivers to
know when OOB data must be returned to the upper layers and when it is simply
needed for internal calculations, potentially saving time for NAND HW/SW that
can simply avoid reading the OOB data.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 95ba987..a206f43 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1475,7 +1475,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	uint32_t max_oobsize = ops->mode == MTD_OPS_AUTO_OOB ?
 		mtd->oobavail : mtd->oobsize;
 
-	uint8_t *bufpoi, *oob, *buf;
+	uint8_t *bufpoi, *oobpoi, *oob, *buf;
 
 	stats = mtd->ecc_stats;
 
@@ -1489,6 +1489,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 	buf = ops->datbuf;
 	oob = ops->oobbuf;
+	oobpoi = oob ? chip->oob_poi : NULL;
 
 	while (1) {
 		bytes = min(mtd->writesize - col, readlen);
@@ -1506,13 +1507,13 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			/* Now read the page into the buffer */
 			if (unlikely(ops->mode == MTD_OPS_RAW))
 				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi,
-							      NULL, page);
+							      oobpoi, page);
 			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
 				ret = chip->ecc.read_subpage(mtd, chip,
 							col, bytes, bufpoi);
 			else
 				ret = chip->ecc.read_page(mtd, chip, bufpoi,
-							  NULL, page);
+							  oobpoi, page);
 			if (ret < 0) {
 				if (!aligned)
 					/* Invalidate page cache */
@@ -1535,7 +1536,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			buf += bytes;
 
 			if (unlikely(oob)) {
-
 				int toread = min(oobreadlen, max_oobsize);
 
 				if (toread) {
@@ -2256,7 +2256,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	while (1) {
 		int bytes = mtd->writesize;
 		int cached = writelen > bytes && page != blockmask;
-		uint8_t *wbuf = buf;
+		uint8_t *wbuf = buf, *oobpoi;
 
 		/* Partial page write? */
 		if (unlikely(column || writelen < (mtd->writesize - 1))) {
@@ -2272,12 +2272,14 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			size_t len = min(oobwritelen, oobmaxlen);
 			oob = nand_fill_oob(mtd, oob, len, ops);
 			oobwritelen -= len;
+			oobpoi = chip->oob_poi;
 		} else {
+			oobpoi = NULL;
 			/* We still need to erase leftover OOB data */
 			memset(chip->oob_poi, 0xff, mtd->oobsize);
 		}
 
-		ret = chip->write_page(mtd, chip, wbuf, NULL, page, cached,
+		ret = chip->write_page(mtd, chip, wbuf, oobpoi, page, cached,
 				       (ops->mode == MTD_OPS_RAW));
 		if (ret)
 			break;
-- 
1.7.5.4.2.g519b1
