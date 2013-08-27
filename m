Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEMiS-0000T0-KX
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2013 17:06:05 +0000
Received: by mail-pb0-f47.google.com with SMTP id rr4so5052967pbb.20
 for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2013 10:05:43 -0700 (PDT)
Message-ID: <521CDC55.60602@gmail.com>
Date: Tue, 27 Aug 2013 22:35:25 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V2 2/4] mtd: gpmi: use DMA channel 0 for all the nand chips
References: <1377595747-21033-1-git-send-email-b32955@freescale.com>
 <1377595747-21033-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1377595747-21033-3-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27/Aug/2013 2:59 PM, Huang Shijie wrote:
> We only have one DMA channel : the channel 0.
> Use DMA channel 0 to access all the nand chips.

IIRC, We have 4 DMA channels. Don't we?

> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>   drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    5 ++---
>   1 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 8d8a814..24ee8d7 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -357,9 +357,8 @@ int common_nfc_set_geometry(struct gpmi_nand_data *this)
>
>   struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)
>   {
> -	int chipnr = this->current_chip;
> -
> -	return this->dma_chans[chipnr];
> +	/* We use the DMA channel 0 to access all the nand chips. */
> +	return this->dma_chans[0];
>   }
>
>   /* Can we use the upper's buffer directly for DMA? */
>
