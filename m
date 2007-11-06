Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1IpFPU-0003RF-A5
	for linux-mtd@lists.infradead.org; Mon, 05 Nov 2007 22:47:34 -0500
Received: from [99.236.101.138] (helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68) (envelope-from <rpjday@crashcourse.ca>)
	id 1IpFPS-0000QZ-4n
	for linux-mtd@lists.infradead.org; Mon, 05 Nov 2007 22:47:26 -0500
Date: Mon, 5 Nov 2007 22:45:51 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: [PATCH] MTD:  Remove now-unused linux/mtd/jedec.h file.
Message-ID: <Pine.LNX.4.64.0711052243130.27409@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Given that support for jedec was removed in commit ba7cc09c, and that
no one seems to be including this header file, it would seem to be
removable.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/include/linux/mtd/jedec.h b/include/linux/mtd/jedec.h
deleted file mode 100644
index 9006feb..0000000
--- a/include/linux/mtd/jedec.h
+++ /dev/null
@@ -1,66 +0,0 @@
-
-/* JEDEC Flash Interface.
- * This is an older type of interface for self programming flash. It is
- * commonly use in older AMD chips and is obsolete compared with CFI.
- * It is called JEDEC because the JEDEC association distributes the ID codes
- * for the chips.
- *
- * See the AMD flash databook for information on how to operate the interface.
- *
- * $Id: jedec.h,v 1.4 2005/11/07 11:14:54 gleixner Exp $
- */
-
-#ifndef __LINUX_MTD_JEDEC_H__
-#define __LINUX_MTD_JEDEC_H__
-
-#include <linux/types.h>
-
-#define MAX_JEDEC_CHIPS 16
-
-// Listing of all supported chips and their information
-struct JEDECTable
-{
-   __u16 jedec;
-   char *name;
-   unsigned long size;
-   unsigned long sectorsize;
-   __u32 capabilities;
-};
-
-// JEDEC being 0 is the end of the chip array
-struct jedec_flash_chip
-{
-   __u16 jedec;
-   unsigned long size;
-   unsigned long sectorsize;
-
-   // *(__u8*)(base + (adder << addrshift)) = data << datashift
-   // Address size = size << addrshift
-   unsigned long base;           // Byte 0 of the flash, will be unaligned
-   unsigned int datashift;       // Useful for 32bit/16bit accesses
-   unsigned int addrshift;
-   unsigned long offset;         // linerized start. base==offset for unbanked, uninterleaved flash
-
-   __u32 capabilities;
-
-   // These markers are filled in by the flash_chip_scan function
-   unsigned long start;
-   unsigned long length;
-};
-
-struct jedec_private
-{
-   unsigned long size;         // Total size of all the devices
-
-   /* Bank handling. If sum(bank_fill) == size then this is linear flash.
-      Otherwise the mapping has holes in it. bank_fill may be used to
-      find the holes, but in the common symetric case
-      bank_fill[0] == bank_fill[*], thus addresses may be computed
-      mathmatically. bank_fill must be powers of two */
-   unsigned is_banked;
-   unsigned long bank_fill[MAX_JEDEC_CHIPS];
-
-   struct jedec_flash_chip chips[MAX_JEDEC_CHIPS];
-};
-
-#endif
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
