Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MSTPK-0004Jd-CB
	for linux-mtd@lists.infradead.org; Sun, 19 Jul 2009 10:14:18 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n6JAE4U7012426
	for <linux-mtd@lists.infradead.org>; Sun, 19 Jul 2009 05:14:07 -0500
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: amend NOR flash pre-erase quirk
Date: Sun, 19 Jul 2009 15:05:55 +0300
Message-Id: <1248005156-18662-2-git-send-email-dedekind@infradead.org>
In-Reply-To: <1248005156-18662-1-git-send-email-dedekind@infradead.org>
References: <1248005156-18662-1-git-send-email-dedekind@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

In case of NOR flash, UBI zeroes EC and VID headers' magic,
in order to detect interrupted erasures. It first zeroes out
the EC magic, then VID magic. However, if a power cut happens
in between, we'll end up with a corrupted EC header and a valid
VID header, in which case UBI accepts the PEB, but prints a
warning. This patch makes sure we first zero out the VID
magic, then the EC magic, not vice versa. This is just a
small amendment to prevent warning messages.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 4cb6992..4e7bcb2 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -480,20 +480,20 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	loff_t addr;
 	uint32_t data = 0;
 
-	addr = (loff_t)pnum * ubi->peb_size;
+	addr = (loff_t)pnum * ubi->peb_size + ubi->vid_hdr_aloffset;
 	err = ubi->mtd->write(ubi->mtd, addr, 4, &written, (void *)&data);
 	if (err) {
 		ubi_err("error %d while writing 4 bytes to PEB %d:%d, written "
-			"%zd bytes", err, pnum, 0, written);
+			"%zd bytes", err, pnum, ubi->vid_hdr_aloffset, written);
 		ubi_dbg_dump_stack();
 		return err;
 	}
 
-	addr += ubi->vid_hdr_aloffset;
+	addr -= ubi->vid_hdr_aloffset;
 	err = ubi->mtd->write(ubi->mtd, addr, 4, &written, (void *)&data);
 	if (err) {
 		ubi_err("error %d while writing 4 bytes to PEB %d:%d, written "
-			"%zd bytes", err, pnum, ubi->vid_hdr_aloffset, written);
+			"%zd bytes", err, pnum, 0, written);
 		ubi_dbg_dump_stack();
 		return err;
 	}
-- 
1.6.0.6
