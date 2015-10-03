Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiRMq-00005u-Tm
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2015 18:17:10 +0000
Date: Sat, 3 Oct 2015 20:13:36 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Felipe Balbi <balbi@ti.com>,
 Markus Pargmann <mpa@pengutronix.de>, Tejun Heo <tj@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] signal: turn dequeue_signal_lock() into
 kernel_dequeue_signal()
Message-ID: <20151003181336.GA1054@redhat.com>
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

1. Rename dequeue_signal_lock() to kernel_dequeue_signal(). This
   matches another "for kthreads only" kernel_sigaction() helper.

2. Remove the "tsk" and "mask" arguments, they are always current
   and current->blocked. And it is simply wrong if tsk != current.

3. We could also remove the 3rd "siginfo_t *info" arg but it looks
   potentially useful. However we can simplify the callers if we
   change kernel_dequeue_signal() to accept info => NULL.

4. Remove _irqsave, it is never called from atomic context.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 drivers/block/nbd.c                          |  9 ++-------
 drivers/usb/gadget/function/f_mass_storage.c |  4 +---
 fs/jffs2/background.c                        |  3 +--
 include/linux/sched.h                        | 11 ++++++-----
 4 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 293495a..214de17 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -432,9 +432,7 @@ static int nbd_thread_recv(struct nbd_device *nbd)
 	nbd->task_recv = NULL;
 
 	if (signal_pending(current)) {
-		siginfo_t info;
-
-		ret = dequeue_signal_lock(current, &current->blocked, &info);
+		ret = kernel_dequeue_signal(NULL);
 		dev_warn(nbd_to_dev(nbd), "pid %d, %s, got signal %d\n",
 			 task_pid_nr(current), current->comm, ret);
 		mutex_lock(&nbd->tx_lock);
@@ -545,11 +543,8 @@ static int nbd_thread_send(void *data)
 					 !list_empty(&nbd->waiting_queue));
 
 		if (signal_pending(current)) {
-			siginfo_t info;
-			int ret;
+			int ret = kernel_dequeue_signal(NULL);
 
-			ret = dequeue_signal_lock(current, &current->blocked,
-						  &info);
 			dev_warn(nbd_to_dev(nbd), "pid %d, %s, got signal %d\n",
 				 task_pid_nr(current), current->comm, ret);
 			mutex_lock(&nbd->tx_lock);
diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index a6eb537..9d1e3b3 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -2347,7 +2347,6 @@ static void fsg_disable(struct usb_function *f)
 
 static void handle_exception(struct fsg_common *common)
 {
-	siginfo_t		info;
 	int			i;
 	struct fsg_buffhd	*bh;
 	enum fsg_state		old_state;
@@ -2359,8 +2358,7 @@ static void handle_exception(struct fsg_common *common)
 	 * into a high-priority EXIT exception.
 	 */
 	for (;;) {
-		int sig =
-			dequeue_signal_lock(current, &current->blocked, &info);
+		int sig = kernel_dequeue_signal(NULL);
 		if (!sig)
 			break;
 		if (sig != SIGUSR1) {
diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index bb9cebc..f3145fd 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -121,13 +121,12 @@ static int jffs2_garbage_collect_thread(void *_c)
 		/* Put_super will send a SIGKILL and then wait on the sem.
 		 */
 		while (signal_pending(current) || freezing(current)) {
-			siginfo_t info;
 			unsigned long signr;
 
 			if (try_to_freeze())
 				goto again;
 
-			signr = dequeue_signal_lock(current, &current->blocked, &info);
+			signr = kernel_dequeue_signal(NULL);
 
 			switch(signr) {
 			case SIGSTOP:
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8c3fa80..e714539 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2464,14 +2464,15 @@ extern void ignore_signals(struct task_struct *);
 extern void flush_signal_handlers(struct task_struct *, int force_default);
 extern int dequeue_signal(struct task_struct *tsk, sigset_t *mask, siginfo_t *info);
 
-static inline int dequeue_signal_lock(struct task_struct *tsk, sigset_t *mask, siginfo_t *info)
+static inline int kernel_dequeue_signal(siginfo_t *info)
 {
-	unsigned long flags;
+	struct task_struct *tsk = current;
+	siginfo_t __info;
 	int ret;
 
-	spin_lock_irqsave(&tsk->sighand->siglock, flags);
-	ret = dequeue_signal(tsk, mask, info);
-	spin_unlock_irqrestore(&tsk->sighand->siglock, flags);
+	spin_lock_irq(&tsk->sighand->siglock);
+	ret = dequeue_signal(tsk, &tsk->blocked, info ?: &__info);
+	spin_unlock_irq(&tsk->sighand->siglock);
 
 	return ret;
 }
-- 
2.4.3
