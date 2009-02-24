Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LbyO5-0004C7-V5
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2009 14:36:01 +0000
Date: Tue, 24 Feb 2009 23:36:00 +0900 (JST)
Message-Id: <20090224.233600.27954115.anemo@mba.ocn.ne.jp>
To: s.hauer@pengutronix.de
Subject: Re: [PATCH] physmap: Fix leak of memory returned by
	parse_mtd_partitions
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20090224133505.GJ21900@pengutronix.de>
References: <20081112.235733.01917391.anemo@mba.ocn.ne.jp>
	<20090224133505.GJ21900@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 24 Feb 2009 14:35:05 +0100, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> On Wed, Nov 12, 2008 at 11:57:33PM +0900, Atsushi Nemoto wrote:
> > The mtd partition parser returns an allocated pointer array of
> > mtd_partition.  The caller must free it.  The array is used only for
> > add_mtd_partitions(), so free it just after the call.
> 
> This patch breaks command line parsing support. With command line
> partition parsing the struct mtd_partition array is allocated, but only
> once. On my board with NAND and NOR (both with command line partition
> parsing) It fails badly in parse_cmdline_partitions() when the second
> device gets parsed.
> 
> The following patch fixes it, but I don't know if this is
> the correct solution. Does anybody have more insights on this?

Do your NAND and NOR have same mtd-id?  The cmdlinepart allocates
mtd_partition aray for each mtd-id.  So usually another array will be
returned for NAND and NOR.

The physmap patch has another bug and fixes are on the way mainline:

http://git.infradead.org/mtd-2.6.git?a=commit;h=e480814f138cd5d78a8efe397756ba6b6518fdb6

But this seems not enough, as you wrote.  If multiple mtd have same
mtd-id, bad things can happen.  And more seriously, if I load physmap
driver _again_ after unload, cmdlinepart will return a freed pointer
on the second time.

Hmm, little memory leak is less serious than crash.  Now I start
thinking reverting the commit 176bf2e0 will be best for 2.6.29
release.

I'm not sure for long term solutions.

A) make all parsers return kmalloc-ed mtd_partition array each time
   and fix memory leak in each driver

B) make all parsers return mtd_partition array allocated only once,
   and fix drivers which free the mtd_partition array.

David, how do you think?

---
Atsushi Nemoto
