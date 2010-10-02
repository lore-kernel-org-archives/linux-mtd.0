Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P27S1-0000ZD-1b
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2010 19:08:53 +0000
Date: Sat, 2 Oct 2010 12:09:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: dedekind1@gmail.com
Subject: Re: [patch 1/2] mtdpart: memory accessor interface for MTD layer
Message-Id: <20101002120952.e34b6d65.akpm@linux-foundation.org>
In-Reply-To: <1286028592.32172.14.camel@brekeke>
References: <201010012116.o91LGRGn021118@imap1.linux-foundation.org>
	<1286028592.32172.14.camel@brekeke>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: sudhakar.raj@ti.com, khilman@deeprootsystems.com, david-b@pacbell.net,
	linux-mtd@lists.infradead.org, cbouatmailru@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 02 Oct 2010 17:09:52 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Fri, 2010-10-01 at 14:16 -0700, akpm@linux-foundation.org wrote:
> > From: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> > 
> > Implement a memory accessor interface in the MTD layer which enables the
> > kernel to access flash data.
> > 
> > This patch adds two new members to the mtd_partition structure, a function
> > handler which will be called during setup of the partition and an argument
> > to be passed to this setup function.
> 
> This patch does not apply to my l2-mtd-2.6.git tree - many confilicts.

It applies against linux-next.

For heavens sake guys, please fix this.
