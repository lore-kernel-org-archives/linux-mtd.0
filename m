Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dtwGk-0008Ph-HT
 for linux-mtd@lists.infradead.org; Mon, 18 Sep 2017 13:39:34 +0000
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com,
 dwmw2@infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Check for spi_nor_hwcaps_read2cmd() return
 value
Date: Mon, 18 Sep 2017 15:39:25 +0200
Message-ID: <2454131.y020cBOLnt@blindfold>
In-Reply-To: <20170918113945.1549571f@bbrezillon>
References: <20170917095750.14059-1-richard@nod.at>
 <20170918113945.1549571f@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Montag, 18. September 2017, 11:39:45 CEST schrieb Boris Brezillon:
> On Sun, 17 Sep 2017 11:57:50 +0200
> 
> Richard Weinberger <richard@nod.at> wrote:
> > The function can return a negativ value in case of errors,
> > don't use it blindly as array index.
> > 
> > Detected by CoverityScan CID#1418067 ("Memory - illegal accesses")
> > Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable
> > Parameters (SFDP) tables")
> 
> Hm, not sure but I think "Fixes:" should not be wrapped.

Hmm, vi tried to be smart. ;-\ 

> 
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > ---
> > 
> >  drivers/mtd/spi-nor/spi-nor.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index cf1d4a15e10a..d71765739a93 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2145,6 +2145,9 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> > 
> >  		params->hwcaps.mask |= rd->hwcaps;
> >  		cmd = spi_nor_hwcaps_read2cmd(rd->hwcaps);
> > 
> > +		if (cmd < 0)
> > +			return -EINVAL;
> 
> Why not returning cmd directly?

I thought about that too but the only other user of that function also returns
-EINVAL upon error.
Maybe Cyrille can give more input whether we should propagate 
spi_nor_hwcaps_read2cmd()'s return values or not.

Thanks,
//richard
