Received: from tyo202.gate.nec.co.jp ([202.32.8.206])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9rxy-0004Pd-Ct
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 03:41:41 +0000
Message-ID: <4BE23A6F.1010406@renesas.com>
Date: Thu, 06 May 2010 12:41:35 +0900
From: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
MIME-Version: 1.0
To: Artem.Bityutskiy@nokia.com
Subject: [PATCH] UBI: Fix s/then/than/ typos
References: <4BE23A03.1030001@renesas.com>
In-Reply-To: <4BE23A03.1030001@renesas.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: shinya.kuribayashi.px@renesas.com
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
---
  drivers/mtd/ubi/Kconfig |    2 +-
  drivers/mtd/ubi/io.c    |    2 +-
  drivers/mtd/ubi/kapi.c  |    6 +++---
  drivers/mtd/ubi/scan.c  |    4 ++--
  drivers/mtd/ubi/wl.c    |    2 +-
  5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 0a8c7ea..f702a16 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -27,7 +27,7 @@ config MTD_UBI_WL_THRESHOLD
  	  The default value should be OK for SLC NAND flashes, NOR flashes and
  	  other flashes which have eraseblock life-cycle 100000 or more.
  	  However, in case of MLC NAND flashes which typically have eraseblock
-	  life-cycle less then 10000, the threshold should be lessened (e.g.,
+	  life-cycle less than 10000, the threshold should be lessened (e.g.,
  	  to 128 or 256, although it does not have to be power of 2).
  
  config MTD_UBI_BEB_RESERVE
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 533b1a4..016ec13 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -65,7 +65,7 @@
   *
   * A: because when writing a sub-page, MTD still writes a full 2K page but the
   * bytes which are no relevant to the sub-page are 0xFF. So, basically, writing
- * 4x512 sub-pages is 4 times slower then writing one 2KiB NAND page. Thus, we
+ * 4x512 sub-pages is 4 times slower than writing one 2KiB NAND page. Thus, we
   * prefer to use sub-pages only for EV and VID headers.
   *
   * As it was noted above, the VID header may start at a non-aligned offset.
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 17f287d..69fa4ef 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -488,7 +488,7 @@ EXPORT_SYMBOL_GPL(ubi_leb_write);
   *
   * This function changes the contents of a logical eraseblock atomically. @buf
   * has to contain new logical eraseblock data, and @len - the length of the
- * data, which has to be aligned. The length may be shorter then the logical
+ * data, which has to be aligned. The length may be shorter than the logical
   * eraseblock size, ant the logical eraseblock may be appended to more times
   * later on. This function guarantees that in case of an unclean reboot the old
   * contents is preserved. Returns zero in case of success and a negative error
@@ -571,7 +571,7 @@ EXPORT_SYMBOL_GPL(ubi_leb_erase);
   *
   * This function un-maps logical eraseblock @lnum and schedules the
   * corresponding physical eraseblock for erasure, so that it will eventually be
- * physically erased in background. This operation is much faster then the
+ * physically erased in background. This operation is much faster than the
   * erase operation.
   *
   * Unlike erase, the un-map operation does not guarantee that the logical
@@ -590,7 +590,7 @@ EXPORT_SYMBOL_GPL(ubi_leb_erase);
   *
   * The main and obvious use-case of this function is when the contents of a
   * logical eraseblock has to be re-written. Then it is much more efficient to
- * first un-map it, then write new data, rather then first erase it, then write
+ * first un-map it, then write new data, rather than first erase it, then write
   * new data. Note, once new data has been written to the logical eraseblock,
   * UBI guarantees that the old contents has gone forever. In other words, if an
   * unclean reboot happens after the logical eraseblock has been un-mapped and
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index dc5f688..aed19f3 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -231,7 +231,7 @@ static struct ubi_scan_volume *add_volume(struct ubi_scan_info *si, int vol_id,
   * case of success this function returns a positive value, in case of failure, a
   * negative error code is returned. The success return codes use the following
   * bits:
- *     o bit 0 is cleared: the first PEB (described by @seb) is newer then the
+ *     o bit 0 is cleared: the first PEB (described by @seb) is newer than the
   *       second PEB (described by @pnum and @vid_hdr);
   *     o bit 0 is set: the second PEB is newer;
   *     o bit 1 is cleared: no bit-flips were detected in the newer LEB;
@@ -452,7 +452,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
  
  		if (cmp_res & 1) {
  			/*
-			 * This logical eraseblock is newer then the one
+			 * This logical eraseblock is newer than the one
  			 * found earlier.
  			 */
  			err = validate_vid_hdr(vid_hdr, sv, pnum);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index f64ddab..ee7b1d8 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -350,7 +350,7 @@ static void prot_queue_add(struct ubi_device *ubi, struct ubi_wl_entry *e)
   * @max: highest possible erase counter
   *
   * This function looks for a wear leveling entry with erase counter closest to
- * @max and less then @max.
+ * @max and less than @max.
   */
  static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int max)
  {
-- 
1.7.1
