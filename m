Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsXTv-0000fF-7n
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 08:55:16 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/13] UBI: rename a local variable
Date: Mon,  6 Sep 2010 11:54:50 +0300
Message-Id: <1283763293-1882-7-git-send-email-dedekind1@gmail.com>
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

Rename local variable 'ec_corr' into 'ec_err' to make the code a little bit
more readable. 'ec_err' is more appropriate because it sounds more like 'error
when EC was read' and it looks more logical because we use it together with
'err'. Just a minor nicification which should improve the rather complex
scanning code.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 6f90807..a15e9bc 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -725,7 +725,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		      int pnum)
 {
 	long long uninitialized_var(ec);
-	int err, bitflips = 0, vol_id, ec_corr = 0;
+	int err, bitflips = 0, vol_id, ec_err = 0;
 
 	dbg_bld("scan PEB %d", pnum);
 
@@ -756,12 +756,12 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		 * corrupted. Set %bitflips flag in order to make this PEB be
 		 * moved and EC be re-created.
 		 */
-		ec_corr = err;
+		ec_err = err;
 		ec = UBI_SCAN_UNKNOWN_EC;
 		bitflips = 1;
 	}
 
-	if (!ec_corr) {
+	if (!ec_err) {
 		int image_seq;
 
 		/* Make sure UBI version is OK */
@@ -817,10 +817,10 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 	else if (err == UBI_IO_BITFLIPS)
 		bitflips = 1;
 	else if (err == UBI_IO_BAD_HDR_EBADMSG || err == UBI_IO_BAD_HDR ||
-		 (err == UBI_IO_FF && ec_corr) || err == UBI_IO_FF_BITFLIPS) {
+		 (err == UBI_IO_FF && ec_err) || err == UBI_IO_FF_BITFLIPS) {
 		/* VID header is corrupted */
 		if (err == UBI_IO_BAD_HDR_EBADMSG ||
-		    ec_corr == UBI_IO_BAD_HDR_EBADMSG)
+		    ec_err == UBI_IO_BAD_HDR_EBADMSG)
 			si->read_err_count += 1;
 		err = add_to_list(si, pnum, ec, &si->corr);
 		if (err)
@@ -870,7 +870,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		}
 	}
 
-	if (ec_corr)
+	if (ec_err)
 		ubi_warn("valid VID header but corrupted EC header at PEB %d",
 			 pnum);
 	err = ubi_scan_add_used(ubi, si, pnum, ec, vidh, bitflips);
@@ -878,7 +878,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		return err;
 
 adjust_mean_ec:
-	if (!ec_corr) {
+	if (!ec_err) {
 		si->ec_sum += ec;
 		si->ec_count += 1;
 		if (ec > si->max_ec)
-- 
1.7.1.1
