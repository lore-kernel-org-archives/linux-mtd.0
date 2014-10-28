Received: from smtprelay0230.hostedemail.com ([216.40.44.230]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj94A-00087q-CH
 for linux-mtd@lists.infradead.org; Tue, 28 Oct 2014 15:52:15 +0000
Message-ID: <1414511499.6643.11.camel@perches.com>
Subject: Re: [PATCH 0/7] seq_printf cleanups
From: Joe Perches <joe@perches.com>
To: Steven Rostedt <rostedt@goodmis.org>
Date: Tue, 28 Oct 2014 08:51:39 -0700
In-Reply-To: <20141028113240.74dbe5c5@gandalf.local.home>
References: <20140929124246.3e39dac8@gandalf.local.home>
 <cover.1412031505.git.joe@perches.com>
 <20141028113240.74dbe5c5@gandalf.local.home>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.cz>,
 cluster-devel@redhat.com, coreteam@netfilter.org,
 linux-mtd@lists.infradead.org, Al Viro <viro@ZenIV.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-10-28 at 11:32 -0400, Steven Rostedt wrote:
> If you haven't already done so, can you update checkpatch.pl to
> complain if someone checks the return value of seq_printf(),
> seq_puts(), or seq_putc().

I'm not sure that matters much as a rule because I
hope soon the compiler will bleat when that happens.

There are several more too:

	seq_vprintf
	seq_escape
	seq_write
	seq_bitmap
	seq_cpumask/seq_nodemask (and _list variants),
	seq_put_decimal_xxx
