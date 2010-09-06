Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsXTr-0000ZO-F5
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 08:55:13 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/13] UBI: change cascade of ifs to switch statements
Date: Mon,  6 Sep 2010 11:54:51 +0300
Message-Id: <1283763293-1882-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1283763293-1882-1-git-send-email-dedekind1@gmail.com>
References: <1283763293-1882-1-git-send-email-dedekind1@gmail.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch improves readability and simplifies scanning code by changing a
long cascade of 'if' statements to a switch statement. This should presumably
be a little faster as well.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |   45 ++++++++++++++++++++++++++++++++-------------
 1 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index a15e9bc..9405e24 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -746,11 +746,18 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 	err = ubi_io_read_ec_hdr(ubi, pnum, ech, 0);
 	if (err < 0)
 		return err;
-	else if (err == UBI_IO_BITFLIPS)
+	switch (err) {
+	case 0:
+		break;
+	case UBI_IO_BITFLIPS:
 		bitflips = 1;
-	else if (err == UBI_IO_FF || err == UBI_IO_FF_BITFLIPS)
+		break;
+	case UBI_IO_FF:
+	case UBI_IO_FF_BITFLIPS:
 		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, &si->erase);
-	else if (err == UBI_IO_BAD_HDR_EBADMSG || err == UBI_IO_BAD_HDR) {
+	case UBI_IO_BAD_HDR_EBADMSG:
+		si->read_err_count += 1;
+	case UBI_IO_BAD_HDR:
 		/*
 		 * We have to also look at the VID header, possibly it is not
 		 * corrupted. Set %bitflips flag in order to make this PEB be
@@ -759,6 +766,10 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		ec_err = err;
 		ec = UBI_SCAN_UNKNOWN_EC;
 		bitflips = 1;
+		break;
+	default:
+		ubi_err("'ubi_io_read_ec_hdr()' returned unknown code %d", err);
+		return -EINVAL;
 	}
 
 	if (!ec_err) {
@@ -814,24 +825,32 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 	err = ubi_io_read_vid_hdr(ubi, pnum, vidh, 0);
 	if (err < 0)
 		return err;
-	else if (err == UBI_IO_BITFLIPS)
+	switch (err) {
+	case 0:
+		break;
+	case UBI_IO_BITFLIPS:
 		bitflips = 1;
-	else if (err == UBI_IO_BAD_HDR_EBADMSG || err == UBI_IO_BAD_HDR ||
-		 (err == UBI_IO_FF && ec_err) || err == UBI_IO_FF_BITFLIPS) {
-		/* VID header is corrupted */
-		if (err == UBI_IO_BAD_HDR_EBADMSG ||
-		    ec_err == UBI_IO_BAD_HDR_EBADMSG)
-			si->read_err_count += 1;
+		break;
+	case UBI_IO_BAD_HDR_EBADMSG:
+		si->read_err_count += 1;
+	case UBI_IO_BAD_HDR:
+	case UBI_IO_FF_BITFLIPS:
 		err = add_to_list(si, pnum, ec, &si->corr);
 		if (err)
 			return err;
 		goto adjust_mean_ec;
-	} else if (err == UBI_IO_FF) {
-		/* No VID header - the physical eraseblock is free */
-		err = add_to_list(si, pnum, ec, &si->free);
+	case UBI_IO_FF:
+		if (ec_err)
+			err = add_to_list(si, pnum, ec, &si->corr);
+		else
+			err = add_to_list(si, pnum, ec, &si->free);
 		if (err)
 			return err;
 		goto adjust_mean_ec;
+	default:
+		ubi_err("'ubi_io_read_vid_hdr()' returned unknown code %d",
+			err);
+		return -EINVAL;
 	}
 
 	vol_id = be32_to_cpu(vidh->vol_id);
-- 
1.7.1.1
