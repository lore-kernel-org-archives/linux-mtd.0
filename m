Received: from www.tglx.de ([62.245.132.106])
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JXBzZ-000251-AC
	for linux-mtd@lists.infradead.org; Thu, 06 Mar 2008 09:02:22 +0000
Date: Thu, 6 Mar 2008 10:02:09 +0100
From: Sebastian Siewior <bigeasy@tglx.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] [FS] jffs2: check if partition is marked RO on mount
Message-ID: <20080306090209.GB894@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

and if it is, don't tell userspace that write is possible. Mount it RO
instead.

Signed-off-by: Sebastian Siewior <bigeasy@linutronix.de>
---
 fs/jffs2/super.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 4677355..e4c9493 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -108,6 +108,9 @@ static int jffs2_fill_super(struct super_block *sb, void *data, int silent)
 #ifdef CONFIG_JFFS2_FS_POSIX_ACL
 	sb->s_flags |= MS_POSIXACL;
 #endif
+	if (!(c->mtd->flags & MTD_WRITEABLE))
+		sb->s_flags |= MS_RDONLY;
+
 	return jffs2_do_fill_super(sb, data, silent);
 }
 
-- 
1.5.3.5
