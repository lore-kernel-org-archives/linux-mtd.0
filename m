Received: from law14-oe48.law14.hotmail.com ([64.4.20.20] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19eUaC-0000tU-Pn
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2003 07:55:40 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Mon, 21 Jul 2003 12:28:30 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE48eBIeBoVue0000fcf0@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Garbage collection code
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

Can someone tell me what is happening in this code copied below

Specifically what does schedule at the end of the code does.

Also kindly tell me a link where I can read abt these things in detail.

With regards
Vikram

for (;;) {
  spin_lock_irq(&current->sigmask_lock);
  siginitsetinv (&current->blocked, sigmask(SIGHUP) | sigmask(SIGKILL) |
sigmask(SIGSTOP) | sigmask(SIGCONT));
  recalc_sigpending(current);
  spin_unlock_irq(&current->sigmask_lock);

  if (!thread_should_wake(c)) {
                        set_current_state (TASK_INTERRUPTIBLE);
   D1(printk(KERN_EMERG "jffs2_garbage_collect_thread sleeping. ..\n"));
   /* Yes, there's a race here; we checked thread_should_wake() before
      setting current->state to TASK_INTERRUPTIBLE. But it doesn't
      matter - We don't care if we miss a wakeup, because the GC thread
      is only an optimisation anyway. */
   schedule();
}
