Date: Thu, 12 Feb 2015 16:22:34 +0100
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 04/10] mtd: pxa3xx_nand: set NDCR_PG_PER_BLK if page
 per block is 128
Message-ID: <20150212152234.GI11169@kwain>
References: <1423752816-26219-1-git-send-email-antoine.tenart@free-electrons.com>
 <1423752816-26219-5-git-send-email-antoine.tenart@free-electrons.com>
 <20150212161616.184481ea@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150212161616.184481ea@bbrezillon>
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, jszhang@marvell.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 12, 2015 at 04:16:16PM +0100, Boris Brezillon wrote:
> On Thu, 12 Feb 2015 15:53:30 +0100
> Antoine Tenart <antoine.tenart@free-electrons.com> wrote:
> 
> Hm, still no commit message here ;-)

I knew I missed something... I'll fix this.

> 
> > Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > index 55fce9527c2e..64628bff3fa5 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -1216,7 +1216,8 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
> >  
> >  	ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
> >  	ndcr |= (host->col_addr_cycles == 2) ? NDCR_RA_START : 0;
> > -	ndcr |= (f->page_per_block == 64) ? NDCR_PG_PER_BLK : 0;
> > +	ndcr |= (f->page_per_block == 64 || f->page_per_block == 128) ?
> > +		NDCR_PG_PER_BLK : 0;
> >  	ndcr |= (f->page_size == 2048) ? NDCR_PAGE_SZ : 0;
> >  	ndcr |= (f->flash_width == 16) ? NDCR_DWIDTH_M : 0;
> >  	ndcr |= (f->dfc_width == 16) ? NDCR_DWIDTH_C : 0;
> 
> 
> 
> -- 
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
Antoine Ténart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
