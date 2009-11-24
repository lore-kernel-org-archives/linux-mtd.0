Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NCsvT-00060H-88
	for linux-mtd@lists.infradead.org; Tue, 24 Nov 2009 10:47:20 +0000
Date: Tue, 24 Nov 2009 19:46:25 +0900 (JST)
From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: [PATCH 4/7] nandsim: Don't use PF_MEMALLOC
In-Reply-To: <4B0AEA33.3010306@nokia.com>
References: <1258988417.18407.44.camel@localhost> <4B0AEA33.3010306@nokia.com>
Message-Id: <20091124194532.AFC2.A69D9226@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Hi

Thank you for this useful comments.

> > I vaguely remember Adrian (CCed) did this on purpose. This is for the
> > case when nandsim emulates NAND flash on top of a file. So there are 2
> > file-systems involved: one sits on top of nandsim (e.g. UBIFS) and the
> > other owns the file which nandsim uses (e.g., ext3).
> > 
> > And I really cannot remember off the top of my head why he needed
> > PF_MEMALLOC, but I think Adrian wanted to prevent the direct reclaim
> > path to re-enter, say UBIFS, and cause deadlock. But I'd thing that all
> > the allocations in vfs_read()/vfs_write() should be GFP_NOFS, so that
> > should not be a probelm?
> > 
> 
> Yes it needs PF_MEMALLOC to prevent deadlock because there can be a
> file system on top of nandsim which, in this case, is on top of another
> file system.
> 
> I do not see how mempools will help here.
> 
> Please offer an alternative solution.

I have few questions.

Can you please explain more detail? Another stackable filesystam
(e.g. ecryptfs) don't have such problem. Why nandsim have its issue?
What lock cause deadlock?
