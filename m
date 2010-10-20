Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P8Udo-0004Zh-UU
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 09:07:27 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o9K96wGC004018
	for <linux-mtd@lists.infradead.org>; Wed, 20 Oct 2010 12:07:22 +0300
Received: from eru.research.nokia.com (helruo-dhcp022226.ntc.nokia.com
	[172.21.22.226])
	by mgw-da02.ext.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o9K96apx014311
	for <linux-mtd@lists.infradead.org>; Wed, 20 Oct 2010 12:06:37 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] UBI: fix check_data_ff return code
Date: Wed, 20 Oct 2010 12:07:15 +0300
Message-Id: <1287565636-18825-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1287565636-18825-1-git-send-email-dedekind1@gmail.com>
References: <1287565636-18825-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When the data does not contain all 0xFF bytes, 'check_data_ff()' should return
1, not -EINVAL; Also, the caller ('process_eb()') should not add the PEB to the
"corrupted" list if there was a read error.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 2fbb571..e7b800b 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -784,7 +784,7 @@ static int check_data_ff(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 	ubi_dbg_print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
 			       ubi->peb_buf1, ubi->leb_size, 1);
 	mutex_unlock(&ubi->buf_mutex);
-	return -EINVAL;
+	return 1;
 }
 
 /**
@@ -936,7 +936,10 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 			 * have to check what is in the data area.
 			 */
 			err = check_data_ff(ubi, vidh, pnum);
-		if (!err)
+
+		if (err < 0)
+			return err;
+		else if (!err)
 			/* This corruption is caused by a power cut */
 			err = add_to_list(si, pnum, ec, 1, &si->erase);
 		else
-- 
1.7.2.3
