Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZZAm-0005NR-L7
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 10:01:38 +0000
Subject: Patch "mtd: cfi_cmdset_0002: Change erase functions to retry for
 error" has been added to the 3.18-stable tree
To: Joakim.Tjernlund@infinera.com, boris.brezillon@bootlin.com,
 boris.brezillon@free-electrons.com, chris.packham@alliedtelesis.co.nz,
 computersforpeace@gmail.com, cyrille.pitchen@wedev4u.fr, dwmw2@infradead.org,
 gregkh@linuxfoundation.org, ikegami@allied-telesis.co.jp,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com, richard@nod.at
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 01 Jul 2018 12:01:10 +0200
Message-ID: <1530439270156125@kroah.com>
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

    mtd: cfi_cmdset_0002: Change erase functions to retry for error

to the 3.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mtd-cfi_cmdset_0002-change-erase-functions-to-retry-for-error.patch
and it can be found in the queue-3.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From 45f75b8a919a4255f52df454f1ffdee0e42443b2 Mon Sep 17 00:00:00 2001
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Date: Wed, 30 May 2018 18:32:28 +0900
Subject: mtd: cfi_cmdset_0002: Change erase functions to retry for error

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

commit 45f75b8a919a4255f52df454f1ffdee0e42443b2 upstream.

For the word write functions it is retried for error.
But it is not implemented to retry for the erase functions.
To make sure for the erase functions change to retry as same.

This is needed to prevent the flash erase error caused only once.
It was caused by the error case of chip_good() in the do_erase_oneblock().
Also it was confirmed on the MACRONIX flash device MX29GL512FHT2I-11G.
But the error issue behavior is not able to reproduce at this moment.
The flash controller is parallel Flash interface integrated on BCM53003.

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
 drivers/mtd/chips/cfi_cmdset_0002.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2239,6 +2239,7 @@ static int __xipram do_erase_chip(struct
 	unsigned long int adr;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;
+	int retry_cnt = 0;
 
 	adr = cfi->addr_unlock1;
 
@@ -2256,6 +2257,7 @@ static int __xipram do_erase_chip(struct
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
+ retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
@@ -2310,6 +2312,9 @@ static int __xipram do_erase_chip(struct
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
 
+		if (++retry_cnt <= MAX_RETRIES)
+			goto retry;
+
 		ret = -EIO;
 	}
 
@@ -2329,6 +2334,7 @@ static int __xipram do_erase_oneblock(st
 	unsigned long timeo = jiffies + HZ;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;
+	int retry_cnt = 0;
 
 	adr += chip->start;
 
@@ -2346,6 +2352,7 @@ static int __xipram do_erase_oneblock(st
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
+ retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
@@ -2403,6 +2410,9 @@ static int __xipram do_erase_oneblock(st
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
 
+		if (++retry_cnt <= MAX_RETRIES)
+			goto retry;
+
 		ret = -EIO;
 	}
 


Patches currently in stable-queue which might be from ikegami@allied-telesis.co.jp are

queue-3.18/mtd-cfi_cmdset_0002-change-erase-functions-to-retry-for-error.patch
queue-3.18/mtd-cfi_cmdset_0002-change-write-buffer-to-check-correct-value.patch
queue-3.18/mips-bcm47xx-enable-74k-core-externalsync-for-pcie-erratum.patch
