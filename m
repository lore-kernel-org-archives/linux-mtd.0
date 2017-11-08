Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCSnH-0003AM-QL
 for linux-mtd@lists.infradead.org; Wed, 08 Nov 2017 16:01:42 +0000
From: Richard Weinberger <richard@nod.at>
To: Colin Ian King <colin.king@canonical.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Andrea Adami <andrea.adami@gmail.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: NAK: [PATCH][mtd-next] mtd: sharpslpart: fix overflow on
 block_adr calculation
Date: Wed, 08 Nov 2017 17:01:23 +0100
Message-ID: <19367170.UUVyJ8x06A@blindfold>
In-Reply-To: <c69cae0f-0490-20b7-9706-78d2ef2d3c73@canonical.com>
References: <20171108154649.30096-1-colin.king@canonical.com>
 <c69cae0f-0490-20b7-9706-78d2ef2d3c73@canonical.com>
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

Colin,

Am Mittwoch, 8. November 2017, 16:57:57 CET schrieb Colin Ian King:
> On 08/11/17 15:46, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Multiplying block_num and mtd->erasesize may potentially overflow
> > as they are both unsigned ints and so the multiplication is evaluated
> > in unsigned int arithmetic .  Cast block_adr to off_t to ensure
> > multiplication is off_t sized to avoid any potential overflow.
> > 
> > Detected by CoverityScan, CID#1461264 ("Unintentional integer overflow")
> > 
> > Fixes: fff1e32a50c0 ("mtd: sharpslpart: Add sharpslpart partition parser")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> > 
> >  drivers/mtd/parsers/sharpslpart.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/parsers/sharpslpart.c
> > b/drivers/mtd/parsers/sharpslpart.c index 5fe0079ea5ed..b1d97aa3bac4
> > 100644
> > --- a/drivers/mtd/parsers/sharpslpart.c
> > +++ b/drivers/mtd/parsers/sharpslpart.c
> > @@ -244,7 +244,7 @@ static int sharpsl_nand_read_laddr(struct mtd_info
> > *mtd,> 
> >  		return -EINVAL;
> >  	
> >  	block_num = ftl->log2phy[log_num];
> > 
> > -	block_adr = block_num * mtd->erasesize;
> > +	block_adr = (loff_t)block_num * mtd->erasesize;
> > 
> >  	block_ofs = mtd_mod_by_eb((u32)from, mtd);
> >  	
> >  	err = mtd_read(mtd, block_adr + block_ofs, len, &retlen, buf);
> 
> Sorry, ignore this, there is another place that does this that needs
> some attention. I'll sent V2 shortly.

No need to hurry. :)
I agree that such overflows should be addressed, although they are purely 
theoretical. MTD is being used on small devices only.

Thanks,
//richard 
