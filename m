Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1983OQ-0007p8-Dr
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 20:25:26 +0100
Received: from covert.brown-ring.iadfw.net ([209.196.123.142])
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 1983OX-0002V0-00
	for linux-mtd@lists.infradead.org; Tue, 22 Apr 2003 20:25:33 +0100
Received: from pppte03-425.ght.iadfw.net ([66.94.133.171]
	helo=pcdebian.artsapartment.org)
	by covert.iadfw.net with esmtp (Exim 4.10)	id 1983OW-0007xv-00
	for mtd@infradead.org; Tue, 22 Apr 2003 14:25:33 -0500
Received: from arth by pcdebian.artsapartment.org with local (Exim 3.36 #1
	(Debian))	id 1983OT-00080t-00
	for <mtd@infradead.org>; Tue, 22 Apr 2003 14:25:29 -0500
Date: Tue, 22 Apr 2003 14:25:29 -0500
From: Art Haas <ahaas@airmail.net>
To: linux-mtd@lists.infradead.org
Message-ID: <20030422192529.GB17381@debian>
References: <20030422155653.GB7260@debian>
	<20030422190324.GC12947@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030422190324.GC12947@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=us-ascii
Subject: Re: [PATCH] C99 initializers for drivers/mtd/devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Here's a patch against the CVS lart.c to convert it to C99. The
'blkmtd.c' file from CVS doesn't match the file I generated the C99
patch for that was in the kernel.

Art Haas

Index: drivers/mtd/devices/lart.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/devices/lart.c,v
retrieving revision 1.2
diff -u -u -r1.2 lart.c
--- drivers/mtd/devices/lart.c	2 Oct 2001 15:05:13 -0000	1.2
+++ drivers/mtd/devices/lart.c	22 Apr 2003 19:23:43 -0000
@@ -584,46 +584,41 @@
 
 static struct mtd_info mtd;
 
-static struct mtd_erase_region_info erase_regions[] =
-{
-   /* parameter blocks */
-   {
-	     offset: 0x00000000,
-	  erasesize: FLASH_BLOCKSIZE_PARAM,
-	  numblocks: FLASH_NUMBLOCKS_16m_PARAM
-   },
-   /* main blocks */
-   {
-	     offset: FLASH_BLOCKSIZE_PARAM * FLASH_NUMBLOCKS_16m_PARAM,
-	  erasesize: FLASH_BLOCKSIZE_MAIN,
-	  numblocks: FLASH_NUMBLOCKS_16m_MAIN
-   }
+static struct mtd_erase_region_info erase_regions[] = {
+	/* parameter blocks */
+	{
+		.offset		= 0x00000000,
+		.erasesize	= FLASH_BLOCKSIZE_PARAM,
+		.numblocks	= FLASH_NUMBLOCKS_16m_PARAM,
+	},
+	/* main blocks */
+	{
+		.offset	 = FLASH_BLOCKSIZE_PARAM * FLASH_NUMBLOCKS_16m_PARAM,
+		.erasesize	= FLASH_BLOCKSIZE_MAIN,
+		.numblocks	= FLASH_NUMBLOCKS_16m_MAIN,
+	}
 };
 
 #ifdef HAVE_PARTITIONS
-static struct mtd_partition lart_partitions[] =
-{
-   /* blob */
-   {
-	       name: "blob",
-	     offset: BLOB_START,
-	       size: BLOB_LEN,
-	 mask_flags: 0
-   },
-   /* kernel */
-   {
-	       name: "kernel",
-	     offset: KERNEL_START,			/* MTDPART_OFS_APPEND */
-	       size: KERNEL_LEN,
-	 mask_flags: 0
-   },
-   /* initial ramdisk / file system */
-   {
-	       name: "file system",
-	     offset: INITRD_START,			/* MTDPART_OFS_APPEND */
-	       size: INITRD_LEN,			/* MTDPART_SIZ_FULL */
-	 mask_flags: 0
-   }
+static struct mtd_partition lart_partitions[] = {
+	/* blob */
+	{
+		.name	= "blob",
+		.offset	= BLOB_START,
+		.size	= BLOB_LEN,
+	},
+	/* kernel */
+	{
+		.name	= "kernel",
+		.offset	= KERNEL_START,		/* MTDPART_OFS_APPEND */
+		.size	= KERNEL_LEN,
+	},
+	/* initial ramdisk / file system */
+	{
+		.name	= "file system",
+		.offset	= INITRD_START,		/* MTDPART_OFS_APPEND */
+		.size	= INITRD_LEN,		/* MTDPART_SIZ_FULL */
+	}
 };
 #endif
 
-- 
To announce that there must be no criticism of the President, or that we
are to stand by the President, right or wrong, is not only unpatriotic
and servile, but is morally treasonable to the American public.
 -- Theodore Roosevelt, Kansas City Star, 1918
