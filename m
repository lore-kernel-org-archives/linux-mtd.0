Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4QhS-0005PY-Te
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2015 09:29:03 +0000
Date: Mon, 15 Jun 2015 11:28:38 +0200
From: Petr Mladek <pmladek@suse.cz>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [RFC PATCH 07/18] kthread: Make iterant kthreads freezable by
 default
Message-ID: <20150615092838.GK9409@pathway.suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-8-git-send-email-pmladek@suse.cz>
 <20150609072003.GY21465@mtj.duckdns.org>
 <20150609155313.GC9409@pathway.suse.cz>
 <20150610043154.GG11955@mtj.duckdns.org>
 <20150612132440.GH9409@pathway.suse.cz>
 <20150613232222.GB346@mtj.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150613232222.GB346@mtj.duckdns.org>
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Peter Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
 Chris Mason <clm@fb.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, live-patching@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
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

On Sat 2015-06-13 18:22:22, Tejun Heo wrote:
> > I try to better understand why freezer is considered to be a blunt
> > tool. Is it because it is a generic API, try_to_freeze() is put on
> > "random" locations, so that it does not define the safe point
> > precisely enough?
>
> Not that.  I don't know how to explain it better.  Hmmm... okay, let's
> say there's a shared queue Q and N users o fit.  If you wanna make Q
> empty and keep it that way for a while, the right thing to do is
> blocking new queueing and then wait till Q drains - you choke the
> entity that you wanna control.
>
> Instead of that, freezer is trying to block the "N" users part.  In
> majority of cases, it blocks enough but it's pretty difficult to be
> sure whether you actually got all N of them (as some of them may not
> involve kthreads at all or unfreezable kthreads might end up doing
> those operations too on corner cases) and it's also not that clear
> whether blocking the N users actually make Q empty.  Maybe there are
> things which can be in flight asynchronously on Q even all its N users
> are blocked.  This is inherently finicky.

I feel convinced that it does not make sense to make kthreads
freezable by default and that we should not use it when not
necessary.

Thanks a lot for patience and so detailed explanation.

Best Regards,
Petr
