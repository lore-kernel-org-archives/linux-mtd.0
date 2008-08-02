Received: from smtp6.pp.htv.fi ([213.243.153.40])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KPQo8-0006GA-Bq
	for linux-mtd@lists.infradead.org; Sat, 02 Aug 2008 23:46:44 +0000
Date: Sun, 3 Aug 2008 02:45:35 +0300
From: Adrian Bunk <bunk@kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH] drivers/mtd/mtdsuper.c: fix build error
Message-ID: <20080802234535.GA8929@cs181140183.pp.htv.fi>
References: <20080802225304.GD4856@orion>
	<20080802233240.GA4385@cs181140183.pp.htv.fi>
	<a4423d670808021640he3ec660k1b5ddfcb6efd1ae5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a4423d670808021640he3ec660k1b5ddfcb6efd1ae5@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 03, 2008 at 03:40:12AM +0400, Alexander Beregalov wrote:
> 2008/8/3 Adrian Bunk <bunk@kernel.org>:
> > On Sun, Aug 03, 2008 at 02:53:04AM +0400, Alexander Beregalov wrote:
> >> From: Alexander Beregalov <a.beregalov@gmail.com>
> >>
> >> drivers/mtd/mtdsuper.c: fix build error
> >>
> >> drivers/mtd/mtdsuper.c:184: error: implicit declaration of
> >>       function 'lookup_bdev'
> >> drivers/mtd/mtdsuper.c:197: error: implicit declaration of
> >>       function 'bdput'
> >
> >
> > It already gets fs.h indirectly through linux/mtd/super.h, so while
> > your patch might be correct it cannot fix a compile error.
> >
> > If that's with CONFIG_BLOCK=n then it's
> >  http://bugzilla.kernel.org/show_bug.cgi?id=11225
> >
> > Otherwise please send your .config .
> 
> I do not have this config, I collect log from builds with randconfig
> and try to fix problems.
>...

You must store the config of the failed builds somewhere, since 
otherwise (like in this case) you cannot verify whether a patch
actually fixes a problem.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
