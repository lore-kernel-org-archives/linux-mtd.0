Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPXMq-0000ux-Hb
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 16:27:50 +0000
From: Bastian Stender <bst@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Bastian Stender <bst@pengutronix.de>
Subject: [PATCH] mtd: partitions: no unnecessary check for erase block
Date: Fri,  6 Jan 2017 17:26:24 +0100
Message-Id: <20170106162624.544-1-bst@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Partitions must start/end on erase block or boundary to be writeable.
This makes only sense if erasing is necessary. Do not force the
partition to be read-only if MTD_NO_ERASE flag is set.

Signed-off-by: Bastian Stender <bst@pengutronix.de>
---
 drivers/mtd/mtdpart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index fccdd49bb964..cd138023ed32 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -557,6 +557,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	}
 
 	if ((slave->mtd.flags & MTD_WRITEABLE) &&
+	    !(slave->mtd.flags & MTD_NO_ERASE) &&
 	    mtd_mod_by_eb(slave->offset, &slave->mtd)) {
 		/* Doesn't start on a boundary of major erase size */
 		/* FIXME: Let it be writable if it is on a boundary of
@@ -566,6 +567,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 			part->name);
 	}
 	if ((slave->mtd.flags & MTD_WRITEABLE) &&
+	    !(slave->mtd.flags & MTD_NO_ERASE) &&
 	    mtd_mod_by_eb(slave->mtd.size, &slave->mtd)) {
 		slave->mtd.flags &= ~MTD_WRITEABLE;
 		printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",
-- 
2.11.0
