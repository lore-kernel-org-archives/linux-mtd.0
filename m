Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAyxw-0003Kk-6H
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 13:26:13 +0000
Date: Wed, 17 May 2017 15:25:48 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.marshall@omicronenergy.com, b44839@freescale.com,
 prabhakar@freescale.com
Subject: Re: [PATCH] fsl_ifc_nand: fix handing of bit flips in erased nand
Message-ID: <20170517152548.6d52c41b@bbrezillon>
In-Reply-To: <20170517130059.GA3437@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170419221507.GA24914@amd> <20170420002748.5c76c9b9@bbrezillon>
 <20170420114057.GA4705@amd> <20170421105107.GA7259@amd>
 <20170517122224.GB583@amd> <20170517143211.205ff5de@bbrezillon>
 <20170517130059.GA3437@amd>
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

On Wed, 17 May 2017 15:00:59 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> 
> > > @@ -904,6 +922,21 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
> > >  		chip->ecc.algo = NAND_ECC_HAMMING;
> > >  	}
> > >  
> > > +	{
> > > +		struct mtd_oob_region oobregion = { };
> > > +
> > > +		mtd_ooblayout_ecc(mtd, 0, &oobregion);
> > > +		if (!oobregion.length) {
> > > +			dev_err(priv->dev, "No ECC in oobregion?\n");
> > > +			return -EINVAL;
> > > +		}
> > > +		mtd_ooblayout_ecc(mtd, 1, &oobregion);
> > > +		if (oobregion.length) {
> > > +			dev_err(priv->dev, "Extra data in oobregion?\n");
> > > +			return -EINVAL;
> > > +		}
> > > +	}  
> > 
> > This clearly doesn't belong in this patch. And if you really want to
> > check that, please create a separate function instead of defining a
> > non-conditional code block inside fsl_ifc_chip_init().  
> 
> I am not sure I want to check that. check_erased_page() can only
> handle layout with just one oobregion. If you think check is not
> needed, I'll happily remove the checking.

Let's drop it then. And please change the subject to "mtd: nand:
fsl_ifc: fix handing of bit flips in erased pages".

Thanks,

Boris
