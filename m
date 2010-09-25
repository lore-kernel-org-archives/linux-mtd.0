Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OzNuB-0007iF-DS
	for linux-mtd@lists.infradead.org; Sat, 25 Sep 2010 06:06:41 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 82BA01B4382
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Sep 2010 06:06:37 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4 v2] mtd-utils: unify flash_erase and flash_eraseall
Date: Sat, 25 Sep 2010 02:07:27 -0400
Message-Id: <1285394847-29844-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1285293221-25028-4-git-send-email-vapier@gentoo.org>
References: <1285293221-25028-4-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These have overlapping functionality, and while flash_eraseall supports
newer 64bit ioctls, flash_erase does not.  So rather than graft support
onto flash_erase, merge the functionality of two into flash_erase so we
only have to support one util from now on.

A simple wrapper is provided to ease old flash_eraseall users into the
new combined flash_erase util.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- add SCRIPTS var for install

 .gitignore       |    1 -
 Makefile         |    7 +-
 flash_erase.c    |  418 ++++++++++++++++++++++++++++++++++--------------------
 flash_eraseall   |    4 +
 flash_eraseall.c |  276 -----------------------------------
 5 files changed, 269 insertions(+), 437 deletions(-)
 create mode 100755 flash_eraseall
 delete mode 100644 flash_eraseall.c

diff --git a/.gitignore b/.gitignore
index defbd57..2dbf198 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,7 +20,6 @@
 /doc_loadbios
 /docfdisk
 /flash_erase
-/flash_eraseall
 /flash_info
 /flash_lock
 /flash_otp_dump
diff --git a/Makefile b/Makefile
index d315f39..9160fac 100644
--- a/Makefile
+++ b/Makefile
@@ -9,7 +9,7 @@ endif
 
 SUBDIRS = lib ubi-utils mkfs.ubifs
 
-TARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
+TARGETS = ftl_format flash_erase nanddump doc_loadbios \
 	ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \
 	flash_otp_info flash_otp_dump mtd_debug flashcp nandwrite nandtest \
 	jffs2dump \
@@ -17,6 +17,7 @@ TARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
 	rfddump rfdformat \
 	serve_image recv_image \
 	sumtool #jffs2reader
+SCRIPTS = flash_eraseall
 
 SYMLINKS =
 
@@ -53,8 +54,8 @@ LDLIBS_jffs2reader  = -lz -llzo2
 
 $(BUILDDIR)/lib/libmtd.a: subdirs_lib_all ;
 
-install:: ${TARGETS}
+install:: ${TARGETS} ${SCRIPTS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
-	install -m 0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
+	install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
 	mkdir -p ${DESTDIR}/${MANDIR}/man1
 	gzip -9c mkfs.jffs2.1 > ${DESTDIR}/${MANDIR}/man1/mkfs.jffs2.1.gz
diff --git a/flash_erase.c b/flash_erase.c
index fdf9918..2467fff 100644
--- a/flash_erase.c
+++ b/flash_erase.c
@@ -1,189 +1,293 @@
-/*
- * flash_erase.c -- erase parts of a MTD device
- */
+/* flash_erase.c -- erase MTD devices
 
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <fcntl.h>
-#include <time.h>
-#include <string.h>
-#include <sys/ioctl.h>
-#include <sys/mount.h>
-#include <mtd/mtd-user.h>
+   Copyright (C) 2000 Arcom Control System Ltd
+   Copyright (C) 2010 Mike Frysinger <vapier@gentoo.org>
 
-int region_erase(int Fd, int start, int count, int unlock, int regcount)
-{
-	int i, j;
-	region_info_t * reginfo;
-
-	reginfo = calloc(regcount, sizeof(region_info_t));
-
-	for(i = 0; i < regcount; i++)
-	{
-		reginfo[i].regionindex = i;
-		if(ioctl(Fd,MEMGETREGIONINFO,&(reginfo[i])) != 0)
-			return 8;
-		else
-			printf("Region %d is at %d of %d sector and with sector "
-					"size %x\n", i, reginfo[i].offset, reginfo[i].numblocks,
-					reginfo[i].erasesize);
-	}
+   This program is free software; you can redistribute it and/or modify
+   it under the terms of the GNU General Public License as published by
+   the Free Software Foundation; either version 2 of the License, or
+   (at your option) any later version.
 
-	// We have all the information about the chip we need.
+   This program is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+   GNU General Public License for more details.
 
-	for(i = 0; i < regcount; i++)
-	{ //Loop through the regions
-		region_info_t * r = &(reginfo[i]);
+   You should have received a copy of the GNU General Public License
+   along with this program; if not, write to the Free Software
+   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
+ */
 
-		if((start >= reginfo[i].offset) &&
-				(start < (r->offset + r->numblocks*r->erasesize)))
-			break;
-	}
+#define PROGRAM_NAME "flash_erase"
+#define VERSION "2"
 
