Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsU9I-0001Ht-Oq
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 11:16:45 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, yangds.fnst@cn.fujitsu.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 03/11] Make cli byte parsing from ubi-utils available for all
 tools
Date: Sat, 31 Oct 2015 12:15:52 +0100
Message-Id: <1446290160-30696-4-git-send-email-richard@nod.at>
In-Reply-To: <1446290160-30696-1-git-send-email-richard@nod.at>
References: <1446290160-30696-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Gstir <david@sigma-star.at>

ubiutils_get_bytes(str) parses strings like "12MiB" and returns the value in
bytes. We want this function to be available to all tools not just ubi specific
ones. The function is now simply named parse_bytes

ubiutils_print_bytes() performs the reverse and is now named print_bytes.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 include/common.h                    | 90 +++++++++++++++++++++++++++++++++++
 ubi-utils/include/ubiutils-common.h |  2 -
 ubi-utils/mtdinfo.c                 |  6 +--
 ubi-utils/ubiattach.c               |  6 +--
 ubi-utils/ubiformat.c               |  8 ++--
 ubi-utils/ubimkvol.c                |  6 +--
 ubi-utils/ubinfo.c                  | 10 ++--
 ubi-utils/ubinize.c                 | 10 ++--
 ubi-utils/ubirsvol.c                |  2 +-
 ubi-utils/ubiutils-common.c         | 93 -------------------------------------
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 66 ++------------------------
 11 files changed, 119 insertions(+), 180 deletions(-)

diff --git a/include/common.h b/include/common.h
index fb0ca83..460d2aa 100644
--- a/include/common.h
+++ b/include/common.h
@@ -213,6 +213,96 @@ do { \
 	printf("%s %s\n", PROGRAM_NAME, VERSION); \
 } while (0)
 
+/**
+ * get_multiplier - convert size specifier to an integer multiplier.
+ * @str: the size specifier string
+ *
+ * This function parses the @str size specifier, which may be one of
+ * 'KiB', 'MiB', or 'GiB' into an integer multiplier. Returns positive
+ * size multiplier in case of success and %-1 in case of failure.
+ */
+static inline int get_multiplier(const char *str)
+{
+	if (!str)
+		return 1;
+
+	/* Remove spaces before the specifier */
+	while (*str == ' ' || *str == '\t')
+		str += 1;
+
+	if (!strcmp(str, "KiB"))
+		return 1024;
+	if (!strcmp(str, "MiB"))
+		return 1024 * 1024;
+	if (!strcmp(str, "GiB"))
+		return 1024 * 1024 * 1024;
+
+	return -1;
+}
+
+/**
+ * parse_bytes - convert a string containing amount of bytes into an
+ * integer
+ * @str: string to convert
+ *
+ * This function parses @str which may have one of 'KiB', 'MiB', or 'GiB'
+ * size specifiers. Returns positive amount of bytes in case of success and %-1
+ * in case of failure.
+ */
+static inline long long parse_bytes(const char *str)
+{
+	char *endp;
+	long long bytes = strtoull(str, &endp, 0);
+
+	if (endp == str || bytes < 0)
+		return errmsg("incorrect amount of bytes: \"%s\"\n", str);
+
+	if (*endp != '\0') {
+		int mult = get_multiplier(endp);
+
+		if (mult == -1)
+			return errmsg("bad size specifier: \"%s\" - "
+			        "should be 'KiB', 'MiB' or 'GiB'\n", endp);
+		bytes *= mult;
+	}
+
+	return bytes;
+}
+
+/**
+ * print_bytes - print bytes.
+ * @bytes: variable to print
+ * @bracket: whether brackets have to be put or not
+ *
+ * This is a helper function which prints amount of bytes in a human-readable
+ * form, i.e., it prints the exact amount of bytes following by the approximate
+ * amount of Kilobytes, Megabytes, or Gigabytes, depending on how big @bytes
+ * is.
+ */
+static inline void print_bytes(long long bytes, int bracket)
+{
+	const char *p;
+
+	if (bracket)
+		p = " (";
+	else
+		p = ", ";
+
+	printf("%lld bytes", bytes);
+
+	if (bytes > 1024 * 1024 * 1024)
+		printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
+	else if (bytes > 1024 * 1024)
+		printf("%s%.1f MiB", p, (double)bytes / (1024 * 1024));
+	else if (bytes > 1024 && bytes != 0)
+		printf("%s%.1f KiB", p, (double)bytes / 1024);
+	else
+		return;
+
+	if (bracket)
+		printf(")");
+}
+
 #include "xalloc.h"
 
 #ifdef __cplusplus
