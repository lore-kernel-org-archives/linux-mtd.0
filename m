Received: from mail-qk0-f174.google.com ([209.85.220.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yvrl7-0003m0-HD
 for linux-mtd@lists.infradead.org; Fri, 22 May 2015 18:33:26 +0000
Received: by qkdn188 with SMTP id n188so18614450qkd.2
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2015 11:32:58 -0700 (PDT)
From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [RFC/PATCH] ubi-utils: add ubiecdump tool
Date: Fri, 22 May 2015 15:32:44 -0300
Message-Id: <1432319564-6121-1-git-send-email-guido@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Ezequiel=20Garc=C3=ADa?= <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This utility allows to dump the erase counter of each PEB in the UBI
device for auditing and testing purposes. It prints one value per line,
using -1 for bad PEBs and when errors occur. This allows to do some
quick stats like:

$ ubidumpec -m 7 | sort -n | uniq -c
     21 -1
    682 8
    130 9
    538 10
    ....

 where we see 21 bad blocks, 682 blocks with an EC of 8 and so on, or to
plot histograms automatically.

It can be invoked with either an attached ubi device (/dev/ubi0) or with
and MTD device that contains a UBI volume (-m 7).

Signed-off-by: Guido Martínez <guido@vanguardiasur.com.ar>
---
Hi, this new tools allow to do some easy auditing on the ECs of the UBI
device. It was inspired by the "Wear-leveling peculiarities" thread on
linux-mtd. It only support printing the ECs one-by-one, but I could
extend it to show basic statistics if there's interest for that.

Thanks!

 Makefile              |   3 +-
 ubi-utils/.gitignore  |   1 +
 ubi-utils/ubidumpec.c | 186 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+), 1 deletion(-)
 create mode 100644 ubi-utils/ubidumpec.c

diff --git a/Makefile b/Makefile
index eade234..96ad3a1 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,8 @@ MTD_BINS = \
 	sumtool jffs2reader
 UBI_BINS = \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
-	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
+	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock \
+	ubidumpec
 
 BINS = $(MTD_BINS)
 BINS += mkfs.ubifs/mkfs.ubifs
diff --git a/ubi-utils/.gitignore b/ubi-utils/.gitignore
index 19653a8..b0d8619 100644
--- a/ubi-utils/.gitignore
+++ b/ubi-utils/.gitignore
@@ -11,3 +11,4 @@
 /ubirsvol
 /ubiblock
 /mtdinfo
+/ubidumpec
diff --git a/ubi-utils/ubidumpec.c b/ubi-utils/ubidumpec.c
new file mode 100644
index 0000000..6ed06e5
--- /dev/null
+++ b/ubi-utils/ubidumpec.c
@@ -0,0 +1,186 @@
+/*
+ * Copyright (c) Guido Martínez, 2014
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+#define PROGRAM_NAME "ubidumpec"
+
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <getopt.h>
+
+#include <mtd_swab.h>
+#include <crc32.h>
+
+#include <libubi.h>
+#include <libmtd.h>
+#include "common.h"
+
+static const char *usage_str =
+PROGRAM_NAME " version " VERSION " - dump erase counters of UBI device\n"
+"\n"
+"usage: " PROGRAM_NAME " <ubi_device>\n"
+"       " PROGRAM_NAME " -m <mtd_num>\n"
+"\n"
+"This program will dump the UBI erase counter for each PEB in the\n"
+"associated MTD volume, one per line. Values of -1 mean either a bad\n"
+"block or that an error ocurred when trying to read the UBI header.\n";
+
+static void usage()
+{
+	fprintf(stderr, "%s", usage_str);
+}
+
+static int mtd_num = -1;
+
+static const struct option long_options[] = {
+	{"mtdn", required_argument, 0, 'm'},
+	{"help", no_argument,       0, 'h'},
+	{ 0 },
+};
+
+static int parse_opt(int argc, char *argv[])
+{
+	int c, idx;
+
+	while ((c = getopt_long(argc, argv, "m:h", long_options, &idx)) != -1) {
+		switch (c) {
+		case 'm':
+			mtd_num = atoi(optarg);
+			break;
+		case 'h':
+			usage();
+			exit(0);
+		case '?':
+			exit(1);
+		}
+	}
+
+	return 0;
+}
+
+static int ubi2mtd(char *ubi_node)
+{
+	struct ubi_dev_info ubi_devinfo;
+	libubi_t libubi;
+	int ret;
+
+	libubi = libubi_open();
+	if (!libubi) {
+		if (errno == 0)
+			errmsg("UBI is not present in the system");
+		sys_errmsg("cannot open libubi");
+		return -1;
+	}
+
+	ret = ubi_get_dev_info(libubi, ubi_node, &ubi_devinfo);
+	if (ret) {
+		errmsg("Cannot get info for UBI node %s", ubi_node);
+		libubi_close(libubi);
+		return -1;
+	}
+
+	libubi_close(libubi);
+
+	return ubi_devinfo.mtd_num;
+}
+
+int main(int argc, char *argv[])
+{
+	struct mtd_dev_info mtd_devinfo;
+	struct ubi_ec_hdr ec_hdr;
+	libmtd_t libmtd;
+	char mtd_node[80];
+	uint32_t crc;
+	int fd;
+	int ret, peb;
+	int err = 1;
+
+	if (argc < 2) {
+		usage();
+		return 1;
+	}
+
+	parse_opt(argc, argv);
+
+	libmtd = libmtd_open();
+	if (!libmtd) {
+		if (errno == 0)
+			errmsg("MTD is not present in the system");
+		sys_errmsg("cannot open libmtd");
+		return 1;
+	}
+
+	/*
+	 * If the user didn't specify a MTD number, then we need to find it
+	 * from the UBI node the user gave us
+	 */
+	if (mtd_num < 0) {
+		mtd_num = ubi2mtd(argv[1]);
+		if (mtd_num < 0)
+			goto out;
+	}
+
+	ret = mtd_get_dev_info1(libmtd, mtd_num, &mtd_devinfo);
+	if (ret) {
+		errmsg("Can't get info for MTD device #%i", mtd_num);
+		goto out;
+	}
+
+	sprintf(mtd_node, "/dev/mtd%iro", mtd_num);
+	fd = open(mtd_node, O_RDONLY);
+	if (fd < 0) {
+		sys_errmsg("Can't open %s", mtd_node);
+		goto out;
+	}
+
+	for (peb = 0; peb < mtd_devinfo.eb_cnt; peb++) {
+		if (mtd_is_bad(&mtd_devinfo, fd, peb)) {
+			printf("-1\n");
+			continue;
+		}
+
+		ret = mtd_read(&mtd_devinfo, fd, peb, 0, &ec_hdr, sizeof ec_hdr);
+		if (ret) {
+			warnmsg("reading UBI header of PEB #%i failed", peb);
+			printf("-1\n");
+			continue;
+		}
+
+		if (be32_to_cpu(ec_hdr.magic) != UBI_EC_HDR_MAGIC) {
+			warnmsg("PEB %i has bad UBI magic", peb);
+			printf("-1\n");
+			continue;
+		}
+
+		crc = mtd_crc32(UBI_CRC32_INIT, &ec_hdr, UBI_EC_HDR_SIZE_CRC);
+		if (crc != be32_to_cpu(ec_hdr.hdr_crc)) {
+			warnmsg("PEB %i has corrupt header", peb);
+			printf("-1\n");
+			continue;
+		}
+
+		printf("%" PRIu64 "\n", be64_to_cpu(ec_hdr.ec));
+	}
+	err = 0;
+
+out:
+	libmtd_close(libmtd);
+	return err;
+}
-- 
2.1.4
