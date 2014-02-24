Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHylv-0003HL-Ba
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 16:52:52 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Mon, 24 Feb 2014 17:52:18 +0100
Message-Id: <1393260738-11824-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [PATCH] mtd: fix bug in partition size calculation related to
 MTDPART_OFS_RETAIN
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the remaining space is exactly what should still be available after
the partition in question is added slave->mtd.size was set to zero
instead of erroring out. In the next code block this was then
interpreted as MTDPART_SIZ_FULL filling the rest of the partition
instead of keeping it free for the next partition.

This problem existed since the MTDPART_OFS_RETAIN feature was introduced
for 3.2-rc1.

Fixes: 1a31368bf92e ("mtd: add a flags for partitions which should just leave smth. after them")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this MTDPART_OFS_RETAIN feature looks very special, and there is only a single
user (arch/arm/mach-ep93xx/ts72xx.c). Moreover I didn't understand its purpose
from reading the documentation in include/linux/mtd/partitions.h:

	offset: absolute starting position within the master MTD device; [...]
	if [defined as] MTDPART_OFS_RETAIN, consume as much as possible,
	leaving size after the end of partition.

But maybe it's only me.

Anyhow I wonder if this feature is still considered valuable and if it's maybe
better to just drop support for MTDPART_OFS_RETAIN. A more intuive replacement
could be to specify start and end(+1) of partitions and interpret .start =
-0x100000 as 1 MiB before the end of the device.

Best regards
Uwe

 drivers/mtd/mtdpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 6e732c3820c1..3ca9d7fbf126 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -442,16 +442,16 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	}
 	if (slave->offset == MTDPART_OFS_RETAIN) {
 		slave->offset = cur_offset;
-		if (master->size - slave->offset >= slave->mtd.size) {
+		if (master->size - slave->offset > slave->mtd.size) {
 			slave->mtd.size = master->size - slave->offset
 							- slave->mtd.size;
 		} else {
 			printk(KERN_ERR "mtd partition \"%s\" doesn't have enough space: %#llx < %#llx, disabled\n",
 				part->name, master->size - slave->offset,
 				slave->mtd.size);
 			/* register to preserve ordering */
 			goto out_register;
 		}
 	}
 	if (slave->mtd.size == MTDPART_SIZ_FULL)
 		slave->mtd.size = master->size - slave->offset;
-- 
1.9.0
