Received: from sccrmhc01.attbi.com ([204.127.202.61])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184Ol7-00013s-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 17:53:29 +0100
Message-Id: <5.1.0.14.2.20021023102143.03ec1de0@mail.attbi.com>
Date: Wed, 23 Oct 2002 10:22:57 -0700
To: bgat@billgatliff.com
From: Eugene Surovegin <ebs@innocent.com>
Subject: Re: mtdblock_ro and ext2 yields panic: block not locked
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20021023121843.A9783@saturn.billgatliff.com>
References: <5.1.0.14.2.20021023101127.03ed2df0@pop.prodigy.net>
 <20021023104957.G8758@saturn.billgatliff.com>
 <5.1.0.14.2.20021023101127.03ed2df0@pop.prodigy.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

Bill,

At 10:18 AM 10/23/2002, you wrote:
>Care to post the patch?  I'd love to see if it fixes my problem...

Sure :)
Here it is:

diff -ur a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -138,10 +138,11 @@
        }

        if (current_request->sector << 9 > mtd->size ||
-         (current_request->sector + current_request->nr_sectors) << 9 > 
mtd->size)
+         (current_request->sector + current_request->current_nr_sectors) 
<< 9 > mtd->size)
        {
          printk("mtd: Attempt to read past end of device!\n");
-        printk("size: %x, sector: %lx, nr_sectors %lx\n", mtd->size, 
current_request->sector, current_request->nr_sectors);
+        printk("size: %x, sector: %lx, nr_sectors %lx\n", mtd->size, 
current_request->sector,
+               current_request->current_nr_sectors);
          end_request(0);
          continue;
        }
@@ -162,7 +163,7 @@

          case READ:
          if (MTD_READ(mtd,current_request->sector<<9,
-                     current_request->nr_sectors << 9,
+                     current_request->current_nr_sectors << 9,
                       &retlen, current_request->buffer) == 0)
             res = 1;
          else
@@ -184,7 +185,7 @@

          // Do the write
          if (MTD_WRITE(mtd,current_request->sector<<9,
-                      current_request->nr_sectors << 9,
+                      current_request->current_nr_sectors << 9,
                        &retlen, current_request->buffer) == 0)
             res = 1;
          else
@@ -287,7 +288,7 @@
  static void __exit cleanup_mtdblock(void)
  {
         unregister_blkdev(MAJOR_NR,DEVICE_NAME);
-       blksize_size[MAJOR_NR] = NULL;
+       blk_size[MAJOR_NR] = NULL;
         blk_cleanup_queue(BLK_DEFAULT_QUEUE(MAJOR_NR));
  }





  Eugene Surovegin <mailto:ebs@innocent.com>