diff --git a/ubi-utils/include/ubiutils-common.h b/ubi-utils/include/ubiutils-common.h
index 9762837..a86ca2f 100644
--- a/ubi-utils/include/ubiutils-common.h
+++ b/ubi-utils/include/ubiutils-common.h
@@ -23,8 +23,6 @@
 extern "C" {
 #endif
 
-long long ubiutils_get_bytes(const char *str);
-void ubiutils_print_bytes(long long bytes, int bracket);
 void ubiutils_print_text(FILE *stream, const char *txt, int len);
 int ubiutils_srand(void);
 
diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index a86abd1..e360fcd 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -172,7 +172,7 @@ static void print_ubi_info(const struct mtd_info *mtd_info,
 	printf("Default UBI VID header offset:  %d\n", ui.vid_hdr_offs);
 	printf("Default UBI data offset:        %d\n", ui.data_offs);
 	printf("Default UBI LEB size:           ");
-	ubiutils_print_bytes(ui.leb_size, 0);
+	print_bytes(ui.leb_size, 0);
 	printf("\n");
 	printf("Maximum UBI volumes count:      %d\n", ui.max_volumes);
 }
@@ -306,10 +306,10 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
 	printf("Name:                           %s\n", mtd.name);
 	printf("Type:                           %s\n", mtd.type_str);
 	printf("Eraseblock size:                ");
-	ubiutils_print_bytes(mtd.eb_size, 0);
+	print_bytes(mtd.eb_size, 0);
 	printf("\n");
 	printf("Amount of eraseblocks:          %d (", mtd.eb_cnt);
-	ubiutils_print_bytes(mtd.size, 0);
+	print_bytes(mtd.size, 0);
 	printf(")\n");
 	printf("Minimum input/output unit size: %d %s\n",
 	       mtd.min_io_size, mtd.min_io_size > 1 ? "bytes" : "byte");
diff --git a/ubi-utils/ubiattach.c b/ubi-utils/ubiattach.c
index a7c62d0..a4844fa 100644
--- a/ubi-utils/ubiattach.c
+++ b/ubi-utils/ubiattach.c
@@ -238,11 +238,11 @@ int main(int argc, char * const argv[])
 	}
 
 	printf("UBI device number %d, total %d LEBs (", dev_info.dev_num, dev_info.total_lebs);
-	ubiutils_print_bytes(dev_info.total_bytes, 0);
+	print_bytes(dev_info.total_bytes, 0);
 	printf("), available %d LEBs (", dev_info.avail_lebs);
-	ubiutils_print_bytes(dev_info.avail_bytes, 0);
+	print_bytes(dev_info.avail_bytes, 0);
 	printf("), LEB size ");
-	ubiutils_print_bytes(dev_info.leb_size, 1);
+	print_bytes(dev_info.leb_size, 1);
 	printf("\n");
 
 	libubi_close(libubi);
diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 21409ca..4064da0 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -143,7 +143,7 @@ static int parse_opt(int argc, char * const argv[])
 
 		switch (key) {
 		case 's':
-			args.subpage_size = ubiutils_get_bytes(optarg);
+			args.subpage_size = parse_bytes(optarg);
 			if (args.subpage_size <= 0)
 				return errmsg("bad sub-page size: \"%s\"", optarg);
 			if (!is_power_of_2(args.subpage_size))
@@ -170,7 +170,7 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'S':
-			args.image_sz = ubiutils_get_bytes(optarg);
+			args.image_sz = parse_bytes(optarg);
 			if (args.image_sz <= 0)
 				return errmsg("bad image-size: \"%s\"", optarg);
 			break;
@@ -791,9 +791,9 @@ int main(int argc, char * const argv[])
 
 	if (!args.quiet) {
 		normsg_cont("mtd%d (%s), size ", mtd.mtd_num, mtd.type_str);
-		ubiutils_print_bytes(mtd.size, 1);
+		print_bytes(mtd.size, 1);
 		printf(", %d eraseblocks of ", mtd.eb_cnt);
-		ubiutils_print_bytes(mtd.eb_size, 1);
+		print_bytes(mtd.eb_size, 1);
 		printf(", min. I/O size %d bytes\n", mtd.min_io_size);
 	}
 
diff --git a/ubi-utils/ubimkvol.c b/ubi-utils/ubimkvol.c
index 7c2a234..84cb65a 100644
--- a/ubi-utils/ubimkvol.c
+++ b/ubi-utils/ubimkvol.c
@@ -137,7 +137,7 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 's':
-			args.bytes = ubiutils_get_bytes(optarg);
+			args.bytes = parse_bytes(optarg);
 			if (args.bytes <= 0)
 				return errmsg("bad volume size: \"%s\"", optarg);
 			break;
@@ -278,9 +278,9 @@ int main(int argc, char * const argv[])
 	}
 
 	printf("Volume ID %d, size %d LEBs (", vol_info.vol_id, vol_info.rsvd_lebs);
