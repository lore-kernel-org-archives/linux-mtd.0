Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PIvda-0002lf-CA
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2010 03:58:19 +0000
Received: by wyf22 with SMTP id 22so2819962wyf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Nov 2010 19:58:16 -0800 (PST)
Date: Thu, 18 Nov 2010 06:58:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [patch] UBI: release locks in check_corruption()
Message-ID: <20101118035804.GM31724@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 45aafd32996e27 "UBI: tighten the corrupted PEB criteria"
introduced some return paths that didn't release the ubi->buf_mutex;

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 3c63186..204345b 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -787,16 +787,15 @@ static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 		 * erased, so it became unstable and corrupted, and should be
 		 * erased.
 		 */
-		return 0;
+		err = 0;
+		goto out_unlock;
 	}
 
 	if (err)
-		return err;
+		goto out_unlock;
 
-	if (ubi_check_pattern(ubi->peb_buf1, 0xFF, ubi->leb_size)) {
-		mutex_unlock(&ubi->buf_mutex);
-		return 0;
-	}
+	if (ubi_check_pattern(ubi->peb_buf1, 0xFF, ubi->leb_size))
+		goto out_unlock;
 
 	ubi_err("PEB %d contains corrupted VID header, and the data does not "
 		"contain all 0xFF, this may be a non-UBI PEB or a severe VID "
@@ -806,8 +805,11 @@ static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 		pnum, ubi->leb_start, ubi->leb_size);
 	ubi_dbg_print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
 			       ubi->peb_buf1, ubi->leb_size, 1);
+	err = 1;
+
+out_unlock:
 	mutex_unlock(&ubi->buf_mutex);
-	return 1;
+	return err;
 }
 
 /**