-	if(i >= regcount)
-	{
-		printf("Starting offset %x not within chip.\n", start);
-		return 8;
-	}
+#include <inttypes.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <string.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <sys/ioctl.h>
+#include <sys/types.h>
 
-	//We are now positioned within region i of the chip, so start erasing
-	//count sectors from there.
+#include <common.h>
+#include <strtox.h>
+#include <crc32.h>
+#include <libmtd.h>
 
-	for(j = 0; (j < count)&&(i < regcount); j++)
-	{
-		erase_info_t erase;
-		region_info_t * r = &(reginfo[i]);
+#include <mtd/mtd-user.h>
+#include <mtd/jffs2-user.h>
 
-		erase.start = start;
-		erase.length = r->erasesize;
+static const char *mtd_device;
 
-		if(unlock != 0)
-		{ //Unlock the sector first.
-			if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
-			{
-				perror("\nMTD Unlock failure");
-				close(Fd);
-				return 8;
-			}
-		}
-		printf("\rPerforming Flash Erase of length %u at offset 0x%x",
-				erase.length, erase.start);
-		fflush(stdout);
-		if(ioctl(Fd, MEMERASE, &erase) != 0)
-		{
-			perror("\nMTD Erase failure");
-			close(Fd);
-			return 8;
-		}
+static int quiet;		/* true -- don't output progress */
+static int jffs2;		/* format for jffs2 usage */
+static int noskipbad;		/* do not skip bad blocks */
+static int unlock;		/* unlock sectors before erasing */
 
+static struct jffs2_unknown_node cleanmarker;
+int target_endian = __BYTE_ORDER;
 
-		start += erase.length;
-		if(start >= (r->offset + r->numblocks*r->erasesize))
-		{ //We finished region i so move to region i+1
-			printf("\nMoving to region %d\n", i+1);
-			i++;
-		}
-	}
+static void show_progress(struct mtd_dev_info *mtd, uint64_t start, int eb,
+			  int eb_start, int eb_cnt)
+{
+	bareverbose(!quiet, "\rErasing %d Kibyte @ %"PRIx64" -- %2i %% complete ",
+		mtd->eb_size / 1024, start, ((eb - eb_start) * 100) / eb_cnt);
+	fflush(stdout);
+}
 
-	printf(" done\n");
+static void display_help (void)
+{
+	printf("Usage: %s [options] MTD_DEVICE <start block> <block count>\n"
+			"Erase blocks of the specified MTD device.\n"
+			"Specify a count of 0 to erase to end of device.\n"
+			"\n"
+			"  -j, --jffs2       format the device for jffs2\n"
+			"  -N, --noskipbad   don't skip bad blocks\n"
+			"  -u, --unlock      unlock sectors before erasing\n"
+			"  -q, --quiet       display progress messages\n"
+			"      --silent      same as --quiet\n"
+			"      --help        display this help and exit\n"
+			"      --version     output version information and exit\n",
+			PROGRAM_NAME);
+}
 
-	return 0;
+static void display_version (void)
+{
+	printf(PROGRAM_NAME " version " VERSION "\n"
+			"\n"
+			"Copyright (C) 2000 Arcom Control Systems Ltd\n"
+			"\n"
+			PROGRAM_NAME " comes with NO WARRANTY\n"
+			"to the extent permitted by law.\n"
+			"\n"
+			"You may redistribute copies of " PROGRAM_NAME "\n"
+			"under the terms of the GNU General Public Licence.\n"
+			"See the file `COPYING' for more information.\n");
 }
 