-	ubiutils_print_bytes(vol_info.rsvd_bytes, 0);
+	print_bytes(vol_info.rsvd_bytes, 0);
 	printf("), LEB size ");
-	ubiutils_print_bytes(vol_info.leb_size, 1);
+	print_bytes(vol_info.leb_size, 1);
 	printf(", %s, name \"%s\", alignment %d\n",
 	       req.vol_type == UBI_DYNAMIC_VOLUME ? "dynamic" : "static",
 	       vol_info.name, vol_info.alignment);
diff --git a/ubi-utils/ubinfo.c b/ubi-utils/ubinfo.c
index cb88f53..bd97198 100644
--- a/ubi-utils/ubinfo.c
+++ b/ubi-utils/ubinfo.c
@@ -211,12 +211,12 @@ static int print_vol_info(libubi_t libubi, int dev_num, int vol_id)
 	printf("Alignment:   %d\n", vol_info.alignment);
 
 	printf("Size:        %d LEBs (", vol_info.rsvd_lebs);
-	ubiutils_print_bytes(vol_info.rsvd_bytes, 0);
+	print_bytes(vol_info.rsvd_bytes, 0);
 	printf(")\n");
 
 	if (vol_info.type == UBI_STATIC_VOLUME) {
 		printf("Data bytes:  ");
-		ubiutils_print_bytes(vol_info.data_bytes, 1);
+		print_bytes(vol_info.data_bytes, 1);
 		printf("\n");
 	}
 	printf("State:       %s\n", vol_info.corrupted ? "corrupted" : "OK");
@@ -240,15 +240,15 @@ static int print_dev_info(libubi_t libubi, int dev_num, int all)
 	printf("ubi%d\n", dev_info.dev_num);
 	printf("Volumes count:                           %d\n", dev_info.vol_count);
 	printf("Logical eraseblock size:                 ");
-	ubiutils_print_bytes(dev_info.leb_size, 0);
+	print_bytes(dev_info.leb_size, 0);
 	printf("\n");
 
 	printf("Total amount of logical eraseblocks:     %d (", dev_info.total_lebs);
-	ubiutils_print_bytes(dev_info.total_bytes, 0);
+	print_bytes(dev_info.total_bytes, 0);
 	printf(")\n");
 
 	printf("Amount of available logical eraseblocks: %d (", dev_info.avail_lebs);
-	ubiutils_print_bytes(dev_info.avail_bytes, 0);
+	print_bytes(dev_info.avail_bytes, 0);
 	printf(")\n");
 
 	printf("Maximum count of volumes                 %d\n", dev_info.max_vol_count);
diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
index 34f465a..e7c0a36 100644
--- a/ubi-utils/ubinize.c
+++ b/ubi-utils/ubinize.c
@@ -176,13 +176,13 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 'p':
-			args.peb_size = ubiutils_get_bytes(optarg);
+			args.peb_size = parse_bytes(optarg);
 			if (args.peb_size <= 0)
 				return errmsg("bad physical eraseblock size: \"%s\"", optarg);
 			break;
 
 		case 'm':
-			args.min_io_size = ubiutils_get_bytes(optarg);
+			args.min_io_size = parse_bytes(optarg);
 			if (args.min_io_size <= 0)
 				return errmsg("bad min. I/O unit size: \"%s\"", optarg);
 			if (!is_power_of_2(args.min_io_size))
