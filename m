Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bf01J-00081F-I0
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:33:41 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, Daniel Walter <dwalter@sigma-star.at>
Subject: [PATCH 1/4] Nandsimctl initial commit
Date: Wed, 31 Aug 2016 09:32:41 +0200
Message-Id: <20160831073244.29106-2-dwalter@sigma-star.at>
In-Reply-To: <20160831073244.29106-1-dwalter@sigma-star.at>
References: <20160831073244.29106-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
---
 Makefile                   |   2 +-
 include/mtd/nandsim-user.h | 102 +++++++++++++++++
 nand-utils/nandsimctl.c    | 276 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 379 insertions(+), 1 deletion(-)
 create mode 100644 include/mtd/nandsim-user.h
 create mode 100644 nand-utils/nandsimctl.c

diff --git a/Makefile b/Makefile
index 977c9c5..1723e78 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,7 @@ UBIFS_BINS = \
 JFFSX_BINS = \
 	mkfs.jffs2 sumtool jffs2reader jffs2dump
 NAND_BINS = \
-	nanddump nandwrite nandtest nftldump nftl_format
+	nanddump nandwrite nandtest nftldump nftl_format nandsimctl
 NOR_BINS = \
 	rfddump rfdformat
 
diff --git a/include/mtd/nandsim-user.h b/include/mtd/nandsim-user.h
new file mode 100644
index 0000000..0254b09
--- /dev/null
+++ b/include/mtd/nandsim-user.h
@@ -0,0 +1,102 @@
+#ifndef __NANDSIM_USER_H__
+#define __NANDSIM_USER_H__
+
+#include <linux/types.h>
+
+#define NANSIM_IOC_MAGIC 'n'
+
+#define NANDSIM_IOC_NEW_INSTANCE _IOW(NANSIM_IOC_MAGIC, 0, struct ns_new_instance_req)
+#define NANDSIM_IOC_DESTROY_INSTANCE _IOW(NANSIM_IOC_MAGIC, 1, struct ns_destroy_instance_req)
+
+#define NANDSIM_MAX_DEVICES 32
+#define NANDSIM_MAX_PARTS 32
+
+enum ns_backend_type {
+	NANDSIM_BACKEND_RAM = 0,
+	NANDSIM_BACKEND_CACHEFILE = 1,
+	NANDSIM_BACKEND_FILE = 2,
+	NANDSIM_BACKEND_MAX,
+};
+
+/**
+ * struct ns_new_instance_req - Create a new nandsim instance.
+ *
+ * @id_bytes: NAND ID of the simulated NAND chip
+ * @bus_width: bus width to emulate, either 8 or 16
+ * @bbt_mode: bad block table mode, 0 OOB, 1 BBT with marker in OOB,
+ *            2 BBT with marker in data area
+ * @no_oob: backing file contains no OOB data
+ * @bch_strength: instead of hamming ECC use BCH with given strength
+ * @parts_num: number of MTD partitions to create
+ * @parts: partition sizes in physical erase blocks, used then @parts_num > 0
+ * @backend: backend type, see @ns_backend_type
+ * @file_fd: file describtor of backend, only for @NANDSIM_BACKEND_CACHEFILE
+ *           and @NANDSIM_BACKEND_FILE.
+ * @bitflips: maximum number of random bit flips per page
+ * @overridesize: specifies the NAND size overriding the ID bytes
+ * @access_delay: initial page access delay (microseconds)
+ * @program_delay: page programm delay (microseconds)
+ * @erase_delay: sector erase delay (milliseconds)
+ * @output_cycle: word output, from flash, time (nanoseconds)
+ * @input_cycle: word input, to flash, time (nanoseconds)
+ * @simelem_num: number of simulation elements appened to this
+ *               data structure. see @ns_simelement_prop
+ *
+ * This struct is used with the @NANDSIM_IOC_NEW_INSTANCE ioctl command.
+ * It creates a new nandsim instance from the given parameter.
+ * The ioctl command returns in case of success the nandsim id of the new
+ * instance, in case of error a negative value.
+ *
+ * Not all fields in the struct have to be filled, if nandsim should
+ * use a default ignore the value, fill with 0.
+ * The only mandatory fields are @id_bytes and @bus_width.
+ * When @no_oob is non-zero @bch_strength cannot be used since
+ * @no_oob implies that no ECC is used.
+ */
+struct ns_new_instance_req {
+	__s8 id_bytes[8];
+
+	__s8 bus_width;
+	__s8 bbt_mode;
+	__s8 no_oob;
+	__s32 bch_strength;
+
+	__s8 parts_num;
+	__s32 parts[NANDSIM_MAX_PARTS];
+
+	__s8 backend;
+	__s32 file_fd;
+
+	__s32 bitflips;
+	__s32 overridesize;
+	__s32 access_delay;
+	__s32 program_delay;
+	__s32 erase_delay;
+	__s32 output_cycle;
+	__s32 input_cycle;
+
+	__s32 padding[4];
+
+	__s32 simelem_num;
+} __attribute__((packed));
+
+enum {
+	NANDSIM_SIMELEM_BADBLOCK = 0,
+	NANDSIM_SIMELEM_WEAKBLOCK,
+	NANDSIM_SIMELEM_WEAKPAGE,
+	NANDSIM_SIMELEM_GRAVEPAGE,
+};
+
+struct ns_simelement_prop {
+	__s8 elem_type;
+	__s32 elem_id;
+	__s32 elem_attr;
+	__s8 padding[7];
+} __attribute__((packed));
+
+struct ns_destroy_instance_req {
+	__s8 id;
+	__s8 padding[7];
+} __attribute__((packed));
+
+#endif /* __NANDSIM_USER_H__ */
diff --git a/nand-utils/nandsimctl.c b/nand-utils/nandsimctl.c
new file mode 100644
index 0000000..0f641ab
--- /dev/null
+++ b/nand-utils/nandsimctl.c
@@ -0,0 +1,276 @@
+#include <stdio.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include <string.h>
+#include <mtd/nandsim-user.h>
+#include <getopt.h>
+#include <unistd.h>
+
+#define PROGRAM_NAME "nandsimctl"
+
+#include "common.h"
+
+#define TEMP_DIR "/tmp"
+#define NANDSIM_CTRL_DEV "/dev/nandsim_ctrl"
+
+enum action {
+	ACT_ATTACH = 0,
+	ACT_DETACH,
+	ACT_DETACH_ALL,
+};
+
+static const struct option long_options[] = {
+	{ .name = "backend",	.has_arg = 1, .flag = NULL, .val = 'b' },
+	{ .name = "id",		.has_arg = 1, .flag = NULL, .val = 'i' },
+	{ .name = "detach",	.has_arg = 1, .flag = NULL, .val = 'd' },
+	{ .name = "detach-all",	.has_arg = 0, .flag = NULL, .val = 'D' },
+	{ .name = "no-oob",	.has_arg = 0, .flag = NULL, .val = 'n' },
+	{ NULL, 0, NULL, 0},
+};
+
+static int ctrl_fd;
+
+static struct {
+	int backend;
+	bool wide_addr;
+	int id[8];
+	char *backing_file;
+	bool no_oob;
+	enum action act;
+	int detach;
+	bool detach_all;
+} args = {
+	.backend = -1,
+	.detach = -1,
+	.wide_addr = false,
+	.id = {
+		[0] = 0x98,
+		[1] = 0x39,
+		[2 ... 7] = 0xff,
+	},
+	.backing_file = NULL,
+	.no_oob = false,
+};
+
+static int do_help(void)
+{
+	fprintf(stderr, "Help\n");
+	return 0;
+}
+
+static int parse_args(int argc, char *argv[])
+{
+	int key, error = 0;
+
+	for (;;) {
+		key = getopt_long(argc, argv, "b:i:h?rcfwod:D", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 'b':
+			if (args.backend != -1)
+				return errmsg("backend type already set!");
+
+			if (!strcmp(optarg, "ram"))
+				args.backend = NANDSIM_BACKEND_RAM;
+			else if (!strcmp(optarg, "cache"))
+				args.backend = NANDSIM_BACKEND_CACHEFILE;
+			else if (!strcmp(optarg, "file"))
+				args.backend = NANDSIM_BACKEND_FILE;
+			else
+				return errmsg("bad backend type: \"%s\"", optarg);
+		break;
+		case 'i':
+		{
+			int i;
+			int n = sscanf(optarg, "0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%02x",
+						&args.id[0], &args.id[1], &args.id[2], &args.id[3],
+						&args.id[4], &args.id[5], &args.id[6], &args.id[7]);
+			if (n < 1)
+				return errmsg("unable to parse id byte string!");
+
+			for (i = n; i < 8; i++)
+				args.id[i] = 0xff;
+		}
+		break;
+		case 'r':
+			if (args.backend != -1)
+				return errmsg("backend type already set!");
+
+			args.backend = NANDSIM_BACKEND_RAM;
+		break;
+		case 'c':
+			if (args.backend != -1)
+				return errmsg("backend type already set!");
+
+			args.backend = NANDSIM_BACKEND_CACHEFILE;
+		break;
+		case 'f':
+			if (args.backend != -1)
+				return errmsg("backend type already set!");
+
+			args.backend = NANDSIM_BACKEND_FILE;
+		break;
+		case 'w':
+			args.wide_addr = true;
+		break;
+		case 'n':
+			args.no_oob = true;
+		break;
+		case 'd':
+			args.detach = simple_strtoul(optarg, &error);
+			if (error)
+				return errmsg("unable to parse nandsim instance number");
+
+			if (args.detach < 0 || args.detach >= NANDSIM_MAX_DEVICES)
+				return errmsg("bad instance number to detach");
+		break;
+		case 'D':
+			args.detach_all = true;
+		break;
+		case '?':
+			return do_help();
+		break;
+		}
+	}
+
+	if (args.backend >= 0 && (args.detach >= 0 || args.detach_all))
+		return errmsg("you cannot attach and detach at the same time");
+
+	if (args.detach >= 0 && args.detach_all)
+		return errmsg("not sure whether you want to detach all instances or just one");
+
+	if (args.backend == NANDSIM_BACKEND_FILE) {
+		if (optind == argc)
+			return errmsg("no backing file specified!");
+
+		if (optind != argc - 1)
+			return errmsg("more than one backing file specified!");
+
+		args.backing_file = strdup(argv[optind]);
+	} else if (optind == argc - 1)
+		return errmsg("unknown parameter \"%s\"", argv[optind]);
+
+	if (args.detach >= 0)
+		args.act = ACT_DETACH;
+	else if (args.detach_all)
+		args.act = ACT_DETACH_ALL;
+	else
+		args.act = ACT_ATTACH;
+
+	return 0;
+}
+
+static int do_detach(int id)
+{
+	int ret;
+	struct ns_destroy_instance_req req;
+
+	req.id = id;
+	ret = ioctl(ctrl_fd, NANDSIM_IOC_DESTROY_INSTANCE, &req);
+	if (ret < 0 && errno != EBUSY)
+		return sys_errmsg("unable to destroy instance %i", id);
+
+	if (ret < 0)
+		warnmsg("instance %i is currently in use, cannot detach", id);
+
+	return 0;
+}
+
+static int do_detach_all(void)
+{
+	int i, ret;
+
+	for (i = 0; i < NANDSIM_MAX_DEVICES; i++) {
+		ret = do_detach(i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int get_temp_file_fd(void)
+{
+	int fd, ret;
+	char *tmpdir = NULL;
+
+#ifdef O_TMPFILE
+	fd = open(TEMP_DIR, O_CLOEXEC | O_RDWR | O_EXCL | O_TMPFILE, 0700);
+	if (fd == -1 && (errno != EINVAL && errno != EISDIR && errno != EOPNOTSUPP))
+		return sys_errmsg("Unable to open an temporary file");
+
+	if (fd >= 0)
+		return fd;
+#endif
+	tmpdir = xstrdup(TEMP_DIR "/nandsim-XXXXXX");
+	fd = mkstemp(tmpdir);
+	free(tmpdir);
+	if (fd == -1)
+		return sys_errmsg("unable to open an temporary file using mkstemp");
+
+	ret = unlink(tmpdir);
+	if (ret == -1)
+		return sys_errmsg("unable to unlink temporary file");
+
+	return fd;
+}
+
+static int do_attach(void)
+{
+	struct ns_new_instance_req req;
+	int i, ret, fd = 0;
+
+	if (args.backend == NANDSIM_BACKEND_CACHEFILE) {
+		fd = get_temp_file_fd();
+		if (fd < 0)
+			return fd;
+	} else if (args.backend == NANDSIM_BACKEND_FILE) {
+		fd = open(args.backing_file, O_RDWR | O_LARGEFILE | O_CLOEXEC);
+		if (fd == -1)
+			return sys_errmsg("unable to open \"%s\"", args.backing_file);
+	} else
+		args.backend = NANDSIM_BACKEND_RAM;
+
+	memset(&req, 0, sizeof(req));
+
+	req.backend = args.backend;
+	req.bus_width = args.wide_addr ? 16 : 8;
+	req.no_oob = !!args.no_oob;
+	for (i = 0; i < 8; i++)
+		req.id_bytes[i] = args.id[i] & 0xff;
+	req.file_fd = fd;
+
+	ret = ioctl(ctrl_fd, NANDSIM_IOC_NEW_INSTANCE, &req);
+	if (ret < 0) {
+		sys_errmsg("unable to create new nandsim instance");
+		return ret;
+	}
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int ret;
+
+	ret = parse_args(argc, argv);
+	if (ret)
+		return -1;
+
+	ctrl_fd = open(NANDSIM_CTRL_DEV, O_RDWR | O_CLOEXEC);
+	if (ctrl_fd < 0)
+		return sys_errmsg("unable to open \"%s\"", NANDSIM_CTRL_DEV);
+
+	if (args.detach >= 0)
+		return do_detach(args.detach);
+	else if (args.detach_all)
+		return do_detach_all();
+	else
+		return do_attach();
+
+	return 0;
+}
-- 
2.8.3
