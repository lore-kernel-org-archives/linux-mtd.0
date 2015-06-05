Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0t8i-0002SP-QV
 for linux-mtd@lists.infradead.org; Fri, 05 Jun 2015 15:02:33 +0000
From: Petr Mladek <pmladek@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>,
 Tejun Heo <tj@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [RFC PATCH 05/18] freezer/scheduler: Add freezable_cond_resched()
Date: Fri,  5 Jun 2015 17:01:04 +0200
Message-Id: <1433516477-5153-6-git-send-email-pmladek@suse.cz>
In-Reply-To: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Jiri Kosina <jkosina@suse.cz>, Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Michal Hocko <mhocko@suse.cz>, Chris Mason <clm@fb.com>,
 Petr Mladek <pmladek@suse.cz>, linux-mtd@lists.infradead.org,
 linux-api@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 live-patching@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It makes sense to call cond_resched() in freezable kthreads.
But there is the chicken&egg problem whether to call try_to_freeze()
before or after the schedule.

This patch adds freezable_cond_resched(). It uses the same trick as
freezable_schedule(). It tells the freezer that it might ignore
the sleeping process.

Note that it might be used only on locations where the freezing
is safe. It means that no lock is taken and we are ready to sleep
for a very long time.

Signed-off-by: Petr Mladek <pmladek@suse.cz>
---
 include/linux/freezer.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/freezer.h b/include/linux/freezer.h
index 6b7fd9cf5ea2..1446f210dfc6 100644
--- a/include/linux/freezer.h
+++ b/include/linux/freezer.h
@@ -172,6 +172,14 @@ static inline void freezable_schedule(void)
 	freezer_count();
 }
 
+/* Like cond_resched(), but should not block the freezer. */
+static inline void freezable_cond_resched(void)
+{
+	freezer_do_not_count();
+	cond_resched();
+	freezer_count();
+}
+
 /* DO NOT ADD ANY NEW CALLERS OF THIS FUNCTION */
 static inline void freezable_schedule_unsafe(void)
 {
-- 
1.8.5.6
