Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1XgqfC-0003GP-8Z
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 07:48:58 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] ubiformat: Leave space for fastmap anchor
Date: Wed, 22 Oct 2014 09:48:31 +0200
Message-Id: <1413964111-4048-3-git-send-email-s.hauer@pengutronix.de>
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

The fastmap code needs a free eraseblock in the first 64 erasblocks
to write a fastmap anchor. Since ubiformat continuously writes the
image to the flash the fastmap code won't find a free block and
fastmap will be disabled. With this patch ubiformat skips flashing
a block at the beginning thus allowing the fastmap code to write
an anchor.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 ubi-utils/ubiformat.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 2269cdf..df43df3 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -518,6 +518,7 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 		       const struct ubigen_info *ui, struct ubi_scan_info *si)
 {
 	int fd, img_ebs, eb, written_ebs = 0, divisor, skip_data_read = 0;
+	int fastmap_anchor_done = 0;
 	off_t st_size;
 
 	fd = open_file(&st_size);
@@ -544,6 +545,15 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 		int err;
 		char buf[mtd->eb_size];
 
+		if (!fastmap_anchor_done) {
+			err = write_eraseblock(libmtd, mtd, ui, si, eb, NULL, 0);
+			if (err < 0)
+				goto out_close;
+			if (err == 0)
+				fastmap_anchor_done = 1;
+			continue;
+		}
+
 		if (!args.quiet && !args.verbose) {
 			printf("\r" PROGRAM_NAME ": flashing eraseblock %d -- %2lld %% complete  ",
 			       eb, (long long)(eb + 1) * 100 / divisor);
-- 
2.1.1
