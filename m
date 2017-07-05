Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dSopj-0000IV-BJ
 for linux-mtd@lists.infradead.org; Wed, 05 Jul 2017 18:15:29 +0000
Received: by mail-qk0-x242.google.com with SMTP id 91so32291611qkq.1
 for <linux-mtd@lists.infradead.org>; Wed, 05 Jul 2017 11:15:05 -0700 (PDT)
Subject: Re: [PATCH] brcmnand: Fix up the flash cache register offset for
 older controllers
To: Karl Beldan <karl.beldan@gmail.com>, linux-mtd@lists.infradead.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Karl Beldan <karl.beldan+oss@gmail.com>
References: <20170705174653.21797-1-karl.beldan+oss@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7f7804da-e431-f197-31b9-c98359b9151a@gmail.com>
Date: Wed, 5 Jul 2017 11:15:01 -0700
MIME-Version: 1.0
In-Reply-To: <20170705174653.21797-1-karl.beldan+oss@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/05/2017 10:46 AM, Karl Beldan wrote:
> From: Karl Beldan <karl.beldan-ext@sagemcom.com>
> 
> Tested on BCM{63138,6838,63268} and cross checked with the various
> *_map_part.h which the brcmnand_regs_v* in brcmnand.c have historically
> been derived from.

BCM63138 is using a 7.0 controller, 6838 uses a 5.0 controller, but has
a separate flash cache register which does indeed end up at 0x400 bytes
off the main FLASH block, and finally 63268 does have a v4.0 controller
and the flash cache is also in a separate register that makes it end up
at 0x400.

Your change, as proposed would break chips like 7425 which use 5.0
controller with the flash cache at 0x200 bytes.

The binding describes an optional flash-cache register cell that you can
specify, so that's probably what you want to do here?

> 
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Signed-off-by: Karl Beldan <karl.beldan-ext@sagemcom.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 7419c5c..e6371ff6 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -250,7 +250,7 @@ static const u16 brcmnand_regs_v40[] = {
>  	[BRCMNAND_OOB_READ_10_BASE]	= 0x130,
>  	[BRCMNAND_OOB_WRITE_BASE]	=  0x30,
>  	[BRCMNAND_OOB_WRITE_10_BASE]	=     0,
> -	[BRCMNAND_FC_BASE]		= 0x200,
> +	[BRCMNAND_FC_BASE]		= 0x400,
>  };
>  
>  /* BRCMNAND v5.0 */
> @@ -280,7 +280,7 @@ static const u16 brcmnand_regs_v50[] = {
>  	[BRCMNAND_OOB_READ_10_BASE]	= 0x130,
>  	[BRCMNAND_OOB_WRITE_BASE]	=  0x30,
>  	[BRCMNAND_OOB_WRITE_10_BASE]	= 0x140,
> -	[BRCMNAND_FC_BASE]		= 0x200,
> +	[BRCMNAND_FC_BASE]		= 0x400,
>  };
>  
>  /* BRCMNAND v6.0 - v7.1 */
> 


-- 
Florian
