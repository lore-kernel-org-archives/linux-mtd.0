Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1XgqfG-0003Gr-Ht
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 07:49:03 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] ubiformat: Factor out a write_eraseblock function
Date: Wed, 22 Oct 2014 09:48:30 +0200
Message-Id: <1413964111-4048-2-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1413964111-4048-1-git-send-email-s.hauer@pengutronix.de>
References: <1413964111-4048-1-git-send-email-s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The format and the flash_image function share some code. Factor out a
write_erasblock function. This makes the code a bit shorter and makes
it easy to skip flashing a block for fastmap support.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 ubi-utils/ubiformat.c | 241 +++++++++++++++++++++++---------------------------
 1 file changed, 111 insertions(+), 130 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 21409ca..2269cdf 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -415,6 +415,105 @@ static int mark_bad(const struct mtd_dev_info *mtd, struct ubi_scan_info *si, in
 	return consecutive_bad_check(eb);
 }
 
+/*
+ * Write a single eraseblock. When buf is given its content is written to the
+ * eraseblock. When buf is NULL only the ec header is written. Returns 0 on
+ * success, 1 if this block should be skipped or -1 when an error occured.
+ */
+static int write_eraseblock(libmtd_t libmtd, const struct mtd_dev_info *mtd,
+		const struct ubigen_info *ui, struct ubi_scan_info *si, int eb,
+		void *buf, int written_ebs)
+{
+	int err, write_size;
+	struct ubi_ec_hdr *hdr = NULL;
+	long long ec;
+
+	if (args.override_ec)
+		ec = args.ec;
+	else if (si->ec[eb] <= EC_MAX)
+		ec = si->ec[eb] + 1;
+	else
+		ec = si->mean_ec;
+
+	if (args.verbose) {
+		normsg_cont("eraseblock %d: erase", eb);
+		fflush(stdout);
+	}
+
+	err = mtd_erase(libmtd, mtd, args.node_fd, eb);
+	if (err) {
+		if (!args.quiet)
+			printf("\n");
+
+		sys_errmsg("failed to erase eraseblock %d", eb);
+		if (errno != EIO)
+			return -1;
+
+		if (mark_bad(mtd, si, eb))
+			return -1;
+
+		return 1;
+	}
+
+	if (buf) {
+		write_size = mtd->eb_size;
+		err = change_ech((struct ubi_ec_hdr *)buf, ui->image_seq, ec);
+		if (err) {
+			errmsg("bad EC header at eraseblock %d of \"%s\"",
+			       written_ebs, args.image);
+			return -1;
+		}
+		write_size = drop_ffs(mtd, buf, mtd->eb_size);
+	} else {
+		write_size = UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
+		write_size /= mtd->subpage_size;
+		write_size *= mtd->subpage_size;
+
+		hdr = malloc(write_size);
+		if (!hdr)
+			return sys_errmsg("cannot allocate %d bytes of memory", write_size);
+		memset(hdr, 0xFF, write_size);
+
+		ubigen_init_ec_hdr(ui, hdr, ec);
+
+		buf = hdr;
+	}
+
+	if (args.verbose) {
+		printf(", write %sEC %lld\n", hdr ? "" : "data, ", ec);
+		fflush(stdout);
+	}
+
+	err = mtd_write(libmtd, mtd, args.node_fd, eb, 0, buf,
+			write_size, NULL, 0, 0);
+	if (err) {
+		if (!args.quiet && !args.verbose)
+			printf("\n");
+		sys_errmsg("cannot write eraseblock %d", eb);
+
+		if (errno != EIO) {
+			if (args.subpage_size != mtd->min_io_size)
+				normsg("may be sub-page size is "
+				       "incorrect?");
+			err = -1;
+			goto out;
+		}
+
+		err = mtd_torture(libmtd, mtd, args.node_fd, eb);
+		if (err) {
+			if (mark_bad(mtd, si, eb)) {
+				err = -1;
+				goto out;
+			}
+		}
+		err = 1;
+	}
+
+out:
+	free(hdr);
+	return err;
+}
+
 static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 		       const struct ubigen_info *ui, struct ubi_scan_info *si)
 {
@@ -442,9 +541,8 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 	verbose(args.verbose, "will write %d eraseblocks", img_ebs);
 	divisor = img_ebs;
 	for (eb = 0; eb < mtd->eb_cnt; eb++) {
-		int err, new_len;
+		int err;
 		char buf[mtd->eb_size];
-		long long ec;
 
 		if (!args.quiet && !args.verbose) {
 			printf("\r" PROGRAM_NAME ": flashing eraseblock %d -- %2lld %% complete  ",
@@ -457,26 +555,6 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			continue;
 		}
 
-		if (args.verbose) {
-			normsg_cont("eraseblock %d: erase", eb);
-			fflush(stdout);
-		}
-
-		err = mtd_erase(libmtd, mtd, args.node_fd, eb);
-		if (err) {
-			if (!args.quiet)
-				printf("\n");
-			sys_errmsg("failed to erase eraseblock %d", eb);
-
-			if (errno != EIO)
-				goto out_close;
-
-			if (mark_bad(mtd, si, eb))
-				goto out_close;
-
-			continue;
-		}
-
 		if (!skip_data_read) {
 			err = read_all(fd, buf, mtd->eb_size);
 			if (err) {
@@ -487,46 +565,11 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 		}
 		skip_data_read = 0;
 
-		if (args.override_ec)
-			ec = args.ec;
-		else if (si->ec[eb] <= EC_MAX)
-			ec = si->ec[eb] + 1;
-		else
-			ec = si->mean_ec;
-
-		if (args.verbose) {
-			printf(", change EC to %lld", ec);
-			fflush(stdout);
-		}
-
-		err = change_ech((struct ubi_ec_hdr *)buf, ui->image_seq, ec);
-		if (err) {
-			errmsg("bad EC header at eraseblock %d of \"%s\"",
-			       written_ebs, args.image);
+		err = write_eraseblock(libmtd, mtd, ui, si, eb, buf, written_ebs);
+		if (err < 0)
 			goto out_close;
-		}
-
-		if (args.verbose) {
-			printf(", write data\n");
-			fflush(stdout);
-		}
-
-		new_len = drop_ffs(mtd, buf, mtd->eb_size);
-
-		err = mtd_write(libmtd, mtd, args.node_fd, eb, 0, buf, new_len,
-				NULL, 0, 0);
-		if (err) {
-			sys_errmsg("cannot write eraseblock %d", eb);
-
-			if (errno != EIO)
-				goto out_close;
-
-			err = mtd_torture(libmtd, mtd, args.node_fd, eb);
-			if (err) {
-				if (mark_bad(mtd, si, eb))
-					goto out_close;
-			}
 
+		if (err > 0) {
 			/*
 			 * We have to make sure that we do not read next block
 			 * of data from the input image or stdin - we have to
@@ -553,20 +596,11 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 		  const struct ubigen_info *ui, struct ubi_scan_info *si,
 		  int start_eb, int novtbl)
 {
-	int eb, err, write_size;
-	struct ubi_ec_hdr *hdr;
+	int eb, err;
 	struct ubi_vtbl_record *vtbl;
 	int eb1 = -1, eb2 = -1;
 	long long ec1 = -1, ec2 = -1;
 
-	write_size = UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
-	write_size /= mtd->subpage_size;
-	write_size *= mtd->subpage_size;
-	hdr = malloc(write_size);
-	if (!hdr)
-		return sys_errmsg("cannot allocate %d bytes of memory", write_size);
-	memset(hdr, 0xFF, write_size);
-
 	for (eb = start_eb; eb < mtd->eb_cnt; eb++) {
 		long long ec;
 
@@ -579,33 +613,6 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 		if (si->ec[eb] == EB_BAD)
 			continue;
 
-		if (args.override_ec)
-			ec = args.ec;
-		else if (si->ec[eb] <= EC_MAX)
-			ec = si->ec[eb] + 1;
-		else
-			ec = si->mean_ec;
-		ubigen_init_ec_hdr(ui, hdr, ec);
-
-		if (args.verbose) {
-			normsg_cont("eraseblock %d: erase", eb);
-			fflush(stdout);
-		}
-
-		err = mtd_erase(libmtd, mtd, args.node_fd, eb);
-		if (err) {
-			if (!args.quiet)
-				printf("\n");
-
-			sys_errmsg("failed to erase eraseblock %d", eb);
-			if (errno != EIO)
-				goto out_free;
-
-			if (mark_bad(mtd, si, eb))
-				goto out_free;
-			continue;
-		}
-
 		if ((eb1 == -1 || eb2 == -1) && !novtbl) {
 			if (eb1 == -1) {
 				eb1 = eb;
@@ -619,33 +626,9 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			continue;
 		}
 
-		if (args.verbose) {
-			printf(", write EC %lld\n", ec);
-			fflush(stdout);
-		}
-
-		err = mtd_write(libmtd, mtd, args.node_fd, eb, 0, hdr,
-				write_size, NULL, 0, 0);
-		if (err) {
-			if (!args.quiet && !args.verbose)
-				printf("\n");
-			sys_errmsg("cannot write EC header (%d bytes buffer) to eraseblock %d",
-				   write_size, eb);
-
-			if (errno != EIO) {
-				if (args.subpage_size != mtd->min_io_size)
-					normsg("may be sub-page size is incorrect?");
-				goto out_free;
-			}
-
-			err = mtd_torture(libmtd, mtd, args.node_fd, eb);
-			if (err) {
-				if (mark_bad(mtd, si, eb))
-					goto out_free;
-			}
-			continue;
-
-		}
+		err = write_eraseblock(libmtd, mtd, ui, si, eb, NULL, 0);
+		if (err < 0)
+			return -1;
 	}
 
 	if (!args.quiet && !args.verbose)
@@ -654,28 +637,26 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 	if (!novtbl) {
 		if (eb1 == -1 || eb2 == -1) {
 			errmsg("no eraseblocks for volume table");
-			goto out_free;
+			goto out;
 		}
 
 		verbose(args.verbose, "write volume table to eraseblocks %d and %d", eb1, eb2);
 		vtbl = ubigen_create_empty_vtbl(ui);
 		if (!vtbl)
-			goto out_free;
+			goto out;
 
 		err = ubigen_write_layout_vol(ui, eb1, eb2, ec1,  ec2, vtbl,
 					      args.node_fd);
 		free(vtbl);
 		if (err) {
 			errmsg("cannot write layout volume");
-			goto out_free;
+			goto out;
 		}
 	}
 
-	free(hdr);
 	return 0;
 
-out_free:
-	free(hdr);
+out:
 	return -1;
 }
 
-- 
2.1.1
