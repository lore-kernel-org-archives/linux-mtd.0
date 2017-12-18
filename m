Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eQyGE-0000dB-Eo
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 16:27:29 +0000
Date: Mon, 18 Dec 2017 17:27:05 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Richard Weinberger
 <richard@nod.at>, kernel-janitors@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH][V2] mtd: sharpslpart: fix overflow on block_adr
 calculation
Message-ID: <20171218172705.59e25d29@bbrezillon>
In-Reply-To: <CAAQYJAuVYbbg5SyD8ZkANZ201atZATkgF07CfwPet+7SbXXuPQ@mail.gmail.com>
References: <20171108161323.30662-1-colin.king@canonical.com>
 <CAAQYJAuVYbbg5SyD8ZkANZ201atZATkgF07CfwPet+7SbXXuPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 10 Nov 2017 17:35:13 +0100
Andrea Adami <andrea.adami@gmail.com> wrote:

> On Wed, Nov 8, 2017 at 5:13 PM, Colin King <colin.king@canonical.com> wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Multiplying block_num and mtd->erasesize may potentially overflow
> > as they are both unsigned ints and so the multiplication is evaluated
> > in unsigned int arithmetic.  Cast block_adr to off_t to ensure
> > multiplication is off_t sized to avoid any potential overflow.
> >
> > Detected by CoverityScan, CID#1461264 ("Unintentional integer overflow")
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/mtd/parsers/sharpslpart.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/parsers/sharpslpart.c b/drivers/mtd/parsers/sharpslpart.c
> > index 5fe0079ea5ed..0ddb79ac390d 100644
> > --- a/drivers/mtd/parsers/sharpslpart.c
> > +++ b/drivers/mtd/parsers/sharpslpart.c
> > @@ -192,7 +192,7 @@ static int sharpsl_nand_init_ftl(struct mtd_info *mtd, struct sharpsl_ftl *ftl)
> >
> >         /* create physical-logical table */
> >         for (block_num = 0; block_num < phymax; block_num++) {
> > -               block_adr = block_num * mtd->erasesize;
> > +               block_adr = (loff_t)block_num * mtd->erasesize;
> >
> >                 if (mtd_block_isbad(mtd, block_adr))
> >                         continue;
> > @@ -244,7 +244,7 @@ static int sharpsl_nand_read_laddr(struct mtd_info *mtd,
> >                 return -EINVAL;
> >
> >         block_num = ftl->log2phy[log_num];
> > -       block_adr = block_num * mtd->erasesize;
> > +       block_adr = (loff_t)block_num * mtd->erasesize;
> >         block_ofs = mtd_mod_by_eb((u32)from, mtd);
> >
> >         err = mtd_read(mtd, block_adr + block_ofs, len, &retlen, buf);
> > --
> > 2.14.1
> >  
> 
> Thanks for spotting this,
> 
> Acked-by: Andrea Adami <andrea.adami@gmail.com>

Applied.

Thanks,

Boris
