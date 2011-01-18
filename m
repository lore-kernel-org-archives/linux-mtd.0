Received: from www84.your-server.de ([213.133.104.84])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf6v3-00016q-Fz
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 08:28:08 +0000
From: stefani@seibold.net
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Artem.Bityutskiy@nokia.com
Subject: [PATCH] New tuneubifs command to adjust tunable filesystem parameters
	on ubifs
Date: Tue, 18 Jan 2011 09:28:46 +0100
Message-Id: <1295339326-1720-1-git-send-email-stefani@seibold.net>
Cc: Stefani Seibold <stefani@seibold.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Stefani Seibold <stefani@seibold.net>

ChangeLog:
31.12.2010 first proposal
18.01.2011 fixes suggested by Artem:
           - fix help message
	   - rename the tool into tuneubifs
	   - rename mkfs.ubifs" directory into "ubifs-utils"
	   - move the tool to ubifs-utils/tuneubifs
	   - code cleanup

tuneubifs allows the system administrator to adjust various tunable filesystem
parameters on Linux ubifs filesystems. The current values of these parameters
can be displayed by using the -v or calling without any option.

Currently the tuneubifs supports the following parameters:

-x, --compr=<none|lzo|zlib>    compression type
-R, --reserved=SIZE            how much space should be reserved for super-user

Maybe it will be nice to adjust also the uid and gid of the reserved owner,
or the increase the max. size of the ubi filesystem. This will be very
simple to implement.

Signed-off-by: Stefani Seibold <stefani@seibold.net>
---
 Makefile                                           |    2 +-
 mkfs.ubifs/.gitignore                              |    1 -
 ubifs-utils/.gitignore                             |    2 +
 {mkfs.ubifs => ubifs-utils}/COPYING                |    0
 {mkfs.ubifs => ubifs-utils}/Makefile               |    5 +-
 {mkfs.ubifs => ubifs-utils}/README                 |    0
 {mkfs.ubifs => ubifs-utils}/compr.c                |    0
 {mkfs.ubifs => ubifs-utils}/compr.h                |    0
 {mkfs.ubifs => ubifs-utils}/crc16.c                |    0
 {mkfs.ubifs => ubifs-utils}/crc16.h                |    0
 {mkfs.ubifs => ubifs-utils}/defs.h                 |    0
 {mkfs.ubifs => ubifs-utils}/devtable.c             |    0
 {mkfs.ubifs => ubifs-utils}/hashtable/hashtable.c  |    0
 {mkfs.ubifs => ubifs-utils}/hashtable/hashtable.h  |    0
 .../hashtable/hashtable_itr.c                      |    0
 .../hashtable/hashtable_itr.h                      |    0
 .../hashtable/hashtable_private.h                  |    0
 {mkfs.ubifs => ubifs-utils}/key.h                  |    0
 {mkfs.ubifs => ubifs-utils}/lpt.c                  |    0
 {mkfs.ubifs => ubifs-utils}/lpt.h                  |    0
 {mkfs.ubifs => ubifs-utils}/mkfs.ubifs.c           |    0
 {mkfs.ubifs => ubifs-utils}/mkfs.ubifs.h           |    0
 ubifs-utils/tuneubifs.c                            |  492 ++++++++++++++++++++
 {mkfs.ubifs => ubifs-utils}/ubifs-media.h          |    0
 {mkfs.ubifs => ubifs-utils}/ubifs.h                |    0
 25 files changed, 499 insertions(+), 3 deletions(-)
 delete mode 100644 mkfs.ubifs/.gitignore
 create mode 100644 ubifs-utils/.gitignore
 rename {mkfs.ubifs => ubifs-utils}/COPYING (100%)
 rename {mkfs.ubifs => ubifs-utils}/Makefile (84%)
 rename {mkfs.ubifs => ubifs-utils}/README (100%)
 rename {mkfs.ubifs => ubifs-utils}/compr.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/compr.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/crc16.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/crc16.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/defs.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/devtable.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/hashtable/hashtable.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/hashtable/hashtable.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/hashtable/hashtable_itr.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/hashtable/hashtable_itr.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/hashtable/hashtable_private.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/key.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/lpt.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/lpt.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/mkfs.ubifs.c (100%)
 rename {mkfs.ubifs => ubifs-utils}/mkfs.ubifs.h (100%)
 create mode 100644 ubifs-utils/tuneubifs.c
 rename {mkfs.ubifs => ubifs-utils}/ubifs-media.h (100%)
 rename {mkfs.ubifs => ubifs-utils}/ubifs.h (100%)

