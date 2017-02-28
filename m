Received: from lgeamrelo13.lge.com ([156.147.23.53])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cia9y-00067V-Ub
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 05:17:24 +0000
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
CC: Artem Bityutskiy <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>,
 Hyunchul Lee <cheol.lee@lge.com>
Subject: [PATCH 2/3] ubifs: change type of ubifs_inode's compr_type to
 unsigend:16
Date: Tue, 28 Feb 2017 14:16:48 +0900
Message-ID: <1488259008-12510-3-git-send-email-hyc.lee@gmail.com>
In-Reply-To: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
References: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hyunchul Lee <cheol.lee@lge.com>

if new compression is added, UBIFS_COMPR_TYPES_CNT becomes greater than 3.
so type "unsigned:2" of compr_type should be changed.

Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
---
 fs/ubifs/ubifs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index ca72382..2a1e857 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -394,7 +394,7 @@ struct ubifs_inode {
 	unsigned int dirty:1;
 	unsigned int xattr:1;
 	unsigned int bulk_read:1;
-	unsigned int compr_type:2;
+	unsigned int compr_type:16;
 	struct mutex ui_mutex;
 	spinlock_t ui_lock;
 	loff_t synced_i_size;
-- 
1.9.1
