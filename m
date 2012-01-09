Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkLlu-0004Da-S3
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 20:24:47 +0000
Received: by iadk27 with SMTP id k27so8400220iad.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 12:24:46 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 1/6] mtd: nand: add NAND_NO_WRITE_OOB option
Date: Mon,  9 Jan 2012 12:23:27 -0800
Message-Id: <1326140612-26323-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Peter Wippich <pewi@gw-instruments.de>, Gabor Juhos <juhosg@openwrt.org>,
 Guillaume LECERF <glecerf@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
 Jamie Iles <jamie@jamieiles.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Barry Song <21cnbao@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Florian Fainelli <florian@openwrt.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some systems cannot use the OOB area for storing any information, not
even bad block markers (for instance, if ECC uses entire spare area).
Thus, we implement an option to prevent ever writing to OOB. This will
be useful for determining whether to record bad blocks by writing to the
flash-based BBT, the bad block's OOB region, or both.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    8 ++++++--
 include/linux/mtd/nand.h     |    6 ++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 35b4565..b9dbf0c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2187,6 +2187,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	int ret, subpage;
 
 	ops->retlen = 0;
+	ops->oobretlen = 0;
 	if (!writelen)
 		return 0;
 
@@ -2238,7 +2239,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			wbuf = chip->buffers->databuf;
 		}
 
-		if (unlikely(oob)) {
+		if (unlikely(oob) && !(chip->options & NAND_NO_WRITE_OOB)) {
 			size_t len = min(oobwritelen, oobmaxlen);
 			oob = nand_fill_oob(mtd, oob, len, ops);
 			oobwritelen -= len;
@@ -2270,7 +2271,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	}
 
 	ops->retlen = ops->len - writelen;
-	if (unlikely(oob))
+	if (unlikely(oob) && !(chip->options & NAND_NO_WRITE_OOB))
 		ops->oobretlen = ops->ooblen;
 	return ret;
 }
@@ -2372,6 +2373,9 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 	pr_debug("%s: to = 0x%08x, len = %i\n",
 			 __func__, (unsigned int)to, (int)ops->ooblen);
 
+	if (chip->options & NAND_NO_WRITE_OOB)
+		return 0;
+
 	if (ops->mode == MTD_OPS_AUTO_OOB)
 		len = chip->ecc.layout->oobavail;
 	else
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 63b5a8b..3547205 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -228,6 +228,12 @@ typedef enum {
 #define NAND_OWN_BUFFERS	0x00020000
 /* Chip may not exist, so silence any errors in scan */
 #define NAND_SCAN_SILENT_NODEV	0x00040000
+/*
+ * Do not write to OOB. Useful, e.g., when ECC takes up entire OOB. Should be
+ * used with flash-based BBT, since the bad block markers will no longer be
+ * reliable.
+ */
+#define NAND_NO_WRITE_OOB	0x00080000
 
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
-- 
1.7.5.4
