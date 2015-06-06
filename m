Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1N4Z-0004b6-7C
 for linux-mtd@lists.infradead.org; Sat, 06 Jun 2015 23:00:15 +0000
Date: Sun, 7 Jun 2015 00:58:54 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [RFC PATCH 11/18] jffs2: Convert jffs2_gcd_mtd kthread into
 the iterant API
Message-ID: <20150606225854.GA20352@redhat.com>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-12-git-send-email-pmladek@suse.cz>
 <20150606211648.GA15591@redhat.com>
 <alpine.LNX.2.00.1506062322550.12753@pobox.suse.cz>
 <20150606223001.GA18838@redhat.com>
 <alpine.LNX.2.00.1506070034100.12753@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1506070034100.12753@pobox.suse.cz>
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-api@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.cz>,
 Michal Hocko <mhocko@suse.cz>, Chris Mason <clm@fb.com>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>,
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

On 06/07, Jiri Kosina wrote:
>
> On Sun, 7 Jun 2015, Oleg Nesterov wrote:
>
> > > I personally don't see a huge principal difference between
> > > "kthread_signal_dequeue() + kthread_do_signal_{stop,...}" vs. generic
> > > "kthread_do_signal()" that's just basically completely general and
> > > takes care of 'everything necessary'.
> >
> > Then why do we need the new API ?
>
> Well, in a nutshell, because of the "it's general and takes care of
> everything" part.

...

> Signal handling is just
> one of the piggy-backers on top of this general cleanup.

And to avoid the confusion: so far I only argued with the signal
handling part of this API. Namely with kthread_do_signal(), especially
with the SIG_DFL logic.

If we want somthing like kthread_iterant agree it should probably help to
handle the signals too. But afaics kthread_do_signal() doesn't really help
and certainly it is not strictly necessary.

Oleg.
