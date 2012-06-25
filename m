Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjB4n-0006pr-3D
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2012 15:19:41 +0000
Received: by ghbf11 with SMTP id f11so3144135ghb.36
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2012 08:19:39 -0700 (PDT)
From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
To: 
Subject: [PATCH] ubifs: Fix build warning
Date: Mon, 25 Jun 2012 12:19:40 -0300
Message-Id: <1340637580-12711-1-git-send-email-aletes.xgr@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Alexandre Pereira da Silva <aletes.xgr@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix:
fs/ubifs/dir.c: In function 'ubifs_rename':
fs/ubifs/dir.c:972:15: warning: 'saved_nlink' may be used uninitialized
in this function

Initilize saved_nlink to 0

Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
---
 fs/ubifs/dir.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index a6d42ef..d5b8cb1e 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -969,7 +969,7 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	struct ubifs_budget_req ino_req = { .dirtied_ino = 1,
 			.dirtied_ino_d = ALIGN(old_inode_ui->data_len, 8) };
 	struct timespec time;
-	unsigned int saved_nlink;
+	unsigned int saved_nlink = 0;
 
 	/*
 	 * Budget request settings: deletion direntry, new direntry, removing
-- 
1.7.10
