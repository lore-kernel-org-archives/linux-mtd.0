Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3igq-0001wo-AK
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 11:01:50 +0000
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
 by cn.fujitsu.com (Postfix) with ESMTP id 5A1A64092564
 for <linux-mtd@lists.infradead.org>; Tue,  1 Dec 2015 19:01:09 +0800 (CST)
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <linux-mtd@lists.infradead.org>
CC: Zeng Linggang <zenglg.jy@cn.fujitsu.com>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH] mtd-utils: introduce mtd_raid tool.
Date: Tue, 1 Dec 2015 18:53:50 +0800
Message-ID: <1448967230-17541-1-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1448967157-17423-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1448967157-17423-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Zeng Linggang <zenglg.jy@cn.fujitsu.com>

Signed-off-by: Zeng Linggang <zenglg.jy@cn.fujitsu.com>
Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 .gitignore                  |   1 +
 Makefile                    |   2 +-
 include/mtd/mtd-raid-user.h |  33 ++++++
 misc-utils/mtd_raid.c       | 246 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 281 insertions(+), 1 deletion(-)
 create mode 100644 include/mtd/mtd-raid-user.h
 create mode 100644 misc-utils/mtd_raid.c

diff --git a/.gitignore b/.gitignore
index 04d9251..94ebdce 100644
--- a/.gitignore
+++ b/.gitignore
@@ -31,6 +31,7 @@
 /misc-utils/flashcp
 /misc-utils/ftl_check
 /misc-utils/ftl_format
+/misc-utils/mtd_raid
 /jffsX-utils/jffs2dump
 /jffsX-utils/jffs2reader
 /jffsX-utils/mkfs.jffs2
diff --git a/Makefile b/Makefile
index 33d3e34..5282be9 100644
--- a/Makefile
+++ b/Makefile
@@ -20,7 +20,7 @@ MISC_BINS = \
 	ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
 	serve_image recv_image mtdpart flash_erase flash_lock \
 	flash_unlock flash_otp_info flash_otp_dump flash_otp_lock \
-	flash_otp_write flashcp
+	flash_otp_write flashcp mtd_raid
 UBI_BINS = \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
 	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
