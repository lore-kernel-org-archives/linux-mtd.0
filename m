Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15lyIf-0005FY-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Sep 2001 20:55:25 +0100
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id WAA12502
	for <linux-mtd@lists.infradead.org>; Tue, 25 Sep 2001 22:04:10 +0200
Date: Tue, 25 Sep 2001 22:04:26 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: partt partition table parser
Message-ID: <20010925220426.B9581@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi!

There has been time for some cleanups, so the code might actually
work. Please have a look and see if this is usable.

Jörn

-- 
``Plan to throw one away; you will, anyhow.'' 
(Fred Brooks, ``The Mythical Man-Month'', Chapter 11)

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="partt.patch"

diff -Naur mtd.orig/drivers/mtd/Config.in mtd/drivers/mtd/Config.in
--- mtd.orig/drivers/mtd/Config.in	Sun Aug 12 00:00:07 2001
+++ mtd/drivers/mtd/Config.in	Tue Sep 25 20:19:20 2001
@@ -15,6 +15,13 @@
    dep_tristate '  RedBoot partition table parsing' CONFIG_MTD_REDBOOT_PARTS $CONFIG_MTD_PARTITIONS
    dep_tristate '  Compaq bootldr partition table parsing' CONFIG_MTD_BOOTLDR_PARTS $CONFIG_MTD_PARTITIONS
    dep_tristate '  ARM Firmware Suite partition parsing' CONFIG_MTD_AFS_PARTS $CONFIG_MTD_PARTITIONS
+   dep_tristate '  Partt partition table parsing' CONFIG_MTD_PARTT_PARTS $CONFIG_MTD_PARTITIONS
+   if [ "$CONFIG_MTD_PARTT_PARTS" = "y" -o "$CONFIG_MTD_PARTT_PARTS" = "m" ]; then
+      bool      '    use indirect address to partition table' CONFIG_MTD_PARTT_INDIRECT
+      bool      '    seek partition table [pointer] from end' CONFIG_MTD_PARTT_SEEK_FROM_END
+      hex       '    address to partition table [pointer]' CONFIG_MTD_PARTT_ADDRESS 0
+   fi
+
 
 comment 'User Modules And Translation Layers'
    dep_tristate '  Direct char device access to MTD devices' CONFIG_MTD_CHAR $CONFIG_MTD
diff -Naur mtd.orig/drivers/mtd/Makefile mtd/drivers/mtd/Makefile
--- mtd.orig/drivers/mtd/Makefile	Thu Jun 14 00:00:07 2001
+++ mtd/drivers/mtd/Makefile	Tue Sep 25 20:17:50 2001
@@ -48,6 +48,7 @@
 obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
 obj-$(CONFIG_MTD_BOOTLDR_PARTS) += bootldr.o
 obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
+obj-$(CONFIG_MTD_PARTT_PARTS)	+= partt.o
 
 # 'Users' - code which presents functionality to userspace.
 obj-$(CONFIG_MTD_CHAR)		+= mtdchar.o
diff -Naur mtd.orig/drivers/mtd/maps/physmap.c mtd/drivers/mtd/maps/physmap.c
--- mtd.orig/drivers/mtd/maps/physmap.c	Sun Jul 15 00:00:11 2001
+++ mtd/drivers/mtd/maps/physmap.c	Tue Sep 25 20:28:03 2001
@@ -81,8 +81,15 @@
 #define cleanup_physmap cleanup_module
 #endif
 
+#if defined(CONFIG_MTD_PARTT_PARTS)
+static struct mtd_partition *parts;
+#endif
+
 int __init init_physmap(void)
 {
+#if defined(CONFIG_MTD_PARTT_PARTS)
+	int nrparts = 0;
+#endif
        	printk(KERN_NOTICE "physmap flash device: %x at %x\n", WINDOW_SIZE, WINDOW_ADDR);
 	physmap_map.map_priv_1 = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE);
 
@@ -91,15 +98,19 @@
 		return -EIO;
 	}
 	mymtd = do_map_probe("cfi_probe", &physmap_map);
