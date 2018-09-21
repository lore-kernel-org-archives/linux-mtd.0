Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3PEW-0003m5-H2
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2018 17:28:50 +0000
Received: by mail-pg1-x542.google.com with SMTP id q19-v6so5490534pgn.10
 for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2018 10:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180920233024.28534-1-natechancellor@gmail.com>
In-Reply-To: <20180920233024.28534-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 21 Sep 2018 10:28:22 -0700
Message-ID: <CAKwvOd=V4n9MXDn3+gX7iQtoCBNEcn3CSueg++QvOMMzD4VDDg@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: Use proper enum for flctl_dma_fifo0_transfer
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at,
 David Woodhouse <dwmw2@infradead.org>, computersforpeace@gmail.com,
 marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 20, 2018 at 4:31 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns when one enumerated type is converted implicitly to another:
>
> drivers/mtd/nand/raw/sh_flctl.c:483:46: warning: implicit conversion
> from enumeration type 'enum dma_transfer_direction' to different
> enumeration type 'enum dma_data_direction' [-Wenum-conversion]
>                 flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_DEV_TO_MEM) > 0)
>                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
> drivers/mtd/nand/raw/sh_flctl.c:542:46: warning: implicit conversion
> from enumeration type 'enum dma_transfer_direction' to different
> enumeration type 'enum dma_data_direction' [-Wenum-conversion]
>                 flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV) > 0)
>                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
> 2 warnings generated.
>
> Use the proper enums from dma_data_direction to satisfy Clang.
>
> DMA_MEM_TO_DEV = DMA_TO_DEVICE = 1
> DMA_DEV_TO_MEM = DMA_FROM_DEVICE = 2
>
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/mtd/nand/raw/sh_flctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
> index c0c0798f268f..4d20d033de7b 100644
> --- a/drivers/mtd/nand/raw/sh_flctl.c
> +++ b/drivers/mtd/nand/raw/sh_flctl.c
> @@ -480,7 +480,7 @@ static void read_fiforeg(struct sh_flctl *flctl, int rlen, int offset)
>
>         /* initiate DMA transfer */
>         if (flctl->chan_fifo0_rx && rlen >= 32 &&
> -               flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_DEV_TO_MEM) > 0)
> +               flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_FROM_DEVICE) > 0)

Looks like flctl_dma_fifo0_transfer() expects an `enum
dma_data_direction dir`, not an `enum dma_transfer_direction` as noted
by the warning, and luckily the values specified happened to have the
same value today as you noted.  So this change is no functional
change, but will prevent changes to either enum from potentially
breaking this code.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>                         goto convert;   /* DMA success */
>
>         /* do polling transfer */
> @@ -539,7 +539,7 @@ static void write_ec_fiforeg(struct sh_flctl *flctl, int rlen,
>
>         /* initiate DMA transfer */
>         if (flctl->chan_fifo0_tx && rlen >= 32 &&
> -               flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV) > 0)
> +               flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_TO_DEVICE) > 0)
>                         return; /* DMA success */
>
>         /* do polling transfer */
> --
> 2.19.0
>


-- 
Thanks,
~Nick Desaulniers
