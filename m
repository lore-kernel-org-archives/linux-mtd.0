Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CNWsz-0004M9-Vo
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2004 09:33:48 -0400
From: Ian Campbell <icampbell@arcom.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1099056821.24918.1669.camel@icampbell-debian>
Mime-Version: 1.0
Date: Fri, 29 Oct 2004 14:33:42 +0100
Content-Transfer-Encoding: 7bit
Subject: [PATCH 2/2] Make redboot partition table location configurable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

RedBoot has a compile time configuration option called
CYGNUM_REDBOOT_FIS_DIRECTORY_BLOCK. 

The patch below (against BK) adds an equivalent option to the Linux
redboot partition table parsing code.

Is it OK to commit to MTD CVS and send to Linus?

Ian.

Index: 2.6-bk/drivers/mtd/Kconfig
===================================================================
--- 2.6-bk.orig/drivers/mtd/Kconfig	2004-10-29 09:52:28.814675295 +0100
+++ 2.6-bk/drivers/mtd/Kconfig	2004-10-29 10:09:19.565036333 +0100
@@ -54,8 +54,8 @@
 	depends on MTD_PARTITIONS
 	---help---
 	  RedBoot is a ROM monitor and bootloader which deals with multiple
-	  'images' in flash devices by putting a table in the last erase
-	  block of the device, similar to a partition table, which gives
+	  'images' in flash devices by putting a table one of the erase
+	  blocks on the device, similar to a partition table, which gives
 	  the offsets, lengths and names of all the images stored in the
 	  flash.
 
@@ -68,6 +68,23 @@
 	  SA1100 map driver (CONFIG_MTD_SA1100) has an option for this, for 
 	  example.
 
+config MTD_REDBOOT_DIRECTORY_BLOCK
+	int "Location of RedBoot partition table"
+	depends on MTD_REDBOOT_PARTS
+	default "-1"
+	---help---
+	  This option is the Linux counterpart to the
+	  CYGNUM_REDBOOT_FIS_DIRECTORY_BLOCK RedBoot compile time
+	  option.
+
+	  The option specifies which Flash sectors holds the RedBoot
+	  partition table.  A zero or positive value gives an absolete
+	  erase block number. A negative value specifies a number of
+	  sectors before the end of the device.
+	  
+	  For example "2" means block number 2, "-1" means the last
+	  block and "-2" means the penultimate block.
+	  
 config MTD_REDBOOT_PARTS_UNALLOCATED
 	bool "  Include unallocated flash regions"
 	depends on MTD_REDBOOT_PARTS
Index: 2.6-bk/drivers/mtd/redboot.c
===================================================================
--- 2.6-bk.orig/drivers/mtd/redboot.c	2004-10-29 10:09:01.798848528 +0100
+++ 2.6-bk/drivers/mtd/redboot.c	2004-10-29 10:09:35.374754066 +0100
@@ -30,6 +30,9 @@
 	struct fis_list *next;
 };
 
+static int directory = CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK;
+module_param(directory, int, 0);
+
 static inline int redboot_checksum(struct fis_image_desc *img)
 {
 	/* RedBoot doesn't actually write the desc_cksum field yet AFAICT */
@@ -51,6 +54,7 @@
 	int namelen = 0;
 	int nulllen = 0;
 	int numslots;
+	unsigned long offset;
 #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
 	static char nullstring[] = "unallocated";
 #endif
@@ -60,8 +64,15 @@
 	if (!buf)
 		return -ENOMEM;
 
-	/* Read the start of the last erase block */
-	ret = master->read(master, master->size - master->erasesize,
+	if ( directory < 0 )
+		offset = master->size + directory*master->erasesize;
+	else
+		offset = directory*master->erasesize;
+
+	printk(KERN_NOTICE "Searching for RedBoot partition table in %s at offset 0x%lx\n",
+	       master->name, offset);
+
+	ret = master->read(master, offset,
 			   master->erasesize, &retlen, (void *)buf);
 
 	if (ret)

-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road, 			Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom	Phone:  +44 (0)1223 411 200
