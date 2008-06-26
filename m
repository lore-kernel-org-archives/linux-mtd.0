Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KBvCi-0004ka-6X
	for linux-mtd@lists.infradead.org; Thu, 26 Jun 2008 17:24:16 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR005.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0K32004PTYZSKQ80@VL-MO-MR005.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 26 Jun 2008 13:23:53 -0400 (EDT)
Date: Thu, 26 Jun 2008 13:24:14 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] orion_nand: add chip_delay parameter
In-reply-to: <alpine.LFD.1.10.0806230952530.2979@xanadu.home>
Message-id: <alpine.LFD.1.10.0806261319340.2979@xanadu.home>
References: <alpine.LFD.1.10.0806230952530.2979@xanadu.home>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 23 Jun 2008, Nicolas Pitre wrote:

> From: Saeed Bishara <saeed@marvell.com>
> 
> Some SoC's need a different chip_delay value.
> 
> Signed-off-by: Saeed Bishara <saeed@marvell.com>
> Signed-off-by: Lennert Buytenhek <buytenh@marvell.com>
> Signed-off-by: Nicolas Pitre <nico@marvell.com>

I posted this patch on Monday for inclusion in 2.6.27.  However we have 
additional patches meant to be pushed through the ARM tree that depend 
on this one.  So to simplify dependency issues, I would like for this 
patch to be acked and then we'll simply push it along with the others 
through the ARM path.

Any objections??

> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index 59e05a1..ee2ac39 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -85,6 +85,9 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  	nc->cmd_ctrl = orion_nand_cmd_ctrl;
>  	nc->ecc.mode = NAND_ECC_SOFT;
>  
> +	if (board->chip_delay)
> +		nc->chip_delay = board->chip_delay;
> +
>  	if (board->width == 16)
>  		nc->options |= NAND_BUSWIDTH_16;
>  
> diff --git a/include/asm-arm/plat-orion/orion_nand.h b/include/asm-arm/plat-orion/orion_nand.h
> index ffd3852..ad4ce94 100644
> --- a/include/asm-arm/plat-orion/orion_nand.h
> +++ b/include/asm-arm/plat-orion/orion_nand.h
> @@ -18,6 +18,7 @@ struct orion_nand_data {
>  	u8 ale;		/* address line number connected to ALE */
>  	u8 cle;		/* address line number connected to CLE */
>  	u8 width;	/* buswidth */
> +	u8 chip_delay;
>  };
>  
>  
> 


Nicolas
