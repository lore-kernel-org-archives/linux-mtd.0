Received: from tyo201.gate.nec.co.jp ([202.32.8.193])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9yDc-0003eu-E1
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 10:22:13 +0000
Message-ID: <4BE29851.7040006@renesas.com>
Date: Thu, 06 May 2010 19:22:09 +0900
From: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
MIME-Version: 1.0
To: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] UBI: Misc comment fixes
References: <4BE29771.4050800@renesas.com>
In-Reply-To: <4BE29771.4050800@renesas.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: shinya.kuribayashi.px@renesas.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Note that hunk #1 of the patch fixes two typos; s/no/not/ and s/EV/EC/.

Signed-off-by: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
---

 v2: Incorporate s/EV/EC/ typo, too.

 As UBI comments are beatifully written conforming to 80-char-wide limit,
 I also would like to follow that good practice.

 drivers/mtd/ubi/io.c   |    6 +++---
 drivers/mtd/ubi/vtbl.c |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 016ec13..4b979e3 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -64,9 +64,9 @@
  * device, e.g., make @ubi->min_io_size = 512 in the example above?
  *
  * A: because when writing a sub-page, MTD still writes a full 2K page but the
- * bytes which are no relevant to the sub-page are 0xFF. So, basically, writing
- * 4x512 sub-pages is 4 times slower than writing one 2KiB NAND page. Thus, we
- * prefer to use sub-pages only for EV and VID headers.
+ * bytes which are not relevant to the sub-page are 0xFF. So, basically,
+ * writing 4x512 sub-pages is 4 times slower than writing one 2KiB NAND page.
+ * Thus, we prefer to use sub-pages only for EC and VID headers.
  *
  * As it was noted above, the VID header may start at a non-aligned offset.
  * For example, in case of a 2KiB page NAND flash with a 512 bytes sub-page,
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index cd90ff3..14c10be 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -414,7 +414,7 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 	 * 0 contains more recent information.
 	 *
 	 * So the plan is to first check LEB 0. Then
-	 * a. if LEB 0 is OK, it must be containing the most resent data; then
+	 * a. if LEB 0 is OK, it must be containing the most recent data; then
 	 *    we compare it with LEB 1, and if they are different, we copy LEB
 	 *    0 to LEB 1;
 	 * b. if LEB 0 is corrupted, but LEB 1 has to be OK, and we copy LEB 1
@@ -848,7 +848,7 @@ int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_scan_info *si)
 		goto out_free;
 
 	/*
-	 * Get sure that the scanning information is consistent to the
+	 * Make sure that the scanning information is consistent to the
 	 * information stored in the volume table.
 	 */
 	err = check_scanning_info(ubi, si);
-- 
1.7.1
