Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFGMR-0000k1-Ke
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 08:49:13 +0000
Date: Mon, 29 May 2017 10:48:38 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz>
Cc: Pavel Machek <pavel@ucw.cz>, "richard@nod.at" <richard@nod.at>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "cyrille.pitchen@atmel.com"
 <cyrille.pitchen@atmel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mark.marshall@omicronenergy.com"
 <mark.marshall@omicronenergy.com>, "b44839@freescale.com"
 <b44839@freescale.com>, "prabhakar@freescale.com" <prabhakar@freescale.com>
Subject: Re: mtd: nand: fsl_ifc: fix handing of bit flips in erased pages
Message-ID: <20170529104838.48225166@bbrezillon>
In-Reply-To: <5f665145ea304d3a9e1ecb39c51a951e@svr-chch-ex1.atlnz.lc>
References: <5f665145ea304d3a9e1ecb39c51a951e@svr-chch-ex1.atlnz.lc>
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

Hi,

On Thu, 25 May 2017 23:33:43 +0000
Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz> wrote:

> Hi,
> 
> We are also having the same problem where the IFC (nand flash) was 
> reporting ECC uncorrectable errors on single bitflips with erased pages. 
> Applying this patch with some minor modifications seems to solve our 
> issue. We are still doing more testing but recent results looks promising.

Pavel, can you send a v2 fixing these problems?

Thanks,

Boris

> 
> Our kernel is 4.4.6 so we have to modify it a bit to fit the old ECC 
> layout structure. We just have a few comments about the patch:
> 
>  > -				if (!is_blank(mtd, bufnum))
>  > -					ctrl->nand_stat |=
>  > -						IFC_NAND_EVTER_STAT_ECCER;
>  > -				break;
>  > +				ctrl->nand_stat |= IFC_NAND_EVTER_STAT_ECCER;  
> 
> Added 'error = 0' after setting the flag since no error was actually 
> corrected.
> 
>  > -	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER)
>  > -		dev_err(priv->dev, "NAND Flash ECC Uncorrectable Error\n");
>  > -
>  >  	if (ctrl->nand_stat != IFC_NAND_EVTER_STAT_OPC)
>  >  		mtd->ecc_stats.failed++;
>  > +
>  > +	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER) {
>  > +		int res;
>  > +
>  > +		if (!oob_required)
>  > +			fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
>  > +
>  > +		res = check_erased_page(chip, buf);
>  > +		return res;
>  > +	}  
> 
> We have to do the check IFC_NAND_EVTER_STAT_ECCER first because the 
> condition (ctrl->nand_stat != IFC_NAND_EVTER_STAT_OPC) will never be 
> true since IFC always sets IFC_NAND_EVTER_STAT_ECCER on empty pages. 
> Incrementing failed stats first before doing check_erased_page() makes 
> nand_read() report ECC error all time.
> 
> Our exact modification was:
> 	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER) {
> 		if (!oob_required)
> 			fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> 
> 		return check_erased_page(chip, buf);
> 	}
> 
> 	if (ctrl->nand_stat != IFC_NAND_EVTER_STAT_OPC)
> 		mtd->ecc_stats.failed++;
> 
> Because check_erased_page() will be updating the failed stat anyway.
> 
> 
> Cheers,
> Darwin
