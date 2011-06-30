From: Huang Shijie-B32955 <B32955@freescale.com>
To: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: reply: [PATCH v5 1/3] ARM: mxs: add GPMI-NFC support for imx23/imx28
Date: Thu, 30 Jun 2011 16:12:27 +0000
Message-ID: <14C4E31473AF7E4B98176CB73615181C19FBD3@039-SN1MPN1-006.039d.mgd.msft.net>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"w.sang@pengutronix.de" <w.sang@pengutronix.de>,
	"thierry.nolf.barco@gmail.com" <thierry.nolf.barco@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
	"LW@karo-electronics.de" <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd:=0A=
=0A=
On Thursday 30 June 2011, Huang Shijie wrote:=0A=
> add GPMI-NFC support for imx23 and imx28.=0A=
>=0A=
> Signed-off-by: Huang Shijie <b32955@freescale.com>=0A=
=0A=
>This needs a better changelog, please at least spell out what GPMI-NFC mea=
ns.=0A=
>I'm probably not the only one who gets confused into reading this as=0A=
>'near field communication' instead of 'nand flash controller'.=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
thanks.=0A=
I will add more information in the following version.=0A=
=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
>Could you rename this all into gpmi-nand or gpmi-flash instead, to avoid=
=0A=
>confusion when you add support for near field communication?=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
This is a nand flash controller driver.=0A=
=0A=
I think gpmi-nfc is much better then gpmi-nand or gpmi-flash.=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
> +#define RES_MEM(soc, _id, _s, _n)                            \=0A=
> +     {                                                       \=0A=
> +             .start =3D soc ##_## _id ## _BASE_ADDR,           \=0A=
> +             .end   =3D soc ##_## _id ## _BASE_ADDR + (_s) - 1,\=0A=
> +             .name  =3D (_n),                                  \=0A=
> +             .flags =3D IORESOURCE_MEM,                        \=0A=
> +     }=0A=
> +=0A=
> +#define RES_IRQ(soc, _id, _n)                        \=0A=
> +     {                                       \=0A=
> +             .start =3D soc ##_INT_## _id,     \=0A=
> +             .end   =3D soc ##_INT_## _id,     \=0A=
> +             .name  =3D (_n),                  \=0A=
> +             .flags =3D IORESOURCE_IRQ,        \=0A=
> +     }=0A=
> +=0A=
> +#define RES_DMA(soc, _i_s, _i_e, _n)         \=0A=
> +     {                                       \=0A=
> +             .start =3D soc ##_## _i_s,        \=0A=
> +             .end   =3D soc ##_## _i_e,        \=0A=
> +             .name  =3D (_n),                  \=0A=
> +             .flags =3D IORESOURCE_DMA,        \=0A=
> +     }=0A=
=0A=
>I know that you didn't start this pattern, but I find these macros=0A=
>extremely annoying. It obscures the use of the macros with the=0A=
>string concatenation and the macro names are way too generic=0A=
>for something platform specific. If people think it's a good idea=0A=
>to have these, please submit a patch to add macros (without the=0A=
>string concatenation) into include/linux/ioport.h.=0A=
=0A=
>Until then, better spell out the resources.=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
I ever tried several methods,  but  I can not find a better method to=0A=
replace the current method.=0A=
=0A=
It's annoying, but it really saves some lines.=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
=0A=
> +/**=0A=
> + * struct gpmi_nfc_platform_data - GPMI NFC driver platform data.=0A=
> + *=0A=
> + * This structure communicates platform-specific information to the GPMI=
 NFC=0A=
> + * driver that can't be expressed as resources.=0A=
> + *=0A=
> + * @platform_init:           A pointer to a function the driver will cal=
l to=0A=
> + *                           initialize the platform (e.g., set up the p=
in mux).=0A=
> + * @platform_exit:           A pointer to a function the driver will cal=
l to=0A=
> + *                           exit the platform (e.g., free pins).=0A=
> + * @min_prop_delay_in_ns:    Minimum propagation delay of GPMI signals t=
o and=0A=
> + *                           from the NAND Flash device, in nanoseconds.=
=0A=
> + * @max_prop_delay_in_ns:    Maximum propagation delay of GPMI signals t=
o and=0A=
> + *                           from the NAND Flash device, in nanoseconds.=
=0A=
> + * @max_chip_count:          The maximum number of chips for which the d=
river=0A=
> + *                           should configure the hardware. This value m=
ost=0A=
> + *                           likely reflects the number of pins that are=
=0A=
> + *                           connected to a NAND Flash device. If this i=
s=0A=
> + *                           greater than the SoC hardware can support, =
the=0A=
> + *                           driver will print a message and fail to ini=
tialize.=0A=
> + * @partitions:              An optional pointer to an array of partitio=
n=0A=
> + *                           descriptions.=0A=
> + * @partition_count:         The number of elements in the partitions ar=
ray.=0A=
> + */=0A=
> +struct gpmi_nfc_platform_data {=0A=
> +     /* SoC hardware information. */=0A=
> +     int             (*platform_init)(void);=0A=
> +     void            (*platform_exit)(void);=0A=
> +=0A=
> +     /* NAND Flash information. */=0A=
> +     unsigned int    min_prop_delay_in_ns;=0A=
> +     unsigned int    max_prop_delay_in_ns;=0A=
> +     unsigned int    max_chip_count;=0A=
> +=0A=
> +     /* Medium information. */=0A=
> +     struct mtd_partition *partitions;=0A=
> +     unsigned        partition_count;=0A=
> +};=0A=
=0A=
>When adding new infrastructure, always keep in mind how you want it to loo=
k=0A=
>after the device tree conversion. The partitions and min/max_* are easily =
covered=0A=
>with that, but the init/exit function pointers are somewhat problematic.=
=0A=
=0A=
>Fortunately, you don't really require these functions for this driver. The=
 _exit=0A=
>function is completely unused, so just get rid of it.=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=0A=
I am reluctant to remove it, I am not sure whether I will use the _exit() i=
n future.=0A=
But, yes, it can be removed now.=0A=
=0A=
=0A=
=0A=
Best Regards=0A=
Huang Shijie=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=0A=
=0A=
The init function is used only to set up iomux, so the logical replacement =
is=0A=
a pointer to the iomux data, and calling mxs_iomux_setup_multiple_pads=0A=
directly from the driver.=0A=
=0A=
        Arnd=0A=
=0A=
_______________________________________________=0A=
linux-arm-kernel mailing list=0A=
linux-arm-kernel@lists.infradead.org=0A=
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel=0A=
=0A=
