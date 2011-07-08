Message-ID: <4E16CD6F.9050304@freescale.com>
Date: Fri, 8 Jul 2011 17:27:11 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v5 1/3] ARM: mxs: add GPMI-NFC support for imx23/imx28
References: <1309406028-2924-1-git-send-email-b32955@freescale.com>
	<1309406028-2924-2-git-send-email-b32955@freescale.com>
	<201106301555.19440.arnd@arndb.de>
	<20110708073119.GP29624@pengutronix.de>
	<4E16B47E.8090909@freescale.com>
	<20110708090903.GQ29624@pengutronix.de>
In-Reply-To: <20110708090903.GQ29624@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Arnd Bergmann <arnd@arndb.de>, s.hauer@pengutronix.de,
	w.sang@pengutronix.de, thierry.nolf.barco@gmail.com,
	linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>,
	linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2011=E5=B9=B407=E6=9C=8808=E6=97=A5 17:09, Uwe Kleine-K=C3=B6ni=
g =E5=86=99=E9=81=93:
> Hello,
>
> On Fri, Jul 08, 2011 at 03:40:46PM +0800, Huang Shijie wrote:
>> =E4=BA=8E 2011=E5=B9=B407=E6=9C=8808=E6=97=A5 15:31, Uwe Kleine-K=C3=B6=
nig =E5=86=99=E9=81=93:
>>> Hello,
>>>
>>> On Thu, Jun 30, 2011 at 03:55:19PM +0200, Arnd Bergmann wrote:
>>>> On Thursday 30 June 2011, Huang Shijie wrote:
>>>>> add GPMI-NFC support for imx23 and imx28.
>>>>>
>>>>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>>>>> +/**
>>>>> + * struct gpmi_nfc_platform_data - GPMI NFC driver platform data.
>>>>> + *
>>>>> + * This structure communicates platform-specific information to th=
e GPMI NFC
>>>>> + * driver that can't be expressed as resources.
>>>>> + *
>>>>> + * @platform_init:           A pointer to a function the driver wi=
ll call to
>>>>> + *                           initialize the platform (e.g., set up=
 the pin mux).
>>>>> + * @platform_exit:           A pointer to a function the driver wi=
ll call to
>>>>> + *                           exit the platform (e.g., free pins).
>>>>> + * @min_prop_delay_in_ns:    Minimum propagation delay of GPMI sig=
nals to and
>>>>> + *                           from the NAND Flash device, in nanose=
conds.
>>>>> + * @max_prop_delay_in_ns:    Maximum propagation delay of GPMI sig=
nals to and
>>>>> + *                           from the NAND Flash device, in nanose=
conds.
>>>>> + * @max_chip_count:          The maximum number of chips for which=
 the driver
>>>>> + *                           should configure the hardware. This v=
alue most
>>>>> + *                           likely reflects the number of pins th=
at are
>>>>> + *                           connected to a NAND Flash device. If =
this is
>>>>> + *                           greater than the SoC hardware can sup=
port, the
>>>>> + *                           driver will print a message and fail =
to initialize.
>>>>> + * @partitions:              An optional pointer to an array of pa=
rtition
>>>>> + *                           descriptions.
>>>>> + * @partition_count:         The number of elements in the partiti=
ons array.
>>>>> + */
>>>>> +struct gpmi_nfc_platform_data {
>>>>> +	/* SoC hardware information. */
>>>>> +	int		(*platform_init)(void);
>>>>> +	void		(*platform_exit)(void);
>>>>> +
>>>>> +	/* NAND Flash information. */
>>>>> +	unsigned int	min_prop_delay_in_ns;
>>>>> +	unsigned int	max_prop_delay_in_ns;
>>>>> +	unsigned int	max_chip_count;
>>>>> +
>>>>> +	/* Medium information. */
>>>>> +	struct mtd_partition *partitions;
>>>>> +	unsigned	partition_count;
>>>>> +};
>>>> When adding new infrastructure, always keep in mind how you want it =
to look
>>>> after the device tree conversion. The partitions and min/max_* are e=
asily covered
>>>> with that, but the init/exit function pointers are somewhat problema=
tic.
>>>>
>>>> Fortunately, you don't really require these functions for this drive=
r. The _exit
>>>> function is completely unused, so just get rid of it.
>>>>
>>>> The init function is used only to set up iomux, so the logical repla=
cement is
>>>> a pointer to the iomux data, and calling mxs_iomux_setup_multiple_pa=
ds
>>>> directly from the driver.
>>> Why not put the iomux stuff into the per-machine table and get rid of
>>> the init callback, too?
>> The mmc (ssp) has pin conflict with gpmi on both mx23evk and mx28evk.
>> So, it's better to initialize the pin when the driver(GPMI or MMC)
>> is enabled.
> What do you do to prevent userspace from trying to use both devices?
The board can not support the two devices at the same time.
So the user can only use one device with the board.

> I guess you need to configure the hardware somehow to switch between th=
e
> two using a jumper? Isn't it possible to detect the hardware setting an=
d
> setup the muxer accordingly?
>
> IMHO an per-device init-callback is the wrong approach to solve a pin
> conflict.
Do you have any good solution about this?


Best Regards
Huang Shijie

> Best regards
> Uwe
>
