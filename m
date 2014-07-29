Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XC3v5-00045W-1m
 for linux-mtd@lists.infradead.org; Tue, 29 Jul 2014 09:42:09 +0000
Message-ID: <53D76C2F.6080908@huawei.com>
Date: Tue, 29 Jul 2014 17:41:03 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/5] ubi-utils: Introduce ubidump
References: <53D7677A.6000905@huawei.com>
In-Reply-To: <53D7677A.6000905@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Bill Pringlemeir <bpringlemeir@nbsps.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Read data by MTD functionality now. Also move some dump code to
libdump.

rename options:
    -n   --->  -l
    -N   --->  --ubifs
    -H   --->  --ubi


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 ubi-utils/ubidump.c | 293 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 293 insertions(+)
 create mode 100644 ubi-utils/ubidump.c

diff --git a/ubi-utils/ubidump.c b/ubi-utils/ubidump.c
new file mode 100644
index 0000000..95d055b
--- /dev/null
+++ b/ubi-utils/ubidump.c
@@ -0,0 +1,293 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ */
+
+/*
+ * An utility to dump UBI/UBIFS format data in eraseblock
+ *
+ * Author: Hu Jianyang <hujianyang@huawei.com>
+ */
+
+#define PROGRAM_NAME	"ubidump"
+
+#include <stdlib.h>
+#include <getopt.h>
+#include <unistd.h>
+
+#include <libubi.h>
+#include <libdump.h>
+#include <libmtd.h>
+#include "common.h"
+#include "ubiutils-common.h"
+
+#define MTD_DEV_PATT "/dev/mtd%d"
+
+/* The variables below are set by command line arguments */
+struct args {
+	const char *vol;
+	int lnum;
+	int info:1;
+	int ubi:1;
+	int ubifs:1;
+};
+
+static struct args args =
+{
+	.vol	= NULL,
+	.lnum	= -1,
+	.info	= 0,
+	.ubi	= 0,
+	.ubifs	= 0,
+};
+
+static const char doc[] = PROGRAM_NAME " version " VERSION
+		" - an utility to dump UBI/UBIFS format data in eraseblock";
+
+static const char optionsstr[] =
+"-h, --help		print help message\n"
+"-l, --lnum		logic eraseblock num to dump\n"
+"-i, --info		show explicit information about ubifs-level\n"
+"    --ubi		dump ubi-level stuff only\n"
+"    --ubifs		dump ubifs-level stuff only\n"
+"-V, --version		print program version";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " <UBI volume node file name> [-l <lnum>] [-i]\n"
+"\t\t\t[--help] [--version]\n\n"
+"Example 1: " PROGRAM_NAME " /dev/ubi0_1 --lnum 2 - dump leb 2 in volume 1\n"
+"Example 2: " PROGRAM_NAME " /dev/ubi0_0 -l 1234 -i - dump leb 1234 with explicit info\n";
+
+static const struct option long_options[] = {
+	{ .name = "ubi",     .has_arg = 0, .flag = NULL, .val = 0   },
+	{ .name = "ubifs",   .has_arg = 0, .flag = NULL, .val = 0   },
+	{ .name = "help",    .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "lnum",    .has_arg = 1, .flag = NULL, .val = 'l' },
+	{ .name = "info",    .has_arg = 0, .flag = NULL, .val = 'i' },
+	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0}
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int option_index, key, error = 0;
+
+		key = getopt_long(argc, argv, "h?il:", long_options, &option_index);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 0:
+			switch (option_index) {
+			case 0:
+				args.ubi = 1;
+				break;
+			case 1:
+				args.ubifs = 1;
+				break;
+			}
+			break;
+		case 'l':
+			args.lnum = simple_strtoul(optarg, &error);
+			if (error || args.lnum < 0)
+				return errmsg("bad lnum: \"%s\"", optarg);
+			break;
+
+		case 'i':
+			args.info = 1;
+			break;
+
+		case 'h':
+		case '?':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			common_print_version();
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
+	if (optind == argc)
+		return errmsg("UBI device name was not specified (use -h for help)");
+	else if (optind != argc - 1)
+		return errmsg("more then one UBI device specified (use -h for help)");
+
+	args.vol = argv[optind];
+
+	if (args.lnum < 0)
+		return errmsg("lnum was not specified (use -h for help)");
+	if (args.ubi && (args.info || args.ubifs))
+		return errmsg("cannot specify --ubi with -i or --ubifs");
+
+	return 0;
+}
+
+static int leb_get_pnum(int *pnum)
+{
+	int fd, err;
+
+	fd = open(args.vol, O_RDONLY);
+	if (fd == -1) {
+		sys_errmsg("cannot open UBI volume \"%s\"", args.vol);
+		return -1;
+	}
+
+	*pnum = -1;
+	err = ubi_lnum_to_pnum(fd, args.lnum, pnum);
+	if (err)
+		sys_errmsg("ubi_lnum_to_pnum() failed, err = %d", err);
+
+	close(fd);
+	return err;
+}
+
+static int dump_eraseblock(int mtd_num, int pnum)
+{
+	int err, fd, peb_size, ret;
+	int ubi = !args.ubifs;
+	int ubifs = !args.ubi;
+	off_t offs;
+	libmtd_t libmtd;
+	struct mtd_info mtd_info;
+	struct mtd_dev_info mtd;
+	char file[strlen(MTD_DEV_PATT) + 100];
+	char *buf;
+
+	libmtd = libmtd_open();
+	if (!libmtd)
+		return errmsg("MTD subsystem is not present");
+
+	err = mtd_get_info(libmtd, &mtd_info);
+	if (err) {
+		if (errno == ENODEV)
+			errmsg("MTD is not present");
+		sys_errmsg("cannot get MTD information");
+		goto out;
+	}
+
+	err = mtd_get_dev_info1(libmtd, mtd_num, &mtd);
+	if (err) {
+		sys_errmsg("cannot get information about mtd%d\n", mtd_num);
+		goto out;
+	}
+
+	peb_size = mtd.eb_size;
+	buf = malloc(peb_size);
+	if (!buf) {
+		sys_errmsg("cannot alloc %d bytes memoroy", peb_size);
+		err = -ENOMEM;
+		goto out;
+	}
+
+	sprintf(file, MTD_DEV_PATT, mtd_num);
+	fd = open(file, O_RDONLY);
+	if (fd == -1) {
+		sys_errmsg("cannot open MTD device %s, mtd_num = %d", file, mtd_num);
+		goto out_free;
+	}
+
+	offs = pnum * peb_size;
+	ret = pread(fd, buf, peb_size, offs);
+	if (ret != peb_size) {
+		errmsg("cannot read %d bytes at pnum %d, read %d", peb_size,
+		       pnum, ret);
+		err = -EIO;
+		goto out_fd;
+	}
+
+	printf("leb %d is mapped to peb %d, start to dump:\n", args.lnum, pnum);
+	ubidump(buf, peb_size, ubi, ubifs, args.info);
+
+out_fd:
+	close(fd);
+out_free:
+	free(buf);
+out:
+	libmtd_close(libmtd);
+	return err;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err, pnum, mtd_num;
+	libubi_t libubi;
+	struct ubi_vol_info vol_info;
+	struct ubi_dev_info dev_info;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return -1;
+
+	libubi = libubi_open();
+	if (!libubi) {
+		if (errno == 0)
+			errmsg("UBI is not present in the system");
+		else
+			sys_errmsg("cannot open libubi");
+		goto out_libubi;
+	}
+
+	err = ubi_probe_node(libubi, args.vol);
+	if (err == 1) {
+		errmsg("\"%s\" is an UBI device node, not an UBI volume node",
+		       args.vol);
+		goto out_libubi;
+	} else if (err < 0) {
+		if (errno == ENODEV)
+			errmsg("\"%s\" is not an UBI volume node", args.vol);
+		else
+			sys_errmsg("error while probing \"%s\"", args.vol);
+		goto out_libubi;
+	}
+
+	err = ubi_get_vol_info(libubi, args.vol, &vol_info);
+	if (err) {
+		sys_errmsg("cannot get information about UBI volume \"%s\"",
+			   args.vol);
+		goto out_libubi;
+	}
+
+	err = leb_get_pnum(&pnum);
+	if (err) {
+		sys_errmsg("cannot get pnum of leb %d", args.lnum);
+		goto out_libubi;
+	} else if (pnum == -1) {
+		errmsg("leb %d is not mapped", args.lnum);
+		goto out_libubi;
+	}
+
+	err = ubi_get_dev_info1(libubi, vol_info.dev_num, &dev_info);
+	if (err) {
+		sys_errmsg("cannot get information about UBI%d", vol_info.dev_num);
+		goto out_libubi;
+	}
+	mtd_num = dev_info.mtd_num;
+
+	err = dump_eraseblock(mtd_num, pnum);
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
-- 
1.8.1.4