-	if (mymtd) {
-		mymtd->module = THIS_MODULE;
-
-		add_mtd_device(mymtd);
-		return 0;
+	if (!mymtd) {
+		iounmap((void *)physmap_map.map_priv_1);
+		return -ENXIO;
 	}
-
-	iounmap((void *)physmap_map.map_priv_1);
-	return -ENXIO;
+	mymtd->module = THIS_MODULE;
+	add_mtd_device(mymtd);
+#if defined(CONFIG_MTD_PARTT_PARTS)
+	nrparts = parse_partt_partitions(mymtd, &parts);
+	if (nrparts <= 0)
+		return nrparts; /* FIXME: Is there more cleanup to do? */
+	add_mtd_partitions(mymtd, parts, nrparts);
+#endif
+	return 0;
 }
 
 static void __exit cleanup_physmap(void)
diff -Naur mtd.orig/drivers/mtd/partt.c mtd/drivers/mtd/partt.c
--- mtd.orig/drivers/mtd/partt.c	Thu Jan  1 01:00:00 1970
+++ mtd/drivers/mtd/partt.c	Tue Sep 25 20:22:03 2001
@@ -0,0 +1,117 @@
+/*
+ * partt Partition Table Parser
+ *
+ * very minimal and flexible parser
+ *
+ * Copyright (C) 2001 Joern Engel
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/string.h>
+#include <linux/mtd/partt.h>
+
+/*
+ * Atomic wrapper for (struct mtdinfo)->read, so it always returns len bytes
+ * or fails completely 
+ */
+inline int wrapped_read(struct mtd_info *mtd, loff_t from, size_t len, u_char *buf)
+{
+	int ret;
+	size_t retlen, offset;
+	for (retlen=offset=0; offset < len; offset += retlen) {
+		ret = mtd->read (mtd, from, len, &retlen, buf+offset);
+		if (ret<0)
+			return ret;
+		if (retlen==0)
+			return -EIO;
+	}
+	return ret;
+}
+
+#ifdef CONFIG_MTD_PARTT_SEEK_FROM_END
+#	define ADDR (master->size - (CONFIG_MTD_PARTT_ADDRESS))
+#else
+#	define ADDR (CONFIG_MTD_PARTT_ADDRESS)
+#endif
+
+/*
+ * Partition table format:
+ * - <=16 Entries on a table
+ * - Null-terminated - the last entry's name starts with 0x00
+ * - Extendable - the terminating entry might include a pointer to the next
+ *     partition table, even though this feature is not used yet
+ * - Small flash footprint - includes only informations that the kernel uses
+ *
+ * TODO: 
+ * Handle multiple partition tables
+ * Change code to handle flash sizes >4GiB
+ */
+int parse_partt_partitions(struct mtd_info *master, struct mtd_partition **pparts)
+{
+	int ret;
+	u32 flash_table;
+	partt_table *mem_table;
+	struct mtd_partition *parts;
+	int nrparts = 0;
+	char *names;
+	int namelen = 0;
+	int i;
+
+	/* get position of partition table */ 
+#ifdef CONFIG_MTD_PARTT_INDIRECT
+	ret = wrapped_read (master, ADDR, sizeof(flash_table), (u_char*)&flash_table);
+	if (ret<0)
+		return ret;
+	if (flash_table >= (master->size - TABLE_SIZE))
+		return -EFAULT;
+#else
+	flash_table = ADDR;
+#endif
+	/* copy partition table to ram */
+	mem_table = kmalloc (sizeof(partt_table), GFP_KERNEL);
+	if (!mem_table)
+		return -ENOMEM;
+	ret = wrapped_read (master, flash_table, TABLE_SIZE, (u_char*)mem_table);
+	if (ret<0)
+		goto out;
+	if (mem_table[0][TABLE_NO_ENTRIES-1].mask_flags != PARTT_MAGIC)
+		goto out;
+
+	/* calculate number of partitions and memory need */
+	for (; mem_table[0][nrparts].name[0] && nrparts<TABLE_NO_ENTRIES; nrparts++) {
+		if (mem_table[0][nrparts].name[NAME_MAX_LEN])
+			goto out;
+		/* FIXME: Do some more sanity checks */
+		namelen += strlen (mem_table[0][nrparts].name) + 1;
+	}
+	if (!nrparts) {
+		ret = 0;
+		goto out;
+	}
+
+	/* copy data to linux partition table */
+	parts = kmalloc (nrparts*sizeof(*parts) + namelen, GFP_KERNEL);
+	if (!parts) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	names = (char*)&parts[nrparts];
+	for (i=0; i<nrparts; i++) {
+		parts[i].size = mem_table[0][i].size;
+		parts[i].offset = mem_table[0][i].offset;
+		parts[i].mask_flags = mem_table[0][i].mask_flags;
+		parts[i].name = names;
+		strcpy (names, mem_table[0][i].name);
+		names += strlen(names)+1;
+	}
+	*pparts = parts;
+	ret = nrparts;
+out:
+	kfree (mem_table);
+	return ret;
+}
diff -Naur mtd.orig/include/linux/mtd/partt.h mtd/include/linux/mtd/partt.h
--- mtd.orig/include/linux/mtd/partt.h	Thu Jan  1 01:00:00 1970
+++ mtd/include/linux/mtd/partt.h	Tue Sep 25 20:15:02 2001
@@ -0,0 +1,28 @@
+#ifndef _LINUX_MTD_PARTT_H
+#define _LINUX_MTD_PARTT_H
+
+#include <linux/types.h>
+
+#define PARTT_MAGIC 0x0054544a /* "\0TTJ" */
+
+#define TABLE_ENTRY_SIZE (32)
+#define TABLE_NO_ENTRIES (16)
+#define TABLE_SIZE ((TABLE_NO_ENTRIES)*(TABLE_ENTRY_SIZE))
+#define NAME_MAX_LEN ((TABLE_ENTRY_SIZE) - 3*sizeof(__u32))
+
+#ifndef PARTT_NODEBUG
+#	ifdef __KERNEL__
+#		define DOUT(fmt, args...) printk(KERN_CRIT "partt: " fmt, ## args)
+#	endif
+#endif
+
+struct partt_entry {
+	char name[NAME_MAX_LEN]; /* name is also padding */
+	__u32 size;
+	__u32 offset;
+	__u32 mask_flags; 
+};
+
+typedef struct partt_entry partt_table[TABLE_NO_ENTRIES];
+
+#endif
diff -Naur mtd.orig/util/Makefile mtd/util/Makefile
--- mtd.orig/util/Makefile	Thu Sep  6 00:00:07 2001
+++ mtd/util/Makefile	Tue Sep 25 20:15:37 2001
@@ -7,7 +7,7 @@
 
 TARGETS = ftl_format erase eraseall nftldump nanddump doc_loadbios \
 nftl_format mkfs.jffs ftl_check nandtest nandwrite mkfs.jffs2 lock unlock \
