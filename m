Received: from mu-out-0910.google.com ([209.85.134.184])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hvaxd-0007XN-LD
	for linux-mtd@lists.infradead.org; Tue, 05 Jun 2007 11:29:19 -0400
Received: by mu-out-0910.google.com with SMTP id w1so1830285mue
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Jun 2007 08:28:33 -0700 (PDT)
To: linux-mtd@lists.infradead.org
Subject: Re: JFFS2, AT45DB642D dataflash and power failure
Date: Tue, 5 Jun 2007 17:28:18 +0200
References: <646b5e90706032328i78c258f1ga27cd5ba92330b23@mail.gmail.com>
	<20070604113806.397b9400@newbox>
In-Reply-To: <20070604113806.397b9400@newbox>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200706051728.18745.hans.jorgensen@email.dk>
From: Hans Jorgensen <hans.jorgensen.news@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ivan,

> Could you please post your patch, so I could check if it works for me?

This patch is generated for Linux 2.6.12+ maxim.org.za patch, but i
would suspect that Linux 2.6.21 without patches would have the same 
issue, as linux-2.6.21.3/drivers/mtd/devices/mtd_dataflash.c also uses
OP_PROGRAM_VIA_BUF1 for writing data.

Note this patch should only be used to identify if that is the
problem, as there might be other problems associated with using it.
Such as is it valid to reprogram 0 to 0 and 1 to 1 without erasing the
flash first, and it may potentially break compatibility between mtd and
other file systems.

--- linux-2.6.12+at91/drivers/mtd/devices/at91_dataflash.c      2007-06-05 07:37:46.000000000 +0200
+++ current/drivers/mtd/devices/at91_dataflash.c        2007-06-05 08:51:16.000000000 +0200
@@ -390,6 +390,37 @@
                }
 
                /* (2) Program via Buffer1 */
+              
+/*Start of modification
+  The following code is NOT A FIX OF A PROBLEM, but was applied to identify
+  a problem with power failure and the JFFS2 file system.
+ 
+  It was suspected that the original code could corrupt the entire data page even though
+  only a small part of the page needed updating. Because OP_PROGRAM_VIA_BUF1
+  instructs the internal state machine of the data chip to first erase the page and later
+  program it. If a power failure or reset of the flash happens during this period
+  the entire page could be corrupted. So the algorithm was modified to not use an
+  erase page.
+*/
+
+               /* (2a) Transfer data to buffer 1*/
+               addr = (pageaddr << priv->page_offset) + offset;
+               command[0] = 0x84;
+               command[1] = (addr & 0x00FF0000) >> 16;
+               command[2] = (addr & 0x0000FF00) >> 8;
+               command[3] = (addr & 0x000000FF);
+               do_spi_transfer(2, command, 4, command, 4, writebuf, writelen, tmpbuf, writelen);
+              
+               /* (2b) Write buffer 1 to Flash without built-in erase*/
+               addr = (pageaddr << priv->page_offset) + offset;
+               command[0] = 0x88;
+               command[1] = (addr & 0x00FF0000) >> 16;
+               command[2] = (addr & 0x0000FF00) >> 8;
+               command[3] = (addr & 0x000000FF);
+               do_spi_transfer(1, command, 4, command, 4, NULL, 0, NULL, 0);
+               at91_dataflash_waitready();
+
+        /* Original code
                addr = (pageaddr << priv->page_offset) + offset;
                command[0] = OP_PROGRAM_VIA_BUF1;
                command[1] = (addr & 0x00FF0000) >> 16;
@@ -400,6 +431,9 @@
 #endif
                do_spi_transfer(2, command, 4, command, 4, writebuf, writelen, tmpbuf, writelen);
                at91_dataflash_waitready();
+        */
+       
+/*end of modification*/
 
                /* (3) Compare to Buffer1 */
                addr = pageaddr << priv->page_offset;


Hans
