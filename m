Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuEBd-0001I6-7q
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 09:51:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id u12-v6so11713406wrr.4
 for <linux-mtd@lists.infradead.org>; Mon, 27 Aug 2018 02:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20180827085943.24324-1-hch@lst.de>
In-Reply-To: <20180827085943.24324-1-hch@lst.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 27 Aug 2018 11:51:29 +0200
Message-ID: <CAFLxGvy=1r0aKHxj_LtwFrGMULH0nFk9ZJR6YpeEM6D24P2-mw@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: qcom: don't include dma-direct.h
To: Christoph Hellwig <hch@lst.de>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 27, 2018 at 10:59 AM Christoph Hellwig <hch@lst.de> wrote:
>
> A recent commit removed the incorrect use of phys_to_dma from this
> driver, but failed to remove the dma-direct.h include, so do that
> now.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 1 -
>  include/linux/dma-mapping.h       | 6 ++++++
>  2 files changed, 6 insertions(+), 1 deletion(-)

Hmm, the diffstat does not match the diff itself.

> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index d1d470bb32e4..d2831b0b28fb 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -23,7 +23,6 @@
>  #include <linux/of_device.h>
>  #include <linux/delay.h>
>  #include <linux/dma/qcom_bam_dma.h>
> -#include <linux/dma-direct.h> /* XXX: drivers shall never use this directly! */
>
>  /* NANDc reg offsets */
>  #define        NAND_FLASH_CMD                  0x00
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Thanks,
//richard
