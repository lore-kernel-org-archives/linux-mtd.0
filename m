Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DEF-0001GS-Bm
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:04:09 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd-utils: switch ubi and ubifs tools to use common
	strtoX funcs
Date: Fri,  8 Apr 2011 18:07:29 +0300
Message-Id: <1302275249-11962-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1302275249-11962-1-git-send-email-dedekind1@gmail.com>
References: <1302275249-11962-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Instead of using strtol and Co directly, use our share simple_strtoX()
helpers. This is just a cleanup.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 mkfs.ubifs/mkfs.ubifs.c      |   29 ++++++++++++++---------------
 ubi-utils/src/mtdinfo.c      |    7 +++----
 ubi-utils/src/ubiattach.c    |   15 +++++++--------
 ubi-utils/src/ubidetach.c    |   11 +++++------
 ubi-utils/src/ubiformat.c    |   19 +++++++++----------
 ubi-utils/src/ubimkvol.c     |   15 +++++++--------
 ubi-utils/src/ubinfo.c       |   11 +++++------
 ubi-utils/src/ubinize.c      |   19 +++++++++----------
 ubi-utils/src/ubirmvol.c     |    7 +++----
 ubi-utils/src/ubirsvol.c     |   11 +++++------
 ubi-utils/src/ubiupdatevol.c |    7 +++----
 11 files changed, 70 insertions(+), 81 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index a306dd6..8583712 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -520,10 +520,9 @@ static int open_ubi(const char *node)
 
 static int get_options(int argc, char**argv)
 {
-	int opt, i;
+	int i;
 	const char *tbl_file = NULL;
 	struct stat st;
-	char *endp;
 
 	c->fanout = 8;
 	c->orph_lebs = 1;
@@ -539,6 +538,8 @@ static int get_options(int argc, char**argv)
 	c->log_lebs = -1;
 
 	while (1) {
+		int opt, error = 0;
+
 		opt = getopt_long(argc, argv, optstring, longopts, &i);
 		if (opt == -1)
 			break;
@@ -599,27 +600,25 @@ static int get_options(int argc, char**argv)
 			printf("Version " PROGRAM_VERSION "\n");
 			exit(0);
 		case 'g':
-			debug_level = strtol(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg ||
-			    debug_level < 0 || debug_level > 3)
+			debug_level = simple_strtol(optarg, &error);
+			if (error || debug_level < 0 || debug_level > 3)
 				return err_msg("bad debugging level '%s'",
 					       optarg);
 			break;
 		case 'f':
-			c->fanout = strtol(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || c->fanout <= 0)
+			c->fanout = simple_strtol(optarg, &error);
+			if (error || c->fanout <= 0)
 				return err_msg("bad fanout %s", optarg);
 			break;
 		case 'l':
-			c->log_lebs = strtol(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || c->log_lebs <= 0)
+			c->log_lebs = simple_strtol(optarg, &error);
+			if (error || c->log_lebs <= 0)
 				return err_msg("bad count of log LEBs '%s'",
 					       optarg);
 			break;
 		case 'p':
-			c->orph_lebs = strtol(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg ||
-			    c->orph_lebs <= 0)
+			c->orph_lebs = simple_strtol(optarg, &error);
+			if (error || c->orph_lebs <= 0)
 				return err_msg("bad orphan LEB count '%s'",
 					       optarg);
 			break;
@@ -644,9 +643,9 @@ static int get_options(int argc, char**argv)
 				return err_msg("bad compressor name");
 			break;
 		case 'X':
-			c->favor_percent = strtol(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg ||
-			    c->favor_percent <= 0 || c->favor_percent >= 100)
+			c->favor_percent = simple_strtol(optarg, &error);
+			if (error || c->favor_percent <= 0 ||
+			    c->favor_percent >= 100)
 				return err_msg("bad favor LZO percent '%s'",
 					       optarg);
 			break;
diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index 54a039a..c9f6f58 100644
--- a/ubi-utils/src/mtdinfo.c
+++ b/ubi-utils/src/mtdinfo.c
@@ -87,8 +87,7 @@ static const struct option long_options[] = {
 static int parse_opt(int argc, char * const argv[])
 {
 	while (1) {
-		int key;
-		char *endp;
+		int key, error = 0;
 
 		key = getopt_long(argc, argv, "am:uhV", long_options, NULL);
 		if (key == -1)
@@ -104,8 +103,8 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'm':
-			args.mtdn = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.mtdn < 0)
+			args.mtdn = simple_strtoul(optarg, &error);
+			if (error || args.mtdn < 0)
 				return errmsg("bad MTD device number: \"%s\"", optarg);
 
 			break;
diff --git a/ubi-utils/src/ubiattach.c b/ubi-utils/src/ubiattach.c
index d2f191b..9297b56 100644
--- a/ubi-utils/src/ubiattach.c
+++ b/ubi-utils/src/ubiattach.c
@@ -91,8 +91,7 @@ static const struct option long_options[] = {
 static int parse_opt(int argc, char * const argv[])
 {
 	while (1) {
-		int key;
-		char *endp;
+		int key, error = 0;
 
 		key = getopt_long(argc, argv, "p:m:d:O:hV", long_options, NULL);
 		if (key == -1)
@@ -103,22 +102,22 @@ static int parse_opt(int argc, char * const argv[])
 			args.dev = optarg;
 			break;
 		case 'd':
-			args.devn = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.devn < 0)
+			args.devn = simple_strtoul(optarg, &error);
+			if (error || args.devn < 0)
 				return errmsg("bad UBI device number: \"%s\"", optarg);
 
 			break;
 
 		case 'm':
-			args.mtdn = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.mtdn < 0)
+			args.mtdn = simple_strtoul(optarg, &error);
+			if (error || args.mtdn < 0)
 				return errmsg("bad MTD device number: \"%s\"", optarg);
 
 			break;
 
 		case 'O':
-			args.vidoffs = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.vidoffs <= 0)
+			args.vidoffs = simple_strtoul(optarg, &error);
+			if (error || args.vidoffs <= 0)
 				return errmsg("bad VID header offset: \"%s\"", optarg);
 
 			break;
diff --git a/ubi-utils/src/ubidetach.c b/ubi-utils/src/ubidetach.c
index dfd6485..5ee55f1 100644
--- a/ubi-utils/src/ubidetach.c
+++ b/ubi-utils/src/ubidetach.c
@@ -82,8 +82,7 @@ static const struct option long_options[] = {
 static int parse_opt(int argc, char * const argv[])
 {
 	while (1) {
-		int key;
-		char *endp;
+		int key, error = 0;
 
 		key = getopt_long(argc, argv, "p:m:d:hV", long_options, NULL);
 		if (key == -1)
@@ -94,15 +93,15 @@ static int parse_opt(int argc, char * const argv[])
 			args.dev = optarg;
 			break;
 		case 'd':
-			args.devn = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.devn < 0)
+			args.devn = simple_strtoul(optarg, &error);
+			if (error || args.devn < 0)
 				return errmsg("bad UBI device number: \"%s\"", optarg);
 
 			break;
 
 		case 'm':
-			args.mtdn = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.mtdn < 0)
+			args.mtdn = simple_strtoul(optarg, &error);
+			if (error || args.mtdn < 0)
 				return errmsg("bad MTD device number: \"%s\"", optarg);
 
 			break;
diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 098da7d..6e5cdb8 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -134,8 +134,7 @@ static int parse_opt(int argc, char * const argv[])
 	args.image_seq = rand();
 
 	while (1) {
-		int key;
-		char *endp;
+		int key, error = 0;
 		unsigned long int image_seq;
 
 		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:S:", long_options, NULL);
@@ -152,14 +151,14 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'O':
-			args.vid_hdr_offs = strtoul(optarg, &endp, 0);
-			if (args.vid_hdr_offs <= 0 || *endp != '\0' || endp == optarg)
+			args.vid_hdr_offs = simple_strtoul(optarg, &error);
+			if (error || args.vid_hdr_offs <= 0)
 				return errmsg("bad VID header offset: \"%s\"", optarg);
 			break;
 
 		case 'e':
-			args.ec = strtoull(optarg, &endp, 0);
-			if (args.ec < 0 || *endp != '\0' || endp == optarg)
+			args.ec = simple_strtoull(optarg, &error);
+			if (error || args.ec < 0)
 				return errmsg("bad erase counter value: \"%s\"", optarg);
 			if (args.ec >= EC_MAX)
 				return errmsg("too high erase %llu, counter, max is %u", args.ec, EC_MAX);
@@ -189,14 +188,14 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'x':
-			args.ubi_ver = strtoul(optarg, &endp, 0);
-			if (args.ubi_ver < 0 || *endp != '\0' || endp == optarg)
+			args.ubi_ver = simple_strtoul(optarg, &error);
+			if (error || args.ubi_ver < 0)
 				return errmsg("bad UBI version: \"%s\"", optarg);
 			break;
 
 		case 'Q':
-			image_seq = strtoul(optarg, &endp, 0);
-			if (*endp != '\0'  || endp == optarg || image_seq > 0xFFFFFFFF)
+			image_seq = simple_strtoul(optarg, &error);
+			if (error || image_seq > 0xFFFFFFFF)
 				return errmsg("bad UBI image sequence number: \"%s\"", optarg);
 			args.image_seq = image_seq;
 			break;
diff --git a/ubi-utils/src/ubimkvol.c b/ubi-utils/src/ubimkvol.c
index f6e498f..db71e2f 100644
--- a/ubi-utils/src/ubimkvol.c
+++ b/ubi-utils/src/ubimkvol.c
@@ -121,8 +121,7 @@ static int param_sanity_check(void)
 static int parse_opt(int argc, char * const argv[])
 {
 	while (1) {
-		int key;
-		char *endp;
+		int key, error = 1;
 
 		key = getopt_long(argc, argv, "a:n:N:s:S:t:h?Vm", long_options, NULL);
 		if (key == -1)
@@ -145,20 +144,20 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'S':
-			args.lebs = strtoull(optarg, &endp, 0);
-			if (endp == optarg || args.lebs <= 0 || *endp != '\0')
+			args.lebs = simple_strtoull(optarg, &error);
+			if (error || args.lebs <= 0)
 				return errmsg("bad LEB count: \"%s\"", optarg);
 			break;
 
 		case 'a':
-			args.alignment = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.alignment <= 0)
+			args.alignment = simple_strtoul(optarg, &error);
+			if (error || args.alignment <= 0)
 				return errmsg("bad volume alignment: \"%s\"", optarg);
 			break;
 
 		case 'n':
-			args.vol_id = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.vol_id < 0)
+			args.vol_id = simple_strtoul(optarg, &error);
+			if (error || args.vol_id < 0)
 				return errmsg("bad volume ID: " "\"%s\"", optarg);
 			break;
 
diff --git a/ubi-utils/src/ubinfo.c b/ubi-utils/src/ubinfo.c
index 3171e8a..2bfee16 100644
--- a/ubi-utils/src/ubinfo.c
+++ b/ubi-utils/src/ubinfo.c
@@ -89,8 +89,7 @@ static const struct option long_options[] = {
 static int parse_opt(int argc, char * const argv[])
 {
 	while (1) {
-		int key;
-		char *endp;
+		int key, error = 0;
 
 		key = getopt_long(argc, argv, "an:N:d:hV", long_options, NULL);
 		if (key == -1)
@@ -102,8 +101,8 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'n':
-			args.vol_id = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.vol_id < 0)
+			args.vol_id = simple_strtoul(optarg, &error);
+			if (error || args.vol_id < 0)
 				return errmsg("bad volume ID: " "\"%s\"", optarg);
 			break;
 
@@ -112,8 +111,8 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'd':
-			args.devn = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.devn < 0)
+			args.devn = simple_strtoul(optarg, &error);
+			if (error || args.devn < 0)
 				return errmsg("bad UBI device number: \"%s\"", optarg);
 
 			break;
diff --git a/ubi-utils/src/ubinize.c b/ubi-utils/src/ubinize.c
index 4991691..52a193f 100644
--- a/ubi-utils/src/ubinize.c
+++ b/ubi-utils/src/ubinize.c
@@ -159,8 +159,7 @@ static int parse_opt(int argc, char * const argv[])
 	args.image_seq = rand();
 
 	while (1) {
-		int key;
-		char *endp;
+		int key, error = 0;
 		unsigned long int image_seq;
 
 		key = getopt_long(argc, argv, "o:p:m:s:O:e:x:Q:vhV", long_options, NULL);
@@ -199,26 +198,26 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'O':
-			args.vid_hdr_offs = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.vid_hdr_offs < 0)
+			args.vid_hdr_offs = simple_strtoul(optarg, &error);
+			if (error || args.vid_hdr_offs < 0)
 				return errmsg("bad VID header offset: \"%s\"", optarg);
 			break;
 
 		case 'e':
-			args.ec = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.ec < 0)
+			args.ec = simple_strtoul(optarg, &error);
+			if (error || args.ec < 0)
 				return errmsg("bad erase counter value: \"%s\"", optarg);
 			break;
 
 		case 'x':
-			args.ubi_ver = strtoul(optarg, &endp, 0);
-			if (*endp != '\0'  || endp == optarg || args.ubi_ver < 0)
+			args.ubi_ver = simple_strtoul(optarg, &error);
+			if (error || args.ubi_ver < 0)
 				return errmsg("bad UBI version: \"%s\"", optarg);
 			break;
 
 		case 'Q':
-			image_seq = strtoul(optarg, &endp, 0);
-			if (*endp != '\0'  || endp == optarg || image_seq > 0xFFFFFFFF)
+			image_seq = simple_strtoul(optarg, &error);
+			if (error || image_seq > 0xFFFFFFFF)
 				return errmsg("bad UBI image sequence number: \"%s\"", optarg);
 			args.image_seq = image_seq;
 			break;
diff --git a/ubi-utils/src/ubirmvol.c b/ubi-utils/src/ubirmvol.c
index 9e55b02..5a7217a 100644
--- a/ubi-utils/src/ubirmvol.c
+++ b/ubi-utils/src/ubirmvol.c
@@ -89,8 +89,7 @@ static int param_sanity_check(void)
 static int parse_opt(int argc, char * const argv[])
 {
 	while (1) {
-		int key;
-		char *endp;
+		int key, error = 0;
 
 		key = getopt_long(argc, argv, "n:N:h?V", long_options, NULL);
 		if (key == -1)
@@ -99,8 +98,8 @@ static int parse_opt(int argc, char * const argv[])
 		switch (key) {
 
 		case 'n':
-			args.vol_id = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.vol_id < 0) {
+			args.vol_id = simple_strtoul(optarg, &error);
+			if (error || args.vol_id < 0) {
 				errmsg("bad volume ID: " "\"%s\"", optarg);
 				return -1;
 			}
diff --git a/ubi-utils/src/ubirsvol.c b/ubi-utils/src/ubirsvol.c
index 20a1d33..34321b8 100644
--- a/ubi-utils/src/ubirsvol.c
+++ b/ubi-utils/src/ubirsvol.c
@@ -107,8 +107,7 @@ static int param_sanity_check(void)
 static int parse_opt(int argc, char * const argv[])
 {
 	while (1) {
-		int key;
-		char *endp;
+		int key, error = 0;
 
 		key = getopt_long(argc, argv, "s:S:n:N:h?V", long_options, NULL);
 		if (key == -1)
@@ -122,14 +121,14 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'S':
-			args.lebs = strtoull(optarg, &endp, 0);
-			if (endp == optarg || args.lebs <= 0 || *endp != '\0')
+			args.lebs = simple_strtoull(optarg, &error);
+			if (error || args.lebs <= 0)
 				return errmsg("bad LEB count: \"%s\"", optarg);
 			break;
 
 		case 'n':
-			args.vol_id = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.vol_id < 0) {
+			args.vol_id = simple_strtoul(optarg, &error);
+			if (error || args.vol_id < 0) {
 				errmsg("bad volume ID: " "\"%s\"", optarg);
 				return -1;
 			}
diff --git a/ubi-utils/src/ubiupdatevol.c b/ubi-utils/src/ubiupdatevol.c
index 4bf4123..62f140b 100644
--- a/ubi-utils/src/ubiupdatevol.c
+++ b/ubi-utils/src/ubiupdatevol.c
@@ -78,8 +78,7 @@ static const struct option long_options[] = {
 static int parse_opt(int argc, char * const argv[])
 {
 	while (1) {
-		int key;
-		char *endp;
+		int key, error = 0;
 
 		key = getopt_long(argc, argv, "ts:h?V", long_options, NULL);
 		if (key == -1)
@@ -91,8 +90,8 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 's':
-			args.size = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.size < 0)
+			args.size = simple_strtoul(optarg, &error);
+			if (error || args.size < 0)
 				return errmsg("bad size: " "\"%s\"", optarg);
 			break;
 
-- 
1.7.2.3
