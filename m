Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SeDg-0001Na-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 14:42:56 +0100
Date: Thu, 11 Jul 2002 15:42:56 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Cc: jffs-dev@axis.com
Subject: [patch 2] mkfs.jffs2
Message-ID: <20020711134256.GA8771@wohnheim.fh-wedel.de>
References: <20020711125740.GA6789@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020711125740.GA6789@wohnheim.fh-wedel.de>
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

ECC NOR flash does not allow any page (8 bytes or so) to be written
twice between erases. Since some flashers even write 0xff to flash,
this does make a diffence. The flash looks empty but cannot be written
anymore.
My solution is to pad the output of mkfs.jffs2 with a node, instead of
0xff. Now the erase blocks in question will not be written to, until
garbage collection explicitly erases them.
A command line option is added to turn this behaviour on.

Joern

Index: mkfs.jffs2.1
===================================================================
RCS file: /home/cvs/mtd/util/mkfs.jffs2.1,v
retrieving revision 1.2
diff -u -p -u -r1.2 mkfs.jffs2.1
--- mkfs.jffs2.1	24 Apr 2001 01:48:52 -0000	1.2
+++ mkfs.jffs2.1	11 Jul 2002 13:01:13 -0000
@@ -90,6 +90,10 @@ Write JFFS2 image to file FILE.  Default
 Pad output to SIZE bytes with 0xFF.  If SIZE is not specified,
 the output is padded to the end of the final erase block.
 .TP
+.B -n, --nodepad
+Same as --pad, but padding is done with a padding node whenever
+possible.
+.TP
 .B -r, -d, --root=DIR
 Build filesystem from directory DIR.  The default is the current
 directory.


--- mkfs.jffs2.c.orig	Thu Jul 11 14:25:03 2002
+++ mkfs.jffs2.c	Thu Jul 11 14:25:40 2002
@@ -4,6 +4,7 @@
  * Copyright 2001, 2002 Red Hat, Inc.
  *           2001 David A. Schleef <ds@lineo.com>
  *           2001 Erik Andersen <andersen@codepoet.org>
+ *           2002 Joern Engel <joern@wh.fh-wedel.de>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -30,6 +31,10 @@
  *
  * I also added a sample device table file.  See device_table.txt
  *  -Erik, Septermber 2001
+ *
+ * July 2002, Joern Engel
+ * - fixed some sprintf() to snprintf(). This might be suid root.
+ * - added padding node for ECC'd NOR flashes
  */
 
 /* $Id: mkfs.jffs2.c,v 1.26 2002/07/03 22:20:13 dwmw2 Exp $ */
@@ -105,6 +110,7 @@
 #endif
 
 static int erase_block_size = 65536;
+static int pad_with_nodes = 0;
 static int pad_fs_size = 0;
 static int page_size = 4096;
 static int out_fd = 1;
@@ -497,7 +503,7 @@
 	return (new_entry);
 }
 
-static void padblock(void)
+static void padblock_with_ff(void)
 {
 	while (out_ofs % erase_block_size) {
 		full_write(out_fd, ffbuf, 
@@ -505,6 +511,30 @@
 	}
 }
 
+static void padblock_with_node(void)
+{
+	if (!(out_ofs % erase_block_size))
+		return;
+	if (erase_block_size - (out_ofs % erase_block_size)
+			>= sizeof(struct jffs2_unknown_node)) {
+		struct jffs2_unknown_node pad;
+		pad.magic = cpu_to_target16(JFFS2_MAGIC_BITMASK);
+		pad.nodetype = JFFS2_NODETYPE_PADDING;
+		pad.totlen = erase_block_size - (out_ofs % erase_block_size);
+		pad.hdr_crc = cpu_to_target32(crc32(0, &pad, sizeof(pad) - 4));
+		full_write(out_fd, &pad, sizeof(pad));
+	}
+	padblock_with_ff();
+}
+
+static void padblock(void)
+{
+	if (pad_with_nodes)
+		padblock_with_node();
+	else
+		padblock_with_ff();
+}
+
 static inline void pad_block_if_less_than(int req)
 {
 	if ((out_ofs % erase_block_size) + req > erase_block_size) {
@@ -757,7 +787,7 @@
 	struct directory_entry *parent;
 
 
-	sprintf(path, "%s", dname);
+	snprintf(path, sizeof(path), "%s", dname);
 
 	if (lstat(path, &sb)) {
 		perror_msg_and_die("%s", path);
@@ -776,9 +806,9 @@
 			continue;
 		}
 		if (strcmp(dname, ".") == 0)
-			sprintf(path, "%s", dp->d_name);
+			snprintf(path, sizeof(path), "%s", dp->d_name);
 		else
-			sprintf(path, "%s/%s", dname, dp->d_name);
+			snprintf(path, sizeof(path), "%s/%s", dname, dp->d_name);
 		if (lstat(path, &sb)) {
 			perror_msg_and_die("%s", path);
 		}
@@ -845,7 +875,7 @@
 		error_msg_and_die("Device table entries require absolute paths");
 	}
 	name = xstrdup(path + 1);
-	sprintf(path, "%s/%s", rootdir, name);
+	snprintf(path, sizeof(path), "%s/%s", rootdir, name);
 
 	switch (type) {
 	case 'd':
@@ -869,7 +899,7 @@
 			char buf[80];
 
 			for (i = start; i < count; i++) {
-				sprintf(buf, "%s%d", name, i);
+				snprintf(buf, sizeof(buf), "%s%d", name, i);
 				/* FIXME:  MKDEV uses illicit insider knowledge of kernel 
 				 * major/minor representation...  */
 				rdev = MKDEV(major, minor + (i * increment - start));
@@ -1099,6 +1129,7 @@
 
 static struct option long_options[] = {
 	{"pad", 2, NULL, 'p'},
+	{"nodepad", 0, NULL, 'n'},
 	{"root", 1, NULL, 'r'},
 	{"pagesize", 1, NULL, 's'},
 	{"eraseblock", 1, NULL, 'e'},
@@ -1122,6 +1153,8 @@
 	"  -p, --pad[=SIZE]       Pad output to SIZE bytes with 0xFF. If SIZE is\n"
 	"                         not specified, the output is padded to the end of\n"
 	"                         the final erase block\n"
+	"  -n, --nodepad          Same as --pad, but padding is done with a padding node\n"
+	"                         instead of plain 0xFF, whenever possible\n"
 	"  -r, -d, --root=DIR     Build filesystem from directory DIR (default: cwd)\n"
 	"  -s, --pagesize=SIZE    Use page size (max data node size) SIZE (default: 4KiB)\n"
 	"  -e, --eraseblock=SIZE  Use erase block size SIZE (default: 64KiB)\n"
@@ -1146,7 +1179,7 @@
 	struct stat statbuf;
 	FILE *devtable = NULL;
 
-	while ((opt = getopt_long(argc, argv, "D:p::d:r:s:e:o:blqfh?v", 
+	while ((opt = getopt_long(argc, argv, "D:p::nd:r:s:e:o:blqfh?v", 
 			long_options, &c)) >= 0) {
 		switch (opt) {
 		case 'D':
@@ -1155,6 +1188,10 @@
 				perror_msg_and_die(optarg);
 			if (statbuf.st_size < 10)
 				error_msg_and_die("%s: not a proper device table file", optarg);
+			break;
+		case 'n':
+			pad_with_nodes = 1;
+			pad_fs_size = -1;
 			break;
 		case 'p':
 			if (optarg)
