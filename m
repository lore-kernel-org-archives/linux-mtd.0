Received: from m12-15.163.com ([220.181.12.15])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1ZgvXB-0006hi-At
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 14:05:34 +0000
From: Yaowei Bai <bywxiaobai@163.com>
To: viro@zeniv.linux.org.uk,
	dedekind1@gmail.com,
	adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ubifs: remove unnecessary new_valid_dev check
Date: Tue, 29 Sep 2015 21:57:33 +0800
Message-Id: <1443535053-4673-1-git-send-email-bywxiaobai@163.com>
In-Reply-To: <1443446807-4838-1-git-send-email-bywxiaobai@163.com>
References: <1443446807-4838-1-git-send-email-bywxiaobai@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As currently new_valid_dev always returns 1, so new_valid_dev check is not
needed, remove it.

Signed-off-by: Yaowei Bai <bywxiaobai@163.com>
---
 fs/ubifs/dir.c  | 3 ---
 fs/ubifs/misc.h | 9 ++-------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5c27c66..1dd9267 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -787,9 +787,6 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 
 	dbg_gen("dent '%pd' in dir ino %lu", dentry, dir->i_ino);
 
-	if (!new_valid_dev(rdev))
-		return -EINVAL;
-
 	if (S_ISBLK(mode) || S_ISCHR(mode)) {
 		dev = kmalloc(sizeof(union ubifs_dev_desc), GFP_NOFS);
 		if (!dev)
diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index ee7cb5e..8ece6ca 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -155,13 +155,8 @@ static inline int ubifs_wbuf_sync(struct ubifs_wbuf *wbuf)
  */
 static inline int ubifs_encode_dev(union ubifs_dev_desc *dev, dev_t rdev)
 {
-	if (new_valid_dev(rdev)) {
-		dev->new = cpu_to_le32(new_encode_dev(rdev));
-		return sizeof(dev->new);
-	} else {
-		dev->huge = cpu_to_le64(huge_encode_dev(rdev));
-		return sizeof(dev->huge);
-	}
+	dev->new = cpu_to_le32(new_encode_dev(rdev));
+	return sizeof(dev->new);
 }
 
 /**
-- 
1.9.1
