Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BpQu3-00024F-Vn
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 08:17:58 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Andy Hawkins <a.hawkins@cabletime.com>
In-Reply-To: <1090923928.2237.6.camel@adh>
References: <1090923928.2237.6.camel@adh>
Content-Type: text/plain
Message-Id: <1090930297.20889.93.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Tue, 27 Jul 2004 14:11:38 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Large JFFS2 filesystem problem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-27 at 12:25, Andy Hawkins wrote:

>  * Check, if we have to concatenate physical blocks to larger virtual
> blocks
>  * to reduce the memorysize for c->blocks. (kmalloc allows max. 128K
> allocation)
>  */
> c->sector_size = c->mtd->erasesize; 
> blocks = c->flash_size / c->sector_size;
> while ((blocks * sizeof (struct jffs2_eraseblock)) > (128 * 1024)) {
> 	blocks >>= 1;
> 	c->sector_size <<= 1;
> }	
> 
> could be the source of the proble, because while it decreases the number
> of blocks, it increases the sector size, and it is this sector size that
> is used in the kmalloc line that fails.

Sure, the combination of sector size and number of sectors in relation
to the maximum allocation size of 128K is the limitation.

It should be easy to fix the scan code. All we have to do is to reduce
the chunk size which we read in one go. The functionality to do so is
already there and its simple to make it work

Can you try the following patch ?
Please let me know if it works.

Index: scan.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/scan.c,v
retrieving revision 1.110
diff -u -r1.110 scan.c
--- scan.c      17 Jun 2004 17:15:31 -0000      1.110
+++ scan.c      27 Jul 2004 12:15:52 -0000
@@ -104,6 +104,10 @@
                else
                        buf_size = PAGE_SIZE;
  
+               /* Respect kmalloc limitations */
+               if (buf_size > 128*1024)
+                       buf_size = 128*1024;
+
                D1(printk(KERN_DEBUG "Allocating readbuf of %d bytes\n",
buf_size));
                flashbuf = kmalloc(buf_size, GFP_KERNEL);
                if (!flashbuf)

> Previously, someone recommended waiting for YAFFS2, as this is likely to
> be more efficient with large filesystems. Does anyone have any idea as
> to when this is likely to be available?

Ask on the YAFFS mailing list.

tglx
