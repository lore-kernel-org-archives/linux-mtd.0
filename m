Received: from rv-out-0708.google.com ([209.85.198.245])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JuLvT-0003GK-Cz
	for linux-mtd@lists.infradead.org; Fri, 09 May 2008 06:17:52 +0000
Received: by rv-out-0708.google.com with SMTP id b17so1318188rvf.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 May 2008 23:17:50 -0700 (PDT)
Message-ID: <bae050c10805082317m3db651e3jfb8d3c060525bfc6@mail.gmail.com>
Date: Fri, 9 May 2008 14:17:50 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH]new-ubi-util: ubidumpvol
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubidumpvol is a tool for dump UBI volume content to a file.

Here's my implementation.

diff -uprBN ../mtd-utils/include/mtd/ubi-user.h mtd-utils/include/mtd/ubi-user.h
--- ../mtd-utils/include/mtd/ubi-user.h	2008-05-07 15:02:05.000000000 +0800
+++ mtd-utils/include/mtd/ubi-user.h	2008-05-09 11:50:35.000000000 +0800
@@ -21,6 +21,10 @@
 #ifndef __UBI_USER_H__
 #define __UBI_USER_H__

+#ifndef __KERNEL__ /* Urgh. The whole point of splitting this out into
+		    separate files was to avoid #ifdef __KERNEL__ */
+#define __user
+#endif
 /*
  * UBI device creation (the same as MTD device attachment)
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -124,6 +128,8 @@
 #define UBI_IOCEBER _IOW(UBI_VOL_IOC_MAGIC, 1, int32_t)
 /* An atomic eraseblock change command */
 #define UBI_IOCEBCH _IOW(UBI_VOL_IOC_MAGIC, 2, int32_t)
+/* Start UBI volume dump */
+#define UBI_IOCLEBDP _IOWR(UBI_VOL_IOC_MAGIC, 3, struct ubi_leb_dump)

 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
@@ -265,4 +271,14 @@ struct ubi_leb_change_req {
 	uint8_t padding[7];
 } __attribute__ ((packed));

+/**
+ * struct ubi_leb_dump - a data structure used in volume dump request.
+ * @lnum: logical eraseblock number to dump
+ * @lebbuf: LEB data buffer
+ */
+struct ubi_leb_dump{
+	int32_t lnum;
+	char __user *lebbuf;
+};
+
 #endif /* __UBI_USER_H__ */
