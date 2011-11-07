Received: from mail-qw0-f49.google.com ([209.85.216.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RNYyi-0005qg-Iw
 for linux-mtd@lists.infradead.org; Mon, 07 Nov 2011 23:51:49 +0000
Received: by qap15 with SMTP id 15so4687303qap.36
 for <linux-mtd@lists.infradead.org>; Mon, 07 Nov 2011 15:51:46 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: mtd_blkdevs: don't increase 'open' count on error path
Date: Mon,  7 Nov 2011 15:51:05 -0800
Message-Id: <1320709865-21903-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some error paths in mtd_blkdevs were fixed in the following commit:

    commit 94735ec4044a6d318b83ad3c5794e931ed168d10
    mtd: mtd_blkdevs: fix error path in blktrans_open

But on these error paths, the block device's `dev->open' count is
already incremented before we check for errors. This meant that, while
the error path was handled correctly on the first time through
blktrans_open(), the device is erroneously considered already open on
the second time through.

This problem can be seen, for instance, when a UBI volume is
simultaneously mounted as a UBIFS partition and read through its
corresponding gluebi mtdblockX device. This results in blktrans_open()
passing its error checks (with `dev->open > 0') without actually having
a handle on the device. Here's a summarized log of the actions and
results with nandsim:

    # modprobe nandsim
    # modprobe mtdblock
    # modprobe gluebi
    # modprobe ubifs
    # ubiattach /dev/ubi_ctrl -m 0
    ...
    # ubimkvol /dev/ubi0 -N test -s 16MiB
    ...
    # mount -t ubifs ubi0:test /mnt
    # ls /dev/mtdblock*
    /dev/mtdblock0  /dev/mtdblock1
    # cat /dev/mtdblock1 > /dev/null
    cat: can't open '/dev/mtdblock4': Device or resource busy
    # cat /dev/mtdblock1 > /dev/null

    CPU 0 Unable to handle kernel paging request at virtual address
    fffffff0, epc == 8031536c, ra == 8031f280
    Oops[#1]:
    ...
    Call Trace:
    [<8031536c>] ubi_leb_read+0x14/0x164
    [<8031f280>] gluebi_read+0xf0/0x148
    [<802edba8>] mtdblock_readsect+0x64/0x198
    [<802ecfe4>] mtd_blktrans_thread+0x330/0x3f4
    [<8005be98>] kthread+0x88/0x90
    [<8000bc04>] kernel_thread_helper+0x10/0x18

Cc: stable@kernel.org [3.0+]
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index ed8b5e7..424ca5f 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -215,7 +215,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 
 	mutex_lock(&dev->lock);
 
-	if (dev->open++)
+	if (dev->open)
 		goto unlock;
 
 	kref_get(&dev->ref);
@@ -235,6 +235,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 		goto error_release;
 
 unlock:
+	dev->open++;
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
 	return ret;
-- 
1.7.5.4
