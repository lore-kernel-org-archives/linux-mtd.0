Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qf5XA-0005Km-1x
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2011 07:31:32 +0000
Date: Fri, 8 Jul 2011 09:31:19 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v5 1/3] ARM: mxs: add GPMI-NFC support for imx23/imx28
Message-ID: <20110708073119.GP29624@pengutronix.de>
References: <1309406028-2924-1-git-send-email-b32955@freescale.com>
	<1309406028-2924-2-git-send-email-b32955@freescale.com>
	<201106301555.19440.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201106301555.19440.arnd@arndb.de>
Cc: Arnd Bergmann <arnd@arndb.de>, s.hauer@pengutronix.de,
	w.sang@pengutronix.de, thierry.nolf.barco@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, Jun 30, 2011 at 03:55:19PM +0200, Arnd Bergmann wrote:
> On Thursday 30 June 2011, Huang Shijie wrote:
> > add GPMI-NFC support for imx23 and imx28.
> > 
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> 
> > +/**
> > + * struct gpmi_nfc_platform_data - GPMI NFC driver platform data.
> > + *
> > + * This structure communicates platform-specific information to the GPMI NFC
> > + * driver that can't be expressed as resources.
> > + *
> > + * @platform_init:           A pointer to a function the driver will call to
> > + *                           initialize the platform (e.g., set up the pin mux).
> > + * @platform_exit:           A pointer to a function the driver will call to
> > + *                           exit the platform (e.g., free pins).
> > + * @min_prop_delay_in_ns:    Minimum propagation delay of GPMI signals to and
> > + *                           from the NAND Flash device, in nanoseconds.
> > + * @max_prop_delay_in_ns:    Maximum propagation delay of GPMI signals to and
> > + *                           from the NAND Flash device, in nanoseconds.
> > + * @max_chip_count:          The maximum number of chips for which the driver
> > + *                           should configure the hardware. This value most
> > + *                           likely reflects the number of pins that are
> > + *                           connected to a NAND Flash device. If this is
> > + *                           greater than the SoC hardware can support, the
> > + *                           driver will print a message and fail to initialize.
> > + * @partitions:              An optional pointer to an array of partition
> > + *                           descriptions.
> > + * @partition_count:         The number of elements in the partitions array.
> > + */
> > +struct gpmi_nfc_platform_data {
> > +	/* SoC hardware information. */
> > +	int		(*platform_init)(void);
> > +	void		(*platform_exit)(void);
> > +
> > +	/* NAND Flash information. */
> > +	unsigned int	min_prop_delay_in_ns;
> > +	unsigned int	max_prop_delay_in_ns;
> > +	unsigned int	max_chip_count;
> > +
> > +	/* Medium information. */
> > +	struct mtd_partition *partitions;
> > +	unsigned	partition_count;
> > +};
> 
> When adding new infrastructure, always keep in mind how you want it to look
> after the device tree conversion. The partitions and min/max_* are easily covered
> with that, but the init/exit function pointers are somewhat problematic.
> 
> Fortunately, you don't really require these functions for this driver. The _exit
> function is completely unused, so just get rid of it.
> 
> The init function is used only to set up iomux, so the logical replacement is
> a pointer to the iomux data, and calling mxs_iomux_setup_multiple_pads
> directly from the driver.
Why not put the iomux stuff into the per-machine table and get rid of
the init callback, too?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
