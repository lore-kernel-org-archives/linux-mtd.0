Received: from www.tglx.de ([62.245.132.106])
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jc4O6-0005aD-0p
	for linux-mtd@lists.infradead.org; Wed, 19 Mar 2008 19:55:50 +0000
Date: Wed, 19 Mar 2008 20:55:38 +0100
From: Sebastian Siewior <bigeasy@tglx.de>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH RESEND] [FS] jffs2: check if partition is marked RO on mount
Message-ID: <20080319195538.GB16728@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>, tglx@linutronix.de,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

and if it is, don't tell userspace that write is possible.

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
