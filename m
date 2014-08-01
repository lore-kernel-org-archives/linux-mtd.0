Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XDFMB-0002rW-UI
 for linux-mtd@lists.infradead.org; Fri, 01 Aug 2014 16:07:00 +0000
Received: by mail-ig0-f174.google.com with SMTP id c1so1825922igq.7
 for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2014 09:06:37 -0700 (PDT)
From: Jeff Harris <jefftharris@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] jffs2: Re-enable write-buffering after filesystem sync
Date: Fri,  1 Aug 2014 12:06:12 -0400
Message-Id: <1406909172-7219-1-git-send-email-jharris@westell.com>
Cc: Jeff Harris <jharris@westell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A JFFS2 filesystem sync cancels the write buffering dirty work and performs
the flush manually.  However, the flag which indicates that the work is active
is not reset.  Thus, if a sync happens while the work is pending, the flag
will never be reset resulting in future work never being started.  The flag is
now reset under the appropriate lock along with the timer cancellation.

Tested on 3.13.6.

Signed-off-by: Jeff Harris <jharris@westell.com>
---
 fs/jffs2/super.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 0918f0e..263136b 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -101,7 +101,10 @@ static int jffs2_sync_fs(struct super_block *sb, int wait)
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
 
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
+	spin_lock(&c->wbuf_dwork_lock);
 	cancel_delayed_work_sync(&c->wbuf_dwork);
+	c->wbuf_queued = 0;
+	spin_lock(&c->wbuf_dwork_lock);
 #endif
 
 	mutex_lock(&c->alloc_sem);
-- 
1.7.9.5
