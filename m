Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4TnA-00050T-UO
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2015 12:47:09 +0000
Date: Mon, 15 Jun 2015 14:46:40 +0200
From: Petr Mladek <pmladek@suse.cz>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [RFC PATCH 02/18] kthread: Add API for iterant kthreads
Message-ID: <20150615124640.GM9409@pathway.suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-3-git-send-email-pmladek@suse.cz>
 <20150609062349.GW21465@mtj.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150609062349.GW21465@mtj.duckdns.org>
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

On Tue 2015-06-09 15:23:49, Tejun Heo wrote:
> Hello, Petr.
> 
> On Fri, Jun 05, 2015 at 05:01:01PM +0200, Petr Mladek wrote:
> > +static int kthread_iterant_fn(void *kti_ptr)
> > +{
> > +	struct kthread_iterant *kti = kti_ptr;
> > +	void *data = kti->data;
> > +
> > +	if (kti->init)
> > +		kti->init(data);
> > +
> > +	do {
> > +		if (kti->func)
> > +			kti->func(data);
> 
> Is supporting kthread_iterant w/o the body function intentional?  If
> so, did you have anything specific on mind for it?  I don't think it
> matters either way.  Just curious how this came to be.

Good question. It might make sense to add a warning for kthreads
with empty main function.

Best Regards,
Petr
