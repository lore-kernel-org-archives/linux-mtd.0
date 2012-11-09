Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWqeC-0007te-FT
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 15:37:33 +0000
Received: by mail-gg0-f177.google.com with SMTP id h1so792746gge.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Nov 2012 07:37:30 -0800 (PST)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd_blkdev: Use a different name for block_device_operations
 variable
Date: Fri,  9 Nov 2012 12:36:35 -0300
Message-Id: <1352475395-11917-1-git-send-email-elezegarcia@gmail.com>
Cc: Ezequiel Garcia <elezegarcia@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

struct mtd_blktrans_ops is a type, and mtd_blktrans_ops is a variable.
To improve code clarity it's better to not use the same names,
so we just change the latter.

Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index f1f0671..26ef2a7 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -325,7 +325,7 @@ unlock:
 	return ret;
 }
 
-static const struct block_device_operations mtd_blktrans_ops = {
+static const struct block_device_operations mtd_block_ops = {
 	.owner		= THIS_MODULE,
 	.open		= blktrans_open,
 	.release	= blktrans_release,
@@ -401,7 +401,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	gd->private_data = new;
 	gd->major = tr->major;
 	gd->first_minor = (new->devnum) << tr->part_bits;
-	gd->fops = &mtd_blktrans_ops;
+	gd->fops = &mtd_block_ops;
 
 	if (tr->part_bits)
 		if (new->devnum < 26)
-- 
1.7.8.6
