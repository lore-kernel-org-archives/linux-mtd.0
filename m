Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nznge-0006HH-Ee
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 09:06:10 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] ubiattach/ubidetach: add support to attach/detach by path
Date: Thu,  8 Apr 2010 12:04:12 +0300
Message-Id: <1270717452-8993-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1270717452-8993-1-git-send-email-dedekind1@gmail.com>
References: <1270717452-8993-1-git-send-email-dedekind1@gmail.com>
Cc: Mika Westerberg <ext-mika.1.westerberg@nokia.com>,
	Jon Ringle <jon@ringle.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mika Westerberg <ext-mika.1.westerberg@nokia.com>

Now there is a new option '-p' (or '--dev-path') that can be used to pass path
to a MTD device node.

Signed-off-by: Mika Westerberg <ext-mika.1.westerberg@nokia.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 ubi-utils/src/ubiattach.c |   35 +++++++++++++++++++--------
 ubi-utils/src/ubidetach.c |   57 ++++++++++++++++++++++++++++++--------------
 2 files changed, 64 insertions(+), 28 deletions(-)

diff --git a/ubi-utils/src/ubiattach.c b/ubi-utils/src/ubiattach.c
index a935b42..67f8c85 100644
--- a/ubi-utils/src/ubiattach.c
+++ b/ubi-utils/src/ubiattach.c
@@ -39,6 +39,7 @@ struct args {
 	int mtdn;
 	int vidoffs;
 	const char *node;
+	const char *dev;
 };
 
 static struct args args = {
@@ -46,6 +47,7 @@ static struct args args = {
 	.mtdn = -1,
 	.vidoffs = 0,
 	.node = NULL,
+	.dev = NULL,
 };
 
 static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
@@ -55,7 +57,9 @@ static const char *optionsstr =
 "-d, --devn=<UBI device number>  the number to assign to the newly created UBI device\n"
 "                                (the number is assigned automatically if this is not\n"
 "                                specified\n"
-"-m, --mtdn=<MTD device number>  MTD device number to attach\n"
+"-p, --dev-path=<path to device> path to MTD device node to attach\n"
+"-m, --mtdn=<MTD device number>  MTD device number to attach (alternative method, e.g\n"
+"                                if the character device node does not exist)\n"
 "-O, --vid-hdr-offset            VID header offset (do not specify this unless you\n"
 "                                really know what you do and the optimal defaults will\n"
 "                                be used)\n"
@@ -63,14 +67,18 @@ static const char *optionsstr =
 "-V, --version                   print program version";
 
 static const char *usage =
-"Usage: " PROGRAM_NAME " <UBI control device node file name> [-m <MTD device number>] [-d <UBI device number>]\n"
-"\t\t[--mtdn=<MTD device number>] [--devn <UBI device number>]\n"
-"Example 1: " PROGRAM_NAME " /dev/ubi_ctrl -m 0 - attach MTD device 0 (mtd0) to UBI\n"
-"Example 2: " PROGRAM_NAME " /dev/ubi_ctrl -m 0 -d 3 - attach MTD device 0 (mtd0) to UBI and\n"
+"Usage: " PROGRAM_NAME " <UBI control device node file name>\n"
+"\t[-m <MTD device number>] [-d <UBI device number>] [-p <path to device>]\n"
+"\t[--mtdn=<MTD device number>] [--devn=<UBI device number>]\n"
+"\t[--dev-path=<path to device>]\n"
+"Example 1: " PROGRAM_NAME " /dev/ubi_ctrl -p /dev/mtd0 - attach /dev/mtd0 to UBI\n"
+"Example 2: " PROGRAM_NAME " /dev/ubi_ctrl -m 0 - attach MTD device 0 (mtd0) to UBI\n"
+"Example 3: " PROGRAM_NAME " /dev/ubi_ctrl -m 0 -d 3 - attach MTD device 0 (mtd0) to UBI and\n"
 "           and create UBI device number 3 (ubi3)";
 
 static const struct option long_options[] = {
 	{ .name = "devn",           .has_arg = 1, .flag = NULL, .val = 'd' },
+	{ .name = "dev-path",       .has_arg = 1, .flag = NULL, .val = 'p' },
 	{ .name = "mtdn",           .has_arg = 1, .flag = NULL, .val = 'm' },
 	{ .name = "vid-hdr-offset", .has_arg = 1, .flag = NULL, .val = 'O' },
 	{ .name = "help",           .has_arg = 0, .flag = NULL, .val = 'h' },
@@ -84,11 +92,14 @@ static int parse_opt(int argc, char * const argv[])
 		int key;
 		char *endp;
 
-		key = getopt_long(argc, argv, "m:d:O:hV", long_options, NULL);
+		key = getopt_long(argc, argv, "p:m:d:O:hV", long_options, NULL);
 		if (key == -1)
 			break;
 
 		switch (key) {
+		case 'p':
+			args.dev = optarg;
+			break;
 		case 'd':
 			args.devn = strtoul(optarg, &endp, 0);
 			if (*endp != '\0' || endp == optarg || args.devn < 0)
@@ -134,8 +145,8 @@ static int parse_opt(int argc, char * const argv[])
 	else if (optind != argc - 1)
 		return errmsg("more then one UBI control device specified (use -h for help)");
 
-	if (args.mtdn == -1)
-		return errmsg("MTD device number was not specified (use -h for help)");
+	if (args.mtdn == -1 && args.dev == NULL)
+		return errmsg("MTD device to attach was not specified (use -h for help)");
 
 	args.node = argv[optind];
 	return 0;
@@ -177,10 +188,14 @@ int main(int argc, char * const argv[])
 	req.dev_num = args.devn;
 	req.mtd_num = args.mtdn;
 	req.vid_hdr_offset = args.vidoffs;
+	req.dev = args.dev;
 
-	err = ubi_attach_mtd(libubi, args.node, &req);
+	err = ubi_attach(libubi, args.node, &req);
 	if (err) {
-		sys_errmsg("cannot attach mtd%d", args.mtdn);
+		if (args.dev)
+			sys_errmsg("cannot attach \"%s\"", args.dev);
+		else
+			sys_errmsg("cannot attach mtd%d", args.mtdn);
 		goto out_libubi;
 	}
 
diff --git a/ubi-utils/src/ubidetach.c b/ubi-utils/src/ubidetach.c
index 83584cd..335486d 100644
--- a/ubi-utils/src/ubidetach.c
+++ b/ubi-utils/src/ubidetach.c
@@ -38,12 +38,14 @@ struct args {
 	int devn;
 	int mtdn;
 	const char *node;
+	const char *dev;
 };
 
 static struct args args = {
 	.devn = UBI_DEV_NUM_AUTO,
 	.mtdn = -1,
 	.node = NULL,
+	.dev = NULL,
 };
 
 static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
@@ -51,22 +53,26 @@ static const char *doc = PROGRAM_NAME " version " PROGRAM_VERSION
 
 static const char *optionsstr =
 "-d, --devn=<UBI device number>  UBI device number to delete\n"
-"-m, --mtdn=<MTD device number>  or altrnatively, MTD device number to detach -\n"
-"                                this will delete corresponding UBI device\n"
+"-p, --dev-path=<path to device> or alternatively, MTD device node path to detach\n"
+"-m, --mtdn=<MTD device number>  or alternatively, MTD device number to detach\n"
 "-h, --help                      print help message\n"
 "-V, --version                   print program version";
 
 static const char *usage =
-"Usage: " PROGRAM_NAME "<UBI control device node file name> [-d <UBI device number>] [-m <MTD device number>]\n"
-"\t\t[--devn <UBI device number>] [--mtdn=<MTD device number>]\n"
-"Example 1: " PROGRAM_NAME " /dev/ubi_ctrl -d 2 - delete UBI device 2 (ubi2)\n"
-"Example 2: " PROGRAM_NAME " /dev/ubi_ctrl -m 0 - detach MTD device 0 (mtd0)";
+"Usage: " PROGRAM_NAME " <UBI control device node file name>\n"
+"\t[-d <UBI device number>] [-m <MTD device number>] [-p <path to device>]\n"
+"\t[--devn=<UBI device number>] [--mtdn=<MTD device number>]\n"
+"\t[--dev-path=<path to device>]\n"
+"Example 1: " PROGRAM_NAME " /dev/ubi_ctrl -p /dev/mtd0 - detach MTD device /dev/mtd0\n"
+"Example 2: " PROGRAM_NAME " /dev/ubi_ctrl -d 2 - delete UBI device 2 (ubi2)\n"
+"Example 3: " PROGRAM_NAME " /dev/ubi_ctrl -m 0 - detach MTD device 0 (mtd0)";
 
 static const struct option long_options[] = {
-	{ .name = "devn",    .has_arg = 1, .flag = NULL, .val = 'd' },
-	{ .name = "mtdn",    .has_arg = 1, .flag = NULL, .val = 'm' },
-	{ .name = "help",    .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "devn",     .has_arg = 1, .flag = NULL, .val = 'd' },
+	{ .name = "dev-path", .has_arg = 1, .flag = NULL, .val = 'p' },
+	{ .name = "mtdn",     .has_arg = 1, .flag = NULL, .val = 'm' },
+	{ .name = "help",     .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",  .has_arg = 0, .flag = NULL, .val = 'V' },
 	{ NULL, 0, NULL, 0},
 };
 
@@ -76,11 +82,14 @@ static int parse_opt(int argc, char * const argv[])
 		int key;
 		char *endp;
 
-		key = getopt_long(argc, argv, "m:d:hV", long_options, NULL);
+		key = getopt_long(argc, argv, "p:m:d:hV", long_options, NULL);
 		if (key == -1)
 			break;
 
 		switch (key) {
+		case 'p':
+			args.dev = optarg;
+			break;
 		case 'd':
 			args.devn = strtoul(optarg, &endp, 0);
 			if (*endp != '\0' || endp == optarg || args.devn < 0)
@@ -119,11 +128,15 @@ static int parse_opt(int argc, char * const argv[])
 	else if (optind != argc - 1)
 		return errmsg("more then one UBI control device specified (use -h for help)");
 
-	if (args.mtdn == -1 && args.devn == -1)
+	if (args.mtdn == -1 && args.devn == -1 && args.dev == NULL)
 		return errmsg("neither MTD nor UBI devices were specified (use -h for help)");
 
-	if (args.mtdn != -1 && args.devn != -1)
-		return errmsg("specify either MTD or UBI device (use -h for help)");
+	if (args.devn != -1) {
+		if (args.mtdn != -1 || args.dev != NULL)
+			return errmsg("specify either MTD or UBI device (use -h for help)");
+
+	} else if (args.mtdn != -1 && args.dev != NULL)
+		return errmsg("specify either MTD number or device node (use -h for help)");
 
 	args.node = argv[optind];
 	return 0;
@@ -167,10 +180,18 @@ int main(int argc, char * const argv[])
 			goto out_libubi;
 		}
 	} else {
-		err = ubi_detach_mtd(libubi, args.node, args.mtdn);
-		if (err) {
-			sys_errmsg("cannot detach mtd%d", args.mtdn);
-			goto out_libubi;
+		if (args.dev != NULL) {
+			err = ubi_detach(libubi, args.node, args.dev);
+			if (err) {
+				sys_errmsg("cannot detach \"%s\"", args.dev);
+				goto out_libubi;
+			}
+		} else {
+			err = ubi_detach_mtd(libubi, args.node, args.mtdn);
+			if (err) {
+				sys_errmsg("cannot detach mtd%d", args.mtdn);
+				goto out_libubi;
+			}
 		}
 	}
 
-- 
1.6.6.1
