From: Artem Bityutskiy <dedekind@infradead.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Subject: [PATCH v2.1 10/17] JFFS2: do not manipulate s_dirt directly
Date: Fri,  5 Jun 2009 16:05:48 +0300
Message-Id: <1244207155-2092-11-git-send-email-dedekind@infradead.org>
In-Reply-To: <1244207155-2092-1-git-send-email-dedekind@infradead.org>
References: <1244207155-2092-1-git-send-email-dedekind@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

... use new VFS helpers instead.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 fs/jffs2/os-linux.h |    2 +-
 fs/jffs2/super.c    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index 2228380..ad12212 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -147,7 +147,7 @@ void jffs2_nor_wbuf_flash_cleanup(struct jffs2_sb_info *c);
 /* erase.c */
 static inline void jffs2_erase_pending_trigger(struct jffs2_sb_info *c)
 {
-	OFNI_BS_2SFFJ(c)->s_dirt = 1;
+	mark_sb_dirty(OFNI_BS_2SFFJ(c));
 }
 
 /* background.c */
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index f7bfd3a..5b321fa 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -58,7 +58,7 @@ static void jffs2_write_super(struct super_block *sb)
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
 
 	lock_super(sb);
-	sb->s_dirt = 0;
+	mark_sb_clean(sb);
 
 	if (!(sb->s_flags & MS_RDONLY)) {
 		D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
@@ -193,7 +193,7 @@ static void jffs2_put_super (struct super_block *sb)
 
 	lock_kernel();
 
-	if (sb->s_dirt)
+	if (is_sb_dirty(sb))
 		jffs2_write_super(sb);
 
 	mutex_lock(&c->alloc_sem);
-- 
1.6.0.6
