Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dVxif-0004FI-AL
 for linux-mtd@lists.infradead.org; Fri, 14 Jul 2017 10:21:12 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: [PATCH RFC] mtdpart: don't force alignment to eraseblock if flags
 have MTD_NO_ERASE
Date: Fri, 14 Jul 2017 12:20:27 +0200
Message-Id: <20170714102027.9916-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some mtd devices don't need to be erased before writing to them. For
these it doesn't make sense to force partition alignment to erase
blocks.

This patch allows partitioning an Everspin mr25h256 that has
erasesize=32768, size=32768 and writesize=1.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this is my followup suggestion for

	From: Bastian Stender <bst@pengutronix.de>
	Subject: Re: [PATCH 1/2] mtd: spi-nor: make n_sectors in flash_info 32 bit wide
	Message-Id: <afb06b83-e97b-48db-9875-9f76b365a5f4@pengutronix.de>



It's IMHO ugly because the two bodys of the newly introduced if look very
similar, but I think there is not much we can do about this.

To ease your reviews: The else body is exactly what we had before.

I'm a bit unsure about the check

	slave->mtd.erasesize >= slave->mtd.writesize

because if that is false, the old code is not only inconvenient by not allowing
partitions, but also wrong. So probably the check can safely be dropped?

Otherwise the logic should be:

	if (MTD_NO_ERASE):
		alignto = writesize
	else:
		alignto = max(writesize, erasesize)
	    
Best regards
Uwe

 drivers/mtd/mtdpart.c | 47 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ea5e5307f667..956c8f0ce2dd 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -567,20 +567,39 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 		slave->mtd.erasesize = master->erasesize;
 	}
 
-	if ((slave->mtd.flags & MTD_WRITEABLE) &&
-	    mtd_mod_by_eb(slave->offset, &slave->mtd)) {
-		/* Doesn't start on a boundary of major erase size */
-		/* FIXME: Let it be writable if it is on a boundary of
-		 * _minor_ erase size though */
-		slave->mtd.flags &= ~MTD_WRITEABLE;
-		printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase block boundary -- force read-only\n",
-			part->name);
-	}
-	if ((slave->mtd.flags & MTD_WRITEABLE) &&
-	    mtd_mod_by_eb(slave->mtd.size, &slave->mtd)) {
-		slave->mtd.flags &= ~MTD_WRITEABLE;
-		printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",
-			part->name);
+	if (slave->mtd.flags & MTD_NO_ERASE &&
+	    slave->mtd.erasesize >= slave->mtd.writesize) {
+		/* If we don't need to erase, then align to writesize */
+		if ((slave->mtd.flags & MTD_WRITEABLE) &&
+		    mtd_mod_by_ws(slave->offset, &slave->mtd)) {
+			/* Doesn't start on a boundary of page */
+			/* FIXME: Can a minor erase block be smaller than a page? */
+			slave->mtd.flags &= ~MTD_WRITEABLE;
+			printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on a page boundary -- force read-only\n",
+			       part->name);
+		}
+		if ((slave->mtd.flags & MTD_WRITEABLE) &&
+		    mtd_mod_by_ws(slave->mtd.size, &slave->mtd)) {
+			slave->mtd.flags &= ~MTD_WRITEABLE;
+			printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on a page boundary -- force read-only\n",
+			       part->name);
+		}
+	} else {
+		if ((slave->mtd.flags & MTD_WRITEABLE) &&
+		    mtd_mod_by_eb(slave->offset, &slave->mtd)) {
+			/* Doesn't start on a boundary of major erase size */
+			/* FIXME: Let it be writable if it is on a boundary of
+			 * _minor_ erase size though */
+			slave->mtd.flags &= ~MTD_WRITEABLE;
+			printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase block boundary -- force read-only\n",
+			       part->name);
+		}
+		if ((slave->mtd.flags & MTD_WRITEABLE) &&
+		    mtd_mod_by_eb(slave->mtd.size, &slave->mtd)) {
+			slave->mtd.flags &= ~MTD_WRITEABLE;
+			printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",
+			       part->name);
+		}
 	}
 
 	mtd_set_ooblayout(&slave->mtd, &part_ooblayout_ops);
-- 
2.11.0
