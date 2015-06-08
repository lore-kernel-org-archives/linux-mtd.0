Received: from smtprelay0105.hostedemail.com ([216.40.44.105]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z216J-00010P-E8
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2015 17:44:44 +0000
Date: Mon, 8 Jun 2015 13:44:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.cz>
Subject: Re: [RFC PATCH 15/18] ring_buffer: Allow to exit the ring buffer
 benchmark immediately
Message-ID: <20150608134417.3fb7a811@gandalf.local.home>
In-Reply-To: <1433516477-5153-16-git-send-email-pmladek@suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-16-git-send-email-pmladek@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-nfs@vger.kernel.org, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Peter Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 Oleg Nesterov <oleg@redhat.com>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
 Chris Mason <clm@fb.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Tejun Heo <tj@kernel.org>, live-patching@vger.kernel.org,
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

On Fri,  5 Jun 2015 17:01:14 +0200
Petr Mladek <pmladek@suse.cz> wrote:

> It takes a while until the ring_buffer_benchmark module is removed
> when the ring buffer hammer is running. It is because it takes
> few seconds and kthread_should_terminate() is not being checked.
> 
> This patch adds the check for kthread termination into the producer.
> It uses the existing kill_test flag to finish the kthreads as
> cleanly as possible.
> 
> It disables printing the "ERROR" message when the kthread is going.
> 
> Also it makes sure that producer does not go into the 10sec sleep
> when it is being killed.

This patch looks like something I may take regardless of the other
patches (if it applies cleanly).

As for the other patches, the ring buffer benchmark is just that, a
benchmark that I use when making changes to the ring buffer. It's not
something for production systems.

What about just adding a depend on !LIVE_PATCHING to
RING_BUFFER_BENCHMARK, or force it to shut down during patching.
There's no reason to make it safe to be running when you patch the
kernel. Just adds complexity to some simple code.

-- Steve
