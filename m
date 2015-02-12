Date: Thu, 12 Feb 2015 16:22:47 +0100
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 05/10] mtd: pxa3xx_nand: add a default chunk size
Message-ID: <20150212152247.GJ11169@kwain>
References: <1423752816-26219-1-git-send-email-antoine.tenart@free-electrons.com>
 <1423752816-26219-6-git-send-email-antoine.tenart@free-electrons.com>
 <20150212161732.7542331b@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150212161732.7542331b@bbrezillon>
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

On Thu, Feb 12, 2015 at 04:17:32PM +0100, Boris Brezillon wrote:
> On Thu, 12 Feb 2015 15:53:31 +0100
> Antoine Tenart <antoine.tenart@free-electrons.com> wrote:
> 
> > Add a default chunk size of 512 in the pxa3xx nand driver.
> > 
> > Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > index 64628bff3fa5..8ed045195d31 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -1430,6 +1430,9 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
> >  	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
> >  		goto KEEP_CONFIG;
> >  
> > +	/* Set a default chunk size */
> 
> Ditto => no explanation about why you do that.

Will do.

> 
> > +	info->chunk_size = 512;
> > +
> >  	ret = pxa3xx_nand_sensing(info);
> >  	if (ret) {
> >  		dev_info(&info->pdev->dev, "There is no chip on cs %d!\n",
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
