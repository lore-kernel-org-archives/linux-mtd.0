Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzQ4m-0007UN-TU
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 08:58:02 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2F8vwUb031816
	for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2011 10:57:58 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/7] UBI: allocate erase checking buffer on demand
Date: Tue, 15 Mar 2011 11:00:31 +0200
Message-Id: <1300179636-12183-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1300179636-12183-1-git-send-email-dedekind1@gmail.com>
References: <1300179636-12183-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Instead of using pre-allocated 'ubi->dbg_peb_buf' buffer in
'ubi_dbg_check_all_ff()', dynamically allocate it when needed. The
intend is to get rid of the pre-allocated 'ubi->dbg_peb_buf' buffer
completely. And the need for this arises because we want to change
to dynamic debugging control instead of compile-time control, i.e.,
we are going to kill the CONFIG_MTD_UBI_DEBUG_PARANOID Kconfig
option, which would mean that 'ubi->dbg_peb_buf' is always allocated,
which would be wasteful.

Thus, we are getting rid of 'ubi->dbg_peb_buf', and this is a
preparation for that.

signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index b4d34ba..35da5aa 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1387,35 +1387,40 @@ int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 {
 	size_t read;
 	int err;
+	void *buf;
 	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
 
-	mutex_lock(&ubi->dbg_buf_mutex);
-	err = ubi->mtd->read(ubi->mtd, addr, len, &read, ubi->dbg_peb_buf);
+	buf = __vmalloc(len, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	if (!buf) {
+		ubi_err("cannot allocate memory to check for 0xFFs");
+		return 0;
+	}
+
+	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
 	if (err && err != -EUCLEAN) {
 		ubi_err("error %d while reading %d bytes from PEB %d:%d, "
 			"read %zd bytes", err, len, pnum, offset, read);
 		goto error;
 	}
 
-	err = ubi_check_pattern(ubi->dbg_peb_buf, 0xFF, len);
+	err = ubi_check_pattern(buf, 0xFF, len);
 	if (err == 0) {
 		ubi_err("flash region at PEB %d:%d, length %d does not "
 			"contain all 0xFF bytes", pnum, offset, len);
 		goto fail;
 	}
-	mutex_unlock(&ubi->dbg_buf_mutex);
 
+	vfree(buf);
 	return 0;
 
 fail:
 	ubi_err("paranoid check failed for PEB %d", pnum);
 	ubi_msg("hex dump of the %d-%d region", offset, offset + len);
-	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
-		       ubi->dbg_peb_buf, len, 1);
+	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1, buf, len, 1);
 	err = -EINVAL;
 error:
 	ubi_dbg_dump_stack();
-	mutex_unlock(&ubi->dbg_buf_mutex);
+	vfree(buf);
 	return err;
 }
 
-- 
1.7.2.3
