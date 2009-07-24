Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUJSt-0007Re-RO
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 12:01:37 +0000
Subject: Re: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <4A69596F.8070300@gmail.com>
References: <1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<1246855913.20721.287.camel@localhost.localdomain>
	<1246862635.20721.291.camel@localhost.localdomain>
	<1246949184.20721.302.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB703AA85C0@usw-am-xch-02.am.trimblecorp.net>
	<20090715205217.GH3056@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB703B47FC9@usw-am-xch-02.am.trimblecorp.net>
	<4A69596F.8070300@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Jul 2009 15:00:25 +0300
Message-Id: <1248436825.24676.70.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jamie Lokier <jamie@shareable.org>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@Trimble.com>, Stefan Roese <sr@denx.de>,
	Nicolas Pitre <nico@cam.org>, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-24 at 09:49 +0300, Artem Bityutskiy wrote:
> Further tests revealed that the fix needs some tweaks.
> 
> I get the following error with the latest UBI containing that "write before
> erase" change:
> 
> UBI: background thread "ubi_bgt0d" started, PID 736
> MTD do_write_buffer(): software timeout
> UBI error: nor_erase_prepare: error -5 while writing 4 bytes to PEB 365:64, written 0 bytes
> Call Trace:
> [cfa07ec0] [c0006cf8] show_stack+0x44/0x16c (unreliable)
> [cfa07f00] [c01b8004] ubi_io_sync_erase+0x234/0x39c
> [cfa07f40] [c01b92d4] erase_worker+0x8c/0x4b8
> [cfa07f70] [c01b894c] do_work+0xac/0x124
> [cfa07f90] [c01b9b90] ubi_thread+0xc0/0x138
> [cfa07fd0] [c0038ab0] kthread+0x4c/0x88
> [cfa07ff0] [c000eb38] kernel_thread+0x4c/0x68
> 
> So apparently it is possible to put NOR to the state when you cannot write
> to it. I wonder if this is SW bug or a HW feature.

OK, I've fixed this by:
1. Not panicking when the UBI headers cannot be invalidated because of
   write failures.
2. Reading the flash and making sure the VID header is anyway corrupted.
3. If it is corrupted, everything is fine and we proceed.
4. If it is not, we panic. Presumably this should not happen, but I'm
   not sure. Anyway, these changes let me proceed further. The patches
   I used are inlined. I've also pushed them to ubi-2.6.git/master.

>From 5088eafafc6c948a29b8371731efe373d034d989 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Fri, 24 Jul 2009 15:31:33 +0300
Subject: [PATCH] UBI: introduce flash dump helper

Useful for debugging problems, compiled in only if UBI debugging
is enabled. This patch also makes the UBI writing function dump
the flash if it fails to write.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/debug.c |   32 ++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/debug.h |    2 ++
 drivers/mtd/ubi/io.c    |    1 +
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 54b0186..4876977 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -196,4 +196,36 @@ void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req)
 	printk(KERN_DEBUG "\t1st 16 characters of name: %s\n", nm);
 }
 
+/**
+ * ubi_dbg_dump_flash - dump a region of flash.
+ * @ubi: UBI device description object
+ * @pnum: the physical eraseblock number to dump
+ * @offset: the starting offset within the physical eraseblock to dump
+ * @len: the length of the region to dump
+ */
+void ubi_dbg_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len)
+{
+	int err;
+	size_t read;
+	void *buf;
+	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
+
+	buf = vmalloc(len);
+	if (!buf)
+		return;
+	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
+	if (err && err != -EUCLEAN) {
+		ubi_err("error %d while reading %d bytes from PEB %d:%d, "
+			"read %zd bytes", err, len, pnum, offset, read);
+		goto out;
+	}
+
+	dbg_msg("dumping %d bytes of data from PEB %d, offset %d",
+		len, pnum, offset);
+	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1, buf, len, 1);
+out:
+	vfree(buf);
+	return;
+}
+
 #endif /* CONFIG_MTD_UBI_DEBUG */
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index a4da7a0..f30bcb3 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -55,6 +55,7 @@ void ubi_dbg_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
 void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv);
 void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb, int type);
 void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req);
