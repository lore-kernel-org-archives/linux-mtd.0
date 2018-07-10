Received: from mail.linuxfoundation.org ([140.211.169.12])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcu0C-00048O-5D
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2018 14:52:30 +0000
Subject: Patch "mtd: cfi_cmdset_0002: Change erase functions to check chip
 good only" has been added to the 4.9-stable tree
To: Joakim.Tjernlund@infinera.com, boris.brezillon@bootlin.com,
 boris.brezillon@free-electrons.com, chris.packham@alliedtelesis.co.nz,
 computersforpeace@gmail.com, cyrille.pitchen@wedev4u.fr, dwmw2@infradead.org,
 gregkh@linuxfoundation.org, ikegami@allied-telesis.co.jp,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com, richard@nod.at
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 10 Jul 2018 16:52:07 +0200
Message-ID: <1531234327174175@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is a note to let you know that I've just added the patch titled

    mtd: cfi_cmdset_0002: Change erase functions to check chip good only

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mtd-cfi_cmdset_0002-change-erase-functions-to-check-chip-good-only.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From 79ca484b613041ca223f74b34608bb6f5221724b Mon Sep 17 00:00:00 2001
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Date: Wed, 30 May 2018 18:32:29 +0900
Subject: mtd: cfi_cmdset_0002: Change erase functions to check chip good only

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

commit 79ca484b613041ca223f74b34608bb6f5221724b upstream.

Currently the functions use to check both chip ready and good.
But the chip ready is not enough to check the operation status.
So change this to check the chip good instead of this.
About the retry functions to make sure the error handling remain it.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


---
 drivers/mtd/chips/cfi_cmdset_0002.c |   22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2292,12 +2292,13 @@ static int __xipram do_erase_chip(struct
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_ready(map, adr))
+		if (chip_good(map, adr, map_word_ff(map)))
 			break;
 
 		if (time_after(jiffies, timeo)) {
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
 				__func__ );
+			ret = -EIO;
 			break;
 		}
 
@@ -2305,15 +2306,15 @@ static int __xipram do_erase_chip(struct
 		UDELAY(map, chip, adr, 1000000/HZ);
 	}
 	/* Did we succeed? */
-	if (!chip_good(map, adr, map_word_ff(map))) {
+	if (ret) {
 		/* reset on all failures. */
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES) {
+			ret = 0;
 			goto retry;
-
-		ret = -EIO;
+		}
 	}
 
 	chip->state = FL_READY;
@@ -2387,7 +2388,7 @@ static int __xipram do_erase_oneblock(st
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_ready(map, adr)) {
+		if (chip_good(map, adr, map_word_ff(map))) {
 			xip_enable(map, chip, adr);
 			break;
 		}
@@ -2396,6 +2397,7 @@ static int __xipram do_erase_oneblock(st
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
 				__func__ );
+			ret = -EIO;
 			break;
 		}
 
@@ -2403,15 +2405,15 @@ static int __xipram do_erase_oneblock(st
 		UDELAY(map, chip, adr, 1000000/HZ);
 	}
 	/* Did we succeed? */
-	if (!chip_good(map, adr, map_word_ff(map))) {
+	if (ret) {
 		/* reset on all failures. */
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES) {
+			ret = 0;
 			goto retry;
-
-		ret = -EIO;
+		}
 	}
 
 	chip->state = FL_READY;


Patches currently in stable-queue which might be from ikegami@allied-telesis.co.jp are

queue-4.9/mtd-cfi_cmdset_0002-change-erase-functions-to-retry-for-error.patch
queue-4.9/mtd-cfi_cmdset_0002-change-erase-functions-to-check-chip-good-only.patch
queue-4.9/mtd-cfi_cmdset_0002-change-definition-naming-to-retry-write-operation.patch
