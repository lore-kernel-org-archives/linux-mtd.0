Received: from carisma.slowglass.com ([195.224.96.167]
	helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1982Tc-0007O5-DC
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 19:26:44 +0100
Received: from covert.brown-ring.iadfw.net ([209.196.123.142])
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 1982Tj-00028Z-00
	for linux-mtd@lists.infradead.org; Tue, 22 Apr 2003 19:26:52 +0100
Date: Tue, 22 Apr 2003 10:56:53 -0500
From: Art Haas <ahaas@airmail.net>
To: linux-kernel@vger.kernel.org, Simon Evans <spse@secret.org.uk>,
	Abraham vd Merwe <abraham@2d3d.co.za>, linux-mtd@lists.infradead.org
Message-ID: <20030422155653.GB7260@debian>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
cc: Linus Torvalds <torvalds@transmeta.com>
Subject: [PATCH] C99 initializers for drivers/mtd/devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

Here are two trivial patches adding C99 initializers to the files. The
patches are against the current BK.

Art Haas

===== drivers/mtd/devices/blkmtd.c 1.29 vs edited =====
--- 1.29/drivers/mtd/devices/blkmtd.c	Sun Mar 23 00:14:13 2003
+++ edited/drivers/mtd/devices/blkmtd.c	Mon Mar 24 11:44:57 2003
@@ -287,12 +287,9 @@
   return 0;
 }
 
-                    
 static struct address_space_operations blkmtd_aops = {
-  writepage:     blkmtd_writepage,
-  readpage:      NULL,
+	.writepage	= blkmtd_writepage,
 }; 
-
 
 /* This is the kernel thread that empties the write queue to disk */
 static int write_queue_task(void *data)
===== drivers/mtd/devices/lart.c 1.1 vs edited =====
--- 1.1/drivers/mtd/devices/lart.c	Tue Feb  5 14:20:55 2002
+++ edited/drivers/mtd/devices/lart.c	Mon Mar  3 12:21:44 2003
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
