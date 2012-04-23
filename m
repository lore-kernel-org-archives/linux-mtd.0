Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMPfn-0005RZ-PB
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 20:15:48 +0000
Received: by dadn15 with SMTP id n15so19572812dad.16
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2012 13:15:46 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 2/2] mtd: nand: nand_base - pass proper 'use_oob' parameter
Date: Mon, 23 Apr 2012 13:14:29 -0700
Message-Id: <1335212069-7450-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
References: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
Cc: Viresh Kumar <viresh.kumar@st.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Vipin Kumar <vipin.kumar@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 prabhakar@freescale.com, Mike Dunn <mikedunn@newsguy.com>,
 Bastian Hecht <hechtb@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
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

We now have an interface for notifying the nand_ecc_ctrl functions when OOB
data must be returned to the upper layers and when it is simply needed for
internal calculations. This patch fills in the 'use_oob' parameter properly
from nand_do_{read,write}_ops. When utilized properly in the lower layers, this
parameter can improve performance for NAND HW that can simply avoid
transferring the OOB data.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c4989b5..089923c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1477,6 +1477,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 		mtd->oobavail : mtd->oobsize;
 
 	uint8_t *bufpoi, *oob, *buf;
+	bool use_oob;
 
 	stats = mtd->ecc_stats;
 
@@ -1490,6 +1491,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 	buf = ops->datbuf;
 	oob = ops->oobbuf;
+	use_oob = oob ? true : false;
 
 	while (1) {
 		bytes = min(mtd->writesize - col, readlen);
@@ -1507,13 +1509,13 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			/* Now read the page into the buffer */
 			if (unlikely(ops->mode == MTD_OPS_RAW))
 				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi,
-							      true, page);
+							      use_oob, page);
 			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
 				ret = chip->ecc.read_subpage(mtd, chip,
 							col, bytes, bufpoi);
 			else
 				ret = chip->ecc.read_page(mtd, chip, bufpoi,
-							  true, page);
+							  use_oob, page);
 			if (ret < 0) {
 				if (!aligned)
 					/* Invalidate page cache */
@@ -1536,7 +1538,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			buf += bytes;
 
 			if (unlikely(oob)) {
-
 				int toread = min(oobreadlen, max_oobsize);
 
 				if (toread) {
@@ -2216,6 +2217,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	uint8_t *oob = ops->oobbuf;
 	uint8_t *buf = ops->datbuf;
 	int ret, subpage;
+	bool use_oob = oob ? true : false;
 
 	ops->retlen = 0;
 	if (!writelen)
@@ -2278,7 +2280,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			memset(chip->oob_poi, 0xff, mtd->oobsize);
 		}
 
-		ret = chip->write_page(mtd, chip, wbuf, true, page, cached,
+		ret = chip->write_page(mtd, chip, wbuf, use_oob, page, cached,
 				       (ops->mode == MTD_OPS_RAW));
 		if (ret)
 			break;
-- 
1.7.5.4.2.g519b1
