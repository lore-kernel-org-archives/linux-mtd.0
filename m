From: richard@nod.at (Richard Weinberger)
Date: Wed, 16 Jan 2019 10:17:31 +0100
Subject: [PATCH] ubi: account the fastmap data blocks when checking
 found_pebs
In-Reply-To: <a540ab38-c0a9-1339-7c1c-23008b375b71@huawei.com>
References: <20190116005935.141529-1-houtao1@huawei.com>
 <1729890.X3pJ5IsDyS@blindfold>
 <a540ab38-c0a9-1339-7c1c-23008b375b71@huawei.com>
Message-ID: <3735706.oOp81Q8WGZ@blindfold>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Tao,

Am Mittwoch, 16. Januar 2019, 10:12:47 CET schrieb Hou Tao:
> > This should get accounted in the loop above.
> >          list_for_each_entry(aeb, &ai->fastmap, u.list) {
> > 
> I have considered to add these data blocks into the fastmap list in ubi_scan_fastmap(), but
> it seems nobody will try to find the data block in fastmap list, so I choose a quick fix for
> the assertion.

Please fix it properly. Fastmap is already a way too complicated.
BTW: What NAND is this? How many blocks does fastmap need?
Usually on huge NANDs the whole fastmap fits into one block.
 
> > I agree that this logic needs a redesign.
> > Please see this patch series I sent last year but had no time to further work
> > on it:
> > https://lkml.org/lkml/2018/6/13/755
> > 
> > I'd highly appreciate if you could revive it. :-)
> > 
> Do you mean the whole patch set ? And we are planning to enable fast-map in our products,
> so I could try to do it.

The more the merrier. :)

Thanks,
//richard
