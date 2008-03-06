Received: from www.tglx.de ([62.245.132.106])
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JXByF-00024L-Kq
	for linux-mtd@lists.infradead.org; Thu, 06 Mar 2008 09:01:00 +0000
Date: Thu, 6 Mar 2008 10:00:50 +0100
From: Sebastian Siewior <bigeasy@tglx.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] [FS] jffs2: check if partition is marked RO on remount
Message-ID: <20080306090050.GA894@www.tglx.de>
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

and if it is, don't tell userspace that write is possible.

Signed-off-by: Sebastian Siewior <bigeasy@linutronix.de>
---
 fs/jffs2/fs.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index e26ea78..a9f474f 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -374,6 +374,9 @@ int jffs2_remount_fs (struct super_block *sb, int *flags, char *data)
 	if (c->flags & JFFS2_SB_FLAG_RO && !(sb->s_flags & MS_RDONLY))
 		return -EROFS;
 
+	if (!(c->mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+
 	/* We stop if it was running, then restart if it needs to.
 	   This also catches the case where it was stopped and this
 	   is just a remount to restart it.
-- 
1.5.3.5
