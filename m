Received: from tomts6.bellnexxia.net ([209.226.175.26] helo=tomts6-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aPck-0002E1-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 00:44:54 +0100
Date: Thu, 1 Aug 2002 19:44:52 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
In-Reply-To: <200208011718437.SM02488@there>
Message-ID: <Pine.LNX.4.44.0208011941330.25251-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Would this modification make a difference?  It seems we read the first 
flash block into a different address when identifying the chip.

Ilguiz

--- doc_stage1.S	30 Jul 2002 01:09:35 -0000	1.12
+++ doc_stage1.S	1 Aug 2002 23:22:05 -0000
@@ -192,13 +192,13 @@
        /* Use existing block read routine to get Manufacturer &
        ** Chip ID.  Overkill, but saves code space.  */  
 
-       movw    $1, %cx         /* read just one page */
-       movw    $GRUBSTART, %ax
+       movw    $1, %cx			/* read just one block */
+       movw    $GRUBLOADSEG, %ax
        movw    %ax, %es
-       movw    $0, %di
+       movw    $GRUBLOADOFS, %di
        call    read_block
 
-       movw    %es:0,%ax               /* id/mfr in first 2 bytes */
+       movw    %es:(GRUBLOADOFS), %ax	/* id/mfr in first 2 bytes */
 
 #ifdef SHOW_INFO
 

On Thu, 1 Aug 2002, Mark Meade wrote:

> We copy a few pages OK (%di = 0x400, 0x500, 0x600), but lock up when %di
> is between 0x700 and 0x800, specifically with ES:DI equal to
> 0x07E0:0x0719.
