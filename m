Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xe9wp-0002iu-Mu
 for linux-mtd@lists.infradead.org; Tue, 14 Oct 2014 21:48:05 +0000
From: Marek Vasut <marex@denx.de>
To: Chao Fu <b44548@freescale.com>
Subject: Re: [PATCH] spi-nor:fsl-quadspi:Add LS1021 support for fsl_quadspi
Date: Tue, 14 Oct 2014 23:10:13 +0200
References: <1413268581-9106-1-git-send-email-b44548@freescale.com>
In-Reply-To: <1413268581-9106-1-git-send-email-b44548@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201410142310.13832.marex@denx.de>
Cc: ryazanov.s.a@gmail.com, geert+renesas@glider.be, zajec5@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 shijie.huang@intel.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, October 14, 2014 at 08:36:21 AM, Chao Fu wrote:
> From: Chao Fu <B44548@freescale.com>
> 
> FSL Quadspi module register bitwise is big-endian, but on ohter paltform
> is little endian.
> Add functions for Quadspi register read/write for bitwise:
> qspi_readl
> qpsi_writel

The commit message really needs fixing ;-)

> Add devtype for LS1021:
> struct fsl_qspi_devtype_data ls1_data

A devtype ?

[...]

> @@ -242,6 +250,23 @@ static inline int is_imx6sx_qspi(struct fsl_qspi *q)
>  	return q->devtype_data->devtype == FSL_QUADSPI_IMX6SX;
>  }
> 
> +static inline int is_ls1_qspi(struct fsl_qspi *q)

Drop the inline and rename the function to be something like 
"fsl_qspi_is_bigendian()", so once a new LS2 enters the market,
this function won't have to be renamed . Future proof the driver ;-)

> +{
> +	return q->devtype_data->devtype == FSL_QUADSPI_LS1;
> +}
> +
> +static inline void qspi_writel(struct fsl_qspi *q, u32 val, void __iomem
> *addr) +{

Drop the inline.

> +	is_ls1_qspi(q) ? __raw_writel(cpu_to_be32(val), addr) :
> +			__raw_writel(cpu_to_le32(val), addr);

You're changing the behavior here, you're replacing writel() with __raw_writel() 
and you are not documenting it anywhere. Nonetheless, such a change should be in
a separate patch anyway .

Besides, it's only the value that's bitwise-swapped here, so just do:

if (fsl_qspi_is_be())
	val = cpu_to_be32()
else
	val = cpu_to_le32()
writel(val, addr);

That's much more readable.

> +}
> +
> +static inline u32 qspi_readl(struct fsl_qspi *q, void __iomem *addr)
> +{
> +	return is_ls1_qspi(q) ? cpu_to_be32((__force u32) __raw_readl(addr)) :
> +				cpu_to_le32((__force u32) __raw_readl(addr));

DTTO as above. Furthermore, drop the __force u32 nonsense. Furthermore, here
the bitwise swaps go the other way around, thus it should be [lb]e32_to_cpu()
instead.
[...]
