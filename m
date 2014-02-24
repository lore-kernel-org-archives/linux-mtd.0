Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHupN-0002yK-6c
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 12:40:19 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v7 2/3] ubi-utils: Add ubiblock tool
Date: Mon, 24 Feb 2014 09:39:23 -0300
Message-Id: <1393245564-23947-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1393245564-23947-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393245564-23947-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With the addition of block device access to UBI volumes, we now
add a simple userspace tool to access the new ioctls.

Since the ioctls have no arguments, usage of this tool is as simple
as it gets:

  $ ubiblock --attach /dev/ubi0_0

will make a new device /dev/ubiblock0_0 available, and

  $ ubiblock --detach /dev/ubi0_0

will remove the device.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 Makefile                   |   2 +-
 include/mtd/ubi-user.h     |   4 ++
 ubi-utils/.gitignore       |   1 +
 ubi-utils/include/libubi.h |  16 +++++
 ubi-utils/libubi.c         |  10 +++
 ubi-utils/ubiblock.c       | 176 +++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 208 insertions(+), 1 deletion(-)
 create mode 100644 ubi-utils/ubiblock.c

diff --git a/Makefile b/Makefile
index 4ff8a49..d316a3d 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@ MTD_BINS = \
 	sumtool jffs2reader
 UBI_BINS = \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
-	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol
+	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
 
 BINS = $(MTD_BINS)
 BINS += mkfs.ubifs/mkfs.ubifs
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 1c06d88..1889249 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -186,6 +186,10 @@
 /* Set an UBI volume property */
 #define UBI_IOCSETVOLPROP _IOW(UBI_VOL_IOC_MAGIC, 6, \
 			       struct ubi_set_vol_prop_req)
+/* Attach a block device to an UBI volume */
+#define UBI_IOCVOLATTBLK _IO(UBI_VOL_IOC_MAGIC, 7)
+/* Detach a block device from an UBI volume */
+#define UBI_IOCVOLDETBLK _IO(UBI_VOL_IOC_MAGIC, 8)
 
 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
diff --git a/ubi-utils/.gitignore b/ubi-utils/.gitignore
index c035c97..19653a8 100644
--- a/ubi-utils/.gitignore
+++ b/ubi-utils/.gitignore
@@ -9,4 +9,5 @@
 /ubirmvol
 /ubiupdatevol
 /ubirsvol
+/ubiblock
 /mtdinfo
diff --git a/ubi-utils/include/libubi.h b/ubi-utils/include/libubi.h
index 47f40e2..3759aa8 100644
--- a/ubi-utils/include/libubi.h
+++ b/ubi-utils/include/libubi.h
@@ -400,6 +400,22 @@ int ubi_get_vol_info1_nm(libubi_t desc, int dev_num, const char *name,
 			 struct ubi_vol_info *info);
 
 /**
+ * ubi_vol_block_add - attach a block device to an UBI volume.
+ * @fd: volume character device file descriptor
+ *
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+int ubi_vol_block_add(int fd);
+
+/**
+ * ubi_vol_block_del - detach a block device from an UBI volume.
+ * @fd: volume character device file descriptor
+ *
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+int ubi_vol_block_del(int fd);
+
+/**
  * ubi_update_start - start UBI volume update.
  * @desc: UBI library descriptor
  * @fd: volume character device file descriptor
diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
index a7463e8..cb631f9 100644
--- a/ubi-utils/libubi.c
+++ b/ubi-utils/libubi.c
@@ -1109,6 +1109,16 @@ int ubi_rsvol(libubi_t desc, const char *node, int vol_id, long long bytes)
 	return ret;
 }
 
+int ubi_vol_block_add(int fd)
+{
+	return ioctl(fd, UBI_IOCVOLATTBLK);
+}
+
+int ubi_vol_block_del(int fd)
+{
+	return ioctl(fd, UBI_IOCVOLDETBLK);
+}
+
 int ubi_update_start(libubi_t desc, int fd, long long bytes)
 {
 	desc = desc;
diff --git a/ubi-utils/ubiblock.c b/ubi-utils/ubiblock.c
new file mode 100644
index 0000000..b57e509
--- /dev/null
+++ b/ubi-utils/ubiblock.c
@@ -0,0 +1,176 @@
+/*
+ * ubiblock:
+ *   An utility to attach block devices to UBI volumes.
+ *
+ * Copyright (c) Ezequiel Garcia, 2014
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
+ *
+ * Usage
+ * -----
+ * Since the ioctls have no arguments, usage of this tool is as simple
+ * as it gets:
+ *
+ *   $ ubiblock --attach /dev/ubi0_0
+ *
+ * will make a new device /dev/ubiblock0_0 available, and
+ *
+ *   $ ubiblock --detach /dev/ubi0_0
+ *
+ * will remove the device.
+ */
+
+#define PROGRAM_NAME    "ubiblock"
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
+struct args {
+	const char *node;
+	int attach;
+};
+
+static struct args args;
+
+static const char doc[] = PROGRAM_NAME " version " VERSION
+			 " - a tool to add/remove block device interface from UBI volumes.";
+
+static const char optionsstr[] =
+"-a, --attach               attach block to volume\n"
+"-d, --detach               detach block from volume\n"
+"-h, --help                 print help message\n"
+"-V, --version              print program version";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " [-a,-d] <UBI volume node file name>\n"
+"Example: " PROGRAM_NAME " --attach /dev/ubi0_0";
+
+static const struct option long_options[] = {
+	{ .name = "attach",   .has_arg = 1, .flag = NULL, .val = 'a' },
+	{ .name = "detach",   .has_arg = 1, .flag = NULL, .val = 'd' },
+	{ .name = "help",     .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",  .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0}
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key;
+
+		key = getopt_long(argc, argv, "a:d:h?V", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 'a':
+			args.attach = 1;
+		case 'd':
+			args.node = optarg;
+			break;
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
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	if (!args.node)
+		return errmsg("invalid arguments (use -h for help)");
+
+	return 0;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err, fd;
+	libubi_t libubi;
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
+	err = ubi_probe_node(libubi, args.node);
+	if (err == 1) {
+		errmsg("\"%s\" is an UBI device node, not an UBI volume node",
+		       args.node);
+		goto out_libubi;
+	} else if (err < 0) {
+		if (errno == ENODEV)
+			errmsg("\"%s\" is not an UBI volume node", args.node);
+		else
+			sys_errmsg("error while probing \"%s\"", args.node);
+		goto out_libubi;
+	}
+
+	fd = open(args.node, O_RDWR);
+	if (fd == -1) {
+		sys_errmsg("cannot open UBI volume \"%s\"", args.node);
+		goto out_libubi;
+	}
+
+	if (args.attach) {
+		err = ubi_vol_block_add(fd);
+		if (err) {
+			sys_errmsg("cannot attach block device");
+			goto out_close;
+		}
+	} else {
+		err = ubi_vol_block_del(fd);
+		if (err) {
+			sys_errmsg("cannot detach block device");
+			goto out_close;
+		}
+	}
+
+	close(fd);
+	libubi_close(libubi);
+	return 0;
+
+out_close:
+	close(fd);
+out_libubi:
+	libubi_close(libubi);
+	return -1;
+}
-- 
1.8.1.5
