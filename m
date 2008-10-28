Subject: Re: [JFFS2] kernel BUG at fs/jffs2/gc.c:516!
From: David Woodhouse <dwmw2@infradead.org>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <9c9fda240810220042g186045a5rba39d6b4006906c3@mail.gmail.com>
References: <6b5362aa0810212338k80de19ci893b9fb4b7802ce4@mail.gmail.com>
	<9c9fda240810220042g186045a5rba39d6b4006906c3@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 28 Oct 2008 10:09:04 +0000
Message-Id: <1225188544.18031.172.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brijesh Singh <brijesh.s.singh@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-10-22 at 16:42 +0900, Kyungmin Park wrote:
> Hi,
> 
> On Wed, Oct 22, 2008 at 3:38 PM, Brijesh Singh
> <brijesh.s.singh@gmail.com> wrote:
> > Hi,
> >     I was testing JFFS2 on 2.6.20 with fsstress for OneNand Chip. JFFS2 died
> > with the a BUG in gc.c.
> >
> >      I have gone through all  the mailing archive possible. Kyungmin park
> > had reported the problem,
> >  but I could not find the fix.
> >
> >      Here is the mail:
> > http://lists.infradead.org/pipermail/linux-mtd/2007-April/017979.html
> >
> >      Any idea,why this BUG occurs/occurred? Is there any fix available?
> 
> You maybe test the fsstress on it.
> After that time, no more test. Could you can test the latest kernel?
> In Flex-OneNAND test, it's not occurred as I know. It means it's
> solved with some patch or other side effect?

Does this fix it?

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index 8adebd3..3cceef4 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -85,15 +85,15 @@ static int jffs2_garbage_collect_thread(void *_c)
 	for (;;) {
 		allow_signal(SIGHUP);
 	again:
+		spin_lock(&c->erase_completion_lock);
 		if (!jffs2_thread_should_wake(c)) {
 			set_current_state (TASK_INTERRUPTIBLE);
+			spin_unlock(&c->erase_completion_lock);
 			D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread sleeping...\n"));
-			/* Yes, there's a race here; we checked jffs2_thread_should_wake()
-			   before setting current->state to TASK_INTERRUPTIBLE. But it doesn't
-			   matter - We don't care if we miss a wakeup, because the GC thread
-			   is only an optimisation anyway. */
 			schedule();
-		}
+		} else
+			spin_unlock(&c->erase_completion_lock);
+			
 
 		/* This thread is purely an optimisation. But if it runs when
 		   other things could be running, it actually makes things a

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
