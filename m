Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiRMq-0000Ab-Tg
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2015 18:17:09 +0000
Date: Sat, 3 Oct 2015 20:13:38 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Felipe Balbi <balbi@ti.com>,
 Markus Pargmann <mpa@pengutronix.de>, Tejun Heo <tj@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] signal: introduce kernel_signal_stop() to fix
 jffs2_garbage_collect_thread()
Message-ID: <20151003181338.GA1057@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151003181319.GA1036@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jffs2_garbage_collect_thread() can race with SIGCONT and sleep in
TASK_STOPPED state after it was already sent. Add the new helper,
kernel_signal_stop(), which does this correctly.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 fs/jffs2/background.c |  3 +--
 include/linux/sched.h | 10 ++++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index f3145fd..53cc735 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -132,8 +132,7 @@ static int jffs2_garbage_collect_thread(void *_c)
 			case SIGSTOP:
 				jffs2_dbg(1, "%s(): SIGSTOP received\n",
 					  __func__);
-				set_current_state(TASK_STOPPED);
-				schedule();
+				kernel_signal_stop();
 				break;
 
 			case SIGKILL:
diff --git a/include/linux/sched.h b/include/linux/sched.h
index e714539..56e688c 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2477,6 +2477,16 @@ static inline int kernel_dequeue_signal(siginfo_t *info)
 	return ret;
 }
 
+static inline void kernel_signal_stop(void)
+{
+	spin_lock_irq(&current->sighand->siglock);
+	if (current->jobctl & JOBCTL_STOP_DEQUEUED)
+		__set_current_state(TASK_STOPPED);
+	spin_unlock_irq(&current->sighand->siglock);
+
+	schedule();
+}
+
 extern void release_task(struct task_struct * p);
 extern int send_sig_info(int, struct siginfo *, struct task_struct *);
 extern int force_sigsegv(int, struct task_struct *);
-- 
2.4.3
