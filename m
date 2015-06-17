Date: Wed, 17 Jun 2015 04:34:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Petr Mladek <pmladek@suse.cz>
Subject: Re: [RFC PATCH 00/18] kthreads/signal: Safer kthread API and signal
 handling
Message-ID: <20150617113450.GA28508@infradead.org>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 live-patching@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@suse.de>,
 David Woodhouse <dwmw2@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-nfs@vger.kernel.org,
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Jiri Kosina <jkosina@suse.cz>,
 Oleg Nesterov <oleg@redhat.com>, linux-api@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 05, 2015 at 05:00:59PM +0200, Petr Mladek wrote:
> Kthreads are implemented as an infinite loop. They include check points
> for termination, freezer, parking, and even signal handling.
> 
> We need to touch all kthreads every time we want to add or
> modify the behavior of such checkpoints. It is not easy because
> there are several hundreds of kthreads and each of them is
> implemented in a slightly different way.
> 
> This anarchy brings potentially broken or non-standard behavior.
> For example, few kthreads already handle signals a strange way.
> 
> 
> This patchset is a _proof-of-concept_ how to improve the situation.

Maybe it might be a better idea to audit the existing callers of
signals for kthreads and first check if we can get rid of them.  Then
as a second step if any are left convert them to signalfd-style
operation where signals aren't checked synchronously but as something
the threads can consume on a as needed basis.
