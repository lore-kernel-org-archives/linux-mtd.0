Received: from smtprelay0104.hostedemail.com ([216.40.44.104]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z21A5-0002sj-LA
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2015 17:48:38 +0000
Date: Mon, 8 Jun 2015 13:48:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 09/18] kthread: Make it easier to correctly sleep in
 iterant kthreads
Message-ID: <20150608134810.3abd862b@gandalf.local.home>
In-Reply-To: <20150605161021.GJ19282@twins.programming.kicks-ass.net>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-10-git-send-email-pmladek@suse.cz>
 <20150605161021.GJ19282@twins.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 Oleg Nesterov <oleg@redhat.com>, Petr Mladek <pmladek@suse.cz>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
 Chris Mason <clm@fb.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Tejun Heo <tj@kernel.org>,
 live-patching@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
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

On Fri, 5 Jun 2015 18:10:21 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Jun 05, 2015 at 05:01:08PM +0200, Petr Mladek wrote:
> > Many kthreads go into an interruptible sleep when there is nothing
> > to do. They should check if anyone did not requested the kthread
> > to terminate, freeze, or park in the meantime. It is easy to do
> > it a wrong way.
> 
> INTERRUPTIBLE is the wrong state to idle in for kthreads, use
> TASK_IDLE.
> 
> ---
> 
> commit 80ed87c8a9ca0cad7ca66cf3bbdfb17559a66dcf
> Author: Peter Zijlstra <peterz@infradead.org>
> Date:   Fri May 8 14:23:45 2015 +0200
> 
>     sched/wait: Introduce TASK_NOLOAD and TASK_IDLE
>     
>     Currently people use TASK_INTERRUPTIBLE to idle kthreads and wait for
>     'work' because TASK_UNINTERRUPTIBLE contributes to the loadavg. Having
>     all idle kthreads contribute to the loadavg is somewhat silly.

Not to mention, tasks in TASK_UNINTERRUPTIBLE state for too long will
trigger hung task detection.


>     
>     Now mostly this works OK, because kthreads have all their signals
>     masked. However there's a few sites where this is causing problems and
>     TASK_UNINTERRUPTIBLE should be used, except for that loadavg issue.
>     
>     This patch adds TASK_NOLOAD which, when combined with
>     TASK_UNINTERRUPTIBLE avoids the loadavg accounting.
>     
>     As most of imagined usage sites are loops where a thread wants to
>     idle, waiting for work, a helper TASK_IDLE is introduced.
>     
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

>     Cc: Julian Anastasov <ja@ssi.bg>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Cc: NeilBrown <neilb@suse.de>
>     Cc: Oleg Nesterov <oleg@redhat.com>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Cc: Thomas Gleixner <tglx@linutronix.de>
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
