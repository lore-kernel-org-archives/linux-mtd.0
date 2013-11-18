Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViVSC-0006JM-My
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2013 20:29:53 +0000
Received: by mail-ie0-f169.google.com with SMTP id e14so2887912iej.28
 for <linux-mtd@lists.infradead.org>; Mon, 18 Nov 2013 12:29:31 -0800 (PST)
Date: Mon, 18 Nov 2013 12:23:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 7/8] mtd: gpmi: change pr_err to dev_err
Message-ID: <20131118202340.GC9468@ld-irv-0074.broadcom.com>
References: <1384410351-2169-1-git-send-email-b32955@freescale.com>
 <1384410351-2169-8-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384410351-2169-8-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 14, 2013 at 02:25:50PM +0800, Huang Shijie wrote:
> There are pr_err and dev_err in the gpmi driver now.
> It makes people confused.
> 
> This patch changes all the pr_err to dev_err except the one
> in the gpmi_reset_block().

Hmm, many of these pr_err() are wholely uninformative. They are only
useful for someone who is doing low-level debugging fo the driver, not
for users. At most, they should be {dev_dbg,pr_debug} messages, but
really, they should be removed.

> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |   67 ++++++++++++++++++-------------
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   43 ++++++++++----------
>  2 files changed, 61 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> index 10a6f07..82ac4a3 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -1129,7 +1140,7 @@ int gpmi_send_command(struct gpmi_nand_data *this)
>  					(struct scatterlist *)pio,
>  					ARRAY_SIZE(pio), DMA_TRANS_NONE, 0);
>  	if (!desc) {
> -		pr_err("step 1 error\n");
> +		dev_err(this->dev, "step 1 error\n");

All of these "step 1/2/etc." error messages should not be here. They
should just return a proper error code (not -1) and let the caller
display an error as appropriate. (Most of the callers already handle
this fine.)

>  		return -1;
>  	}
>  
> @@ -1143,7 +1154,7 @@ int gpmi_send_command(struct gpmi_nand_data *this)
>  				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>  
>  	if (!desc) {
> -		pr_err("step 2 error\n");
> +		dev_err(this->dev, "step 2 error\n");

Same here.

>  		return -1;
>  	}
>  
> @@ -1175,7 +1186,7 @@ int gpmi_send_data(struct gpmi_nand_data *this)
>  	desc = dmaengine_prep_slave_sg(channel, (struct scatterlist *)pio,
>  					ARRAY_SIZE(pio), DMA_TRANS_NONE, 0);
>  	if (!desc) {
> -		pr_err("step 1 error\n");
> +		dev_err(this->dev, "step 1 error\n");

Same here.

>  		return -1;
>  	}
>  
> @@ -1185,7 +1196,7 @@ int gpmi_send_data(struct gpmi_nand_data *this)
>  					1, DMA_MEM_TO_DEV,
>  					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>  	if (!desc) {
> -		pr_err("step 2 error\n");
> +		dev_err(this->dev, "step 2 error\n");

Ditto.

>  		return -1;
>  	}
>  	/* [3] submit the DMA */
> @@ -1212,7 +1223,7 @@ int gpmi_read_data(struct gpmi_nand_data *this)
>  					(struct scatterlist *)pio,
>  					ARRAY_SIZE(pio), DMA_TRANS_NONE, 0);
>  	if (!desc) {
> -		pr_err("step 1 error\n");
> +		dev_err(this->dev, "step 1 error\n");

Ditto.

>  		return -1;
>  	}
>  
> @@ -1222,7 +1233,7 @@ int gpmi_read_data(struct gpmi_nand_data *this)
>  					1, DMA_DEV_TO_MEM,
>  					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>  	if (!desc) {
> -		pr_err("step 2 error\n");
> +		dev_err(this->dev, "step 2 error\n");

Ditto.

>  		return -1;
>  	}
>  
> @@ -1270,7 +1281,7 @@ int gpmi_send_page(struct gpmi_nand_data *this,
>  					ARRAY_SIZE(pio), DMA_TRANS_NONE,
>  					DMA_CTRL_ACK);
>  	if (!desc) {
> -		pr_err("step 2 error\n");
> +		dev_err(this->dev, "step 2 error\n");

Ditto.

>  		return -1;
>  	}
>  	set_dma_type(this, DMA_FOR_WRITE_ECC_PAGE);
> @@ -1305,7 +1316,7 @@ int gpmi_read_page(struct gpmi_nand_data *this,
>  				(struct scatterlist *)pio, 2,
>  				DMA_TRANS_NONE, 0);
>  	if (!desc) {
> -		pr_err("step 1 error\n");
> +		dev_err(this->dev, "step 1 error\n");

Ditto.

>  		return -1;
>  	}
>  
> @@ -1335,7 +1346,7 @@ int gpmi_read_page(struct gpmi_nand_data *this,
>  					ARRAY_SIZE(pio), DMA_TRANS_NONE,
>  					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>  	if (!desc) {
> -		pr_err("step 2 error\n");
> +		dev_err(this->dev, "step 2 error\n");

Ditto.

>  		return -1;
>  	}
>  
> @@ -1356,7 +1367,7 @@ int gpmi_read_page(struct gpmi_nand_data *this,
>  				DMA_TRANS_NONE,
>  				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>  	if (!desc) {
> -		pr_err("step 3 error\n");
> +		dev_err(this->dev, "step 3 error\n");

Ditto.

>  		return -1;
>  	}
>  

I'm not taking this patch for now.

Brian
