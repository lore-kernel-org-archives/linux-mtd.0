Received: from lgeamrelo12.lge.com ([156.147.23.52])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAmO3-0005Ms-Ax
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 00:00:21 +0000
From: Hyunchul Lee <cheol.lee@lge.com>
To: Richard Weinberger <richard@nod.at>
CC: Artem Bityutskiy <dedekind1@gmail.com>, <adrian.hunter@intel.com>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <kernel-team@lge.com>
Subject: [PATCH 1/2] ubifs: Fix inode data budget in ubifs_mknod
Date: Wed, 17 May 2017 08:57:18 +0900
Message-ID: <1494979038-19361-1-git-send-email-cheol.lee@lge.com>
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

Assign inode data budget to budget request correctly.

Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
---
 fs/ubifs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index b777bdd..df67236 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1050,7 +1050,6 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 	int sz_change;
 	int err, devlen = 0;
 	struct ubifs_budget_req req = { .new_ino = 1, .new_dent = 1,
-					.new_ino_d = ALIGN(devlen, 8),
 					.dirtied_ino = 1 };
 	struct fscrypt_name nm;
 
@@ -1068,6 +1067,7 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 		devlen = ubifs_encode_dev(dev, rdev);
 	}
 
+	req.new_ino_d = ALIGN(devlen, 8);
 	err = ubifs_budget_space(c, &req);
 	if (err) {
 		kfree(dev);
-- 
1.9.1
