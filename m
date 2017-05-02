Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5MGN-00070l-TD
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 01:06:01 +0000
Received: by mail-pf0-x243.google.com with SMTP id o68so10807632pfj.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 18:05:39 -0700 (PDT)
Date: Mon, 1 May 2017 18:05:35 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: add driver for STM32 quad spi flash
 controller
Message-ID: <20170502010535.GB18576@google.com>
References: <1492103757-22375-1-git-send-email-ludovic.Barre@st.com>
 <1492103757-22375-3-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1492103757-22375-3-git-send-email-ludovic.Barre@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, Apr 13, 2017 at 07:15:57PM +0200, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> The quadspi is a specialized communication interface targeting single,
> dual or quad SPI Flash memories.
> 
> It can operate in any of the following modes:
> -indirect mode: all the operations are performed using the quadspi
>  registers
> -read memory-mapped mode: the external Flash memory is mapped to the
>  microcontroller address space and is seen by the system as if it was
>  an internal memory
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/mtd/spi-nor/Kconfig         |   7 +
>  drivers/mtd/spi-nor/Makefile        |   1 +
>  drivers/mtd/spi-nor/stm32-quadspi.c | 694 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 702 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 7252087..bfdfb1e 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -106,4 +106,11 @@ config SPI_INTEL_SPI_PLATFORM
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called intel-spi-platform.
>  
> +config SPI_STM32_QUADSPI
> +	tristate "STM32 Quad SPI controller"
> +	depends on ARCH_STM32
> +	help
> +	  This enables support for the STM32 Quad SPI controller.
> +	  We only connect the NOR to this controller.
> +
>  endif # MTD_SPI_NOR
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 72238a7..285aab8 100644
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
> @@ -0,0 +1,694 @@
...

> +static int stm32_qspi_flash_setup(struct stm32_qspi *qspi,
> +				  struct device_node *np)
> +{
> +	u32 width, flash_read, presc, cs_num, max_rate = 0;
> +	struct stm32_qspi_flash *flash;
> +	struct mtd_info *mtd;
> +	int ret;
> +
> +	of_property_read_u32(np, "reg", &cs_num);
> +	if (cs_num >= STM32_MAX_NORCHIP)
> +		return -EINVAL;
> +
> +	of_property_read_u32(np, "spi-max-frequency", &max_rate);
> +	if (!max_rate)
> +		return -EINVAL;
> +
> +	presc = DIV_ROUND_UP(qspi->clk_rate, max_rate) - 1;
> +
> +	if (of_property_read_u32(np, "spi-rx-bus-width", &width))

Can we move handling of this into spi-nor.c sometime? This is the 2nd
driver that wants this. And in this case, there's absolutely no
driver-specific handling for it. (For nxp-spifi.c, the hanling looks a
little wrong anyway -- the DT could have a larger bus width, but the
flash might only support a smaller. So the driver should gracefull
downgrade *after* we detect this, I think.)

Not a blocker for now, but just room for future work.

Brian

> +		width = 1;
> +
> +	if (width == 4)
> +		flash_read = SPI_NOR_QUAD;
> +	else if (width == 2)
> +		flash_read = SPI_NOR_DUAL;
> +	else if (width == 1)
> +		flash_read = SPI_NOR_NORMAL;
> +	else
> +		return -EINVAL;
[...]

Brian
