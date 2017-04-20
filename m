Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d1B0T-0003tf-J5
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 12:16:20 +0000
Date: Thu, 20 Apr 2017 14:15:53 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.marshall@omicronenergy.com, b44839@freescale.com,
 prabhakar@freescale.com
Subject: Re: fsl_ifc_nand: are blank pages protected by ECC?
Message-ID: <20170420141553.1012a79a@bbrezillon>
In-Reply-To: <20170420114057.GA4705@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170419221507.GA24914@amd> <20170420002748.5c76c9b9@bbrezillon>
 <20170420114057.GA4705@amd>
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

On Thu, 20 Apr 2017 13:40:57 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > > Would it make sense to only do hweight if *bitmap != ~0ULL ? Would it
> > > make sense to only check for bitflips > bitflips_threshold each 128
> > > bytes or something like that?  
> > 
> > I didn't go as far as you did and simply assumed hweight32/64() were
> > already optimized. Feel free to propose extra improvements.  
> 
> I'd propose this one (only compile tested, sorry, not sure how to test
> this one). If we see ~0UL, there's no need for hweight, and no need to
> check number of bitflips. So this should be net win.

Looks good to me. Can you send a patch with a real commit message?

Thanks,

Boris

> 
> Signed-off-by: Pavel Machek <pavel@denx.de>
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index b0524f8..96c27ec 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1357,7 +1357,10 @@ static int nand_check_erased_buf(void *buf, int len, int bitflips_threshold)
>  
>  	for (; len >= sizeof(long);
>  	     len -= sizeof(long), bitmap += sizeof(long)) {
> -		weight = hweight_long(*((unsigned long *)bitmap));
> +		unsigned long d = *((unsigned long *)bitmap);
> +		if (d == ~0UL)
> +			continue;
> +		weight = hweight_long(d);
>  		bitflips += BITS_PER_LONG - weight;
>  		if (unlikely(bitflips > bitflips_threshold))
>  			return -EBADMSG;
> 
