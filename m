Received: from smtprelay0245.hostedemail.com ([216.40.44.245]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4WOl-0007kG-O2
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2015 15:34:08 +0000
Date: Mon, 15 Jun 2015 11:33:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.cz>
Subject: Re: [RFC PATCH 15/18] ring_buffer: Allow to exit the ring buffer
 benchmark immediately
Message-ID: <20150615113343.215bcd43@gandalf.local.home>
In-Reply-To: <20150615152313.GC3135@pathway.suse.cz>
References: <1433516477-5153-1-git-send-email-pmladek@suse.cz>
 <1433516477-5153-16-git-send-email-pmladek@suse.cz>
 <20150608134417.3fb7a811@gandalf.local.home>
 <20150615152313.GC3135@pathway.suse.cz>
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

On Mon, 15 Jun 2015 17:23:13 +0200
Petr Mladek <pmladek@suse.cz> wrote:


> Please, find below a version of the patch that can be applied against
> current Linus tree and also against your for-next branch.
> 

Thanks, just on Friday, I was testing ring buffer changes with the
ringbuffer benchmark, and was bitching about how I had to wait the 10
seconds before the module would unload ;-)

-- Steve
