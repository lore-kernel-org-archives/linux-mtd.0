Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MNhwX-0000Of-Qd
	for linux-mtd@lists.infradead.org; Mon, 06 Jul 2009 06:44:57 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Urs Muff <urs_muff@trimble.com>
In-Reply-To: <1246855913.20721.287.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239979018.3390.298.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
	<200905150916.54091.sr@denx.de>
	<C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>
	<1242721105.3623.0.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
	<1246627562.20721.190.camel@localhost.localdomain>
	<1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<1246855913.20721.287.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jul 2009 09:43:55 +0300
Message-Id: <1246862635.20721.291.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nicolas Pitre <nico@cam.org>, Stefan Roese <sr@denx.de>,
	linux-mtd@lists.infradead.org, Eric Holmberg <Eric_Holmberg@trimble.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-07-06 at 07:51 +0300, Artem Bityutskiy wrote:
> > [CCed Nicolas Pitre]
> > 
> > OK, I've written a small user-space program which first fills the NOR
> > flash with an '0x89ABCDEF' pattern, then starts erasing it, and then
> > I cut the power at random point.
> > 
> > And unfortunately the power cut results in eraseblocks which have
> > 0x89ABCDEF at the beginning, and all zeroes at the end. I've attached
> > one example.
> > 
> > So it indeed looks like NOR erasure includes writing zeroes from the
> > end. Unfortunately UBI/UBIFS cannot handle this correctly ATM.
> 
> Although I can easily fix this by writing few zeroes at the beginning of
> the eraseblock _before) erasing it, so that UBI will be happy. But it is
> still interesting whether I may just ask NOR to amend it's embedded
> erase algorithm.

This patch seems to fix the UBI issues Eric and me observed (issue N2).
I'll test the patch for few days, but I couldn't see any problem so far.

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] UBI: fix NOR flash recovery

This commit fixes NOR flash recovery issues observed with Spansion
S29GL512N NOR.

When NOR erases, it first fills PEBs with zeroes, then sets all bytes
to 0xFF. Filling with zeroes starts from the end of the PEB. And when
power is cut, this results in PEBs containing correct EC and VID headers
but corrupted with zeros at the end. This confuses UBI and it mistakinly
accepts these PEBs and associate them with LEBs.

Fis this issue by zeroing EC and VID magics before erasing PEBs, to
make UBI later refuse zem.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |    5 ++++
 drivers/mtd/ubi/io.c    |   58 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/mtd/ubi/ubi.h   |    4 ++-
 3 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 286ed59..4dd4f73 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -657,6 +657,11 @@ static int io_init(struct ubi_device *ubi)
 	if (ubi->mtd->block_isbad && ubi->mtd->block_markbad)
 		ubi->bad_allowed = 1;
 
+	if (ubi->mtd->type == MTD_NORFLASH) {
+		ubi_assert(ubi->mtd->writesize == 1);
+		ubi->nor_flash = 1;
+	}
+
 	ubi->min_io_size = ubi->mtd->writesize;
 	ubi->hdrs_min_io_size = ubi->mtd->writesize >> ubi->mtd->subpage_sft;
 
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index c8edbfd..275e533 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -266,8 +266,8 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	addr = (loff_t)pnum * ubi->peb_size + offset;
 	err = ubi->mtd->write(ubi->mtd, addr, len, &written, buf);
 	if (err) {
-		ubi_err("error %d while writing %d bytes to PEB %d:%d, written"
-			" %zd bytes", err, len, pnum, offset, written);
+		ubi_err("error %d while writing %d bytes to PEB %d:%d, written "
+			"%zd bytes", err, len, pnum, offset, written);
 		ubi_dbg_dump_stack();
 	} else
 		ubi_assert(written == len);
@@ -454,6 +454,54 @@ out:
 }
 
 /**
+ * nor_erase_prepare - prepare a NOR flash PEB for erasure.
+ * @ubi: UBI device description object
+ * @pnum: physical eraseblock number to prepare
+ *
+ * NOR flash, or at least some of them, have peculiar embedded PEB erasure
+ * algorithm: the PEB is first filled with zeroes, then it is erased. And
+ * filling with zeroes starts from the end of the PEB. This was observed with
+ * Spansion S29GL512N NOR flash.
+ *
+ * This means that in case of a power cut we may end up with intact data at the
+ * beginning of the PEB, and all zeroes at the end of PEB. In other words, the
+ * EC and VID headers are OK, but a large chunk of data at the end of PEB is
+ * zeroed. This makes UBI mistakenly treat this PEB as used and associate it
+ * with an LEB, which leads to subsequent failures (e.g., UBIFS fails).
+ *
+ * This function is called before erasing NOR PEBs and it zeroes out EC and VID
+ * magic numbers in order to invalidate them and prevent the failures. Returns
+ * zero in case of success and a negative error code in case of failure.
+ */
+static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
+{
+	int err;
+	size_t written;
+	loff_t addr;
+	uint32_t data = 0;
+
+	addr = (loff_t)pnum * ubi->peb_size;
+	err = ubi->mtd->write(ubi->mtd, addr, 4, &written, &data);
+	if (err) {
+		ubi_err("error %d while writing 4 bytes to PEB %d:0, written "
+			"%zd bytes", err, pnum, 0, written);
+		ubi_dbg_dump_stack();
+		return err;
+	}
+
+	addr += ubi->vid_hdr_aloffset;
+	err = ubi->mtd->write(ubi->mtd, addr, 4, &written, &data);
+	if (err) {
+		ubi_err("error %d while writing 4 bytes to PEB %d:%d, written "
+			"%zd bytes", err, pnum, ubi->vid_hdr_aloffset, written);
+		ubi_dbg_dump_stack();
+		return err;
+	}
+
+	return 0;
+}
+
+/**
  * ubi_io_sync_erase - synchronously erase a physical eraseblock.
  * @ubi: UBI device description object
  * @pnum: physical eraseblock number to erase
@@ -484,6 +532,12 @@ int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture)
 		return -EROFS;
 	}
 
+	if (ubi->nor_flash) {
+		err = nor_erase_prepare(ubi, pnum);
+		if (err)
+			return err;
+	}
+
 	if (torture) {
 		ret = torture_peb(ubi, pnum);
 		if (ret < 0)
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 28acd13..f68cb54 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -372,6 +372,7 @@ struct ubi_wl_entry;
  * @vid_hdr_shift: contains @vid_hdr_offset - @vid_hdr_aloffset
  * @bad_allowed: whether the MTD device admits of bad physical eraseblocks or
  *               not
+ * @nor_flash: non-zero if working on top of NOR flash
  * @mtd: MTD device descriptor
  *
  * @peb_buf1: a buffer of PEB size used for different purposes
@@ -452,7 +453,8 @@ struct ubi_device {
 	int vid_hdr_offset;
 	int vid_hdr_aloffset;
 	int vid_hdr_shift;
-	int bad_allowed;
+	unsigned int bad_allowed:1;
+	unsigned int nor_flash:1;
 	struct mtd_info *mtd;
 
 	void *peb_buf1;
-- 
1.6.0.6

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
