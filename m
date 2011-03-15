Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzQ4m-0007UM-TQ
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 08:58:02 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2F8vwui031809
	for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2011 10:57:58 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/7] UBI: allocate write checking buffer on demand
Date: Tue, 15 Mar 2011 11:00:30 +0200
Message-Id: <1300179636-12183-2-git-send-email-dedekind1@gmail.com>
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
'ubi_dbg_check_write()', dynamically allocate it when needed. The
intend is to get rid of the pre-allocated 'ubi->dbg_peb_buf' buffer
completely. And the need for this arises because we want to change
to dynamic debugging control instead of compile-time control, i.e.,
we are going to kill the CONFIG_MTD_UBI_DEBUG_PARANOID Kconfig
option, which would mean that 'ubi->dbg_peb_buf' is always allocated,
which would be wasteful.

Thus, we are getting rid of 'ubi->dbg_peb_buf', and this is a
preparation for that.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c |   24 +++++++++++++++---------
 1 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 889e25c..b4d34ba 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1326,16 +1326,22 @@ int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 {
 	int err, i;
 	size_t read;
+	void *buf1;
 	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
 
-	mutex_lock(&ubi->dbg_buf_mutex);
-	err = ubi->mtd->read(ubi->mtd, addr, len, &read, ubi->dbg_peb_buf);
+	buf1 = __vmalloc(len, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
+	if (!buf1) {
+		ubi_err("cannot allocate memory to check writes");
+		return 0;
+	}
+
+	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf1);
 	if (err && err != -EUCLEAN)
-		goto out_unlock;
+		goto out_free;
 
 	for (i = 0; i < len; i++) {
 		uint8_t c = ((uint8_t *)buf)[i];
-		uint8_t c1 = ((uint8_t *)ubi->dbg_peb_buf)[i];
+		uint8_t c1 = ((uint8_t *)buf1)[i];
 		int dump_len;
 
 		if (c == c1)
@@ -1352,17 +1358,17 @@ int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 		ubi_msg("hex dump of the read buffer from %d to %d",
 			i, i + dump_len);
 		print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
-			       ubi->dbg_peb_buf + i, dump_len, 1);
+			       buf1 + i, dump_len, 1);
 		ubi_dbg_dump_stack();
 		err = -EINVAL;
-		goto out_unlock;
+		goto out_free;
 	}
-	mutex_unlock(&ubi->dbg_buf_mutex);
 
+	vfree(buf1);
 	return 0;
 
-out_unlock:
-	mutex_unlock(&ubi->dbg_buf_mutex);
+out_free:
+	vfree(buf1);
 	return err;
 }
 
-- 
1.7.2.3
