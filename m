Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI9Ey-0006MA-Cx
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:54:10 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 2/3] ubiformat: remove no-volume-table option
Date: Mon, 14 May 2018 10:53:24 +0200
Message-Id: <20180514085325.6793-3-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20180514085325.6793-1-david.oberhollenzer@sigma-star.at>
References: <20180514085325.6793-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using the -n or --no-volume-table flags, ubiformat can format an mtd device
to a broken UBI that does not attach on a recent kernel. Only very old UBIs
had no volume table.

This patch removes the option entirely from ubiformat.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 ubi-utils/ubiformat.c | 52 ++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 33 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 694ab4c..2ee14eb 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -52,7 +52,6 @@ struct args {
 	unsigned int quiet:1;
 	unsigned int verbose:1;
 	unsigned int override_ec:1;
-	unsigned int novtbl:1;
 	unsigned int manual_subpage;
 	int subpage_size;
 	int vid_hdr_offs;
@@ -82,8 +81,6 @@ static const char optionsstr[] =
 "                             physical eraseblock (default is the next\n"
 "                             minimum I/O unit or sub-page after the EC\n"
 "                             header)\n"
-"-n, --no-volume-table        only erase all eraseblock and preserve erase\n"
-"                             counters, do not write empty volume table\n"
 "-f, --flash-image=<file>     flash image file, or '-' for stdin\n"
 "-S, --image-size=<bytes>     bytes in input, if not reading from file\n"
 "-e, --erase-counter=<value>  use <value> as the erase counter value for all\n"
@@ -114,7 +111,6 @@ static const char usage[] =
 static const struct option long_options[] = {
 	{ .name = "sub-page-size",   .has_arg = 1, .flag = NULL, .val = 's' },
 	{ .name = "vid-hdr-offset",  .has_arg = 1, .flag = NULL, .val = 'O' },
-	{ .name = "no-volume-table", .has_arg = 0, .flag = NULL, .val = 'n' },
 	{ .name = "flash-image",     .has_arg = 1, .flag = NULL, .val = 'f' },
 	{ .name = "image-size",      .has_arg = 1, .flag = NULL, .val = 'S' },
 	{ .name = "yes",             .has_arg = 0, .flag = NULL, .val = 'y' },
@@ -174,10 +170,6 @@ static int parse_opt(int argc, char * const argv[])
 				return errmsg("bad image-size: \"%s\"", optarg);
 			break;
 
-		case 'n':
-			args.novtbl = 1;
-			break;
-
 		case 'y':
 			args.yes = 1;
 			break;
@@ -236,10 +228,6 @@ static int parse_opt(int argc, char * const argv[])
 	else if (optind != argc - 1)
 		return errmsg("more then one MTD device specified (use -h for help)");
 
-	if (args.image && args.novtbl)
-		return errmsg("-n cannot be used together with -f");
-
-
 	args.node = argv[optind];
 	return 0;
 }
@@ -554,7 +542,7 @@ out_close:
 
 static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 		  const struct ubigen_info *ui, struct ubi_scan_info *si,
-		  int start_eb, int novtbl)
+		  int start_eb)
 {
 	int eb, err, write_size;
 	struct ubi_ec_hdr *hdr;
@@ -609,7 +597,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			continue;
 		}
 
-		if ((eb1 == -1 || eb2 == -1) && !novtbl) {
+		if (eb1 == -1 || eb2 == -1) {
 			if (eb1 == -1) {
 				eb1 = eb;
 				ec1 = ec;
@@ -654,24 +642,22 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 	if (!args.quiet && !args.verbose)
 		printf("\n");
 
-	if (!novtbl) {
-		if (eb1 == -1 || eb2 == -1) {
-			errmsg("no eraseblocks for volume table");
-			goto out_free;
-		}
+	if (eb1 == -1 || eb2 == -1) {
+		errmsg("no eraseblocks for volume table");
+		goto out_free;
+	}
 
-		verbose(args.verbose, "write volume table to eraseblocks %d and %d", eb1, eb2);
-		vtbl = ubigen_create_empty_vtbl(ui);
-		if (!vtbl)
-			goto out_free;
+	verbose(args.verbose, "write volume table to eraseblocks %d and %d", eb1, eb2);
+	vtbl = ubigen_create_empty_vtbl(ui);
+	if (!vtbl)
+		goto out_free;
 
-		err = ubigen_write_layout_vol(ui, eb1, eb2, ec1,  ec2, vtbl,
-					      args.node_fd);
-		free(vtbl);
-		if (err) {
-			errmsg("cannot write layout volume");
-			goto out_free;
-		}
+	err = ubigen_write_layout_vol(ui, eb1, eb2, ec1,  ec2, vtbl,
+				args.node_fd);
+	free(vtbl);
+	if (err) {
+		errmsg("cannot write layout volume");
+		goto out_free;
 	}
 
 	free(hdr);
@@ -816,7 +802,7 @@ int main(int argc, char * const argv[])
 		goto out_free;
 	}
 
-	if (si->good_cnt < 2 && (!args.novtbl || args.image)) {
+	if (si->good_cnt < 2) {
 		errmsg("too few non-bad eraseblocks (%d) on mtd%d",
 		       si->good_cnt, mtd.mtd_num);
 		goto out_free;
@@ -916,11 +902,11 @@ int main(int argc, char * const argv[])
 		if (err < 0)
 			goto out_free;
 
-		err = format(libmtd, &mtd, &ui, si, err, 1);
+		err = format(libmtd, &mtd, &ui, si, err);
 		if (err)
 			goto out_free;
 	} else {
-		err = format(libmtd, &mtd, &ui, si, 0, args.novtbl);
+		err = format(libmtd, &mtd, &ui, si, 0);
 		if (err)
 			goto out_free;
 	}
-- 
2.17.0
