Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdEHm-0003e5-Fh
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 10:55:13 +0000
Subject: Re: [PATCH] mtd: nand: tango: Enforce DMA direction type
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
References: <1486979107-15362-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-arm-kernel@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <bef98482-c562-57c1-785b-087a720e3807@nod.at>
Date: Mon, 13 Feb 2017 11:54:46 +0100
MIME-Version: 1.0
In-Reply-To: <1486979107-15362-1-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 13.02.2017 um 10:45 schrieb Boris Brezillon:
> do_dma() use an integer to pass the DMA data direction information and
> pass the same value to dmaengine_prep_slave_sg().
> 
> Currently, DMA_{FROM,TO}_DEVICE match DMA_{DEV_TO_MEM,MEM_TO_DEV}
> definitions so it works fine, but assuming this will always be the case
> is not safe.
> 
> Enforce enum dma_data_direction type in the function prototype and make
> the enum dma_data_direction -> enum dma_transfer_direction conversion
> explicit.
> 
> Reported-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/tango_nand.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> index 4a5e948c62df..9a0e2f85d865 100644
> --- a/drivers/mtd/nand/tango_nand.c
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -223,8 +223,8 @@ static void tango_dma_callback(void *arg)
>  	complete(arg);
>  }
>  
> -static int do_dma(struct tango_nfc *nfc, int dir, int cmd, const void *buf,
> -		  int len, int page)
> +static int do_dma(struct tango_nfc *nfc, enum dma_data_direction dir, int cmd,
> +		  const void *buf, int len, int page)
>  {
>  	void __iomem *addr = nfc->reg_base + NFC_STATUS;
>  	struct dma_chan *chan = nfc->chan;
> @@ -238,7 +238,10 @@ static int do_dma(struct tango_nfc *nfc, int dir, int cmd, const void *buf,
>  	if (dma_map_sg(chan->device->dev, &sg, 1, dir) != 1)
>  		return -EIO;
>  
> -	desc = dmaengine_prep_slave_sg(chan, &sg, 1, dir, DMA_PREP_INTERRUPT);
> +	desc = dmaengine_prep_slave_sg(chan, &sg, 1,
> +				       dir == DMA_FROM_DEVICE ?
> +				       DMA_DEV_TO_MEM : DMA_MEM_TO_DEV,
> +				       DMA_PREP_INTERRUPT);
>  	if (!desc)
>  		goto dma_unmap;
>  

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
