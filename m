Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFnDy-0001Wj-Nw
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2012 14:31:59 +0000
Received: by pbbrq8 with SMTP id rq8so11397004pbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2012 07:31:54 -0700 (PDT)
Message-ID: <505F1D34.3040407@gmail.com>
Date: Sun, 23 Sep 2012 20:01:16 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Bastian Hecht <hechtb@googlemail.com>
Subject: Re: [PATCH 1/2] mtd: sh_flctl: Setup and release DMA channels
References: <1348401683-15698-1-git-send-email-hechtb@gmail.com>
In-Reply-To: <1348401683-15698-1-git-send-email-hechtb@gmail.com>
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
> The code probes if DMA channels can get allocated and tears them down at
> removal/failure if needed.
>
> Based on Guennadi Liakhovetski's code from the sh_mmcif driver.
>
> Signed-off-by: Bastian Hecht<hechtb@gmail.com>
> ---
> Based on l2-mtd with reverted commit e26c113b4130aefa1d8446602bb5b05cfd646bfe.
>
>   drivers/mtd/nand/sh_flctl.c  |   74 ++++++++++++++++++++++++++++++++++++++++++
>   include/linux/mtd/sh_flctl.h |   10 ++++++
>   2 files changed, 84 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index 4fbfe96..2cf6871 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -856,6 +856,76 @@ static irqreturn_t flctl_handle_flste(int irq, void *dev_id)
>   	return IRQ_HANDLED;
>   }
>
> +void flctl_setup_dma(struct sh_flctl *flctl)

static?

~Vikram
