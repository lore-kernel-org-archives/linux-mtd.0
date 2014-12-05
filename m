Received: from szxga01-in.huawei.com ([119.145.14.64])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwpGL-00071k-5E
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 09:33:23 +0000
Message-ID: <54817B78.5010501@huawei.com>
Date: Fri, 5 Dec 2014 17:31:36 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v6 2/3] ubi-utils: introduce ubidump
References: <54817A4B.4080605@huawei.com>
In-Reply-To: <54817A4B.4080605@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch introduce a new utility named ubidump. This utility can dump
a specific leb to userspace(maybe a arrange of lebs in the future).

We don't have an useful tool to get data from a specified logical erase
block and to describe what it contains in userspace before. I suppose
if this utility could help us overcome these problems and give us a new
way to analyze the behavior of UBI/UBIFS without changing kernel.

Artem (dedekind1@gmail.com) and Bill (bpringlemeir@nbsps.com) also
contribute a lot to this utility. I appreciate their help very much.

Only the UBIFS level dumping is supported now, we've discussed and tried
many ways to realize UBI level dumping but didn't reach an agreement.
I'll keep working on it.

I think this work is just the beginning of enriching UBI/UBIFS debugging.

Changes in v6:
	- remove ubifs-media.h from patch set. This file has been
	  added with commit 789d2d7019
	- remove flag '-i'. All the dumping messages are now directly
	  printed without any extra flags.
	- support none '--lnum, -l' dump. If *lnum* is not specific,
	  all the LEBs in target device will be scanned and dumped.
	  An error was returned in previous version.
	
v1:
http://lists.infradead.org/pipermail/linux-mtd/2014-July/054541.html

v2:
http://lists.infradead.org/pipermail/linux-mtd/2014-July/054831.html

v3:
http://lists.infradead.org/pipermail/linux-mtd/2014-September/055463.html

v4:
http://lists.infradead.org/pipermail/linux-mtd/2014-September/055644.html

v5:
http://lists.infradead.org/pipermail/linux-mtd/2014-October/056048.html

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 ubi-utils/ubidump.c |  218 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 218 insertions(+), 0 deletions(-)
 create mode 100644 ubi-utils/ubidump.c

diff --git a/ubi-utils/ubidump.c b/ubi-utils/ubidump.c
new file mode 100644
index 0000000..d04ab94
--- /dev/null
+++ b/ubi-utils/ubidump.c
@@ -0,0 +1,218 @@
+/*
+ * Copyright (C) 2008 Nokia Corporation
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
+/* The variables below are set by command line arguments */
+struct args {
+	const char *vol;
+	int lnum;
+};
+
+static struct args args =
+{
+	.vol	= NULL,
+	.lnum	= -1,
+};
+
+static const char doc[] = PROGRAM_NAME " version " VERSION
+		" - an utility to dump UBI/UBIFS format data in eraseblock";
+
+static const char optionsstr[] =
+"-h, --help		print help message\n"
+"-l, --lnum		logic eraseblock num to dump, print all LEBs if not specific\n"
+"-V, --version		print program version";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " <UBI volume node file name> [-l <lnum>]\n"
+"\t\t\t[--help] [--version]\n\n"
+"Example 1: " PROGRAM_NAME " /dev/ubi0_1 --lnum 2 - dump LEB 2 in /dev/ubi0_1\n"
+"Example 2: " PROGRAM_NAME " /dev/ubi0_0 - dump all LEBs in /dev/ubi0_0\n";
+
+static const struct option long_options[] = {
+	{ .name = "help",    .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "lnum",    .has_arg = 1, .flag = NULL, .val = 'l' },
+	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0}
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key, error = 0;
+
+		key = getopt_long(argc, argv, "hV?l:", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 'l':
+			args.lnum = simple_strtoul(optarg, &error);
+			if (error || args.lnum < 0)
+				return errmsg("bad lnum: \"%s\"", optarg);
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
+	return 0;
+}
+
+static int dump_eraseblock(int fd, struct ubi_vol_info *vol_info)
+{
+	int ret, leb_size, count, lnum;
+	off_t offs;
+	char *buf;
+
+	leb_size = vol_info->leb_size;
+	if (args.lnum == -1) {
+		count = vol_info->rsvd_lebs;
+		lnum = 0;
+	} else {
+		count = 1;
+		lnum = args.lnum;
+	}
+
+	buf = (char*)malloc(leb_size);
+	if (!buf)
+		return errmsg("cannot allocate %d bytes of memory",
+			      leb_size);
+	
+	for (; count > 0; count--, lnum++) {
+		ret = ubi_is_mapped(fd, lnum);
+		if (ret == 0) {
+			printf("lnum %d is not mapped\n", lnum);
+			continue;
+		} else if (ret < 0) {
+			sys_errmsg("lnum %d: ubi_is_mapped() failed", lnum);
+			goto out;
+		}
+
+		offs = lnum * leb_size;
+
+		ret = pread(fd, buf, leb_size, offs);
+		if (ret != leb_size) {
+			errmsg("cannot read %d bytes at lnum %d, read %d",
+			       leb_size, lnum, ret);
+			goto out;
+		}
+
+		ret = ubi_dump(lnum, buf, leb_size);
+	}
+
+out:
+	free(buf);
+	return ret;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err, fd;
+	libubi_t libubi;
+	struct ubi_vol_info vol_info;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return -1;
+
+	libubi = libubi_open();
+	if (!libubi) {
+		if (errno == 0)
+			return errmsg("UBI is not present in the system");
+		return sys_errmsg("cannot open libubi");
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
+	fd = open(args.vol, O_RDONLY);
+	if (fd == -1) {
+		sys_errmsg("cannot open UBI volume \"%s\"", args.vol);
+		goto out_libubi;
+	}
+
+	err = dump_eraseblock(fd, &vol_info);
+	if (err)
+		goto out_fd;
+
+	close(fd);
+	libubi_close(libubi);
+	return 0;
+
+out_fd:
+	close(fd);
+out_libubi:
+	libubi_close(libubi);
+	return -1;
+}
-- 
1.6.0.2
