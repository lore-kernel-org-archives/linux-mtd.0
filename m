Received: from law11-f88.law11.hotmail.com ([64.4.17.88] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9xMz-0004OP-BA
	for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2003 02:56:05 +0100
From: "J B" <mad_flasher@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 15 Oct 2003 20:54:28 -0500
Mime-Version: 1.0
Message-ID: <Law11-F88qfH4OWXoGR0001766a@hotmail.com>
Content-Type: text/plain; format=flowed
cc: dwmw2@infradead.org
Subject: [PATCH] cfi_cmdset_0020.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following patch fixes two issues with erase suspending in the chip 
driver for the STMicro Advanced Architecture chips.  The patch is against 
the latest CVS version as of 10/15.

1.  The if statement that checked FeatureSupport was incorrect.  The same 
issue was fixed a while ago in cfi_cmdset_0001.c I believe.

2.  According to the data sheet for the M58LW032A, the erase operation can 
complete in the period between issuing the suspend command and the time the 
erase controller stops.  The last part ot the patch checks the erase 
suspended bit in the status register and only sets the suspended variable if 
the bit is on.  This keeps the software state machine in sync with the 
actual state of the hardware.

I also plan on doing a patch to add support for the M58LW128A devices as 
well.  Looking at the spec sheet, they appear very similar, so it will 
probably be just a small change.

Eventually, this whole driver could probably be merged with 
cfi_cmdset_0001.c, as they are very similar.  I think that was Joern's plan 
all along, but it looks like nobody has done it yet.

Anyway, have a look and if it seems good, please apply.

Thx,
J

--- drivers/mtd/chips/cfi_cmdset_0020.c.orig	2003-10-15 20:32:20.733539872 
-0500
+++ drivers/mtd/chips/cfi_cmdset_0020.c	2003-10-15 20:23:40.657603432 -0500
@@ -262,7 +262,7 @@
	 */
	switch (chip->state) {
	case FL_ERASING:
-		if (!((struct cfi_pri_intelext *)cfi->cmdset_priv)->FeatureSupport & 2)
+		if (!(((struct cfi_pri_intelext *)cfi->cmdset_priv)->FeatureSupport & 2))
			goto sleep; /* We don't support erase suspend */

		cfi_write (map, CMD(0xb0), cmd_addr);
@@ -297,7 +297,11 @@
			spin_lock_bh(chip->mutex);
		}

-		suspended = 1;
+		/* check to see if the device really suspended.  the erase operation
+		   could have completed before the suspend could take effect */
+		if((status & (CMD(0xC0))) == (CMD(0xC0)))
+			suspended = 1;
+
		cfi_write(map, CMD(0xff), cmd_addr);
		chip->state = FL_READY;
		break;

_________________________________________________________________
Concerned that messages may bounce because your Hotmail account has exceeded 
its 2MB storage limit? Get Hotmail Extra Storage!         
http://join.msn.com/?PAGE=features/es
