Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SI45Z-0008Sf-DG
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2012 20:24:27 +0000
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] check xattr data integrity during the scan.
Date: Wed, 11 Apr 2012 22:23:36 +0200
Message-Id: <1334175816-20688-1-git-send-email-jcd@tribudubois.net>
Cc: Jean-Christophe DUBOIS <jcd@tribudubois.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the system was powered off while JFFS2 was creating or moving
(GC) an extended attribute node, it might happen at next reboot
that the node CRC is OK but the data (name and value) might be
incomplete and therefore corrupted.

During the mount scan we need to check the xattr data integrity to
weed out bad ones and keep good ones (whith an earlier version).

Whitout this check the xattr data integrity problem was detected
a lot later and was not cured automatically (-EIO was returned).

Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
---
 fs/jffs2/scan.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 7654e87..91f44d7 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -354,6 +354,16 @@ static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs2_erasebloc
 		return 0;
 	}
 
+	/* we also need to check the xattr data integrity to weed out bad ones */
+	crc = crc32(0, &rx->data[0], rx->name_len + 1 + je16_to_cpu(rx->value_len));
+	if (crc != je32_to_cpu(rx->data_crc)) {
+		JFFS2_WARNING("xattr data CRC failed at %#08x, read=%#08x, calc=%#08x\n",
+			      ofs, je32_to_cpu(rx->data_crc), crc);
+		if ((err = jffs2_scan_dirty_space(c, jeb, je32_to_cpu(rx->totlen))))
+			return err;
+		return 0;
+	}
+
 	xd = jffs2_setup_xattr_datum(c, xid, version);
 	if (IS_ERR(xd))
 		return PTR_ERR(xd);
-- 
1.7.5.4