diff --git a/Makefile b/Makefile
index 7ab9743..0ec43a4 100644
--- a/Makefile
+++ b/Makefile
@@ -7,7 +7,7 @@ ifeq ($(WITHOUT_XATTR), 1)
   CPPFLAGS += -DWITHOUT_XATTR
 endif
 
-SUBDIRS = lib ubi-utils mkfs.ubifs
+SUBDIRS = lib ubi-utils ubifs-utils
 
 TARGETS = ftl_format flash_erase nanddump doc_loadbios \
 	ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \
diff --git a/mkfs.ubifs/.gitignore b/mkfs.ubifs/.gitignore
deleted file mode 100644
index 6b0e85c..0000000
--- a/mkfs.ubifs/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-/mkfs.ubifs
diff --git a/ubifs-utils/.gitignore b/ubifs-utils/.gitignore
new file mode 100644
index 0000000..05d6d9f
--- /dev/null
+++ b/ubifs-utils/.gitignore
@@ -0,0 +1,2 @@
+/mkfs.ubifs
+/tuneubifs
diff --git a/mkfs.ubifs/COPYING b/ubifs-utils/COPYING
similarity index 100%
rename from mkfs.ubifs/COPYING
rename to ubifs-utils/COPYING
diff --git a/mkfs.ubifs/Makefile b/ubifs-utils/Makefile
similarity index 84%
rename from mkfs.ubifs/Makefile
rename to ubifs-utils/Makefile
index 499f9e5..fb81871 100644
--- a/mkfs.ubifs/Makefile
+++ b/ubifs-utils/Makefile
@@ -4,12 +4,15 @@ CPPFLAGS += $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
 
 ALL_SOURCES=*.[ch] hashtable/*.[ch]
 
-TARGETS = mkfs.ubifs
+TARGETS = tuneubifs mkfs.ubifs
 
 LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid -L$(BUILDDIR)/../ubi-utils/ -lubi
 LDLIBS_mkfs.ubifs += -L$(BUILDDIR)/../lib -lmtd -lcrc32
 LDLIBS_mkfs.ubifs += $(ZLIBLDFLAGS) $(LZOLDFLAGS)
 
+LDLIBS_tuneubifs = -L$(BUILDDIR)/../ubi-utils/ -lubi
+LDLIBS_tuneubifs += -L$(BUILDDIR)/../lib -lmtd
+
 include ../common.mk
 
 $(BUILDDIR)/mkfs.ubifs: $(addprefix $(BUILDDIR)/,\
diff --git a/mkfs.ubifs/README b/ubifs-utils/README
similarity index 100%
rename from mkfs.ubifs/README
rename to ubifs-utils/README
diff --git a/mkfs.ubifs/compr.c b/ubifs-utils/compr.c
similarity index 100%
rename from mkfs.ubifs/compr.c
rename to ubifs-utils/compr.c
diff --git a/mkfs.ubifs/compr.h b/ubifs-utils/compr.h
similarity index 100%
rename from mkfs.ubifs/compr.h
rename to ubifs-utils/compr.h
diff --git a/mkfs.ubifs/crc16.c b/ubifs-utils/crc16.c
similarity index 100%
rename from mkfs.ubifs/crc16.c
rename to ubifs-utils/crc16.c
diff --git a/mkfs.ubifs/crc16.h b/ubifs-utils/crc16.h
similarity index 100%
rename from mkfs.ubifs/crc16.h
rename to ubifs-utils/crc16.h
diff --git a/mkfs.ubifs/defs.h b/ubifs-utils/defs.h
similarity index 100%
rename from mkfs.ubifs/defs.h
rename to ubifs-utils/defs.h
diff --git a/mkfs.ubifs/devtable.c b/ubifs-utils/devtable.c
similarity index 100%
rename from mkfs.ubifs/devtable.c
rename to ubifs-utils/devtable.c
diff --git a/mkfs.ubifs/hashtable/hashtable.c b/ubifs-utils/hashtable/hashtable.c
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable.c
rename to ubifs-utils/hashtable/hashtable.c
diff --git a/mkfs.ubifs/hashtable/hashtable.h b/ubifs-utils/hashtable/hashtable.h
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable.h
rename to ubifs-utils/hashtable/hashtable.h
diff --git a/mkfs.ubifs/hashtable/hashtable_itr.c b/ubifs-utils/hashtable/hashtable_itr.c
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable_itr.c
rename to ubifs-utils/hashtable/hashtable_itr.c
diff --git a/mkfs.ubifs/hashtable/hashtable_itr.h b/ubifs-utils/hashtable/hashtable_itr.h
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable_itr.h
rename to ubifs-utils/hashtable/hashtable_itr.h
diff --git a/mkfs.ubifs/hashtable/hashtable_private.h b/ubifs-utils/hashtable/hashtable_private.h
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable_private.h
rename to ubifs-utils/hashtable/hashtable_private.h
diff --git a/mkfs.ubifs/key.h b/ubifs-utils/key.h
similarity index 100%
rename from mkfs.ubifs/key.h
rename to ubifs-utils/key.h
diff --git a/mkfs.ubifs/lpt.c b/ubifs-utils/lpt.c
similarity index 100%
rename from mkfs.ubifs/lpt.c
rename to ubifs-utils/lpt.c
diff --git a/mkfs.ubifs/lpt.h b/ubifs-utils/lpt.h
similarity index 100%
rename from mkfs.ubifs/lpt.h
rename to ubifs-utils/lpt.h
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs.c
similarity index 100%
rename from mkfs.ubifs/mkfs.ubifs.c
rename to ubifs-utils/mkfs.ubifs.c
diff --git a/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs.h
similarity index 100%
rename from mkfs.ubifs/mkfs.ubifs.h
rename to ubifs-utils/mkfs.ubifs.h
diff --git a/ubifs-utils/tuneubifs.c b/ubifs-utils/tuneubifs.c
new file mode 100644
index 0000000..9546281
--- /dev/null
+++ b/ubifs-utils/tuneubifs.c
@@ -0,0 +1,492 @@
+/*
+ * Copyright (C) 2007, 2008, 2010 Nokia Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+/*
+ * An utility to tune a UBI filesystem.
+ *
+ * Author: Stefani Seibold <stefani@seibold.net>
+ *         in order of NSN Nokia Siemens Networks Ulm/Germany
+ *         based on work by Artem Bityutskiy
+ *
+ */
+
+#define PROGRAM_VERSION "0.4"
+#define PROGRAM_NAME "tuneubifs"
+
+#define _GNU_SOURCE
+#define _LARGEFILE64_SOURCE
+#include <getopt.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <limits.h>
+#include <string.h>
+#include <stdint.h>
+#include <endian.h>
+#include <byteswap.h>
+#include <linux/types.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+
+#include <libubi.h>
+#include <crc32.h>
+#include "common.h"
+#include "ubiutils-common.h"
+#include "ubifs-media.h"
+#include "defs.h"
+
+static void *super_buf;
+struct ubi_dev_info dev_info;
+
+/* The variables below are set by command line arguments */
+struct args {
+	int devn;
+	int vol_id;
+	const char *node;
+	const char *vol_name;
+	int compr;
+	long long reserved;
+	int verbose;
+};
+
+static struct args args = {
+	.vol_id = -1,
+	.devn = -1,
+	.node = NULL,
+	.vol_name = NULL,
+	.compr = -1,
+	.reserved = -1,
+	.verbose = 0,
+};
+
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+			 " - a tool for UBI filesystem tuning.";
+
+static const char optionsstr[] =
+"-d, --devn=<UBI device number>  UBI device number to tune\n"
+"-n, --vol_id=<volume ID>        ID of UBI volume to tune\n"
+"-N, --name=<volume name>        name of UBI volume to tune\n"
+"-x, --compr=<none|lzo|zlib>     compression type\n"
+"-R, --reserved=SIZE             how much space should be reserved for super-user\n"
+"-v, --verbose                   verbose output\n"
+"-h, --help                      print help message\n"
+"-V, --version                   print program version";
+
+static const char usage[] =
+"Usage 1: " PROGRAM_NAME " [-d <UBI device number>] [-n <volume ID> | -N <volume name>]\n"
+"\t\t[-h] [-V] [--vol_id=<volume ID> | --name <volume name>]\n"
+"\t\t[--devn <UBI device number>] [--help] [--version]\n"
+"Usage 2: " PROGRAM_NAME " <UBI volume node file name> [-h] [-V] [--help] [--version]\n\n";
+
+static const struct option long_options[] = {
+	{ .name = "devn",      .has_arg = 1, .flag = NULL, .val = 'd' },
+	{ .name = "vol_id",    .has_arg = 1, .flag = NULL, .val = 'n' },
+	{ .name = "name",      .has_arg = 1, .flag = NULL, .val = 'N' },
+	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "compr",     .has_arg = 1, .flag = NULL, .val = 'c' },
+	{ .name = "reserved",  .has_arg = 1, .flag = NULL, .val = 'r' },
+	{ .name = "verbose",   .has_arg = 0, .flag = NULL, .val = 'v' },
+	{ NULL, 0, NULL, 0},
+};
+
+/**
+ * get_multiplier - convert size specifier to an integer multiplier.
+ * @str: the size specifier string
+ *
+ * This function parses the @str size specifier, which may be one of
+ * 'KiB', 'MiB', or 'GiB' into an integer multiplier. Returns positive
+ * size multiplier in case of success and %-1 in case of failure.
+ */
+static int get_multiplier(const char *str)
+{
+	if (!str)
+		return 1;
+
+	/* Remove spaces before the specifier */
+	while (*str == ' ' || *str == '\t')
+		str++;
+
+	if (!strcasecmp(str, "KB"))
+		return 1000;
+	if (!strcasecmp(str, "MB"))
+		return 1000 * 1000;
+	if (!strcasecmp(str, "GB"))
+		return 1000 * 1000 * 1000;
+	if (!strcasecmp(str, "KiB"))
+		return 1024;
+	if (!strcasecmp(str, "MiB"))
+		return 1024 * 1024;
+	if (!strcasecmp(str, "GiB"))
+		return 1024 * 1024 * 1024;
+
+	return -1;
+}
+
+/**
+ * get_bytes - convert a string containing amount of bytes into an
+ *             integer.
+ * @str: string to convert
+ *
+ * This function parses @str which may have one of 'KiB', 'MiB', or 'GiB' size
+ * specifiers. Returns positive amount of bytes in case of success and %-1 in
+ * case of failure.
+ */
+static long long get_bytes(const char *str)
+{
+	char *endp;
+	long long bytes = strtoull(str, &endp, 0);
+
+	if (endp == str || bytes < 0)
+		return errmsg("incorrect amount of bytes: \"%s\"", str);
+
+	if (*endp != '\0') {
+		int mult = get_multiplier(endp);
+
+		if (mult == -1)
+			return errmsg("bad size specifier: \"%s\" - "
+				"should be 'KiB', 'MiB' or 'GiB'", endp);
+		bytes *= mult;
+	}
+
+	return bytes;
+}
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key;
+		char *endp;
+
+		key = getopt_long(argc, argv, "an:N:d:hVx:R:v", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 'n':
+			args.vol_id = strtoul(optarg, &endp, 0);
+			if (*endp != '\0' || endp == optarg || args.vol_id < 0)
+				return errmsg("bad volume ID: " "\"%s\"", optarg);
+			break;
+
+		case 'N':
+			args.vol_name = optarg;
+			break;
+
+		case 'd':
+			args.devn = strtoul(optarg, &endp, 0);
+			if (*endp != '\0' || endp == optarg || args.devn < 0)
+				return errmsg("bad UBI device number: \"%s\"", optarg);
+
+			break;
+
+		case 'h':
+			fprintf(stderr, "%s\n\n", doc);
+			fprintf(stderr, "%s\n\n", usage);
+			fprintf(stderr, "%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case 'x':
+			if (!strcmp(optarg, "none"))
+				args.compr = UBIFS_COMPR_NONE;
+			else
+			if (!strcmp(optarg, "lzo"))
+				args.compr = UBIFS_COMPR_LZO;
+			else
+			if (!strcmp(optarg, "zlib"))
+				args.compr = UBIFS_COMPR_ZLIB;
+			else
+				return errmsg("bad compr type: \"%s\"", optarg);
+
+			break;
+
+		case 'R':
+			args.reserved = get_bytes(optarg);
+			break;
+
+		case 'v':
+			args.verbose = 1;
+			break;
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
+	if (optind == argc - 1)
+		args.node = argv[optind];
+	else if (optind < argc)
+		return errmsg("more then one UBI device specified (use -h for help)");
+
+	return 0;
+}
+
+static int translate_dev(libubi_t libubi, const char *node)
+{
+	int err;
+
+	err = ubi_probe_node(libubi, node);
+	if (err == -1) {
+		if (errno != ENODEV)
+			return sys_errmsg("error while probing \"%s\"", node);
+		return errmsg("\"%s\" does not correspond to any UBI device or volume", node);
+	}
+
+	if (err == 1) {
+		struct ubi_dev_info dev_info;
+
+		err = ubi_get_dev_info(libubi, node, &dev_info);
+		if (err)
+			return sys_errmsg("cannot get information about UBI device \"%s\"", node);
+
+		args.devn = dev_info.dev_num;
+	} else {
+		struct ubi_vol_info vol_info;
+
+		err = ubi_get_vol_info(libubi, node, &vol_info);
+		if (err)
+			return sys_errmsg("cannot get information about UBI volume \"%s\"", node);
+
+		if (args.vol_id != -1)
+			return errmsg("both volume character device node (\"%s\") and "
+			   "volume ID (%d) are specify, use only one of them"
+			   "(use -h for help)", node, args.vol_id);
+
+		args.devn = vol_info.dev_num;
+		args.vol_id = vol_info.vol_id;
+	}
+
+	return 0;
+}
+
+static int get_vol_id_by_name(libubi_t libubi, int dev_num, const char *name)
+{
+	int err;
+	struct ubi_vol_info vol_info;
+
+	err = ubi_get_vol_info1_nm(libubi, dev_num, name, &vol_info);
+	if (err)
+		return sys_errmsg("cannot get information about volume \"%s\" on ubi%d\n", name, dev_num);
+
+	args.vol_id = vol_info.vol_id;
+
+	return 0;
+}
+
+/**
+ * read_super - read the ubifs super block
+ * @fd: device node file handle
+ * @buf: buffer (must be at least leb_size bytes)
+ */
+static int read_super(int fd, void *buf)
+{
+	struct ubifs_sb_node *sup = buf;
+	off64_t pos = UBIFS_SB_LNUM * dev_info.leb_size;
+
+	if (lseek64(fd, pos, SEEK_SET) != pos)
+		return sys_errmsg("failed seeking super block");
+
+	if (read(fd, buf, UBIFS_SB_NODE_SZ) != UBIFS_SB_NODE_SZ)
+		return sys_errmsg("read super block failed");
+
+	if (le32_to_cpu(sup->ch.magic) != UBIFS_NODE_MAGIC)
+		return sys_errmsg("invalid super block magic");
+
+	if (le32_to_cpu(sup->ch.crc) != mtd_crc32(UBIFS_CRC32_INIT, buf + 8, le32_to_cpu(sup->ch.len) - 8))
+		return sys_errmsg("invalid super block crc");
+
+	if (le32_to_cpu(sup->leb_size) != dev_info.leb_size)
+		return sys_errmsg("invalid super block leb_size");
+
+	return 0;
+}
+
+/**
+ * update_super - write the super block.
+ * @ubi: ubi descriptor
+ * @fd: device node file handle
+ * @buf: buffer (must be at least leb_size bytes)
+ */
+static int update_super(libubi_t ubi, int fd, void *buf)
+{
+	int len;
+	struct ubifs_sb_node *sup = buf;
+	off64_t pos = (off64_t)UBIFS_SB_LNUM * dev_info.leb_size;
+	int update = 0;
+
+	if (args.compr != -1) {
+		if (args.compr != le16_to_cpu(sup->default_compr)) {
+			sup->default_compr = cpu_to_le16(args.compr);
+			update = 1;
+		}
+	}
+
+	if (args.reserved != -1) {
+		if (args.reserved != le64_to_cpu(sup->rp_size)) {
+			sup->rp_size = cpu_to_le64(args.reserved);
+			update = 1;
+		}
+	}
+
+	if (!update) {
+		puts("Nothing changed, hence super block NOT written to flash!");
+		return 1;
+	}
+
+	len = ALIGN(ALIGN(UBIFS_SB_NODE_SZ, 8), dev_info.min_io_size);
+	memset(buf + len, 0xff, dev_info.leb_size - len);
+
+	sup->ch.crc = cpu_to_le32(mtd_crc32(UBIFS_CRC32_INIT, buf + 8, le32_to_cpu(sup->ch.len) - 8));
+
+	if (ubi_leb_change_start(ubi, fd, UBIFS_SB_LNUM, dev_info.leb_size, UBI_LONGTERM))
+		return sys_errmsg("ubi_leb_change_start failed");
+
+	if (lseek64(fd, pos, SEEK_SET) != pos)
+		return sys_errmsg("failed seeking super block");
+
+	if (write(fd, buf, dev_info.leb_size) != dev_info.leb_size)
+		return sys_errmsg("write super block failed");
+
+	return 0;
+}
+
+/**
+ * show_super - show the super block.
+ */
+static void show_super(void *buf)
+{
+	struct ubifs_sb_node *sup = buf;
+	const char *p;
+
+	switch(le16_to_cpu(sup->default_compr)) {
+	case UBIFS_COMPR_NONE:
+		p = "none";
+		break;
+	case UBIFS_COMPR_LZO:
+		p = "lzo";
+		break;
+	case UBIFS_COMPR_ZLIB:
+		p = "zlib";
+		break;
+	default:
+		p = "unknown";
+		break;
+	}
+
+	printf("UBIFS:\n");
+	printf(" default compressor: %s\n", p);
+	printf(" reserved for root: %llu bytes\n", le64_to_cpu(sup->rp_size));
+}
+
+int main(int argc, char * const argv[])
+{
+	int err;
+	libubi_t libubi;
+	char devname[128];
+	int fd;
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
+	if (args.node) {
+		/*
+		 * A character device was specified, translate this into UBI
+		 * device number and volume ID.
+		 */
+		err = translate_dev(libubi, args.node);
+		if (err)
+			goto out_libubi;
+	}
+
+	if (args.devn == -1) {
+		errmsg("device number is missing (use -h for help)\n");
+		goto out_libubi;
+	}
+
+	err = ubi_get_dev_info1(libubi, args.devn, &dev_info);
+	if (err) {
+		errmsg("cannot get information about UBI device %d", args.devn);
+		goto out_libubi;
+	}
+
+	if (args.vol_name) {
+		err = get_vol_id_by_name(libubi, args.devn, args.vol_name);
+		if (err)
+			goto out_libubi;
+	}
+
+	if (args.vol_id == -1) {
+		errmsg("volume ID is missing (use -h for help)\n");
+		goto out_libubi;
+	}
+
+	if (!args.node) {
+		sprintf(devname, "/dev/ubi%d_%d", args.devn, args.vol_id);
+		args.node = devname;
+	}
+
+	super_buf = malloc(dev_info.leb_size);
+	if (!super_buf) {
+		errmsg("out of memory");
+		goto out_libubi;
+	}
+
+	fd = open(args.node, O_RDWR|O_EXCL);
+	if (fd == -1) {
+		errmsg("cannot open the UBI volume '%s'", args.node);
+		goto out_libubi;
+	}
+
+	err = read_super(fd, super_buf);
+	if (err)
+		goto out_libubi;
+
+	if (args.compr != -1 || args.reserved != -1)
+		update_super(libubi, fd, super_buf);
+	else
+		args.verbose = 1;
+
+	if (args.verbose)
+		show_super(super_buf);
+
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
diff --git a/mkfs.ubifs/ubifs-media.h b/ubifs-utils/ubifs-media.h
similarity index 100%
rename from mkfs.ubifs/ubifs-media.h
rename to ubifs-utils/ubifs-media.h
diff --git a/mkfs.ubifs/ubifs.h b/ubifs-utils/ubifs.h
similarity index 100%
rename from mkfs.ubifs/ubifs.h
rename to ubifs-utils/ubifs.h
-- 
1.7.4.rc2
