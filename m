Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zm72A-0000rc-5J
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 21:23:00 +0000
Received: by vkaw128 with SMTP id w128so18766497vka.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 14:22:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1444682116-4708-2-git-send-email-computersforpeace@gmail.com>
References: <1444682116-4708-1-git-send-email-computersforpeace@gmail.com>
 <1444682116-4708-2-git-send-email-computersforpeace@gmail.com>
Date: Tue, 13 Oct 2015 16:22:37 -0500
Message-ID: <CA+EcR2069_6P9z8p=s0HcB8HssGJN==4GRQL_4nv7qhKR34t9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: fsl-quadspi: allow building for other ARCHes
 with COMPILE_TEST
From: Han Xu <xhnjupt@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Han Xu <han.xu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 12, 2015 at 3:35 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> This driver doesn't actually need ARCH_MXC to compile. Relax the
> constraints.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Han Xu <han.xu@freescale.com>
> ---
>  drivers/mtd/spi-nor/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 89bf4c1faa2b..2fe2a7e90fa9 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -23,7 +23,8 @@ config MTD_SPI_NOR_USE_4K_SECTORS
>
>  config SPI_FSL_QUADSPI
>         tristate "Freescale Quad SPI controller"
> -       depends on ARCH_MXC
> +       depends on ARCH_MXC || COMPILE_TEST
> +       depends on HAS_IOMEM
>         help
>           This enables support for the Quad SPI controller in master mode.
>           This controller does not support generic SPI. It only supports
Acked-by: Han xu <han.xu@freescale.com>
> --
> 2.6.0.rc2.230.g3dd15c0
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
