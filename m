Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JyNOK-0007yJ-Vz
	for linux-mtd@lists.infradead.org; Tue, 20 May 2008 08:40:17 +0000
Date: Tue, 20 May 2008 18:39:57 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: ubiupdatevol from pipe/compressed file
Message-ID: <20080520083957.GA29998@cloud.net.au>
References: <20080519084746.GA19325@cloud.net.au>
	<1211187241.27243.40.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1211187241.27243.40.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 19, 2008 at 11:54:01AM +0300, Artem Bityutskiy wrote:
> On Mon, 2008-05-19 at 18:47 +1000, Hamish Moffatt wrote:
> > Alternatively allow the uncompressed file size to be specified as a
> > ubiupdatevol parameter. In my application I can store the uncompressed
> > file size and provide it to ubiupdatevol ok.
> 
> Yeah, I think it is reasonable to add one more option and pass the size
> there. Then it could be easy to teach ubiupdatevol to read the specified
> amount of bytes from stdin.

Here's a patch for ubiupdatevol. It contains 3 changes;

1. Adds -s/--size switch;
2. Allows the image file to be specified as '-', meaning stdin; if used,
the size must be specified.

3. In ubi_update_volume(), the code assumed that a read() requesting a
whole LEB worth of data would always return the amount requested.
However read() is allowed to return less than that, and does in some
cases eg reading from a pipe. I modified it to call read() in a loop
until it had a whole LEB worth of data.

Actually, it looks like the kernel (drivers/mtd/ubi/upd.c) doesn't
require the data in whole LEB chunks anyway, so this code could be
revert with the check for a whole LEB worth of read() removed. I can
send an updated patch tomorrow.

My ubiupdatevol.c original may be out of date. If so I can rebase
tomorrow.

Hamish


Index: ubi-utils/new-utils/src/ubiupdatevol.c
===================================================================
--- ubi-utils/new-utils/src/ubiupdatevol.c	(revision 4575)
+++ ubi-utils/new-utils/src/ubiupdatevol.c	(working copy)
@@ -48,6 +48,8 @@
 	int devn;
 	char dev_name[256];
 	int broken_update;
+	size_t size;
+	int use_stdin;
 };
 
 static struct args args = {
@@ -62,6 +64,7 @@
 "-t, --truncate             truncate volume (wipe it out)\n"
 "-h, --help                 print help message\n"
 "-V, --version              print program version\n\n"
+"-s, --size=<bytes>         bytes in input, if not reading from file\n"
 "The following are compatibility options which are deprecated, do not use them\n"
 "-d, --devn=<devn>          UBI device number - may be used instead of the UBI\n"
 "                           device node name in which case the utility assumes\n"
@@ -69,7 +72,7 @@
 "-B, --broken-update        broken update, this is for testing";
 
 static const char *usage =
-"Usage: " PROGRAM_NAME " <UBI volume node file name> [-t] [-h] [-V] [--truncate] [--help]\n"
+"Usage: " PROGRAM_NAME " <UBI volume node file name> [-t] [-h] [-V] [--truncate] [--size=x] [--help]\n"
 "\t\t\t[--version] <image file>\n\n"
 "Example 1: " PROGRAM_NAME " /dev/ubi0_1 fs.img - write file \"fs.img\" to UBI volume /dev/ubi0_1\n"
 "Example 2: " PROGRAM_NAME " /dev/ubi0_1 -t - wipe out UBI volume /dev/ubi0_1";
@@ -78,6 +81,7 @@
 	{ .name = "truncate", .has_arg = 0, .flag = NULL, .val = 't' },
 	{ .name = "help",     .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",  .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "size",     .has_arg = 1, .flag = NULL, .val = 's' },
 	/* Deprecated -d and -B options */
 	{ .name = "devn",     .has_arg = 1, .flag = NULL, .val = 'd' },
 	{ .name = "broken-update", .has_arg = 1, .flag = NULL, .val = 'B' },
@@ -89,7 +93,7 @@
 	while (1) {
 		int key;
 
-		key = getopt_long(argc, argv, "n:th?Vd:", long_options, NULL);
+		key = getopt_long(argc, argv, "n:th?Vd:s:", long_options, NULL);
 		if (key == -1)
 			break;
 
@@ -98,6 +102,15 @@
 			args.truncate = 1;
 			break;
 
+		case 's':
+		{
+			char *endp;
+			args.size = strtoul(optarg, &endp, 0);
+			if (*endp != '\0' || endp == optarg || args.size < 0)
+				return errmsg("bad size: " "\"%s\"", optarg);
+			break;
+		}
+
 		case 'h':
 		case '?':
 			fprintf(stderr, "%s\n\n", doc);
@@ -151,6 +164,11 @@
 	args.node = argv[optind];
 	args.img  = argv[optind + 1];
 
+	if (strcmp(args.img, "-") == 0)
+		args.use_stdin = 1;
+	if (args.use_stdin && !args.size)
+		return errmsg("file size must be specified if input is stdin");
+
 	return 0;
 }
 
@@ -202,20 +220,24 @@
 {
 	int err, fd, ifd;
 	long long bytes;
-	struct stat st;
 	char *buf;
 
 	buf = malloc(vol_info->leb_size);
 	if (!buf)
 		return errmsg("cannot allocate %d bytes of memory", vol_info->leb_size);
 
-	err = stat(args.img, &st);
-	if (err < 0) {
-		errmsg("stat failed on \"%s\"", args.img);
-		goto out_free;
-	}
+	if (!args.size) {
+		struct stat st;
+		err = stat(args.img, &st);
+		if (err < 0) {
+			errmsg("stat failed on \"%s\"", args.img);
+			goto out_free;
+		}
 
-	bytes = st.st_size;
+		bytes = st.st_size;
+	} else
+		bytes = args.size;
+
 	if (bytes > vol_info->rsvd_bytes) {
 		errmsg("\"%s\" (size %lld) will not fit volume \"%s\" (size %lld)",
 		       args.img, bytes, args.node, vol_info->rsvd_bytes);
@@ -232,10 +254,14 @@
 		goto out_free;
 	}
 
-	ifd = open(args.img, O_RDONLY);
-	if (ifd == -1) {
-		sys_errmsg("cannot open \"%s\"", args.img);
-		goto out_close1;
+	if (args.use_stdin)
+		ifd = STDIN_FILENO;
+	else {
+		ifd = open(args.img, O_RDONLY);
+		if (ifd == -1) {
+			sys_errmsg("cannot open \"%s\"", args.img);
+			goto out_close1;
+		}
 	}
 
 	err = ubi_update_start(libubi, fd, bytes);
@@ -246,19 +272,26 @@
 
 	while (bytes) {
 		int tocopy = vol_info->leb_size;
+		int pos, ret;
 
 		if (tocopy > bytes)
 			tocopy = bytes;
 
-		err = read(ifd, buf, tocopy);
-		if (err != tocopy) {
-			if (errno == EINTR) {
-				warnmsg("do not interrupt me!");
-				continue;
+		pos = 0;
+
+		while (pos < tocopy) {
+			ret = read(ifd, &buf[pos], tocopy - pos);
+			if (ret <= 0) {
+				if (errno == EINTR) {
+					warnmsg("do not interrupt me!");
+					continue;
+				} else {
+					sys_errmsg("cannot read %d bytes from \"%s\"",
+							tocopy, args.img);
+					goto out_close;
+				}
 			} else {
-				sys_errmsg("cannot read %d bytes from \"%s\"",
-					   tocopy, args.img);
-				goto out_close;
+				pos += ret;
 			}
 		}
 
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