-einfo mtd_debug fcp jffs2reader
+einfo mtd_debug fcp jffs2reader mkpartt
 
 SYMLINKS = crc32.h crc32.c compr_rtime.c compr_rubin.c compr.c pushpull.c pushpull.h histo_mips.h compr_rubin.h
 
diff -Naur mtd.orig/util/Makefile.am mtd/util/Makefile.am
--- mtd.orig/util/Makefile.am	Tue Jun 26 10:26:53 2001
+++ mtd/util/Makefile.am	Tue Sep 25 20:15:48 2001
@@ -2,7 +2,7 @@
 
 sbin_PROGRAMS = ftl_format erase eraseall nftldump nanddump doc_loadbios \
                nftl_format mkfs.jffs ftl_check nandtest nandwrite mkfs.jffs2 \
-	       lock unlock einfo mtd_debug fcp
+	       lock unlock einfo mtd_debug fcp mkpartt
 
 CFLAGS = -O2 -Wall
 INCLUDES = -I@CONFIG_KERNELDIR@/include -I@CONFIG_KERNELDIR@/fs/jffs2
diff -Naur mtd.orig/util/mkfs.jffs2.c mtd/util/mkfs.jffs2.c
--- mtd.orig/util/mkfs.jffs2.c	Mon Sep 10 00:00:15 2001
+++ mtd/util/mkfs.jffs2.c	Tue Sep 25 20:12:28 2001
@@ -22,7 +22,7 @@
 
 //#define DMALLOC
 //#define debug_msg	error_msg
