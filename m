Received: from mailrelay010.isp.belgacom.be ([195.238.6.177])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6QJv-0003RO-U4
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 19:52:14 +0000
Date: Thu, 23 Jan 2014 20:51:47 +0100
From: Fabian Frederick <fabf@skynet.be>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] mtd: block2mtd: Add mutex_destroy
Message-Id: <20140123205147.943d63fecf3140aa6cc76994@skynet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: akpm@linux-foundation.org, rdunlap@infradead.org, joern@lazybastard.org,
 linux-kernel@vger.kernel.org, ezequiel.garcia@free-electrons.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mutex_destroy added on each device in block2mtd_exit and add_device failure

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 drivers/mtd/devices/block2mtd.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 0efee5b..8071596 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -240,14 +240,14 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
 
 	if (IS_ERR(bdev)) {
 		pr_err("error: cannot open device %s\n", devname);
-		goto devinit_err;
+		goto devinit_err1;
 	}
 	dev->blkdev = bdev;
 
 	if ((MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) ||
 	    (MAJOR(bdev->bd_dev) == MTD_CHAR_MAJOR)) {
 		pr_err("attempting to use an MTD device as a block device\n");
-		goto devinit_err;
+		goto devinit_err1;
 	}
 
 	mutex_init(&dev->write_mutex);
@@ -256,7 +256,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
 	/* make the name contain the block device in */
 	name = kasprintf(GFP_KERNEL, "block2mtd: %s", devname);
 	if (!name)
-		goto devinit_err;
+		goto devinit_err2;
 
 	dev->mtd.name = name;
 
@@ -275,7 +275,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
 
 	if (mtd_device_register(&dev->mtd, NULL, 0)) {
 		/* Device didn't get added, so free the entry */
-		goto devinit_err;
+		goto devinit_err2;
 	}
 	list_add(&dev->list, &blkmtd_device_list);
 	pr_info("mtd%d: [%s] erase_size = %dKiB [%d]\n",
@@ -284,7 +284,9 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
 		dev->mtd.erasesize >> 10, dev->mtd.erasesize);
 	return dev;
 
-devinit_err:
+devinit_err2:
+	mutex_destroy(&dev->write_mutex);
+devinit_err1:
 	block2mtd_free_device(dev);
 	return NULL;
 }
@@ -449,6 +451,7 @@ static void block2mtd_exit(void)
 		struct block2mtd_dev *dev = list_entry(pos, typeof(*dev), list);
 		block2mtd_sync(&dev->mtd);
 		mtd_device_unregister(&dev->mtd);
+		mutex_destroy(&dev->write_mutex);
 		pr_info("mtd%d: [%s] removed\n",
 			dev->mtd.index,
 			dev->mtd.name + strlen("block2mtd: "));
-- 
1.8.1.4