diff -uprBN ../mtd-utils/ubi-utils/new-utils/include/libubi.h
mtd-utils/ubi-utils/new-utils/include/libubi.h
--- ../mtd-utils/ubi-utils/new-utils/include/libubi.h	2008-05-07
15:02:05.000000000 +0800
+++ mtd-utils/ubi-utils/new-utils/include/libubi.h	2008-05-09
12:17:56.000000000 +0800
@@ -348,6 +348,19 @@ int ubi_get_vol_info1(libubi_t desc, int
  */
 int ubi_update_start(libubi_t desc, int fd, long long bytes);

+
+/**
+ * ubi_dump_start - start UBI volume update.
+ * @fd: volume character devie file descriptor
+ * @dp: structure pointer for volume dump request
+ *
+ * This function call "UBI_IOCLEBDP" ioctl.
+ * return %1 means the LEB is not mapped, no need to dump
+ * return %0 LEB dump done well
+ * return any others error
+ */
+int ubi_dump_start(int fd,  struct ubi_leb_dump *dp);
+
 /**
  * ubi_leb_change_start - start atomic LEB change.
  * @desc: UBI library descriptor
diff -uprBN ../mtd-utils/ubi-utils/new-utils/Makefile
mtd-utils/ubi-utils/new-utils/Makefile
--- ../mtd-utils/ubi-utils/new-utils/Makefile	2008-05-07
15:02:05.000000000 +0800
+++ mtd-utils/ubi-utils/new-utils/Makefile	2008-05-09 11:53:28.000000000 +0800
@@ -14,7 +14,7 @@ CFLAGS := -Iinclude -Isrc -I$(KERNELHDR)

 LIBS = libubi libmtd libubigen libiniparser libscan
 UTILS = ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
-        ubidetach ubinize ubiformat
+        ubidetach ubinize ubiformat ubidumpvol

 vpath %.c src

diff -uprBN ../mtd-utils/ubi-utils/new-utils/src/libubi.c
mtd-utils/ubi-utils/new-utils/src/libubi.c
--- ../mtd-utils/ubi-utils/new-utils/src/libubi.c	2008-05-07
15:02:05.000000000 +0800
+++ mtd-utils/ubi-utils/new-utils/src/libubi.c	2008-05-09
11:56:32.000000000 +0800
@@ -971,6 +971,11 @@ int ubi_update_start(libubi_t desc, int
 	return 0;
 }

+int ubi_dump_start(int fd,  struct ubi_leb_dump *dp)
+{
+	return ioctl(fd, UBI_IOCLEBDP, dp);
+}
+
 int ubi_leb_change_start(libubi_t desc, int fd, int lnum, int bytes, int dtype)
 {
 	struct ubi_leb_change_req req;
diff -uprBN ../mtd-utils/ubi-utils/new-utils/src/ubidumpvol.c
mtd-utils/ubi-utils/new-utils/src/ubidumpvol.c
--- ../mtd-utils/ubi-utils/new-utils/src/ubidumpvol.c	1970-01-01
08:00:00.000000000 +0800
+++ mtd-utils/ubi-utils/new-utils/src/ubidumpvol.c	2008-05-09
12:07:39.000000000 +0800
@@ -0,0 +1,258 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+/*
+ * An utility to update UBI volumes.
+ *
+ * Authors: Frank Haverkamp
+ *          Joshua W. Boyer
+ *          Artem Bityutskiy
+ *          Yurong Tan (Nancy)
+ */
+
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <stdarg.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/stat.h>
+
+#include <libubi.h>
+#include "common.h"
+
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubidumpvol"
+
+struct args {
+	int truncate;
+	const char *node;
+	const char *img;
+	/* For deprecated -d and -B options handling */
+	int devn;
+	char dev_name[256];
+	int broken_update;
+};
+
+static struct args args = {
+	.devn = -1,
+};
+
+static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
+			 " - a tool to write data to UBI volumes.";
+
+static const char *optionsstr =
+"-n, --vol_id=<volume id>   ID of UBI volume to update\n"
+"-t, --truncate             truncate volume (wipe it out)\n"
+"-h, --help                 print help message\n"
+"-V, --version              print program version\n\n"
+"The following are compatibility options which are deprecated, do not
use them\n"
+"-d, --devn=<devn>          UBI device number - may be used instead
of the UBI\n"
+"                           device node name in which case the
utility assumes\n"
+"                           that the device node is \"/dev/ubi<devn>\"\n"
+"-B, --broken-update        broken update, this is for testing";
+
+static const char *usage =
+"Usage: " PROGRAM_NAME " <UBI volume node file name> [-t] [-h] [-V]
[--truncate] [--help]\n"
+"\t\t\t[--version] <image file>\n\n"
+	"Example 1: " PROGRAM_NAME " /dev/ubi0_1 fs.img - dump UBI volume
/dev/ubi0_1 to file \"fs.img\" \n";
+
+struct option long_options[] = {
+	{ .name = "truncate", .has_arg = 0, .flag = NULL, .val = 't' },
+	{ .name = "help",     .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",  .has_arg = 0, .flag = NULL, .val = 'V' },
+	/* Deprecated -d and -B options */
+	{ .name = "devn",     .has_arg = 1, .flag = NULL, .val = 'd' },
+	{ .name = "broken-update", .has_arg = 1, .flag = NULL, .val = 'B' },
+	{ NULL, 0, NULL, 0}
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key;
+
+		key = getopt_long(argc, argv, "n:th?Vd:", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 't':
+			args.truncate = 1;
+			break;
+
+		case 'h':
+		case '?':
+			fprintf(stderr, "%s\n\n", doc);
+			fprintf(stderr, "%s\n\n", usage);
+			fprintf(stderr, "%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'd':
+		{
+			char *endp;
+
+			/* Handle deprecated -d option */
+			warnmsg("-d is depricated and will be removed, do not use it");
+			args.devn = strtoul(optarg, &endp, 0);
+			if (*endp != '\0' || endp == optarg || args.devn < 0)
+				return errmsg("bad UBI device number: " "\"%s\"", optarg);
+			break;
+		}
+
+		case 'B':
+			/* Handle deprecated -B option */
+			warnmsg("-B is depricated and will be removed, do not use it");
+			args.broken_update = 1;
+			break;
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case ':':
+			return errmsg("parameter is missing");
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	/* Handle deprecated -d option */
+	if (args.devn != -1) {
+		sprintf(args.dev_name, "/dev/ubi%d", args.devn);
+		args.node = args.dev_name;
+	} else {
+		if (optind == argc)
+			return errmsg("UBI device name was not specified (use -h for help)");
+		else if (optind != argc - 2)
+			return errmsg("specify UBI device name and image file name as first 2 "
+				      "parameters (use -h for help)");
+	}
+
+	args.node = argv[optind];
+	args.img  = argv[optind + 1];
+
+	return 0;
+}
+
+static int dump_volume(libubi_t libubi, struct ubi_vol_info *vol_info)
+{
+	int err, fd, ifd;
+	struct ubi_leb_dump dp;
+	int i, tmp;
+
+	dp.lebbuf = malloc(vol_info->leb_size);
+	if (!dp.lebbuf)
+		return errmsg("cannot allocate %d bytes of memory", vol_info->leb_size);
+
+	fd = open(args.node, O_RDONLY);
+	if (fd == -1) {
+		sys_errmsg("cannot open UBI volume \"%s\"", args.node);
+		goto out_free;
+	}
+
+	ifd = open(args.img, O_WRONLY | O_TRUNC | O_CREAT, 0644);
+	if (ifd == -1) {
+		sys_errmsg("cannot open \"%s\"", args.img);
+		goto out_close1;
+	}
+	
+	for(i=0; i < vol_info->rsvd_lebs; i++){
+		dp.lnum = i;
+		tmp = ubi_dump_start(fd, &dp);
+		if(tmp == 1)
+			continue;
+		else if(tmp == 0){
+			err = write(ifd, dp.lebbuf, vol_info->leb_size);
+			if (err != vol_info->leb_size){
+				perror("Image file write error\n");
+				
+				goto out_close;	
+			}
+		}else{
+			printf("LEB %d read error\n", i);
+			goto out_close;
+		}
+	}
+
+	close(ifd);
+	close(fd);
+	free(dp.lebbuf);
+	printf("Dump Volume succeed\n");
+	return 0;
+	goto out_close;
+out_close:
+	close(ifd);
+out_close1:
+	close(fd);
+out_free:
+	free(dp.lebbuf);
+	return -1;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err;
+	libubi_t libubi;
+	struct ubi_vol_info vol_info;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return -1;
+
+	if (!args.img && !args.truncate)
+		return errmsg("incorrect arguments, use -h for help");
+
+	libubi = libubi_open(1);
+	if (libubi == NULL) {
+		sys_errmsg("cannot open libubi");
+		goto out_libubi;
+	}
+
+	err = ubi_node_type(libubi, args.node);
+	if (err == 1) {
+		errmsg("\"%s\" is an UBI device node, not an UBI volume node",
+		       args.node);
+		goto out_libubi;
+	} else if (err < 0) {
+		errmsg("\"%s\" is not an UBI volume node", args.node);
+		goto out_libubi;
+	}
+
+	err = ubi_get_vol_info(libubi, args.node, &vol_info);
+	if (err) {
+		sys_errmsg("cannot get information about UBI volume \"%s\"",
+			   args.node);
+		goto out_libubi;
+	}
+
+	err = dump_volume(libubi, &vol_info);
+	if (err)
+		goto out_libubi;
+	
+	libubi_close(libubi);
+	return 0;
+
+out_libubi:
+	libubi_close(libubi);
+	return -1;
+}


NOTICE: the drivers/mtd/ubi/cdev.c need to be changed too

--- ../cdev.c	2008-05-09 14:13:51.000000000 +0800
+++ cdev.c	2008-05-09 14:13:32.000000000 +0800
@@ -411,6 +411,47 @@ static int vol_cdev_ioctl(struct inode *
 	void __user *argp = (void __user *)arg;

 	switch (cmd) {
+	/* Volume dump command */
+	case UBI_IOCLEBDP:
+	{
+		struct ubi_leb_dump dp;
+		int pnum;
+		char *lebbuf;
+
+		if (copy_from_user(&dp, argp, sizeof(struct ubi_leb_dump))){
+			err = -EFAULT;
+			break;
+		}
+		
+		pnum = vol->eba_tbl[dp.lnum];
+		if (pnum < 0) {
+			//the LEB is clean, no need dump
+			err = 1;
+			break;
+		}
+				
+		lebbuf = kmalloc(vol->ubi->leb_size, GFP_KERNEL);
+		if (!lebbuf){
+			err = -ENOMEM;
+			break;
+		}
+				
+		err= ubi_eba_read_leb(ubi, vol, dp.lnum, lebbuf, 0, vol->ubi->leb_size, 0);
+		if (err){
+			kfree(lebbuf);
+			break;	
+		}
+		
+		err = copy_to_user(dp.lebbuf, lebbuf, vol->ubi->leb_size);
+		if (err) {
+			kfree(lebbuf);
+			err = -EFAULT;
+			break;
+		}
+		kfree(lebbuf);
+		break;
+	}
+
 	/* Volume update command */
 	case UBI_IOCVOLUP:
 	{




Signed-off-by: Yurong Tan (Nancy)<nancydreaming@gmail.com>


-- 
Best wishes,
Nancy
