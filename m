Received: from mail-ew0-f173.google.com ([209.85.219.173])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MBSvF-0004zG-SX
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 12:17:00 +0000
Received: by ewy21 with SMTP id 21so13895977ewy.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Jun 2009 05:16:52 -0700 (PDT)
Sender: =?UTF-8?Q?Gerard_Lled=C3=B3?= <raharu@gmail.com>
From: Gerard Lledo <gerard.lledo@gmail.com>
To: akpm@linux-foundation.org
Subject: [PATCH] [JFFS2] jffs2_start_garbage_collect_thread() return value
	cleanup
Date: Tue,  2 Jun 2009 15:11:26 +0300
Message-Id: <1243944686-7039-2-git-send-email-gerard.lledo@gmail.com>
In-Reply-To: <1243944686-7039-1-git-send-email-gerard.lledo@gmail.com>
References: <20090602113216.GA3513@tank>
	<1243944686-7039-1-git-send-email-gerard.lledo@gmail.com>
Cc: linux-mtd@lists.infradead.org, Gerard Lledo <gerard.lledo@gmail.com>,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no user of this return value in the kernel.  Change it to return void
instead.
---
 fs/jffs2/background.c |    7 +------
 fs/jffs2/os-linux.h   |    2 +-
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index 3ff50da..3ae7e5c 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -30,10 +30,9 @@ void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c)
 }
 
 /* This must only ever be called when no GC thread is currently running */
-int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)
+void jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)
 {
 	struct task_struct *tsk;
-	int ret = 0;
 
 	BUG_ON(c->gc_task);
 
@@ -44,15 +43,11 @@ int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)
 	if (IS_ERR(tsk)) {
 		printk(KERN_WARNING "fork failed for JFFS2 garbage collect thread: %ld\n", -PTR_ERR(tsk));
 		complete(&c->gc_thread_exit);
-		ret = PTR_ERR(tsk);
 	} else {
 		/* Wait for it... */
 		D1(printk(KERN_DEBUG "JFFS2: Garbage collect thread is pid %d\n", tsk->pid));
 		wait_for_completion(&c->gc_thread_start);
-		ret = tsk->pid;
 	}
-
-	return ret;
 }
 
 void jffs2_stop_garbage_collect_thread(struct jffs2_sb_info *c)
diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index 2228380..f3184ac 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -151,7 +151,7 @@ static inline void jffs2_erase_pending_trigger(struct jffs2_sb_info *c)
 }
 
 /* background.c */
-int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c);
+void jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c);
 void jffs2_stop_garbage_collect_thread(struct jffs2_sb_info *c);
 void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c);
 
-- 
1.5.6.5
