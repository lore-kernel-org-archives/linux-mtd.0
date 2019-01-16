From: richard@nod.at (Richard Weinberger)
Date: Wed, 16 Jan 2019 10:43:10 +0100
Subject: [PATCH] ubi: account the fastmap data blocks when checking
 found_pebs
In-Reply-To: <d43d7cf7-54a9-da64-a1e6-699c6cc20e11@huawei.com>
References: <20190116005935.141529-1-houtao1@huawei.com>
 <3735706.oOp81Q8WGZ@blindfold>
 <d43d7cf7-54a9-da64-a1e6-699c6cc20e11@huawei.com>
Message-ID: <2376510.TSDP2SaCWW@blindfold>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Am Mittwoch, 16. Januar 2019, 10:38:56 CET schrieb Hou Tao:
> Hi Richard,
> 
> On 2019/1/16 17:17, Richard Weinberger wrote:
> > Tao,
> > 
> > Am Mittwoch, 16. Januar 2019, 10:12:47 CET schrieb Hou Tao:
> >>> This should get accounted in the loop above.
> >>>          list_for_each_entry(aeb, &ai->fastmap, u.list) {
> >>>
> >> I have considered to add these data blocks into the fastmap list in ubi_scan_fastmap(), but
> >> it seems nobody will try to find the data block in fastmap list, so I choose a quick fix for
> >> the assertion.
> > 
> > Please fix it properly. Fastmap is already a way too complicated.
> > BTW: What NAND is this? How many blocks does fastmap need?
> > Usually on huge NANDs the whole fastmap fits into one block.
> >  
> It is just a 2GB-sized NAND flash simulated by nandsim, and two blocks (one super block and
> one data block) are used by fast-map.

Ah, a nandsim zombie. I guessed so.
So far no real NAND I came across needed more than one block for fastmap.
In fact, the only reason why I added support for multiple fastmap blocks was
simulated NANDs. :-)

Thanks,
//richard
