Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.231]
 helo=cdptpa-oedge-vip.email.rr.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj8ld-0005Ny-Ad
 for linux-mtd@lists.infradead.org; Tue, 28 Oct 2014 15:33:06 +0000
Date: Tue, 28 Oct 2014 11:32:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 0/7] seq_printf cleanups
Message-ID: <20141028113240.74dbe5c5@gandalf.local.home>
In-Reply-To: <cover.1412031505.git.joe@perches.com>
References: <20140929124246.3e39dac8@gandalf.local.home>
 <cover.1412031505.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Joe,

If you haven't already done so, can you update checkpatch.pl to
complain if someone checks the return value of seq_printf(),
seq_puts(), or seq_putc().

It should state that those functions will soon be returning void.

Thanks!

-- Steve
