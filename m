Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6v-0002SV-Ar
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:14 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEC028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:03 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/30] UBIFS: amend debugging name check function prototype
Date: Thu,  9 Jun 2011 12:04:52 +0300
Message-Id: <1307610310-28691-13-git-send-email-dedekind1@gmail.com>
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

Add 'struct ubifs_info *c' parameter to the 'dbg_check_name()' debugging
function - it will be needed in one of the following commits where we switch to
debugfs. So this is just a preparation.

Mark parameters as 'const' while on it.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/dir.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index c6cbdd0..d1725a9 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -172,7 +172,9 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 
 #ifdef CONFIG_UBIFS_FS_DEBUG
 
-static int dbg_check_name(struct ubifs_dent_node *dent, struct qstr *nm)
+static int dbg_check_name(const struct ubifs_info *c,
+			  const struct ubifs_dent_node *dent,
+			  const struct qstr *nm)
 {
 	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
 		return 0;
@@ -185,7 +187,7 @@ static int dbg_check_name(struct ubifs_dent_node *dent, struct qstr *nm)
 
 #else
 
-#define dbg_check_name(dent, nm) 0
+#define dbg_check_name(c, dent, nm) 0
 
 #endif
 
@@ -219,7 +221,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 		goto out;
 	}
 
-	if (dbg_check_name(dent, &dentry->d_name)) {
+	if (dbg_check_name(c, dent, &dentry->d_name)) {
 		err = -EINVAL;
 		goto out;
 	}
-- 
1.7.2.3
