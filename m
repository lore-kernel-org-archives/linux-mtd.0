Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JNvbc-0007DK-C8
	for linux-mtd@lists.infradead.org; Sat, 09 Feb 2008 19:43:26 +0000
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68) (envelope-from <rpjday@crashcourse.ca>)
	id 1JNvbW-0001l8-P0
	for linux-mtd@lists.infradead.org; Sat, 09 Feb 2008 14:43:15 -0500
Date: Sat, 9 Feb 2008 14:43:05 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: [PATCH] MTD:  Delete unused jedec.h header file.
Message-ID: <alpine.LFD.1.00.0802091438130.18228@localhost.localdomain>
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


Remove the apparently unreferenced include/linux/mtd/jedec.h header
file.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  is this header file being used these days?  because it keeps showing
up in my scan for unused header files, and i've submitted a patch to
delete it but ... there it is.

  can someone clarify this one way or the other?  thanks.

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

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

Home page:                                         http://crashcourse.ca
Fedora Cookbook:    http://crashcourse.ca/wiki/index.php/Fedora_Cookbook
========================================================================
