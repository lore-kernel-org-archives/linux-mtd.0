From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Thu, 2 Dec 2010 06:34:01 +0200
Subject: [PATCH] UBI: fix corrupted PEB detection for NOR flash
Message-ID: <mailman.33.1291265162.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

My new shiny code for corrupted PEB detection has NOR specific bug.
We tread PEB as corrupted and preserve it, if

1. EC header is OK.
2. VID header is corrupted.
3. data area is not "all 0xFFs"

In case of NOR we have 'nor_erase_prepare()' quirk, which invalidates
the headers before erasing the PEB. And we invalidate first the VID
header, and then the EC header. So if a power cut happens after we have
invalidated the VID header, but before we have invalidated the EC
header, we end up with a PEB which satisfies the above 3 conditions,
and the scanning code will treat it as corrupted, and will print
scary warnings, wrongly.

This patch fixes the issue by firt invalidating the EC header, then
invalidating the VID header. In case of power cut inbetween, we still
just lose the EC header, and UBI can deal with this situation gracefully.

This patch also adds one irrelevant comment about defining VID header
buffer on stack.

Thanks to Anatolij Gustschin <agust@denx.de> for tracking this down.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Reported-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/mtd/ubi/io.c   |   37 ++++++++++++++++++++++++++++---------
 drivers/mtd/ubi/scan.c |    4 ++++
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index c2960ac..3839253 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -480,12 +480,26 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	size_t written;
 	loff_t addr;
 	uint32_t data = 0;
+	/*
+	 * Note, we cannot generally define VID header buffers on stack,
+	 * because of the way we deal with these buffers (see the heder
+	 * comment). But we know this is NOR-specific piece of code, so we can
+	 * do this. But yes, this is error-prone and we should (pre-)allocate
+	 * VID header buffer instead.
+	 */
 	struct ubi_vid_hdr vid_hdr;
 
-	addr = (loff_t)pnum * ubi->peb_size + ubi->vid_hdr_aloffset;
+	/*
+	 * Note, it is important to first invalidate the EC header, and then
+	 * VID header. Otherwise a power cut may result in valid EC header and
+	 * invalid VID header, then UBI will treat this PEB as corrupted and
+	 * will try to preserve it, print scary warnings. See scan.c header
+	 * comment for more information.
+	 */
+	addr = (loff_t)pnum * ubi->peb_size;
 	err = ubi->mtd->write(ubi->mtd, addr, 4, &written, (void *)&data);
 	if (!err) {
-		addr -= ubi->vid_hdr_aloffset;
+		addr += ubi->vid_hdr_aloffset;
 		err = ubi->mtd->write(ubi->mtd, addr, 4, &written,
 				      (void *)&data);
 		if (!err)
@@ -499,13 +513,18 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	 * In this case we probably anyway have garbage in this PEB.
 	 */
 	err1 = ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
-	if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR)
-		/*
-		 * The VID header is corrupted, so we can safely erase this
-		 * PEB and not afraid that it will be treated as a valid PEB in
-		 * case of an unclean reboot.
-		 */
-		return 0;
+	if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR) {
+		struct ubi_ec_hdr ec_hdr;
+
+		err1 = ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
+		if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR)
+			/*
+			 * The VID and EC headers are corrupted, so we can
+			 * safely erase this PEB and not afraid that it will be
+			 * treated as a valid PEB in case of an unclean reboot.
+			 */
+			return 0;
+	}
 
 	/*
 	 * The PEB contains a valid VID header, but we cannot invalidate it.
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 3c63186..d4b1115 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -951,6 +951,10 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 			 * impossible to distinguish it from a PEB which just
 			 * contains garbage because of a power cut during erase
 			 * operation. So we just schedule this PEB for erasure.
+			 *
+			 * Besides, in case of NOR flash, we deliberatly
+			 * corrupt both headers because NOR flash erasure is
+			 * slow and can start from the end.
 			 */
 			err = 0;
 		else
-- 
1.7.3.2

-- 
Best Regards,
Artem Bityutskiy (???????????????? ??????????)
