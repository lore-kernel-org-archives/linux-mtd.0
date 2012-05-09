Received: from mail-we0-f177.google.com ([74.125.82.177])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SS3uU-00042Q-Jk
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 10:14:19 +0000
Received: by werp11 with SMTP id p11so71455wer.36
 for <linux-mtd@lists.infradead.org>; Wed, 09 May 2012 03:13:39 -0700 (PDT)
Date: Wed, 9 May 2012 13:13:34 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: nand: check the return code of
 'read_oob/read_oob_raw'
Message-ID: <20120509131334.2d0b7160@pixies.home.jungo.com>
In-Reply-To: <20120509130635.32973038@pixies.home.jungo.com>
References: <20120509130635.32973038@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Apparently, there is an implementor of 'read_oob' which may return an
error inidication (e.g. docg4_read_oob may return -EIO).

Test the return value of 'read_oob/read_oob_raw', and if negative,
propagate the error, so it's returned by the '_read_oob' interface.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4047d7c..d47586c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1791,6 +1791,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	int readlen = ops->ooblen;
 	int len;
 	uint8_t *buf = ops->oobbuf;
+	int ret = 0;
 
 	pr_debug("%s: from = 0x%08Lx, len = %i\n",
 			__func__, (unsigned long long)from, readlen);
@@ -1826,9 +1827,12 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 
 	while (1) {
 		if (ops->mode == MTD_OPS_RAW)
-			chip->ecc.read_oob_raw(mtd, chip, page);
+			ret = chip->ecc.read_oob_raw(mtd, chip, page);
 		else
-			chip->ecc.read_oob(mtd, chip, page);
+			ret = chip->ecc.read_oob(mtd, chip, page);
+
+		if (ret < 0)
+			break;
 
 		len = min(len, readlen);
 		buf = nand_transfer_oob(chip, buf, ops, len);
@@ -1857,7 +1861,10 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 		}
 	}
 
-	ops->oobretlen = ops->ooblen;
+	ops->oobretlen = ops->ooblen - readlen;
+
+	if (ret < 0)
+		return ret;
 
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
-- 
1.7.9
