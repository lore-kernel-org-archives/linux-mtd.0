Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2EQl-0000Jx-Rc
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2015 07:58:44 +0000
Received: by padev16 with SMTP id ev16so8626792pad.0
 for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2015 00:58:21 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 9 Jun 2015 16:58:08 +0900
From: Tejun Heo <tj@kernel.org>
To: Petr Mladek <pmladek@suse.cz>
Subject: Re: [RFC PATCH 00/18] kthreads/signal: Safer kthread API and signal
 handling
Message-ID: <20150609075808.GA11955@mtj.duckdns.org>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <20150609061025.GU21465@mtj.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150609061025.GU21465@mtj.duckdns.org>
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

Hello, Petr.

I've skimmed through the patchset and I'm not quite sure.
kthread_iterant seems to map almost one to one to kthread_worker
interface.  One calls a predefined callback repeatedly while the other
queues work items which contain callback.  One does nasty plumbing
tasks inbetween interations, the other does inbetween work items.  One
has sleep helper to sleep "safely", the other can use delayed work
items and flushing cancel.  In fact, I'm pretty sure it'd be trivial
to convert between the two sets of API.

If so, is it really worthwhile to introduce the new API?
kthread_iterant is closer to raw kthread but not quite.  It shouldn't
be difficult to apply the bulk of kthread_iterant's features to
kthread_worker.  Wouldn't it be more beneficial to have async
execution mechanisms more closely aligned?

Thanks a lot.

-- 
tejun
