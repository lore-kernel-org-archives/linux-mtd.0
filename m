Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYGDs-0002eW-CN
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 14:45:01 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] ubiblock: Support UBI volume name or volume ID parameter
 passing
Date: Thu, 10 Apr 2014 11:43:40 -0300
Message-Id: <1397141020-6363-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In addition to the previous bevahior, this commit adds support for
ubiblock to identify a UBI volume based on the volume name or ID.

For example, the following command invocations are possible:

  $ ubiblock --create=/dev/ubi0_0   - create from UBI volume node
  $ ubiblock -r /dev/ubi0_0         - remove from UBI volume node

  $ ubiblock -c /dev/ubi0 -n 99     - create from UBI volume 99 from UBI device
  $ ubiblock -r /dev/ubi0 -N my_vol - remove from UBI volume named "my_vol" from UBI device

The implementation assume there's device node file named as "/dev/ubi${%d}_${%d}",
where the first integer is the UBI device number, and the second is the
UBI volume ID. This device is not strictly required to exist for a given volume,
so the implementation is a "best-effort".

For this reason, the open_volume_by_id is implemented here instead of adding
it to libubi.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 ubi-utils/ubiblock.c | 165 +++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 133 insertions(+), 32 deletions(-)

diff --git a/ubi-utils/ubiblock.c b/ubi-utils/ubiblock.c
index 1e12be8..a599576 100644
--- a/ubi-utils/ubiblock.c
+++ b/ubi-utils/ubiblock.c
@@ -34,49 +34,118 @@
 #include <libubi.h>
 #include "common.h"
 
+enum operation {
+	UBIBLOCK_NONE,
+	UBIBLOCK_CREATE,
+	UBIBLOCK_REMOVE,
+};
+
 struct args {
+	int vol_id;
 	const char *node;
-	int create;
+	const char *name;
+	enum operation op;
 };
 
-static struct args args;
+static struct args args = {
+	.op = UBIBLOCK_NONE,
+	.vol_id = -1,
+};
 
 static const char doc[] = PROGRAM_NAME " version " VERSION
 			 " - a tool to create/remove block device interface from UBI volumes.";
 
 static const char optionsstr[] =
-"-c, --create               create block on top of a volume\n"
-"-r, --remove               remove block from volume\n"
-"-h, --help                 print help message\n"
-"-V, --version              print program version";
+"-c, --create=<UBI device/volume node>	create block on top of a volume\n"
+"-r, --remove=<UBI device/volume node>	remove block from volume\n"
+"-n, --vol_id=<volume id>		volume ID\n"
+"-N, --name=<volume name>		volume name\n"
+"-h, --help				print help message\n"
+"-V, --version				print program version";
 
 static const char usage[] =