@@ -190,7 +190,7 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
 		case 's':
-			args.subpage_size = ubiutils_get_bytes(optarg);
+			args.subpage_size = parse_bytes(optarg);
 			if (args.subpage_size <= 0)
 				return errmsg("bad sub-page size: \"%s\"", optarg);
 			if (!is_power_of_2(args.subpage_size))
@@ -368,7 +368,7 @@ static int read_section(const struct ubigen_info *ui, const char *sname,
 	sprintf(buf, "%s:vol_size", sname);
 	p = iniparser_getstring(args.dict, buf, NULL);
 	if (p) {
-		vi->bytes = ubiutils_get_bytes(p);
+		vi->bytes = parse_bytes(p);
 		if (vi->bytes <= 0)
 			return errmsg("bad \"vol_size\" key value \"%s\" (section \"%s\")",
 				      p, sname);
@@ -397,7 +397,7 @@ static int read_section(const struct ubigen_info *ui, const char *sname,
 
 		normsg_cont("volume size was not specified in section \"%s\", assume"
 			    " minimum to fit image \"%s\"", sname, *img);
-		ubiutils_print_bytes(vi->bytes, 1);
+		print_bytes(vi->bytes, 1);
 		printf("\n");
 	}
 
diff --git a/ubi-utils/ubirsvol.c b/ubi-utils/ubirsvol.c
index c469060..d60cf49 100644
--- a/ubi-utils/ubirsvol.c
+++ b/ubi-utils/ubirsvol.c
@@ -114,7 +114,7 @@ static int parse_opt(int argc, char * const argv[])
 
 		switch (key) {
 		case 's':
-			args.bytes = ubiutils_get_bytes(optarg);
+			args.bytes = parse_bytes(optarg);
 			if (args.bytes <= 0)
 				return errmsg("bad volume size: \"%s\"", optarg);
 			break;
diff --git a/ubi-utils/ubiutils-common.c b/ubi-utils/ubiutils-common.c
index 6609a6b..d9ea3b7 100644
--- a/ubi-utils/ubiutils-common.c
+++ b/ubi-utils/ubiutils-common.c
@@ -34,99 +34,6 @@
 #include <unistd.h>
 #include "common.h"
 
-/**
- * get_multiplier - convert size specifier to an integer multiplier.
- * @str: the size specifier string
- *
- * This function parses the @str size specifier, which may be one of
- * 'KiB', 'MiB', or 'GiB' into an integer multiplier. Returns positive
- * size multiplier in case of success and %-1 in case of failure.
- */
-static int get_multiplier(const char *str)
-{
-	if (!str)
-		return 1;
-
-	/* Remove spaces before the specifier */
-	while (*str == ' ' || *str == '\t')
-		str += 1;
-
-	if (!strcmp(str, "KiB"))
-		return 1024;
-	if (!strcmp(str, "MiB"))
-		return 1024 * 1024;
-	if (!strcmp(str, "GiB"))
-		return 1024 * 1024 * 1024;
-
-	return -1;
-}
-
-/**
- * ubiutils_get_bytes - convert a string containing amount of bytes into an
- * integer
- * @str: string to convert
- *
- * This function parses @str which may have one of 'KiB', 'MiB', or 'GiB'
- * size specifiers. Returns positive amount of bytes in case of success and %-1
- * in case of failure.
- */
-long long ubiutils_get_bytes(const char *str)
-{
-	char *endp;
-	long long bytes = strtoull(str, &endp, 0);
-
-	if (endp == str || bytes < 0) {
-		fprintf(stderr, "incorrect amount of bytes: \"%s\"\n", str);
-		return -1;
-	}
-
-	if (*endp != '\0') {
-		int mult = get_multiplier(endp);
-
-		if (mult == -1) {
-			fprintf(stderr, "bad size specifier: \"%s\" - "
-			        "should be 'KiB', 'MiB' or 'GiB'\n", endp);
-			return -1;
-		}
-		bytes *= mult;
-	}
-
-	return bytes;
-}
-
-/**
- * ubiutils_print_bytes - print bytes.
- * @bytes: variable to print
- * @bracket: whether brackets have to be put or not
- *
- * This is a helper function which prints amount of bytes in a human-readable
- * form, i.e., it prints the exact amount of bytes following by the approximate
- * amount of Kilobytes, Megabytes, or Gigabytes, depending on how big @bytes
- * is.
- */
-void ubiutils_print_bytes(long long bytes, int bracket)
-{
-	const char *p;
-
-	if (bracket)
-		p = " (";
-	else
-		p = ", ";
-
-	printf("%lld bytes", bytes);
-
-	if (bytes > 1024 * 1024 * 1024)
-		printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
-	else if (bytes > 1024 * 1024)
-		printf("%s%.1f MiB", p, (double)bytes / (1024 * 1024));
-	else if (bytes > 1024 && bytes != 0)
-		printf("%s%.1f KiB", p, (double)bytes / 1024);
-	else
-		return;
-
-	if (bracket)
-		printf(")");
-}
 
 /**
  * ubiutils_print_text - print text and fold it.
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index b19646f..8a3baea 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -390,62 +390,6 @@ static int validate_options(void)
 	return 0;
 }
 
-/**
- * get_multiplier - convert size specifier to an integer multiplier.
- * @str: the size specifier string
- *
- * This function parses the @str size specifier, which may be one of
- * 'KiB', 'MiB', or 'GiB' into an integer multiplier. Returns positive
- * size multiplier in case of success and %-1 in case of failure.
- */
-static int get_multiplier(const char *str)
-{
-	if (!str)
-		return 1;
-
-	/* Remove spaces before the specifier */
-	while (*str == ' ' || *str == '\t')
-		str += 1;
-
-	if (!strcmp(str, "KiB"))
-		return 1024;
-	if (!strcmp(str, "MiB"))
-		return 1024 * 1024;
-	if (!strcmp(str, "GiB"))
-		return 1024 * 1024 * 1024;
-
-	return -1;
-}
-
-/**
- * get_bytes - convert a string containing amount of bytes into an
- *             integer.
- * @str: string to convert
- *
- * This function parses @str which may have one of 'KiB', 'MiB', or 'GiB' size
- * specifiers. Returns positive amount of bytes in case of success and %-1 in
- * case of failure.
- */
-static long long get_bytes(const char *str)
-{
-	char *endp;
-	long long bytes = strtoull(str, &endp, 0);
-
-	if (endp == str || bytes < 0)
-		return err_msg("incorrect amount of bytes: \"%s\"", str);
-
-	if (*endp != '\0') {
-		int mult = get_multiplier(endp);
-
-		if (mult == -1)
-			return err_msg("bad size specifier: \"%s\" - "
-				       "should be 'KiB', 'MiB' or 'GiB'", endp);
-		bytes *= mult;
-	}
-
-	return bytes;
-}
-
 static int get_options(int argc, char**argv)
 {
 	int opt, i;
@@ -493,17 +437,17 @@ static int get_options(int argc, char**argv)
 						   root);
 			break;
 		case 'm':
-			c->min_io_size = get_bytes(optarg);
+			c->min_io_size = parse_bytes(optarg);
 			if (c->min_io_size <= 0)
 				return err_msg("bad min. I/O size");
 			break;
 		case 'e':
-			c->leb_size = get_bytes(optarg);
+			c->leb_size = parse_bytes(optarg);
 			if (c->leb_size <= 0)
 				return err_msg("bad LEB size");
 			break;
 		case 'c':
-			c->max_leb_cnt = get_bytes(optarg);
+			c->max_leb_cnt = parse_bytes(optarg);
 			if (c->max_leb_cnt <= 0)
 				return err_msg("bad maximum LEB count");
 			break;
@@ -585,12 +529,12 @@ static int get_options(int argc, char**argv)
 					       optarg);
 			break;
 		case 'j':
-			c->max_bud_bytes = get_bytes(optarg);
+			c->max_bud_bytes = parse_bytes(optarg);
 			if (c->max_bud_bytes <= 0)
 				return err_msg("bad maximum amount of buds");
 			break;
 		case 'R':
-			c->rp_size = get_bytes(optarg);
+			c->rp_size = parse_bytes(optarg);
 			if (c->rp_size < 0)
 				return err_msg("bad reserved bytes count");
 			break;
-- 
2.5.0
