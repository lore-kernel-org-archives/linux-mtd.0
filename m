Received: from tolkor.sgi.com ([192.48.180.13])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Xko5-0001ZZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 16:45:37 +0100
Received: from ledzep.americas.sgi.com (ledzep.americas.sgi.com [137.38.226.97])
	by tolkor.sgi.com (8.12.2/8.12.2/linux-outbound_gateway-1.2) with ESMTP id g6PFjaK3008738
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 10:45:36 -0500
Received: from archer.americas.sgi.com (archer.americas.sgi.com [137.38.88.26]) by ledzep.americas.sgi.com (SGI-SGI-8.9.3/americas-smart-nospam1.1) with ESMTP id KAA44954 for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 10:45:35 -0500 (CDT)
Received: from sgi.com (localhost [127.0.0.1]) by archer.americas.sgi.com (8.8.8/ASC-news-1.4) with ESMTP id KAA139096 for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 10:45:35 -0500 (CDT)
Message-ID: <3D401D1E.2DD54BF@sgi.com>
Date: Thu, 25 Jul 2002 10:45:34 -0500
From: Steven Hein <ssh@sgi.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Integrating new MTD/jffs2 into 2.4.18 kernel
References: <20020725131457.GA19796@wohnheim.fh-wedel.de>  <3D3FEE24.49D26D61@sgi.com> <600.1027603720@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David, Joern,

Thanks for the help!  My jffs2 filesystem is now working in NAND flash!

For the benefit of others, here's a summary of what I needed to do
to get this going.

Here's generally what I needed to do.

1) apply the patch ftp://ftp.kernel.org/pub/linux/kernel/people/dwmw2/shared-zliblinux-2.4.19-pre10-shared-zlib.bz2 

   NOTE: I am running linux-2.4.18 + linux-2.4.18-rmk7 ARM patch,
         which already contains some parts of the above patch. So, I had
         to go through the patch and grab the parts I needed.  If this
         is the case for you.....

      a) copy CVS:mtd/lib/zlib_inflate and CVS:mtd/lib/zlib_deflate
         to linux/lib
      b) modify linux/lib Makefile as indicated in the above patch
      c) remove linux/fs/inflate_fs
      e) modify linux/fs/Makefile and linux/fs/cramfs/uncompress.c
         as indicated in the above patch
      f) add the line "source lib/Config.in" to arch/<yours>/Config.in
         (as is done in the above patch)
      *) I think that's all I needed....basically I went through the above
         patch and applied everything in it by hand.

2) remove linux/fs/jffs2

3) copy CVS:mtd/fs/jffs2 to linux/fs/jffs2

4) copy fs/jffs2/crc32.h to linux/include/linux/crc32.h

5) in linux/fs/jffs2/file.c, there is a reference to PageUptodate()
   that must be changed to Page_Uptodate()   (looks like this syntax
   changed from 2.4 to 2.5 kernel....)

6) apply the following patch to linux/fs/Config.in:

diff -uNr linux/fs/Config.in linux.new_jffs2/fs/Config.in
--- linux/fs/Config.in  Mon Feb 25 13:38:07 2002
+++ linux.new_jffs2/fs/Config.in        Thu Jul 25 10:05:41 2002
@@ -42,6 +42,7 @@
 dep_tristate 'Journalling Flash File System v2 (JFFS2) support' CONFIG_JFFS2_FS $CONFIG_MTD
 if [ "$CONFIG_JFFS2_FS" = "y" -o "$CONFIG_JFFS2_FS" = "m" ] ; then
    int 'JFFS2 debugging verbosity (0 = quiet, 2 = noisy)' CONFIG_JFFS2_FS_DEBUG 0
+   dep_bool '  JFFS2 support for NAND flash (EXPERIMENTAL)' CONFIG_JFFS2_FS_NAND $CONFIG_EXPERIMENTAL
 fi
 tristate 'Compressed ROM file system support' CONFIG_CRAMFS
 bool 'Virtual memory file system support (former shm fs)' CONFIG_TMPFS



Once I did that, I had a working, writable JFFS2 filesystem running
on NAND flash.

Thanks again for the help!!

Steve






David Woodhouse wrote:
> 
> joern@wohnheim.fh-wedel.de said:
> >  My guess is that you need the zlib stuff in the kernel lib, you
> > should have linux/lib/zlib_inflate and linux/lib/zlib_deflate in your
> > source plus some modifications in arch/<yours>/config.in, lib/Makefile
> > and include/linux/zlib.h. Roughly.
> 
> ftp://ftp.??.kernel.org/pub/linux/kernel/people/dwmw2/shared-zlib/linux-2.4.19-pre10-shared-zlib.bz2
> 
> And I think you may need to copy fs/jffs2/crc32.h to include/linux/crc32.h
> or something similar.
> 
> --
> dwmw2
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Steve Hein (ssh@sgi.com)              Engineering Diagnostics/Software
Silicon Graphics, Inc.                          
1168 Industrial Blvd.                 Phone: (715) 726-8410
Chippewa Falls, WI 54729              Fax:   (715) 726-6715
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
