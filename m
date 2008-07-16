Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJ87T-0007XJ-7a
	for linux-mtd@lists.infradead.org; Wed, 16 Jul 2008 14:36:40 +0000
Message-ID: <416218737.17674@cqu.edu.cn>
Subject: Re: [PATCH][UBI]:Remove the prot tree from the WL unit
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: dedekind@infradead.org
In-Reply-To: <1216218036.29469.64.camel@sauron>
References: <1216214483.2782.91.camel@localhost.localdomain>
	<1216217566.29469.62.camel@sauron>
	<1216218027.2782.97.camel@localhost.localdomain>
	<1216218036.29469.64.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2008 22:36:11 +0800
Message-Id: <1216218971.2782.112.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2008-07-16 at 17:20 +0300, Artem Bityutskiy wrote:
> On Wed, 2008-07-16 at 22:20 +0800, xiaochuan-xu wrote:
> > Hi,
> > 
> > > Cool, thanks. However, if I grep for "prot", I still find
> > > some traces of protection trees. Try this. They should be
> > > removed as well.
> > > 
> > 
> > Yes, a few "protect" words are still in the wl.c file.
> > but I the are not relative to the PROT tree. 
> 
> Ok, sorry, I'll look closer again.
> 

one problem,without the prot tree, is that when 
ubi_io_read_vid_hdr(ubi, e1->pnum, vid_hdr, 0) (in the
wear_leveling_worker function())return errorcode equals to
UBI_IO_PEB_FREE, such PEB @e1 has to insert back to @used/scrub tree.

a bit later, one other wear-leveling worker will select the some PEB
(@e1 above), UBI_IO_PEB_FREE returns again.

over and over agin.


-- 
yours Sincerely,

xiaochuan-xu (许小川)
