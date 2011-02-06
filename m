Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm8Xb-0001xO-Oh
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 17:36:53 +0000
Received: from eru.research.nokia.com (esdhcp034110.research.nokia.com
	[172.21.34.110])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p16Han8A014624
	for <linux-mtd@lists.infradead.org>; Sun, 6 Feb 2011 19:36:49 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/5] UBI: use raw mtd read function in debugging code
Date: Sun,  6 Feb 2011 19:39:10 +0200
Message-Id: <1297013953-28886-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1297013953-28886-1-git-send-email-dedekind1@gmail.com>
References: <1297013953-28886-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This change affects only the debugging code. Namely, use mtd->read()
function instead of ubi_io_read() to avoid bit-flips injection
(ubi_dbg_is_bitflip()) which we do not want on the debugging path.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 339a74f..6f90a65 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1325,10 +1325,12 @@ int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 			int offset, int len)
 {
 	int err, i;
+	size_t read;
+	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
 
 	mutex_lock(&ubi->dbg_buf_mutex);
-	err = ubi_io_read(ubi, ubi->dbg_peb_buf, pnum, offset, len);
-	if (err)
+	err = ubi->mtd->read(ubi->mtd, addr, len, &read, ubi->dbg_peb_buf);
+	if (err && err != -EUCLEAN)
 		goto out_unlock;
 
 	for (i = 0; i < len; i++) {
-- 
1.7.2.3