-"Usage: " PROGRAM_NAME " [-c,-r] <UBI volume node file name>\n"
-"Example: " PROGRAM_NAME " --create /dev/ubi0_0";
+"Usage: " PROGRAM_NAME " [-c,-r] <UBI device or UBI volume node file name>\n"
+"         [-n <volume id>] [--vol_id=<volume id>]\n"
+"         [-N <volume name>] [--name=<volume name>] [-h] [--help]\n\n"
+"Example: " PROGRAM_NAME " --create=/dev/ubi0_0   - create from UBI volume node\n"
+"         " PROGRAM_NAME " -c /dev/ubi0 -n 1      - create from UBI volume 1 from UBI device\n"
+"         " PROGRAM_NAME " -r /dev/ubi0 -N my_vol - remove from UBI volume named \"my_vol\" from UBI device";
 
 static const struct option long_options[] = {
 	{ .name = "create",   .has_arg = 1, .flag = NULL, .val = 'c' },
 	{ .name = "remove",   .has_arg = 1, .flag = NULL, .val = 'r' },
+	{ .name = "vol_id",   .has_arg = 1, .flag = NULL, .val = 'n' },
+	{ .name = "name",     .has_arg = 1, .flag = NULL, .val = 'N' },
 	{ .name = "help",     .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",  .has_arg = 0, .flag = NULL, .val = 'V' },
 	{ NULL, 0, NULL, 0}
 };
 
-static int parse_opt(int argc, char * const argv[])
+static int param_sanity_check(libubi_t libubi)
+{
+	int err;
+
+	if (args.op == UBIBLOCK_NONE) {
+		errmsg("please, specify a creation or removal operation");
+		return -1;
+	}
+
+	err = ubi_probe_node(libubi, args.node);
+	if (err == 2) {
+		/* UBI volume node, don't need volume ID or name */
+		return 0;
+	} else if (err == 1) {
+		/* UBI device node, we need volume ID or name */
+		;
+	} else if (err < 0) {
+		if (errno == ENODEV)
+			errmsg("\"%s\" is not an UBI device node", args.node);
+		else
+			errmsg("error while probing \"%s\"", args.node);
+		return -1;
+	}
+
+	if (args.vol_id == -1 && !args.name) {
+		errmsg("please, specify either volume ID or volume name");
+		return -1;
+	}
+
+	if (args.vol_id != -1 && args.name) {
+		errmsg("please, specify either volume ID or volume name, not both");
+		return -1;
+	}
+
+	return 0;
+}
+
+static int parse_opt(libubi_t libubi, int argc, char * const argv[])
 {
 	while (1) {
-		int key;
+		int key, error = 0;
 
-		key = getopt_long(argc, argv, "c:r:h?V", long_options, NULL);
+		key = getopt_long(argc, argv, "n:N:c:r:h?V", long_options, NULL);
 		if (key == -1)
 			break;
 
 		switch (key) {
 		case 'c':
-			args.create = 1;
+			args.op = UBIBLOCK_CREATE;
+			args.node = optarg;
+			break;
 		case 'r':
+			args.op = UBIBLOCK_REMOVE;
 			args.node = optarg;
 			break;
+		case 'n':
+			args.vol_id = simple_strtoul(optarg, &error);
+			if (error || args.vol_id < 0) {
+				errmsg("bad volume ID: " "\"%s\"", optarg);
+				return -1;
+			}
+			break;
+		case 'N':
+			args.name = optarg;
+			break;
 		case 'h':
 		case '?':
 			printf("%s\n\n", doc);
@@ -94,20 +163,52 @@ static int parse_opt(int argc, char * const argv[])
 		}
 	}
 
-	if (!args.node)
-		return errmsg("invalid arguments (use -h for help)");
-
+	if (param_sanity_check(libubi))
+		return -1;
 	return 0;
 }
 
-int main(int argc, char * const argv[])
+static int ubi_open_volume_by_id(libubi_t desc, const char *node, int vol_id, int mode)
 {
+	char file[256];
+	struct ubi_dev_info dev_info;
 	int err, fd;
-	libubi_t libubi;
 
-	err = parse_opt(argc, argv);
+	err = ubi_get_dev_info(desc, node, &dev_info);
 	if (err)
+		return errmsg("cannot get information about UBI device \"%s\"", node);
+
+	sprintf(file, "/dev/ubi%d_%d", dev_info.dev_num, vol_id);
+	fd = open(file, mode);
+	if (fd == -1)
+		errmsg("Failed to open '%s' volume device", file);
+	return fd;
+}
+
+static int ubi_open_volume_by_name(libubi_t desc, const char *node, const char *name, int mode)
+{
+	struct ubi_dev_info dev_info;
+	struct ubi_vol_info vol_info;
+	int err;
+
+	err = ubi_get_dev_info(desc, node, &dev_info);
+	if (err) {
+		errmsg("cannot get information about UBI device \"%s\"", node);
+		return -1;
+	}
+
+	err = ubi_get_vol_info1_nm(desc, dev_info.dev_num, name, &vol_info);
+	if (err) {
+		errmsg("cannot find UBI volume \"%s\"", name);
 		return -1;
+	}
+	return ubi_open_volume_by_id(desc, node, vol_info.vol_id, mode);
+}
+
+int main(int argc, char * const argv[])
+{
+	int err, fd;
+	libubi_t libubi;
 
 	libubi = libubi_open();
 	if (!libubi) {
@@ -116,26 +217,26 @@ int main(int argc, char * const argv[])
 		return sys_errmsg("cannot open libubi");
 	}
 
-	err = ubi_probe_node(libubi, args.node);
-	if (err == 1) {
-		errmsg("\"%s\" is an UBI device node, not an UBI volume node",
-		       args.node);
-		goto out_libubi;
-	} else if (err < 0) {
-		if (errno == ENODEV)
-			errmsg("\"%s\" is not an UBI volume node", args.node);
-		else
-			sys_errmsg("error while probing \"%s\"", args.node);
-		goto out_libubi;
+	err = parse_opt(libubi, argc, argv);
+	if (err)
+		return -1;
+
+	if (args.name) {
+		fd = ubi_open_volume_by_name(libubi, args.node, args.name, O_RDWR);
+	} else if (args.vol_id != -1) {
+		fd = ubi_open_volume_by_id(libubi, args.node, args.vol_id, O_RDWR);
+	} else {
+		fd = open(args.node, O_RDWR);
+		if (fd == -1)
+			errmsg("Failed to open '%s' volume device", args.node);
 	}
 
-	fd = open(args.node, O_RDWR);
 	if (fd == -1) {
-		sys_errmsg("cannot open UBI volume \"%s\"", args.node);
+		sys_errmsg("cannot open UBI volume device");
 		goto out_libubi;
 	}
 
-	if (args.create) {
+	if (args.op == UBIBLOCK_CREATE) {
 		err = ubi_vol_block_create(fd);
 		if (err) {
 			if (errno == ENOSYS)
-- 
1.9.1
