Date: Mon, 1 Jun 2009 16:20:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Gerard Lledo <gerard.lledo@gmail.com>
Subject: Re: [PATCH] [JFFS2] Move jffs2_gcd_mtd threads to the new kthread API
Message-Id: <20090601162010.ed69436f.akpm@linux-foundation.org>
In-Reply-To: <1243585181-2997-1-git-send-email-gerard.lledo@gmail.com>
References: <1243585181-2997-1-git-send-email-gerard.lledo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, gerard.lledo@gmail.com,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 29 May 2009 11:19:41 +0300
Gerard Lledo <gerard.lledo@gmail.com> wrote:

> kernel_thread() is being depracated.  This patch moves the jffs2 garbage
> collecting thread to the new kthread API with the minimal impact.
> 
> Signed-off-by: Gerard Lledo <gerard.lledo@gmail.com>
> ---
>  fs/jffs2/background.c |   22 ++++++++++++++--------
>  1 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
> index e958010..077fa65 100644
> --- a/fs/jffs2/background.c
> +++ b/fs/jffs2/background.c
> @@ -15,6 +15,7 @@
>  #include <linux/completion.h>
>  #include <linux/sched.h>
>  #include <linux/freezer.h>
> +#include <linux/kthread.h>
>  #include "nodelist.h"
>  
>  
> @@ -31,7 +32,7 @@ void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c)
>  /* This must only ever be called when no GC thread is currently running */
>  int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)
>  {
> -	pid_t pid;
> +	struct task_struct *tsk;
>  	int ret = 0;
>  
>  	BUG_ON(c->gc_task);
> @@ -39,15 +40,16 @@ int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)
>  	init_completion(&c->gc_thread_start);
>  	init_completion(&c->gc_thread_exit);
>  
> -	pid = kernel_thread(jffs2_garbage_collect_thread, c, CLONE_FS|CLONE_FILES);
> -	if (pid < 0) {
> -		printk(KERN_WARNING "fork failed for JFFS2 garbage collect thread: %d\n", -pid);
> +	tsk = kthread_create(jffs2_garbage_collect_thread, c, "jffs2_gcd_mtd%d", c->mtd->index);
> +	if (IS_ERR(tsk)) {
> +		printk(KERN_WARNING "fork failed for JFFS2 garbage collect thread: %ld\n", -PTR_ERR(tsk));
>  		complete(&c->gc_thread_exit);
> -		ret = pid;
> +		ret = PTR_ERR(tsk);
>  	} else {
> -		/* Wait for it... */
> -		D1(printk(KERN_DEBUG "JFFS2: Garbage collect thread is pid %d\n", pid));
> +		D1(printk(KERN_DEBUG "JFFS2: Garbage collect thread is pid %d\n", tsk->pid));
> +		wake_up_process(tsk);
>  		wait_for_completion(&c->gc_thread_start);
> +		ret = tsk->pid;
>  	}

A simple kthread_run() would be preferable here.  The code presently
sort-of open-codes it.

>  	return ret;

Also, manipulating kernel threads via their pids is atypical and
inefficient.  In-kernel it is better to refer to threads via their
task_struct*.

Fortunately all callers of this function ignore its return value so I
expect we can simply change it to be void-returning.  But that's a
cleanup which would best be done in a spearate patch.

> @@ -71,7 +73,6 @@ static int jffs2_garbage_collect_thread(void *_c)
>  {
>  	struct jffs2_sb_info *c = _c;
>  
> -	daemonize("jffs2_gcd_mtd%d", c->mtd->index);
>  	allow_signal(SIGKILL);
>  	allow_signal(SIGSTOP);
>  	allow_signal(SIGCONT);
> @@ -107,6 +108,11 @@ static int jffs2_garbage_collect_thread(void *_c)
>  		 * the GC thread get there first. */
>  		schedule_timeout_interruptible(msecs_to_jiffies(50));
>  
> +		if (kthread_should_stop()) {
> +			D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread():  kthread_stop() called.\n"));
> +			goto die;
> +		}
> +
>  		/* Put_super will send a SIGKILL and then wait on the sem.
>  		 */
>  		while (signal_pending(current) || freezing(current)) {
