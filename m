From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 7/7] mtd: spi-nor: Add Freescale QuadSpi driver
Date: Tue, 17 Dec 2013 14:16:18 +0100
References: <1387184330-14448-1-git-send-email-b32955@freescale.com>
 <1387184330-14448-8-git-send-email-b32955@freescale.com>
In-Reply-To: <1387184330-14448-8-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201312171416.18560.marex@denx.de>
Cc: angus.clark@st.com, shawn.guo@linaro.org, b44548@freescale.com,
 broonie@linaro.org, dwmw2@infradead.org, linux-doc@vger.kernel.org,
 b18965@freescale.com, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 pekon@ti.com, sourav.poddar@ti.com, computersforpeace@gmail.com,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, December 16, 2013 at 09:58:50 AM, Huang Shijie wrote:
[...]

> +/* Macros for constructing the LUT register. */
> +#define LUT0(ins, pad, opr)						\
> +		(((opr) << OPRND0_SHIFT) | ((LUT_##pad) << PAD0_SHIFT) | \
> +		((LUT_##ins) << INSTR0_SHIFT))
> +
> +#define LUT1(ins, pad, opr)	(LUT0(ins, pad, opr) << OPRND1_SHIFT)

Change this into an inline function, that way you'd get type-checking here.

[...]

> +enum fsl_qspi_devtype {
> +	FSL_QUADSPI_VYBRID,
> +	FSL_QUADSPI_IMX6SLX

Will the SLX be only a single-core chip?

> +};
> +
> +struct fsl_qspi_devtype_data {
> +	enum fsl_qspi_devtype devtype;
> +	u32 memmap_base;
> +	int rxfifo;
> +	int txfifo;
> +};
> +
> +static struct fsl_qspi_devtype_data vybrid_data = {
> +	.devtype = FSL_QUADSPI_VYBRID,
> +	.memmap_base = 0x20000000,

This memmap_base should come from DT prop.

> +	.rxfifo = 128,
> +	.txfifo = 64

Ditto for both of these too. They're HW props.

> +};
[...]

Best regards,
Marek Vasut
