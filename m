From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/3] ARM: mxs: add GPMI-NFC support for imx23/imx28
Date: Thu, 30 Jun 2011 15:55:19 +0200
References: <1309406028-2924-1-git-send-email-b32955@freescale.com>
	<1309406028-2924-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1309406028-2924-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201106301555.19440.arnd@arndb.de>
Cc: s.hauer@pengutronix.de, w.sang@pengutronix.de, thierry.nolf.barco@gmail.com,
	Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de,
	LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 30 June 2011, Huang Shijie wrote:
> add GPMI-NFC support for imx23 and imx28.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

This needs a better changelog, please at least spell out what GPMI-NFC means.
I'm probably not the only one who gets confused into reading this as
'near field communication' instead of 'nand flash controller'.

Could you rename this all into gpmi-nand or gpmi-flash instead, to avoid
confusion when you add support for near field communication?

> +#define RES_MEM(soc, _id, _s, _n)				\
> +	{							\
> +		.start = soc ##_## _id ## _BASE_ADDR,		\
> +		.end   = soc ##_## _id ## _BASE_ADDR + (_s) - 1,\
> +		.name  = (_n),					\
> +		.flags = IORESOURCE_MEM,			\
> +	}
> +
> +#define RES_IRQ(soc, _id, _n)			\
> +	{					\
> +		.start = soc ##_INT_## _id,	\
> +		.end   = soc ##_INT_## _id,	\
> +		.name  = (_n),			\
> +		.flags = IORESOURCE_IRQ,	\
> +	}
> +
> +#define RES_DMA(soc, _i_s, _i_e, _n)		\
> +	{					\
> +		.start = soc ##_## _i_s,	\
> +		.end   = soc ##_## _i_e,	\
> +		.name  = (_n),			\
> +		.flags = IORESOURCE_DMA,	\
> +	}

I know that you didn't start this pattern, but I find these macros
extremely annoying. It obscures the use of the macros with the
string concatenation and the macro names are way too generic
for something platform specific. If people think it's a good idea
to have these, please submit a patch to add macros (without the
string concatenation) into include/linux/ioport.h.

Until then, better spell out the resources.

> +/**
> + * struct gpmi_nfc_platform_data - GPMI NFC driver platform data.
> + *
> + * This structure communicates platform-specific information to the GPMI NFC
> + * driver that can't be expressed as resources.
> + *
> + * @platform_init:           A pointer to a function the driver will call to
> + *                           initialize the platform (e.g., set up the pin mux).
> + * @platform_exit:           A pointer to a function the driver will call to
> + *                           exit the platform (e.g., free pins).
> + * @min_prop_delay_in_ns:    Minimum propagation delay of GPMI signals to and
> + *                           from the NAND Flash device, in nanoseconds.
> + * @max_prop_delay_in_ns:    Maximum propagation delay of GPMI signals to and
> + *                           from the NAND Flash device, in nanoseconds.
> + * @max_chip_count:          The maximum number of chips for which the driver
> + *                           should configure the hardware. This value most
> + *                           likely reflects the number of pins that are
> + *                           connected to a NAND Flash device. If this is
> + *                           greater than the SoC hardware can support, the
> + *                           driver will print a message and fail to initialize.
> + * @partitions:              An optional pointer to an array of partition
> + *                           descriptions.
> + * @partition_count:         The number of elements in the partitions array.
> + */
> +struct gpmi_nfc_platform_data {
> +	/* SoC hardware information. */
> +	int		(*platform_init)(void);
> +	void		(*platform_exit)(void);
> +
> +	/* NAND Flash information. */
> +	unsigned int	min_prop_delay_in_ns;
> +	unsigned int	max_prop_delay_in_ns;
> +	unsigned int	max_chip_count;
> +
> +	/* Medium information. */
> +	struct mtd_partition *partitions;
> +	unsigned	partition_count;
> +};

When adding new infrastructure, always keep in mind how you want it to look
after the device tree conversion. The partitions and min/max_* are easily covered
with that, but the init/exit function pointers are somewhat problematic.

Fortunately, you don't really require these functions for this driver. The _exit
function is completely unused, so just get rid of it.

The init function is used only to set up iomux, so the logical replacement is
a pointer to the iomux data, and calling mxs_iomux_setup_multiple_pads
directly from the driver.

	Arnd
