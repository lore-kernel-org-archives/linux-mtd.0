Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLGek-0005CI-Gn
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 16:58:15 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so4483235pad.36
 for <linux-mtd@lists.infradead.org>; Mon, 08 Oct 2012 09:58:11 -0700 (PDT)
Message-ID: <5073061A.5040405@gmail.com>
Date: Mon, 08 Oct 2012 22:28:02 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] imx/gpmi: Make debug prints more clear
References: <505EDAF0.2040708@gmail.com>
In-Reply-To: <505EDAF0.2040708@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Huang,

Can you please give an ACK for this?

Thanks,
Vikram

On 9/23/2012 3:18 PM, Vikram Narayanan wrote:
> Make the error messages more debugging friendly
>
> Signed-off-by: Vikram Narayanan<vikram186@gmail.com>
> Cc: Huang Shijie<b32955@freescale.com>
> ---
>   drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   14 ++++++++------
>   1 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 5999b15..24fbfb8 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -222,7 +222,7 @@ void prepare_data_dma(struct gpmi_nand_data *this, enum dma_data_direction dr)
>
>   		ret = dma_map_sg(this->dev, sgl, 1, dr);
>   		if (ret == 0)
> -			pr_err("map failed.\n");
> +			pr_err("DMA mapping failed.\n");
>
>   		this->direct_dma_map_ok = false;
>   	}
> @@ -456,7 +456,7 @@ static int __devinit acquire_dma_channels(struct gpmi_nand_data *this)
>
>   	dma_chan = dma_request_channel(mask, gpmi_dma_filter, this);
>   	if (!dma_chan) {
> -		pr_err("dma_request_channel failed.\n");
> +		pr_err("Failed to request DMA channel.\n");
>   		goto acquire_err;
>   	}
>
> @@ -630,7 +630,8 @@ static int read_page_prepare(struct gpmi_nand_data *this,
>   						length, DMA_FROM_DEVICE);
>   		if (dma_mapping_error(dev, dest_phys)) {
>   			if (alt_size<  length) {
> -				pr_err("Alternate buffer is too small\n");
> +				pr_err("%s, Alternate buffer is too small\n",
> +					__func__);
>   				return -ENOMEM;
>   			}
>   			goto map_failed;
> @@ -680,7 +681,8 @@ static int send_page_prepare(struct gpmi_nand_data *this,
>   						DMA_TO_DEVICE);
>   		if (dma_mapping_error(dev, source_phys)) {
>   			if (alt_size<  length) {
> -				pr_err("Alternate buffer is too small\n");
> +				pr_err("%s, Alternate buffer is too small\n",
> +					__func__);
>   				return -ENOMEM;
>   			}
>   			goto map_failed;
> @@ -768,7 +770,7 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
>
>   error_alloc:
>   	gpmi_free_dma_buffer(this);
> -	pr_err("allocate DMA buffer ret!!\n");
> +	pr_err("Error allocating DMA buffers!\n");
>   	return -ENOMEM;
>   }
>
> @@ -1479,7 +1481,7 @@ static int gpmi_set_geometry(struct gpmi_nand_data *this)
>   	/* Set up the NFC geometry which is used by BCH. */
>   	ret = bch_set_geometry(this);
>   	if (ret) {
> -		pr_err("set geometry ret : %d\n", ret);
> +		pr_err("Error setting BCH geometry : %d\n", ret);
>   		return ret;
>   	}
>
