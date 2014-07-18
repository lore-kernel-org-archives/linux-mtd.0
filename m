Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X8ACR-00012B-M0
 for linux-mtd@lists.infradead.org; Fri, 18 Jul 2014 15:35:56 +0000
Received: by mail-la0-f51.google.com with SMTP id el20so2936486lab.24
 for <linux-mtd@lists.infradead.org>; Fri, 18 Jul 2014 08:35:30 -0700 (PDT)
From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] fs/ubifs/{sb,
 super}.c: drop negativity check on unsigned value
Date: Fri, 18 Jul 2014 18:35:25 +0300
Message-Id: <1405697725-23866-1-git-send-email-andrey.krieger.utkin@gmail.com>
Cc: Andrey Utkin <andrey.krieger.utkin@gmail.com>, adrian.hunter@intel.com,
 dcb314@hotmail.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80581
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 fs/ubifs/sb.c    | 2 +-
 fs/ubifs/super.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 4c37607..c2c3d13 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -447,7 +447,7 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 		goto failed;
 	}
 
-	if (c->default_compr < 0 || c->default_compr >= UBIFS_COMPR_TYPES_CNT) {
+	if (c->default_compr >= UBIFS_COMPR_TYPES_CNT) {
 		err = 13;
 		goto failed;
 	}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index e5bd068..9c59c10 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -75,7 +75,7 @@ static int validate_inode(struct ubifs_info *c, const struct inode *inode)
 		return 1;
 	}
 
-	if (ui->compr_type < 0 || ui->compr_type >= UBIFS_COMPR_TYPES_CNT) {
+	if (ui->compr_type >= UBIFS_COMPR_TYPES_CNT) {
 		ubifs_err("unknown compression type %d", ui->compr_type);
 		return 2;
 	}
-- 
1.8.5.5
