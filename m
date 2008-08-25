Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KXhvP-0003ZR-Qj
	for linux-mtd@lists.infradead.org; Mon, 25 Aug 2008 19:40:28 +0000
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: allow 'ubiformat' to read from stdin
Date: Mon, 25 Aug 2008 21:09:51 +0200
Message-Id: <1219691391-15149-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1219691391-15149-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1219691391-15149-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch allows to read the image from stdin and adds an
'--image-size' option to specify its size.  'upiupdatevol' has this
feature already and it is useful for 'ubiformat' too.

It adds a read_all() function which reads a block of data. Plain
'read(2)' can fail on

  nc -l -p 1234 | ubiformat -f - -S 25427968

else.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 ubi-utils/new-utils/src/ubiformat.c |   92 ++++++++++++++++++++++++++++------
 1 files changed, 75 insertions(+), 17 deletions(-)

diff --git a/ubi-utils/new-utils/src/ubiformat.c b/ubi-utils/new-utils/src/ubiformat.c
index c2888e0..e705fda 100644
--- a/ubi-utils/new-utils/src/ubiformat.c
+++ b/ubi-utils/new-utils/src/ubiformat.c
@@ -51,6 +51,7 @@ struct args {
 	int subpage_size;
 	int vid_hdr_offs;
 	int ubi_ver;
+	off_t image_sz;
 	long long ec;
 	const char *image;
 	const char *node;
@@ -75,7 +76,8 @@ static const char *optionsstr =
 "                             header)\n"
 "-n, --no-volume-table        only erase all eraseblock and preserve erase\n"
 "                             counters, do not write empty volume table\n"
-"-f, --flash-image=<file>     flash image file\n"
+"-f, --flash-image=<file>     flash image file, or '-' for stdin\n"
+"-S, --image-size=<bytes>     bytes in input, if not reading from file\n"
 "-e, --erase-counter=<value>  use <value> as the erase counter value for all\n"
 "                             eraseblocks\n"
 "-y, --yes                    assume the answer is \"yes\" for all question\n"
@@ -93,7 +95,7 @@ static const char *usage =
 "\t\t\t[--help] [--version] [--yes] [--verbose] [--quiet]\n"
 "\t\t\t[--ec=<value>] [--vid-hdr-offset=<offs>]\n"
 "\t\t\t[--ubi-ver=<num>] [--no-volume-table]\n"
-"\t\t\t[--flash-image=<file>]\n\n"
+"\t\t\t[--flash-image=<file>] [--image-size=<bytes>]\n\n"
 
 "Example 1: " PROGRAM_NAME " /dev/mtd0 -y - format MTD device number 0 and do\n"
 "           not ask questions.\n"
@@ -105,6 +107,7 @@ static const struct option long_options[] = {
 	{ .name = "vid-hdr-offset",  .has_arg = 1, .flag = NULL, .val = 'O' },
 	{ .name = "no-volume-table", .has_arg = 0, .flag = NULL, .val = 'n' },
 	{ .name = "flash-image",     .has_arg = 1, .flag = NULL, .val = 'f' },
+	{ .name = "image-size",      .has_arg = 1, .flag = NULL, .val = 'S' },
 	{ .name = "yes",             .has_arg = 0, .flag = NULL, .val = 'y' },
 	{ .name = "erase-counter",   .has_arg = 1, .flag = NULL, .val = 'e' },
 	{ .name = "quiet",           .has_arg = 0, .flag = NULL, .val = 'q' },
@@ -121,7 +124,7 @@ static int parse_opt(int argc, char * const argv[])
 		int key;
 		char *endp;
 
-		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:", long_options, NULL);
+		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:S:", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -153,6 +156,12 @@ static int parse_opt(int argc, char * const argv[])
 			args.image = optarg;
 			break;
 
+		case 'S':
+			args.image_sz = ubiutils_get_bytes(optarg);
+			if (args.image_sz <= 0)
+				return errmsg("bad image-size: \"%s\"", optarg);
+			break;
+
 		case 'n':
 			args.novtbl = 1;
 			break;
@@ -294,27 +303,75 @@ static int drop_ffs(const struct mtd_info *mtd, const void *buf, int len)
         return len;
 }
 
+static int open_file(const struct mtd_info *mtd, struct ubi_scan_info *si,
+		     off_t *sz)
+{
+	int		fd;
+
+	if (!strcmp(args.image, "-")) {
+		if (args.image_sz == 0)
+			return errmsg("must use '-S' with non-zero value when reading from stdin");
+
+		*sz = args.image_sz;
+		fd  = dup(STDIN_FILENO);
+		if (fd < 0)
+			return sys_errmsg("failed to dup stdin");
+	} else {
+		struct stat st;
+
+		if (stat(args.image, &st))
+			return sys_errmsg("cannot open \"%s\"", args.image);
+
+		*sz = st.st_size;
+		fd  = open(args.image, O_RDONLY);
+		if (fd == -1)
+			return sys_errmsg("cannot open \"%s\"", args.image);
+	}
+
+	return fd;
+}
+
+static int read_all(int fd, void *buf, size_t len)
+{
+	while (len > 0) {
+		ssize_t		l = read(fd, buf, len);
+		if (l == 0)
+			return errmsg("eof reached; %d bytes remaining", len);
+		else if (l > 0) {
+			buf += l;
+			len -= l;
+		} else if (errno == EINTR || errno == EAGAIN)
+			continue;
+		else
+			return sys_errmsg("reading failed; %d bytes remaining", len);
+	}
+
+	return 0;
+}
+
 static int flash_image(const struct mtd_info *mtd, const struct ubigen_info *ui,
 		       struct ubi_scan_info *si)
 {
 	int fd, img_ebs, eb, written_ebs = 0, divisor;
-	struct stat st;
+	off_t	st_size;
 
-	if (stat(args.image, &st))
-		return sys_errmsg("cannot open \"%s\"", args.image);
+	fd = open_file(mtd, si, &st_size);
+	if (fd < 0)
+		return fd;
 
-	img_ebs = st.st_size / mtd->eb_size;
-	if (img_ebs > si->good_cnt)
-		return sys_errmsg("file \"%s\" is too large (%lld bytes)",
-				  args.image, (long long)st.st_size);
+	img_ebs = st_size / mtd->eb_size;
 
-	if (st.st_size % mtd->eb_size)
-		return sys_errmsg("file \"%s\" (size %lld bytes) is not multiple of eraseblock size (%d bytes)",
-				  args.image, (long long)st.st_size, mtd->eb_size);
+	if (img_ebs > si->good_cnt) {
+		sys_errmsg("file \"%s\" is too large (%lld bytes)",
+			   args.image, (long long)st_size);
+		goto out_close;
+	}
 
-	fd = open(args.image, O_RDONLY);
-	if (fd == -1)
-		return sys_errmsg("cannot open \"%s\"", args.image);
+	if (st_size % mtd->eb_size) {
+		return sys_errmsg("file \"%s\" (size %lld bytes) is not multiple of eraseblock size (%d bytes)",
+				  args.image, (long long)st_size, mtd->eb_size);
+		goto out_close;
+	}
 
 	verbose(args.verbose, "will write %d eraseblocks", img_ebs);
 	divisor = img_ebs;
@@ -345,7 +402,8 @@ static int flash_image(const struct mtd_info *mtd, const struct ubigen_info *ui,
 			goto out_close;
 		}
 
-		if (read(fd, buf, mtd->eb_size) != mtd->eb_size) {
+		err = read_all(fd, buf, mtd->eb_size);
+		if (err) {
 			sys_errmsg("failed to read eraseblock %d from \"%s\"",
 				   written_ebs, args.image);
 			goto out_close;
-- 
1.5.5.1
