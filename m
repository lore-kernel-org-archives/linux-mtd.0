Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NDC9T-0004pr-10
	for linux-mtd@lists.infradead.org; Wed, 25 Nov 2009 07:19:04 +0000
Received: from m2.gw.fujitsu.co.jp ([10.0.50.72])
	by fgwmail6.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id
	nAP7InWr003472 for <linux-mtd@lists.infradead.org> (envelope-from
	kosaki.motohiro@jp.fujitsu.com); Wed, 25 Nov 2009 16:18:49 +0900
Received: from smail (m2 [127.0.0.1])
	by outgoing.m2.gw.fujitsu.co.jp (Postfix) with ESMTP id 0880945DE5D
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Nov 2009 16:18:49 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (s2.gw.fujitsu.co.jp [10.0.50.92])
	by m2.gw.fujitsu.co.jp (Postfix) with ESMTP id D4B1645DE55
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Nov 2009 16:18:48 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id B3284E78003
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Nov 2009 16:18:48 +0900 (JST)
Received: from m106.s.css.fujitsu.com (m106.s.css.fujitsu.com [10.249.87.106])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id 542751DB8038
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Nov 2009 16:18:48 +0900 (JST)
From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: [PATCH 4/7] nandsim: Don't use PF_MEMALLOC
In-Reply-To: <4B0CD912.7090002@nokia.com>
References: <20091125084630.AFC5.A69D9226@jp.fujitsu.com>
	<4B0CD912.7090002@nokia.com>
Message-Id: <20091125161402.AFEA.A69D9226@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Date: Wed, 25 Nov 2009 16:18:47 +0900 (JST)
Cc: "Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	kosaki.motohiro@jp.fujitsu.com, Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> KOSAKI Motohiro wrote:
> >> KOSAKI Motohiro wrote:
> >>> Hi
> >>>
> >>> Thank you for this useful comments.
> >>>
> >>>>> I vaguely remember Adrian (CCed) did this on purpose. This is for the
> >>>>> case when nandsim emulates NAND flash on top of a file. So there are 2
> >>>>> file-systems involved: one sits on top of nandsim (e.g. UBIFS) and the
> >>>>> other owns the file which nandsim uses (e.g., ext3).
> >>>>>
> >>>>> And I really cannot remember off the top of my head why he needed
> >>>>> PF_MEMALLOC, but I think Adrian wanted to prevent the direct reclaim
> >>>>> path to re-enter, say UBIFS, and cause deadlock. But I'd thing that all
> >>>>> the allocations in vfs_read()/vfs_write() should be GFP_NOFS, so that
> >>>>> should not be a probelm?
> >>>>>
> >>>> Yes it needs PF_MEMALLOC to prevent deadlock because there can be a
> >>>> file system on top of nandsim which, in this case, is on top of another
> >>>> file system.
> >>>>
> >>>> I do not see how mempools will help here.
> >>>>
> >>>> Please offer an alternative solution.
> >>> I have few questions.
> >>>
> >>> Can you please explain more detail? Another stackable filesystam
> >>> (e.g. ecryptfs) don't have such problem. Why nandsim have its issue?
> >>> What lock cause deadlock?
> >> The file systems are not stacked.  One is over nandsim, which nandsim
> >> does not know about because it is just a lowly NAND device, and, with
> >> the file cache option, one file system below to provide the file cache.
> >>
> >> The deadlock is the kernel writing out dirty pages to the top file system
> >> which writes to nandsim which writes to the bottom file system which
> >> allocates memory which causes dirty pages to be written out to the top
> >> file system, which tries to write to nandsim => deadlock.
> > 
> > You mean you want to prevent pageout() instead reclaim itself?
> 
> Yes
> 
> > Dropping filecache seems don't make recursive call, right?
> 
> Yes

o.k.

I really think the cache dropping shuoldn't be prevented because
typical linux box have lots droppable file cache and very few free pages.
but prevent pageout() seems not so problematic.

Thank you for good information.
