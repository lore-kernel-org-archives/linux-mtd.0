Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjGCO-0008DQ-Gn
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2012 20:47:53 +0000
Received: by yenr9 with SMTP id r9so3489546yen.36
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2012 13:47:50 -0700 (PDT)
From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
To: 
Subject: [PATCH v2] ubifs: Fix build warning
Date: Mon, 25 Jun 2012 17:47:49 -0300
Message-Id: <1340657269-8588-1-git-send-email-aletes.xgr@gmail.com>
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

Use gcc uninitialized_var macro to avoid bogus warning

Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
---
Applies to v3.5-rc4

Changes since v1:
Use uninitialized_var macro

 fs/ubifs/dir.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index a6d42ef..40c2d04 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -41,6 +41,7 @@
  */
 
 #include "ubifs.h"
+#include <linux/compiler.h>
 
 /**
  * inherit_flags - inherit flags of the parent inode.
@@ -969,7 +970,7 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	struct ubifs_budget_req ino_req = { .dirtied_ino = 1,
 			.dirtied_ino_d = ALIGN(old_inode_ui->data_len, 8) };
 	struct timespec time;
-	unsigned int saved_nlink;
+	unsigned int uninitialized_var(saved_nlink);
 
 	/*
 	 * Budget request settings: deletion direntry, new direntry, removing
-- 
1.7.10
