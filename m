Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFnEf-0001Y5-PA
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2012 14:32:42 +0000
Received: by pbbrq8 with SMTP id rq8so11397771pbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2012 07:32:41 -0700 (PDT)
Message-ID: <505F1D72.6020306@gmail.com>
Date: Sun, 23 Sep 2012 20:02:18 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Bastian Hecht <hechtb@googlemail.com>
Subject: Re: [PATCH 2/2] mtd: sh_flctl: Use DMA for data fifo FLTDFIFO when
 available
References: <1348401683-15698-1-git-send-email-hechtb@gmail.com>
 <1348401683-15698-2-git-send-email-hechtb@gmail.com>
In-Reply-To: <1348401683-15698-2-git-send-email-hechtb@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/23/2012 5:31 PM, Bastian Hecht wrote:
> Map and unmap DMA buffers, trigger the DMA and wait for the completion.
> On failure we fallback to PIO mode.
>
> Signed-off-by: Bastian Hecht<hechtb@gmail.com>
> ---
>   drivers/mtd/nand/sh_flctl.c  |   99 +++++++++++++++++++++++++++++++++++++++++-
>   include/linux/mtd/sh_flctl.h |    1 +
>   2 files changed, 98 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index 2cf6871..00211f9 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -24,6 +24,8 @@
>   #include<linux/module.h>
>   #include<linux/kernel.h>
>   #include<linux/delay.h>
> +#include<linux/dmaengine.h>
> +#include<linux/dma-mapping.h>
>   #include<linux/interrupt.h>
>   #include<linux/io.h>
>   #include<linux/platform_device.h>
> @@ -106,6 +108,13 @@ static void wait_completion(struct sh_flctl *flctl)
>   	writeb(0x0, FLTRCR(flctl));
>   }
>
> +static void flctl_dma_complete(void *param)
> +{
> +	struct sh_flctl *flctl = param;
> +
> +	complete(&flctl->dma_complete);
> +}
> +
>   static void set_addr(struct mtd_info *mtd, int column, int page_addr)
>   {
>   	struct sh_flctl *flctl = mtd_to_flctl(mtd);
> @@ -261,6 +270,71 @@ static void wait_wecfifo_ready(struct sh_flctl *flctl)
>   	timeout_error(flctl, __func__);
>   }
>
> +static void flctl_release_dma(struct sh_flctl *flctl);

I don't think the above statement is required.

~Vikram