-#define debug_msg(...)	{ }
+#define debug_msg(args...)	{ }
 
 
 #define _GNU_SOURCE
diff -Naur mtd.orig/util/mkpartt.c mtd/util/mkpartt.c
--- mtd.orig/util/mkpartt.c	Thu Jan  1 01:00:00 1970
+++ mtd/util/mkpartt.c	Tue Sep 25 20:15:58 2001
@@ -0,0 +1,122 @@
+/*
+ * TODO: 
+ * Always write partition table in big endian format
+ * Allow for multiple partition tables
+ */
+#include <stdio.h>
+#include <unistd.h>
+#define _GNU_SOURCE
+#include <getopt.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <stdlib.h>
+#include <string.h>
+#include "/usr/src/linux/include/linux/mtd/ibmpartt.h"
+
+#define MAX_BUF (4096)
+
+static int cross_endian = 0;
+
+void print_help ()
+{
+	printf ("\n"
+			"mkpartt\n"
+			"creates partt style flash partition tables\n"
+			"\n"
+			"Options:\n"
+			" -h --help          print this help\n"
+			" -c --cross-endian  write partition table in big enian on little endian machines or vice versa\n"
+			"\n"
+			);
+}
+
+void x_order_32 (__u32 *old32)
+{
+	__u32 new32;
+	__u8 *new8 = (__u8*)&new32;
+	__u8 *old8 = (__u8*)old32;
+	new8[0] = old8[3];
+	new8[1] = old8[2];
+	new8[2] = old8[1];
+	new8[3] = old8[0];
+	*old32 = new32;
+}
+
+int cross_endianize (partt_table *table)
+{
+	int i;
+	for (i=0; i<TABLE_NO_ENTRIES; i++) {
+		x_order_32 (&(table[0][i].size));
+		x_order_32 (&(table[0][i].offset));
+		x_order_32 (&(table[0][i].mask_flags));
+	}
+	return 0;
+}
+
+int parse_table (FILE *infile, FILE *outfile)
+{
+	partt_table table;
+	int entry;
+	char *buf;
+	int ret = 0;
+
+	__bzero ((char*)&table, sizeof(table));
+
+	buf = malloc (MAX_BUF); /* FIXME */
+	entry = 0;
+	while (fgets (buf, MAX_BUF, infile) && entry<TABLE_NO_ENTRIES-1) {
+		int columns;
+		if (buf[0] == '#')
+			continue;
+		columns = sscanf (buf, " %20s %x %x %x", /* FIXME: Replace 20 with NAME_MAX_LEN */
+			       	table[entry].name,
+			       	&(table[entry].size),
+			       	&(table[entry].offset),
+			       	&(table[entry].mask_flags));
+		if (columns < 3) {
+			ret = -EIO;
+			goto out;
+		}
+		if (columns == 3) /* mask_flags may be left empty */
+			table[entry].mask_flags = 0;
+		entry++;
+	}
+	__bzero (&(table[entry]), TABLE_ENTRY_SIZE);
+	table[TABLE_NO_ENTRIES-1].mask_flags = PARTT_MAGIC;
+
+	if (cross_endian)
+		cross_endianize (&table);
+
+	if (!fwrite (&table, TABLE_SIZE, 1, outfile))
+		ret = -EIO;
+out:
+	free (buf);
+	return ret;
+}
+
+int main (int argc, char** argv)
+{
+	while (1) {
+		int c, option_index;
+		char short_options[] = "ch";
+		static struct option long_options [] = {
+			{"cross-endian", 0, 0, 'c'},
+			{"help", 0, 0, 'h'},
+			{0, 0, 0, 0} /* FIXME: Parse some useful parameters */
+		};
+                c = getopt_long(argc, argv, short_options, long_options, &option_index);
+		if (c==-1)
+			break;
+		switch (c) {
+			case 'c':
+				cross_endian = 1;
+				break;
+			case 'h':
+				print_help ();
+				return 0;
+			default: 
+				printf ("Option not implemented, contact developer\n");
+		}
+	}
+	return parse_table (stdin, stdout);
+}

--vtzGhvizbBRQ85DL--
