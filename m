Received: from mba.ocn.ne.jp ([210.190.142.172] helo=smtp.mba.ocn.ne.jp)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ABbEu-000060-AH
	for <linux-mtd@lists.infradead.org>; Mon, 20 Oct 2003 15:42:32 +0100
Date: Mon, 20 Oct 2003 23:58:42 +0900 (JST)
Message-Id: <20031020.235842.126570816.anemo@mba.ocn.ne.jp>
To: noah@caltech.edu
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <Pine.GSO.4.58.0310171454050.13905@blinky>
References: <Pine.GSO.4.58.0310171454050.13905@blinky>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: dwmw2@redhat.com
cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Remove needless and non-portable include in mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> On Sun, 19 Oct 2003 21:36:15 -0700 (PDT), "Noah J. Misch" <noah@caltech.edu> said:

noah> The #include <asm/setup.h> in drivers/mtd/cmdlinepart.c does not
noah> appear to provide any definition this file uses, and it quickly
noah> breaks builds on architectures that lack such a header,
noah> including ia64 and sparc.

I have posted a patch including this fix to linux-mtd ML two times
(two month ago and a week ago).  My patch fixes another problem that
cmdlinepart.c can not handle zero offset value correctly
(ex. "mtdparts=id:2M@2M,2M@0").  Please consider applying this fix
also.  Thank you.

--- mtd-20030811/drivers/mtd/cmdlinepart.c	Fri May 30 07:00:05 2003
+++ mtd/drivers/mtd/cmdlinepart.c	Tue Aug 12 16:35:43 2003
@@ -29,7 +29,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/compatmac.h>
-#include <asm/setup.h>
 #include <linux/bootmem.h>
 
 /* error message prefix */
@@ -45,6 +44,7 @@
 
 /* special size referring to all the remaining space in a partition */
 #define SIZE_REMAINING 0xffffffff
+#define OFFSET_CONTINUOUS 0xffffffff
 
 struct cmdline_mtd_partition {
 	struct cmdline_mtd_partition *next;
@@ -77,7 +77,7 @@
 {
 	struct mtd_partition *parts;
 	unsigned long size;
-	unsigned long offset = 0;
+	unsigned long offset = OFFSET_CONTINUOUS;
 	char *name;
 	int name_len;
 	unsigned char *extra_mem;
@@ -312,7 +312,7 @@
 		{
 			for(i = 0, offset = 0; i < part->num_parts; i++)
 			{
-				if (!part->parts[i].offset)
+				if (part->parts[i].offset == OFFSET_CONTINUOUS)
 				  part->parts[i].offset = offset;
 				else
 				  offset = part->parts[i].offset;
---
Atsushi Nemoto
