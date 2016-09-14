MIME-Version: 1.0
In-Reply-To: <1471505884-33996-9-git-send-email-B56489@freescale.com>
References: <1471505884-33996-1-git-send-email-B56489@freescale.com>
 <1471505884-33996-9-git-send-email-B56489@freescale.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Wed, 14 Sep 2016 14:49:23 -0500
Message-ID: <CA+EcR20QhaN1LmNTcHVnCaPf=F3m=PDHdM+ptViMWKmUJJeOOQ@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] mtd: fsl-quadspi: add multi flash chip R/W on
 ls2080a
To: Yunhui Cui <B56489@freescale.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "han.xu@freescale.com" <han.xu@freescale.com>, jagannadh.teki@gmail.com,
 Yunhui Cui <yunhui.cui@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Yao Yuan <yao.yuan@nxp.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 18, 2016 at 2:38 AM, Yunhui Cui <B56489@freescale.com> wrote:
> From: Yunhui Cui <yunhui.cui@nxp.com>
>
> There is a hardware feature that qspi_amba_base is added
> internally by SOC design on ls2080a. so memmap_phy need not
> be added in driver. If memmap_phy is added, the flash A1
> addr space is [0, memmap_phy] which far more than flash size.
> The AMBA memory will be divided into four parts and assign to
> every chipselect. Every channel will has two valid chipselects.
>
> Signed-off-by: Yunhui Cui <yunhui.cui@nxp.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 193e81b..8c9746c 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -736,11 +736,17 @@ static void fsl_qspi_set_map_addr(struct fsl_qspi *q)
>  {
>         int nor_size = q->nor_size;
>         void __iomem *base = q->iobase;
> +       u32 mem_base;
>
> -       qspi_writel(q, nor_size + q->memmap_phy, base + QUADSPI_SFA1AD);
> -       qspi_writel(q, nor_size * 2 + q->memmap_phy, base + QUADSPI_SFA2AD);
> -       qspi_writel(q, nor_size * 3 + q->memmap_phy, base + QUADSPI_SFB1AD);
> -       qspi_writel(q, nor_size * 4 + q->memmap_phy, base + QUADSPI_SFB2AD);
> +       if (has_added_amba_base_internal(q))
> +               mem_base = 0x0;
> +       else
> +               mem_base = q->memmap_phy;
> +
> +       qspi_writel(q, nor_size + mem_base, base + QUADSPI_SFA1AD);
> +       qspi_writel(q, nor_size * 2 + mem_base, base + QUADSPI_SFA2AD);
> +       qspi_writel(q, nor_size * 3 + mem_base, base + QUADSPI_SFB1AD);
> +       qspi_writel(q, nor_size * 4 + mem_base, base + QUADSPI_SFB2AD);
>  }
>
>  /*
> --
> 2.1.0.27.g96db324
>
>
Acked-by: Han xu <han.xu@nxp.com>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Sincerely,

Han XU
