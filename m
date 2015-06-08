Message-ID: <1433763595.1495.35.camel@twins>
Subject: Re: [RFC PATCH 09/18] kthread: Make it easier to correctly sleep in
 iterant kthreads
From: Peter Zijlstra <peterz@infradead.org>
To: Petr Mladek <pmladek@suse.cz>
Date: Mon, 08 Jun 2015 13:39:55 +0200
In-Reply-To: <20150608100107.GA3135@pathway.suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-10-git-send-email-pmladek@suse.cz>
 <20150605161021.GJ19282@twins.programming.kicks-ass.net>
 <20150608100107.GA3135@pathway.suse.cz>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
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

On Mon, 2015-06-08 at 12:01 +0200, Petr Mladek wrote:

> Just to be sure. Do you suggest to use TASK_IDLE everywhere in
> kthreads or only when the uninterruptible sleep is really needed?

Always, only use INTERRUPTIBLE when you're actually interruptible, that
is you want signals or such muck to terminate your wait.

> IMHO, we should not use TASK_IDLE in freezable kthreads because
> it would break freezing.

How so? The task is IDLE, its not doing anything.

>  Well, we could freezable_schedule() but only
> on locations where it is safe to get freezed. Anyway, we need to
> be careful here.

s/freezed/frozen/

Bah, you made me look at the freezer code, karma reduction for you.

And this is the arch typical freeze point if ever there was one, you're
checking kthread_stop, if we can terminate the kthread, we can certainly
get frozen.

> BTW: What is the preferred way of freezing, please? Is it better
> to end up in the fridge or is it fine to call freezer_do_not_count();
> or set PF_NOFREEZE when it is safe?

freezable_schedule() is fine in this case.
