Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6u-0002SL-HA
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:11 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wE5028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/30] UBIFS: rename dbg_check_dir_size function
Date: Thu,  9 Jun 2011 12:04:45 +0300
Message-Id: <1307610310-28691-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Since this function is not only about size checking, rename it to
'dbg_check_dir()'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |    2 +-
 fs/ubifs/debug.h |    4 ++--
 fs/ubifs/super.c |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 4a2170d..26d4c61 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -1177,7 +1177,7 @@ int dbg_check_synced_i_size(struct inode *inode)
  * Note, it is good idea to make sure the @dir->i_mutex is locked before
  * calling this function.
  */
-int dbg_check_dir_size(struct ubifs_info *c, const struct inode *dir)
+int dbg_check_dir(struct ubifs_info *c, const struct inode *dir)
 {
 	unsigned int nlink = 2;
 	union ubifs_key key;
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index c6ad9ea..a51c20b 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -248,7 +248,7 @@ int dbg_check_ltab(struct ubifs_info *c);
 int dbg_chk_lpt_free_spc(struct ubifs_info *c);
 int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len);
 int dbg_check_synced_i_size(struct inode *inode);
-int dbg_check_dir_size(struct ubifs_info *c, const struct inode *dir);
+int dbg_check_dir(struct ubifs_info *c, const struct inode *dir);
 int dbg_check_tnc(struct ubifs_info *c, int extra);
 int dbg_check_idx_size(struct ubifs_info *c, long long idx_size);
 int dbg_check_filesystem(struct ubifs_info *c);
@@ -417,7 +417,7 @@ static inline int dbg_chk_lpt_free_spc(struct ubifs_info *c)      { return 0; }
 static inline int dbg_chk_lpt_sz(struct ubifs_info *c,
 				 int action, int len)             { return 0; }
 static inline int dbg_check_synced_i_size(struct inode *inode)    { return 0; }
-static inline int dbg_check_dir_size(struct ubifs_info *c,
+static inline int dbg_check_dir(struct ubifs_info *c,
 				const struct inode *dir)          { return 0; }
 static inline int dbg_check_tnc(struct ubifs_info *c, int extra)  { return 0; }
 static inline int dbg_check_idx_size(struct ubifs_info *c,
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b5aeb5a..55161c6 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -94,7 +94,7 @@ static int validate_inode(struct ubifs_info *c, const struct inode *inode)
 			   ubifs_compr_name(ui->compr_type));
 	}
 
-	err = dbg_check_dir_size(c, inode);
+	err = dbg_check_dir(c, inode);
 	return err;
 }
 
-- 
1.7.2.3
