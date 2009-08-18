Received: from wmproxy1-g27.free.fr ([212.27.42.91])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MdWp2-0004mc-Uk
	for linux-mtd@lists.infradead.org; Tue, 18 Aug 2009 22:06:37 +0000
Date: Wed, 19 Aug 2009 00:06:28 +0200 (CEST)
From: dimitri.gorokhovik@free.fr
To: David Woodhouse <dwmw2@infradead.org>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Tim Gardner <tim.gardner@canonical.com>,
	Scott James Remnant <scott@canonical.com>, Julia Lawall <julia@diku.dk>,
	David Brownell <dbrownell@users.sourceforge.net>
Message-ID: <785022442.3397251250633188592.JavaMail.root@zimbra3-e1.priv.proxad.net>
In-Reply-To: <605152405.3397101250633087167.JavaMail.root@zimbra3-e1.priv.proxad.net>
Subject: [PATCH] nftl: fix offset alignments
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Arithmetic conversion in the mask computation makes the upper word 
of the second argument passed down to mtd->read_oob(), be always 0
(assuming 'offs' being a 64-bit signed long long type, and 
'mtd->writesize' being a 32-bit unsigned int type). 

This patch applies over the other one adding masking in nftl_write,
"nftl: write support is broken".

Signed-off-by: <dimitri.gorokhovik@free.fr>
---
 
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index 665d3eb..d2fd066 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -135,16 +135,17 @@ static void nftl_remove_dev(struct mtd_blktrans_dev *dev)
 int nftl_read_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 		  size_t *retlen, uint8_t *buf)
 {
+	typeof(offs) mask = mtd->writesize - 1;
 	struct mtd_oob_ops ops;
 	int res;
 
 	ops.mode = MTD_OOB_PLACE;
-	ops.ooboffs = offs & (mtd->writesize - 1);
+	ops.ooboffs = offs & mask;
 	ops.ooblen = len;
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
 
-	res = mtd->read_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
+	res = mtd->read_oob(mtd, offs & ~mask, &ops);
 	*retlen = ops.oobretlen;
 	return res;
 }
@@ -155,16 +156,17 @@ int nftl_read_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 int nftl_write_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 		   size_t *retlen, uint8_t *buf)
 {
+	typeof(offs) mask = mtd->writesize - 1;
 	struct mtd_oob_ops ops;
 	int res;
 
 	ops.mode = MTD_OOB_PLACE;
-	ops.ooboffs = offs & (mtd->writesize - 1);
+	ops.ooboffs = offs & mask;
 	ops.ooblen = len;
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
 
-	res = mtd->write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
+	res = mtd->write_oob(mtd, offs & ~mask, &ops);
 	*retlen = ops.oobretlen;
 	return res;
 }
@@ -177,17 +179,18 @@ int nftl_write_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 static int nftl_write(struct mtd_info *mtd, loff_t offs, size_t len,
 		      size_t *retlen, uint8_t *buf, uint8_t *oob)
 {
+	typeof(offs) mask = mtd->writesize - 1;
 	struct mtd_oob_ops ops;
 	int res;
 
 	ops.mode = MTD_OOB_PLACE;
-	ops.ooboffs = offs & (mtd->writesize - 1);
+	ops.ooboffs = offs & mask;
 	ops.ooblen = mtd->oobsize;
 	ops.oobbuf = oob;
 	ops.datbuf = buf;
 	ops.len = len;
 
-	res = mtd->write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
+	res = mtd->write_oob(mtd, offs & ~mask, &ops);
 	*retlen = ops.retlen;
 	return res;
 }