+void ubi_dbg_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len);
 
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG
 /* General debugging messages */
@@ -167,6 +168,7 @@ static inline int ubi_dbg_is_erase_failure(void)
 #define ubi_dbg_dump_sv(sv)              ({})
 #define ubi_dbg_dump_seb(seb, type)      ({})
 #define ubi_dbg_dump_mkvol_req(req)      ({})
+#define ubi_dbg_dump_flash(ubi, pnum, offset, len) ({})
 
 #define UBI_IO_DEBUG               0
 #define DBG_DISABLE_BGT            0
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 4e7bcb2..b693138 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -269,6 +269,7 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		ubi_err("error %d while writing %d bytes to PEB %d:%d, written "
 			"%zd bytes", err, len, pnum, offset, written);
 		ubi_dbg_dump_stack();
+		ubi_dbg_dump_flash(ubi, pnum, offset, len);
 	} else
 		ubi_assert(written == len);
 
-- 
1.6.0.6


>From d89852b4f75eec9d270d446b164ce12e77b50e50 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Fri, 24 Jul 2009 16:18:04 +0300
Subject: [PATCH] UBI: improve NOR flash erasure quirk

More testing of NOR flash against power cuts showed that sometimes
eraseblocks may be unwritable, and we cannot really invalidate
them before erasure. But in this case the eraseblock probably
contains garbage anyway, and we do not have to invalidate the
headers. This assumption might be not true, but this is at least
what I have observed. So if we cannot invalidate the headers,
we make sure that the PEB does not contain valid VID header.
If this is true, everything is fine, otherwise we panic.
---
 drivers/mtd/ubi/io.c |   48 ++++++++++++++++++++++++++++++++----------------
 1 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index b693138..8aa51e7 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -476,30 +476,46 @@ out:
  */
 static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 {
-	int err;
+	int err, err1;
 	size_t written;
 	loff_t addr;
 	uint32_t data = 0;
+	struct ubi_vid_hdr vid_hdr;
 
 	addr = (loff_t)pnum * ubi->peb_size + ubi->vid_hdr_aloffset;
 	err = ubi->mtd->write(ubi->mtd, addr, 4, &written, (void *)&data);
-	if (err) {
-		ubi_err("error %d while writing 4 bytes to PEB %d:%d, written "
-			"%zd bytes", err, pnum, ubi->vid_hdr_aloffset, written);
-		ubi_dbg_dump_stack();
-		return err;
+	if (!err) {
+		addr -= ubi->vid_hdr_aloffset;
+		err = ubi->mtd->write(ubi->mtd, addr, 4, &written,
+				      (void *)&data);
+		if (!err)
+			return 0;
 	}
 
-	addr -= ubi->vid_hdr_aloffset;
-	err = ubi->mtd->write(ubi->mtd, addr, 4, &written, (void *)&data);
-	if (err) {
-		ubi_err("error %d while writing 4 bytes to PEB %d:%d, written "
-			"%zd bytes", err, pnum, 0, written);
-		ubi_dbg_dump_stack();
-		return err;
-	}
+	/*
+	 * We failed to write to the media. This was observed with Spansion
+	 * S29GL512N NOR flash. Most probably the eraseblock erasure was
+	 * interrupted at a very inappropriate moment, so it became unwritable.
+	 * In this case we probably anyway have garbage in this PEB.
+	 */
+	err1 = ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
+	if (err1 == UBI_IO_BAD_VID_HDR)
+		/*
+		 * The VID header is corrupted, so we can safely erase this
+		 * PEB and not afraid that it will be treated as a valid PEB in
+		 * case of an unclean reboot.
+		 */
+		return 0;
 
-	return 0;
+	/*
+	 * The PEB contains a valid VID header, but we cannot invalidate it.
+	 * Supposedly the flash media or the driver is screwed up, so return an
+	 * error.
+	 */
+	ubi_err("cannot invalidate PEB %d, write returned %d read returned %d",
+		pnum, err, err1);
+	ubi_dbg_dump_flash(ubi, pnum, 0, ubi->peb_size);
+	return -EIO;
 }
 
 /**
-- 
1.6.0.6

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
