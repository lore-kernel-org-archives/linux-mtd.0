Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvT7-0008DB-2H
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:05:55 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 08/17] UBI: fastmap: use ubi_io_{read,
 write}_data() instead of ubi_io_{read, write}()
Date: Mon,  5 Sep 2016 17:04:59 +0200
Message-Id: <1473087908-27862-9-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubi_io_{read,write}_data() are wrappers around ubi_io_{read/write}() that
are used to read/write eraseblock payload data, which is exactly what
fastmap does when calling ubi_io_{read,write}().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/fastmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 1bfb4aeb67d4..7a07b8b53081 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -878,7 +878,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		goto out;
 	}
 
-	ret = ubi_io_read(ubi, fmsb, fm_anchor, ubi->leb_start, sizeof(*fmsb));
+	ret = ubi_io_read_data(ubi, fmsb, fm_anchor, 0, sizeof(*fmsb));
 	if (ret && ret != UBI_IO_BITFLIPS)
 		goto free_fm_sb;
 	else if (ret == UBI_IO_BITFLIPS)
@@ -996,8 +996,8 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		if (sqnum < be64_to_cpu(vh->sqnum))
 			sqnum = be64_to_cpu(vh->sqnum);
 
-		ret = ubi_io_read(ubi, ubi->fm_buf + (ubi->leb_size * i), pnum,
-				  ubi->leb_start, ubi->leb_size);
+		ret = ubi_io_read_data(ubi, ubi->fm_buf + (ubi->leb_size * i),
+				       pnum, 0, ubi->leb_size);
 		if (ret && ret != UBI_IO_BITFLIPS) {
 			ubi_err(ubi, "unable to read fastmap block# %i (PEB: %i, "
 				"err: %i)", i, pnum, ret);
@@ -1311,8 +1311,8 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	}
 
 	for (i = 0; i < new_fm->used_blocks; i++) {
-		ret = ubi_io_write(ubi, fm_raw + (i * ubi->leb_size),
-			new_fm->e[i]->pnum, ubi->leb_start, ubi->leb_size);
+		ret = ubi_io_write_data(ubi, fm_raw + (i * ubi->leb_size),
+					new_fm->e[i]->pnum, 0, ubi->leb_size);
 		if (ret) {
 			ubi_err(ubi, "unable to write fastmap to PEB %i!",
 				new_fm->e[i]->pnum);
-- 
2.7.4