-int non_region_erase(int Fd, int start, int count, int unlock)
+int main(int argc, char *argv[])
 {
-	mtd_info_t meminfo;
-
-	if (ioctl(Fd,MEMGETINFO,&meminfo) == 0)
-	{
-		erase_info_t erase;
-
-		erase.start = start;
-
-		erase.length = meminfo.erasesize;
-
-		for (; count > 0; count--) {
-			printf("\rPerforming Flash Erase of length %u at offset 0x%x",
-					erase.length, erase.start);
-			fflush(stdout);
-
-			if(unlock != 0)
-			{
-				//Unlock the sector first.
-				printf("\rPerforming Flash unlock at offset 0x%x",erase.start);
-				if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
-				{
-					perror("\nMTD Unlock failure");
-					close(Fd);
-					return 8;
-				}
-			}
+	libmtd_t mtd_desc;
+	struct mtd_dev_info mtd;
+	int fd, clmpos = 0, clmlen = 8, eb, eb_start, eb_cnt;
+	int isNAND;
+	int error = 0;
+	uint64_t offset = 0;
+
+	/*
+	 * Process user arguments
+	 */
+	for (;;) {
+		int option_index = 0;
+		static const char *short_options = "jNqu";
+		static const struct option long_options[] = {
+			{"help", no_argument, 0, 0},
+			{"version", no_argument, 0, 0},
+			{"jffs2", no_argument, 0, 'j'},
+			{"noskipbad", no_argument, 0, 'N'},
+			{"quiet", no_argument, 0, 'q'},
+			{"silent", no_argument, 0, 'q'},
+			{"unlock", no_argument, 0, 'u'},
+
+			{0, 0, 0, 0},
+		};
+
+		int c = getopt_long(argc, argv, short_options,
+				long_options, &option_index);
+		if (c == EOF)
+			break;
 
-			if (ioctl(Fd,MEMERASE,&erase) != 0)
-			{
-				perror("\nMTD Erase failure");
-				close(Fd);
-				return 8;
+		switch (c) {
+		case 0:
+			switch (option_index) {
+			case 0:
+				display_help();
+				return 0;
+			case 1:
+				display_version();
+				return 0;
 			}
-			erase.start += meminfo.erasesize;
+			break;
+		case 'j':
+			jffs2 = 1;
+			break;
+		case 'N':
+			noskipbad = 1;
+			break;
+		case 'q':
+			quiet = 1;
+			break;
+		case 'u':
+			unlock = 1;
+			break;
+		case '?':
+			error = 1;
+			break;
 		}
-		printf(" done\n");
 	}
-	return 0;
-}
-
-int main(int argc,char *argv[])
-{
-	int regcount;
-	int Fd;
-	int start;
-	int count;
-	int unlock;
-	int res = 0;
-
-	if (1 >= argc ||  !strcmp(argv[1], "-h") || !strcmp (argv[1], "--help") ) {
-		printf("Usage: flash_erase MTD-device [start] [cnt (# erase blocks)] [lock]\n"
-				"       flash_erase -h | --help\n") ;
-		return 16 ;
+	switch (argc - optind) {
+	case 3:
+		mtd_device = argv[optind];
+		eb_start = simple_strtoul(argv[optind + 1], &error);
+		eb_cnt = simple_strtoul(argv[optind + 2], &error);
+		break;
+	default:
+	case 0:
+		errmsg("no MTD device specified");
+	case 1:
+		errmsg("no start erase block specified");
+	case 2:
+		errmsg("no erase block count specified");
+		error = 1;
+		break;
+	}
+	if (error)
+		return errmsg("Try `--help' for more information");
+
+	/*
+	 * Locate MTD and prepare for erasure
+	 */
+	mtd_desc = libmtd_open();
+	if (mtd_desc == NULL)
+		return errmsg("can't initialize libmtd");
+
+	if ((fd = open(mtd_device, O_RDWR)) < 0)
+		return sys_errmsg("%s", mtd_device);
+
+	if (mtd_get_dev_info(mtd_desc, mtd_device, &mtd) < 0)
+		return errmsg("mtd_get_dev_info failed");
+
+	isNAND = mtd.type == MTD_NANDFLASH ? 1 : 0;
+
+	if (jffs2) {
+		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
+		cleanmarker.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
+		if (!isNAND)
+			cleanmarker.totlen = cpu_to_je32(sizeof(cleanmarker));
+		else {
+			struct nand_oobinfo oobinfo;
+
+			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0)
+				return sys_errmsg("%s: unable to get NAND oobinfo", mtd_device);
+
+			/* Check for autoplacement */
+			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
+				/* Get the position of the free bytes */
+				if (!oobinfo.oobfree[0][1])
+					return errmsg(" Eeep. Autoplacement selected and no empty space in oob");
+				clmpos = oobinfo.oobfree[0][0];
+				clmlen = oobinfo.oobfree[0][1];
+				if (clmlen > 8)
+					clmlen = 8;
+			} else {
+				/* Legacy mode */
+				switch (mtd.oob_size) {
+					case 8:
+						clmpos = 6;
+						clmlen = 2;
+						break;
+					case 16:
+						clmpos = 8;
+						clmlen = 8;
+						break;
+					case 64:
+						clmpos = 16;
+						clmlen = 8;
+						break;
+				}
+			}
+			cleanmarker.totlen = cpu_to_je32(8);
+		}
+		cleanmarker.hdr_crc = cpu_to_je32(mtd_crc32(0, &cleanmarker, sizeof(cleanmarker) - 4));
 	}
 
-	if (argc > 2)
-		start = strtol(argv[2], NULL, 0);
-	else
-		start = 0;
-
-	if (argc > 3)
-		count = strtol(argv[3], NULL, 0);
-	else
-		count = 1;
+	/*
+	 * Now do the actual erasing of the MTD device
+	 */
+	if (eb_cnt == 0)
+		eb_cnt = (mtd.size / mtd.eb_size) - eb_start;
+
+	for (eb = eb_start; eb < eb_start + eb_cnt; eb++) {
+		offset = eb * mtd.eb_size;
+
+		if (!noskipbad) {
+			int ret = mtd_is_bad(&mtd, fd, eb);
+			if (ret > 0) {
+				verbose(!quiet, "Skipping bad block at %08"PRIx64, offset);
+				continue;
+			} else if (ret < 0) {
+				if (errno == EOPNOTSUPP) {
+					noskipbad = 1;
+					if (isNAND)
+						return errmsg("%s: Bad block check not available", mtd_device);
+				} else
+					return sys_errmsg("%s: MTD get bad block failed", mtd_device);
+			}
+		}
 
-	if(argc > 4)
-		unlock = strtol(argv[4], NULL, 0);
-	else
-		unlock = 0;
+		show_progress(&mtd, offset, eb, eb_start, eb_cnt);
 
+		if (unlock) {
+			if (mtd_unlock(&mtd, fd, eb) != 0) {
+				sys_errmsg("%s: MTD unlock failure", mtd_device);
+				continue;
+			}
+		}
 
-	// Open and size the device
-	if ((Fd = open(argv[1],O_RDWR)) < 0)
-	{
-		fprintf(stderr,"File open error\n");
-		return 8;
-	}
+		if (mtd_erase(mtd_desc, &mtd, fd, eb) != 0) {
+			sys_errmsg("%s: MTD Erase failure", mtd_device);
+			continue;
+		}
 
-	printf("Erase Total %d Units\n", count);
+		/* format for JFFS2 ? */
+		if (!jffs2)
+			continue;
 
-	if (ioctl(Fd,MEMGETREGIONCOUNT,&regcount) == 0)
-	{
-		if(regcount == 0)
-		{
-			res = non_region_erase(Fd, start, count, unlock);
-		}
-		else
-		{
-			res = region_erase(Fd, start, count, unlock, regcount);
+		/* write cleanmarker */
+		if (isNAND) {
+			if (mtd_write_oob(mtd_desc, &mtd, fd, offset + clmpos, clmlen, &cleanmarker) != 0) {
+				sys_errmsg("%s: MTD writeoob failure", mtd_device);
+				continue;
+			}
+		} else {
+			if (lseek(fd, (loff_t)offset, SEEK_SET) < 0) {
+				sys_errmsg("%s: MTD lseek failure", mtd_device);
+				continue;
+			}
+			if (write(fd, &cleanmarker, sizeof(cleanmarker)) != sizeof(cleanmarker)) {
+				sys_errmsg("%s: MTD write failure", mtd_device);
+				continue;
+			}
 		}
+		verbose(!quiet, " Cleanmarker written at %"PRIx64, offset);
 	}
+	offset += mtd.eb_size;
+	show_progress(&mtd, offset, eb, eb_start, eb_cnt);
+	bareverbose(!quiet, "\n");
 
-	return res;
+	return 0;
 }
diff --git a/flash_eraseall b/flash_eraseall
new file mode 100755
index 0000000..c5539b3
--- /dev/null
+++ b/flash_eraseall
@@ -0,0 +1,4 @@
+#!/bin/sh
+echo "${0##*/} has been replaced by \`flash_erase <mtddev> 0 0\`; please use it" 1>&2
+[ $# -ne 0 ] && set -- "$@" 0 0
+exec flash_erase "$@"
diff --git a/flash_eraseall.c b/flash_eraseall.c
deleted file mode 100644
index cb6f632..0000000
--- a/flash_eraseall.c
+++ /dev/null
@@ -1,276 +0,0 @@
-/* eraseall.c -- erase the whole of a MTD device
-
-   Copyright (C) 2000 Arcom Control System Ltd
-
-   Renamed to flash_eraseall.c
-
-   This program is free software; you can redistribute it and/or modify
-   it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 2 of the License, or
-   (at your option) any later version.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
- */
-#include <sys/types.h>
-#include <stdio.h>
-#include <sys/stat.h>
-#include <unistd.h>
-#include <sys/mman.h>
-#include <fcntl.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <string.h>
-#include <stdarg.h>
-#include <stdint.h>
-#include <libgen.h>
-#include <ctype.h>
-#include <time.h>
-#include <getopt.h>
-#include <sys/ioctl.h>
-#include <sys/mount.h>
-#include <crc32.h>
-#include <libmtd.h>
-
-#include <mtd/mtd-user.h>
-#include <mtd/jffs2-user.h>
-
-#define PROGRAM "flash_eraseall"
-#define VERSION "$Revision: 1.22 $"
-
-static const char *exe_name;
-static const char *mtd_device;
-static int quiet;		/* true -- don't output progress */
-static int jffs2;		/* format for jffs2 usage */
-
-static struct jffs2_unknown_node cleanmarker;
-int target_endian = __BYTE_ORDER;
-
-static void show_progress (struct mtd_dev_info *mtd, uint64_t start)
-{
-	printf("\rErasing %d Kibyte @ %llx -- %2llu %% complete.",
-		mtd->eb_size / 1024, (unsigned long long)start,
-		(unsigned long long) start * 100 / mtd->size);
-	fflush(stdout);
-}
-
-static void display_help (void)
-{
-	printf("Usage: %s [OPTION] MTD_DEVICE\n"
-			"Erases all of the specified MTD device.\n"
-			"\n"
-			"  -j, --jffs2    format the device for jffs2\n"
-			"  -q, --quiet    don't display progress messages\n"
-			"      --silent   same as --quiet\n"
-			"      --help     display this help and exit\n"
-			"      --version  output version information and exit\n",
-			exe_name);
-}
-
-
-static void display_version (void)
-{
-	printf(PROGRAM " " VERSION "\n"
-			"\n"
-			"Copyright (C) 2000 Arcom Control Systems Ltd\n"
-			"\n"
-			PROGRAM " comes with NO WARRANTY\n"
-			"to the extent permitted by law.\n"
-			"\n"
-			"You may redistribute copies of " PROGRAM "\n"
-			"under the terms of the GNU General Public Licence.\n"
-			"See the file `COPYING' for more information.\n");
-}
-
-int main (int argc, char *argv[])
-{
-	libmtd_t mtd_desc;
-	struct mtd_dev_info mtd;
-	int fd, clmpos = 0, clmlen = 8, eb;
-	int isNAND, bbtest = 1;
-	int error = 0;
-	uint64_t offset = 0;
-
-	exe_name = argv[0];
-	for (;;) {
-		int option_index = 0;
-		static const char *short_options = "jq";
-		static const struct option long_options[] = {
-			{"help", no_argument, 0, 0},
-			{"version", no_argument, 0, 0},
-			{"jffs2", no_argument, 0, 'j'},
-			{"quiet", no_argument, 0, 'q'},
-			{"silent", no_argument, 0, 'q'},
-
-			{0, 0, 0, 0},
-		};
-
-		int c = getopt_long(argc, argv, short_options,
-				long_options, &option_index);
-		if (c == EOF)
-			break;
-
-		switch (c) {
-		case 0:
-			switch (option_index) {
-			case 0:
-				display_help();
-				return 0;
-			case 1:
-				display_version();
-				return 0;
-			}
-			break;
-		case 'q':
-			quiet = 1;
-			break;
-		case 'j':
-			jffs2 = 1;
-			break;
-		case '?':
-			error = 1;
-			break;
-		}
-	}
-	if (optind == argc) {
-		fprintf(stderr, "%s: no MTD device specified\n", exe_name);
-		error = 1;
-	}
-	if (error) {
-		fprintf(stderr, "Try `%s --help' for more information.\n",
-				exe_name);
-		return 1;
-	}
-	mtd_device = argv[optind];
-
-	mtd_desc = libmtd_open();
-	if (mtd_desc == NULL) {
-		fprintf(stderr, "%s: can't initialize libmtd\n", exe_name);
-		return 1;
-	}
-
-	if ((fd = open(mtd_device, O_RDWR)) < 0) {
-		fprintf(stderr, "%s: %s: %s\n", exe_name, mtd_device, strerror(errno));
-		return 1;
-	}
-
-	if (mtd_get_dev_info(mtd_desc, mtd_device, &mtd) < 0) {
-		fprintf(stderr, "%s: mtd_get_dev_info failed\n", exe_name);
-		return 1;
-	}
-
-	isNAND = mtd.type == MTD_NANDFLASH ? 1 : 0;
-
-	if (jffs2) {
-		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
-		cleanmarker.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
-		if (!isNAND)
-			cleanmarker.totlen = cpu_to_je32 (sizeof (struct jffs2_unknown_node));
-		else {
-			struct nand_oobinfo oobinfo;
-
-			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0) {
-				fprintf(stderr, "%s: %s: unable to get NAND oobinfo\n", exe_name, mtd_device);
-				return 1;
-			}
-
-			/* Check for autoplacement */
-			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
-				/* Get the position of the free bytes */
-				if (!oobinfo.oobfree[0][1]) {
-					fprintf (stderr, " Eeep. Autoplacement selected and no empty space in oob\n");
-					return 1;
-				}
-				clmpos = oobinfo.oobfree[0][0];
-				clmlen = oobinfo.oobfree[0][1];
-				if (clmlen > 8)
-					clmlen = 8;
-			} else {
-				/* Legacy mode */
-				switch (mtd.oob_size) {
-					case 8:
-						clmpos = 6;
-						clmlen = 2;
-						break;
-					case 16:
-						clmpos = 8;
-						clmlen = 8;
-						break;
-					case 64:
-						clmpos = 16;
-						clmlen = 8;
-						break;
-				}
-			}
-			cleanmarker.totlen = cpu_to_je32(8);
-		}
-		cleanmarker.hdr_crc =  cpu_to_je32 (mtd_crc32 (0, &cleanmarker,  sizeof (struct jffs2_unknown_node) - 4));
-	}
-
-	for (eb = 0; eb < (mtd.size / mtd.eb_size); eb++) {
-		offset = eb * mtd.eb_size;
-		if (bbtest) {
-			int ret = mtd_is_bad(&mtd, fd, eb);
-			if (ret > 0) {
-				if (!quiet)
-					printf ("\nSkipping bad block at 0x%08llx\n", (unsigned long long)offset);
-				continue;
-			} else if (ret < 0) {
-				if (errno == EOPNOTSUPP) {
-					bbtest = 0;
-					if (isNAND) {
-						fprintf(stderr, "%s: %s: Bad block check not available\n", exe_name, mtd_device);
-						return 1;
-					}
-				} else {
-					fprintf(stderr, "\n%s: %s: MTD get bad block failed: %s\n", exe_name, mtd_device, strerror(errno));
-					return 1;
-				}
-			}
-		}
-
-		if (!quiet)
-			show_progress(&mtd, offset);
-
-		if (mtd_erase(mtd_desc, &mtd, fd, eb) != 0) {
-			fprintf(stderr, "\n%s: %s: MTD Erase failure: %s\n", exe_name, mtd_device, strerror(errno));
-			continue;
-		}
-
-		/* format for JFFS2 ? */
-		if (!jffs2)
-			continue;
-
-		/* write cleanmarker */
-		if (isNAND) {
-			if (mtd_write_oob(mtd_desc, &mtd, fd, offset + clmpos, clmlen, &cleanmarker) != 0) {
-				fprintf(stderr, "\n%s: %s: MTD writeoob failure: %s\n", exe_name, mtd_device, strerror(errno));
-				continue;
-			}
-		} else {
-			if (lseek (fd, (loff_t)offset, SEEK_SET) < 0) {
-				fprintf(stderr, "\n%s: %s: MTD lseek failure: %s\n", exe_name, mtd_device, strerror(errno));
-				continue;
-			}
-			if (write (fd , &cleanmarker, sizeof (cleanmarker)) != sizeof (cleanmarker)) {
-				fprintf(stderr, "\n%s: %s: MTD write failure: %s\n", exe_name, mtd_device, strerror(errno));
-				continue;
-			}
-		}
-		if (!quiet)
-			printf (" Cleanmarker written at %llx.", (unsigned long long)offset);
-	}
-	if (!quiet) {
-		show_progress(&mtd, offset);
-		printf("\n");
-	}
-
-	return 0;
-}
-
-- 
1.7.2.3
