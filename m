Received: from mail.udm.ru ([217.14.192.20] helo=aps.mark-itt.ru)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16h80M-0004Ch-00
	for <linux-mtd@lists.infradead.org>; Sat, 02 Mar 2002 11:48:46 +0000
Received: from [195.161.198.29] (HELO 127.0.0.1)
  by aps.mark-itt.ru (CommuniGate Pro SMTP 3.5.3)
  with ESMTP id 20790152 for linux-mtd@lists.infradead.org; Sat, 02 Mar 2002 16:00:02 +0400
Date: Sat, 2 Mar 2002 16:03:50 +0400
From: ASA <llb@udm.ru>
Reply-To: ASA <llb@udm.ru>
Message-ID: <17921840775.20020302160350@udm.ru>
To: linux-mtd@lists.infradead.org
Subject: root fs mount troubles with 2.4.18 and DOC
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello linux-mtd,

After unpgrading my embedded system to 2.4.18 I found that it was no
able to mount my ext3 filesysten on /dev/nftla1 as root fs.

symptoms:
a)if I boot 2.4.18 with ramdisk as the root fs it is fine. any /dev/nftl*
devices mounts OK.
b)if I boot just the same kernel with /dev/nftla1 as the root fs it hangups
while mounting root (before invocation of init).

then I took 2.4.17 and tried the same experiments: with ramdisk it's fine
c)if 2.4.17 and root=/dev/nftla1, it mounts but afterwards hangups while
trying mount -a
d)in the same situation I commented out mount -a from init.d script and
system was able to boot finally. Then any simple mounts was fine except
'mount -a'.

all partitions at /dev/nftl* are ext3; ramdisk was ext2.
also I should notice, 2.4.17 and 18 worked fine with my ext3 on my harddisks

Now I tried to trace the problem for the b)case (2.4.18+root=/dev/nftla1)
and got the following results:

init/main.c:       prepare_namespaces() calls mount_root()
fs/super.c:1081    mount_root() calls blkdev_put(bdev, BDEV_FS)
fs/block_dev.c:626 blkdev_put() calls bdev->bd_op->release(bd_inode,NULL)

since it is a nftl device, trace continues at:

drivers/mtd/nftlcore.c:1001  nftl_release() calls invalidate_device(...)
fs/inode.c:627,628: condition is true and invalidate_device() calls fsync_dev(dev)
fs/buffers.c:347             fsync_dev() calls sync_inodes(dev)
fs/inodes.c:386              sync_inodes() calls get_super(dev)
fs/super.c:518               get_super() calls down_read(&s->s_umount);
and it hangups on that semaphore endlessly.

That trace was viewed by Al Viro and he suggested me to remove that
invalidate_device() call. I made it and the problem disappeared.
any mount/umount nad rootfs combinations worked.

So I'll send such patch for you (2.4.18 kernel).

diff -Naur virgin/drivers/mtd/nftlcore.c rtl/drivers/mtd/nftlcore.c
--- virgin/drivers/mtd/nftlcore.c      Fri Oct 26 01:58:35 2001
+++ rtl/drivers/mtd/nftlcore.c Sat Mar  2 15:47:27 2002
@@ -998,7 +998,7 @@

       DEBUG(MTD_DEBUG_LEVEL2, "NFTL_release\n");

-      invalidate_device(inode->i_rdev, 1);
+//    invalidate_device(inode->i_rdev, 1);

       if (thisNFTL->mtd->sync)
               thisNFTL->mtd->sync(thisNFTL->mtd);  

-- 
Best regards,
 ASA                          mailto:llb@udm.ru
