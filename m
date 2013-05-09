Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UaV87-0000bB-Nd
 for linux-mtd@lists.infradead.org; Thu, 09 May 2013 17:59:48 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 by smtp.gentoo.org (Postfix) with ESMTP id 8D2CE33DFFD
 for <linux-mtd@lists.infradead.org>; Thu,  9 May 2013 17:59:25 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH mtd-utils 4/4 v2] ubiupdatevol: add a --skip option
Date: Thu,  9 May 2013 13:59:24 -0400
Message-Id: <1368122364-9754-4-git-send-email-vapier@gentoo.org>
In-Reply-To: <1368122364-9754-1-git-send-email-vapier@gentoo.org>
References: <1368122364-9754-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This already has a --size option for controlling how many bytes to read
from the input.  Add a --skip option to control the offset into the input
too.  This way people don't have to do `dd | ubiupdatevol`.

While we're here, I've fixed the types used with args.size and the read
loop so that they can hold the right sizes (like setting a 32bit+ size).

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- there was no v1!

 ubi-utils/ubiupdatevol.c | 45 +++++++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/ubi-utils/ubiupdatevol.c b/ubi-utils/ubiupdatevol.c
index 7fedb3c..5096791 100644
--- a/ubi-utils/ubiupdatevol.c
+++ b/ubi-utils/ubiupdatevol.c
@@ -45,7 +45,8 @@ struct args {
 	const char *img;
 	/* For deprecated -d and -B options handling */
 	char dev_name[256];
-	int size;
+	long long size;
+	long long skip;
 	int use_stdin;
 };
 
@@ -56,7 +57,8 @@ static const char doc[] = PROGRAM_NAME " version " VERSION
 
 static const char optionsstr[] =
 "-t, --truncate             truncate volume (wipe it out)\n"
-"-s, --size=<bytes>         bytes in input, if not reading from file\n"
+"-s, --size=<bytes>         bytes to read from input\n"
+"    --skip=<bytes>         leading bytes to skip from input\n"
 "-h, --help                 print help message\n"
 "-V, --version              print program version";
 
@@ -67,6 +69,8 @@ static const char usage[] =
 "Example 2: " PROGRAM_NAME " /dev/ubi0_1 -t - wipe out UBI volume /dev/ubi0_1";
 
 static const struct option long_options[] = {
+	/* Order matters for opts w/val=0; see option_index below. */
+	{ .name = "skip",     .has_arg = 1, .flag = NULL, .val = 0 },
 	{ .name = "truncate", .has_arg = 0, .flag = NULL, .val = 't' },
 	{ .name = "help",     .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",  .has_arg = 0, .flag = NULL, .val = 'V' },
@@ -77,19 +81,29 @@ static const struct option long_options[] = {
 static int parse_opt(int argc, char * const argv[])
 {
 	while (1) {
-		int key, error = 0;
+		int option_index, key, error = 0;
 
-		key = getopt_long(argc, argv, "ts:h?V", long_options, NULL);
+		key = getopt_long(argc, argv, "ts:h?V", long_options, &option_index);
 		if (key == -1)
 			break;
 
 		switch (key) {
+		case 0:
+			switch (option_index) {
+			case 0: /* --skip */
+				args.skip = simple_strtoull(optarg, &error);
+				if (error || args.skip < 0)
+					return errmsg("bad skip: " "\"%s\"", optarg);
+				break;
+			}
+			break;
+
 		case 't':
 			args.truncate = 1;
 			break;
 
 		case 's':
-			args.size = simple_strtoul(optarg, &error);
+			args.size = simple_strtoull(optarg, &error);
 			if (error || args.size < 0)
 				return errmsg("bad size: " "\"%s\"", optarg);
 			break;
@@ -198,7 +212,7 @@ static int update_volume(libubi_t libubi, struct ubi_vol_info *vol_info)
 			goto out_free;
 		}
 
-		bytes = st.st_size;
+		bytes = st.st_size - args.skip;
 	} else
 		bytes = args.size;
 
@@ -214,14 +228,23 @@ static int update_volume(libubi_t libubi, struct ubi_vol_info *vol_info)
 		goto out_free;
 	}
 
-	if (args.use_stdin)
+	if (args.use_stdin) {
 		ifd = STDIN_FILENO;
-	else {
+		if (args.skip) {
+			errmsg("seeking stdin not supported");
+			goto out_close1;
+		}
+	} else {
 		ifd = open(args.img, O_RDONLY);
 		if (ifd == -1) {
 			sys_errmsg("cannot open \"%s\"", args.img);
 			goto out_close1;
 		}
+
+		if (args.skip && lseek(ifd, args.skip, SEEK_CUR) == -1) {
+			sys_errmsg("lseek input by %lld failed", args.skip);
+			goto out_close;
+		}
 	}
 
 	err = ubi_update_start(libubi, fd, bytes);
@@ -231,10 +254,8 @@ static int update_volume(libubi_t libubi, struct ubi_vol_info *vol_info)
 	}
 
 	while (bytes) {
-		int ret, to_copy = vol_info->leb_size;
-
-		if (to_copy > bytes)
-			to_copy = bytes;
+		ssize_t ret;
+		int to_copy = min(vol_info->leb_size, bytes);
 
 		ret = read(ifd, buf, to_copy);
 		if (ret <= 0) {
-- 
1.8.2.1