diff --git a/include/mtd/mtd-raid-user.h b/include/mtd/mtd-raid-user.h
new file mode 100644
index 0000000..8c735ba
--- /dev/null
+++ b/include/mtd/mtd-raid-user.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright 2015, see mtd/mtd-raid for licensing and copyright details
+ */
+#ifndef __MTD_RAID_USER_H__
+#define __MTD_RAID_USER_H__
+
+#include <linux/types.h>
+#include <linux/magic.h>
+
+/* ioctl's command */
+#define MTD_RAID_IOC_CREATE		_IOW(0xFE, 1, struct mtd_raid_create_req)
+#define MTD_RAID_IOC_DESTROY		_IOW(0xFE, 2, struct mtd_raid_destroy_req)
+
+enum mtd_raid_level {
+	MTD_RAID_LEVEL_SINGLE = 0,
+	MTD_RAID_LEVEL_RAID0,
+	MTD_RAID_LEVEL_RAID1,
+	MTD_RAID_LEVEL_MAX
+};
+
+struct mtd_raid_create_req {
+	__u8 raid_level;
+	__u8 reserved[3];
+	__u32 dev_count;
+	__u64 substripe_size;
+	__u32 mtd_nums[0];
+};
+
+struct mtd_raid_destroy_req {
+	__u32 mtd_num;
+};
+
+#endif				/* __MTD_RAID_USER_H__ */
diff --git a/misc-utils/mtd_raid.c b/misc-utils/mtd_raid.c
new file mode 100644
index 0000000..203676a
--- /dev/null
+++ b/misc-utils/mtd_raid.c
@@ -0,0 +1,246 @@
+/*
+ * User tool for MTD RAID
+ *
+ * Copyright (C) 2015 Zeng Linggang. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ *
+ * Authors: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
+ *          Zeng Linggang <zenglg.jy@cn.fujitsu.com>
+ */
+
+#define PROGRAM_NAME "mtd_raid"
+
+#include <fcntl.h>
+#include <getopt.h>
+#include <limits.h>
+#include <linux/blkpg.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <mtd/mtd-raid-user.h>
+
+#include "common.h"
+
+static void display_help(int status)
+{
+	printf(
+		"Usage:\n"
+		"	%1$s create [OPTION]... <MTD_DEVICE1> ...\n"
+		"	%1$s destroy <MTD_RAID_DEVICE>\n"
+		"\n"
+		"Options:\n"
+		"  -l, --level=[single|0|1]		RAID level of the device you want to create.\n"
+		"  -s, --substripe-size=<SIZE>		Size of substripe, it's not necessary for\n"
+		"					raid-single. Default value is mtd->writesize.\n"
+		"  -h, --help				Display this help and exit\n"
+		"\n"
+		"Create or destroy a mtd raid device. With the create subcommand, we can create\n"
+		"a raid device from the devices you requested.\n",
+		PROGRAM_NAME);
+	exit(status);
+}
+
+/* Command arguments */
+
+typedef enum {
+	COMMAND_CREATE,
+	COMMAND_DESTROY
+} command_type;
+
+static command_type		command;
+static int			dev_count;
+static int			mtddevs[1024];
+static ssize_t			substripe_size;
+static int			raid_level;
+static int			destroy_dev;
+
+static const char *optstring = "s:l:h";
+
+static const struct option longopts[] = {
+	{"level",		1, NULL, 'l'},
+	{"substripe-size",	1, NULL, 's'},
+	{"help",		0, NULL, 'h'},
+	{NULL,			0, NULL, 0}
+};
+
+#ifndef MTD_CHAR_MAJOR
+/*
+ * This is taken from kernel <linux/mtd/mtd.h> and is unlikely to change anytime
+ * soon.
+ */
+#define MTD_CHAR_MAJOR 90
+#endif
+
+/**
+ * mtd_node_to_num - converts device node to MTD number.
+ * @mtd_dev_node: path to device node to convert
+ *
+ * This function converts given @mtd_dev_node to MTD device number.
+ * @mtd_dev_node should contain path to the MTD device node. Returns MTD device
+ * number in case of success and %-1 in case of failure (errno is set).
+ *
+ * XXX This is a copy from ubi-utils/libubi.c.
+ * TODO:
+ * 	Move the generic files from ubi-utils to top level and then
+ * kill the duplication of mtd_node_to_num, even more we can move mtdinfo
+ * from ubi-utils to misc-utils.
+ */
+static int mtd_node_to_num(const char *mtd_dev_node)
+{
+	int major, minor;
+	struct stat sb;
+
+	if (stat(mtd_dev_node, &sb) < 0) {
+		sys_errmsg("cannot stat \"%s\"", mtd_dev_node);
+		return -EINVAL;
+	}
+
+	if (!S_ISCHR(sb.st_mode)) {
+		sys_errmsg("\"%s\" is not a character device",
+				  mtd_dev_node);
+		return -EINVAL;
+	}
+
+	major = major(sb.st_rdev);
+	minor = minor(sb.st_rdev);
+
+	if (major != MTD_CHAR_MAJOR) {
+		sys_errmsg("\"%s\" is not an MTD device", mtd_dev_node);
+		return -EINVAL;
+	}
+
+	return minor / 2;
+}
+
+static enum mtd_raid_level get_raid_level(const char *level_str)
+{
+	if (strcmp(level_str, "single") == 0) {
+		return MTD_RAID_LEVEL_SINGLE;
+	} else if (strcmp(level_str, "0") == 0) {
+		return MTD_RAID_LEVEL_RAID0;
+	} else if (strcmp(level_str, "1") == 0) {
+		return MTD_RAID_LEVEL_RAID1;
+	} else {
+		return -EINVAL;
+	}
+}
+
+static void process_options(int argc, char * const argv[])
+{
+	int mtd_num = 0;
+	const char *s_command = argv[optind++];
+
+	if (strcmp(s_command, "destroy") == 0 && argc == 3)
+		command = COMMAND_DESTROY;
+	else if (strcmp(s_command, "create") == 0 && argc > 2)
+		command = COMMAND_CREATE;
+	else
+		goto err;
+
+	while (1) {
+		int c = getopt_long(argc, argv, optstring, longopts, NULL);
+		if (c == -1)
+			break;
+
+		switch (c) {
+		case 'l':
+			raid_level = get_raid_level(optarg);
+			if (raid_level < 0)
+				goto err;
+			break;
+		case 's':
+			substripe_size = strtoull(optarg, NULL, 0);
+			break;
+		case 'h':
+			display_help(EXIT_SUCCESS);
+			break;
+		case '?':
+			goto err;
+		}
+	}
+
+	if (command == COMMAND_CREATE) {
+		int i = 0;
+
+		while (optind < argc) {
+			mtd_num = mtd_node_to_num(argv[optind++]);
+			if (mtd_num < 0)
+				goto err;
+			if (i >= 1024)
+				goto err;
+			mtddevs[i++] = mtd_num;
+		}
+		dev_count = i;
+		if (dev_count == 0)
+			goto err;
+	} else if (command == COMMAND_DESTROY) {
+		mtd_num = mtd_node_to_num(argv[optind++]);
+		if (mtd_num < 0)
+			goto err;
+		destroy_dev = mtd_num;
+	}
+
+	return;
+err:
+	display_help(EXIT_FAILURE);
+}
+
+
+int main(int argc, char * const argv[])
+{
+	int fd, i = 0;
+	struct mtd_raid_create_req *create_req = NULL;
+	struct mtd_raid_destroy_req *destroy_req = NULL;
+
+	process_options(argc, argv);
+
+	fd = open("/dev/mtd_raid_ctrl", O_RDWR | O_CLOEXEC);
+	if (fd == -1)
+		sys_errmsg_die("Cannot open /dev/mtd_raid_ctrl");
+
+	switch (command) {
+	case COMMAND_CREATE:
+		create_req = malloc(sizeof(*create_req) + sizeof(int) * dev_count);
+		if (!create_req)
+			sys_errmsg_die("malloc error");
+		memset(create_req, 0, sizeof(*create_req) + sizeof(int) * dev_count);
+		create_req->raid_level = raid_level;
+		create_req->dev_count = dev_count;
+		for (i = 0; i < dev_count; i++)
+			create_req->mtd_nums[i] = mtddevs[i];
+		create_req->substripe_size = substripe_size;
+
+		if (ioctl(fd, MTD_RAID_IOC_CREATE, create_req))
+			sys_errmsg_die("Failed to issue MTD_RAID_IOC_CREATE ioctl");
+		break;
+	case COMMAND_DESTROY:
+		destroy_req = malloc(sizeof(*destroy_req));
+		if (!destroy_req)
+			sys_errmsg_die("malloc error");
+		memset(destroy_req, 0, sizeof(*destroy_req));
+		destroy_req->mtd_num = destroy_dev;
+		if (ioctl(fd, MTD_RAID_IOC_DESTROY, destroy_req))
+			sys_errmsg_die("Failed to issue MTD_RAID_IOC_DESTROY ioctl, %d", destroy_req->mtd_num);
+		break;
+	}
+
+	close(fd);
+	/* Exit happy */
+	return EXIT_SUCCESS;
+}
-- 
1.8.4.2
