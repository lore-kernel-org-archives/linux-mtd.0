Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9mAz-00061v-Rn
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2018 07:11:33 +0000
Date: Tue, 9 Oct 2018 09:11:06 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Rob Herring
 <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar
 Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 12/14] mtd: maps: Merge gpio-addr-flash.c into
 physmap-core.c
Message-ID: <20181009091106.7f25a314@bbrezillon>
In-Reply-To: <CAPybu_3ZTNzB=PmidBRzW_ZG_H5Pwwp7sro52LuO58XpOzq+Tg@mail.gmail.com>
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
 <20181008201027.17952-13-boris.brezillon@bootlin.com>
 <CAPybu_3ZTNzB=PmidBRzW_ZG_H5Pwwp7sro52LuO58XpOzq+Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 9 Oct 2018 09:04:51 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> Hi Boris
>=20
> Maybe we want to leave the pdata example.
>=20
> /**
>  * The platform resource layout expected looks something like:
>  * struct mtd_partition partitions[] =3D { ... };
>  * struct physmap_flash_data flash_data =3D
> .....

Sure, I'll add it back.

>=20
>=20
> On Mon, Oct 8, 2018 at 10:10 PM Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> >
> > Controlling some MSB address lines using GPIOs is just a small
> > deviation of the generic physmap logic, and merging those two drivers
> > allows us to share most of the probe logic, which is a good thing.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/mtd/maps/Kconfig           |  19 ++-
> >  drivers/mtd/maps/Makefile          |   1 -
> >  drivers/mtd/maps/gpio-addr-flash.c | 281 -----------------------------=
--------
> >  drivers/mtd/maps/physmap-core.c    | 150 +++++++++++++++++++-
> >  4 files changed, 157 insertions(+), 294 deletions(-)
> >  delete mode 100644 drivers/mtd/maps/gpio-addr-flash.c
> >
> > diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> > index 5bffebacce86..4fd13d76b7b5 100644
> > --- a/drivers/mtd/maps/Kconfig
> > +++ b/drivers/mtd/maps/Kconfig
> > @@ -94,6 +94,15 @@ config MTD_PHYSMAP_OF_GEMINI
> >           platforms, some detection and setting up parallel mode on the
> >           external interface.
> >
> > +config MTD_PHYSMAP_GPIO_ADDR
> > +       bool "GPIO-assisted Flash Chip Support"
> > +       depends on MTD_PHYSMAP
> > +       depends on GPIOLIB || COMPILE_TEST
> > +       depends on MTD_COMPLEX_MAPPINGS
> > +       help
> > +         Extend the physmap driver to allow flashes to be partially
> > +         physically addressed and assisted by GPIOs.
> > +
> >  config MTD_PMC_MSP_EVM
> >         tristate "CFI Flash device mapped on PMC-Sierra MSP"
> >         depends on PMC_MSP && MTD_CFI
> > @@ -334,16 +343,6 @@ config MTD_PCMCIA_ANONYMOUS
> >
> >           If unsure, say N.
> >
> > -config MTD_GPIO_ADDR
> > -       tristate "GPIO-assisted Flash Chip Support"
> > -       depends on GPIOLIB || COMPILE_TEST
> > -       depends on MTD_COMPLEX_MAPPINGS
> > -       help
> > -         Map driver which allows flashes to be partially physically ad=
dressed
> > -         and assisted by GPIOs.
> > -
> > -         If compiled as a module, it will be called gpio-addr-flash.
> > -
> >  config MTD_UCLINUX
> >         bool "Generic uClinux RAM/ROM filesystem support"
> >         depends on (MTD_RAM=3Dy || MTD_ROM=3Dy) && (!MMU || COLDFIRE)
> > diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
> > index ad32b185a120..acec0fbfa18d 100644
> > --- a/drivers/mtd/maps/Makefile
> > +++ b/drivers/mtd/maps/Makefile
> > @@ -43,6 +43,5 @@ obj-$(CONFIG_MTD_PLATRAM)     +=3D plat-ram.o
> >  obj-$(CONFIG_MTD_INTEL_VR_NOR) +=3D intel_vr_nor.o
> >  obj-$(CONFIG_MTD_RBTX4939)     +=3D rbtx4939-flash.o
> >  obj-$(CONFIG_MTD_VMU)          +=3D vmu-flash.o
> > -obj-$(CONFIG_MTD_GPIO_ADDR)    +=3D gpio-addr-flash.o
> >  obj-$(CONFIG_MTD_LATCH_ADDR)   +=3D latch-addr-flash.o
> >  obj-$(CONFIG_MTD_LANTIQ)       +=3D lantiq-flash.o
> > diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio=
-addr-flash.c
> > deleted file mode 100644
> > index a20e85aa770e..000000000000
> > --- a/drivers/mtd/maps/gpio-addr-flash.c
> > +++ /dev/null
> > @@ -1,281 +0,0 @@
> > -/*
> > - * drivers/mtd/maps/gpio-addr-flash.c
> > - *
> > - * Handle the case where a flash device is mostly addressed using phys=
ical
> > - * line and supplemented by GPIOs.  This way you can hook up say a 8Mi=
B flash
> > - * to a 2MiB memory range and use the GPIOs to select a particular ran=
ge.
> > - *
> > - * Copyright =C2=A9 2000 Nicolas Pitre <nico@cam.org>
> > - * Copyright =C2=A9 2005-2009 Analog Devices Inc.
> > - *
> > - * Enter bugs at http://blackfin.uclinux.org/
> > - *
> > - * Licensed under the GPL-2 or later.
> > - */
> > -
> > -#include <linux/gpio.h>
> > -#include <linux/gpio/consumer.h>
> > -#include <linux/io.h>
> > -#include <linux/kernel.h>
> > -#include <linux/module.h>
> > -#include <linux/mtd/mtd.h>
> > -#include <linux/mtd/map.h>
> > -#include <linux/mtd/partitions.h>
> > -#include <linux/mtd/physmap.h>
> > -#include <linux/platform_device.h>
> > -#include <linux/slab.h>
> > -#include <linux/types.h>
> > -
> > -#define win_mask(x) ((BIT(x)) - 1)
> > -
> > -#define DRIVER_NAME "gpio-addr-flash"
> > -
> > -/**
> > - * struct async_state - keep GPIO flash state
> > - *     @mtd:         MTD state for this mapping
> > - *     @map:         MTD map state for this flash
> > - *     @gpios:       Struct containing the array of GPIO descriptors
> > - *     @gpio_values: cached GPIO values
> > - *     @win_order:   dedicated memory size (if no GPIOs)
> > - */
> > -struct async_state {
> > -       struct mtd_info *mtd;
> > -       struct map_info map;
> > -       struct gpio_descs *gpios;
> > -       unsigned int gpio_values;
> > -       unsigned int win_order;
> > -};
> > -#define gf_map_info_to_state(mi) ((struct async_state *)(mi)->map_priv=
_1)
> > -
> > -/**
> > - * gf_set_gpios() - set GPIO address lines to access specified flash o=
ffset
> > - *     @state: GPIO flash state
> > - *     @ofs:   desired offset to access
> > - *
> > - * Rather than call the GPIO framework every time, cache the last-prog=
rammed
> > - * value.  This speeds up sequential accesses (which are by far the mo=
st common
> > - * type).
> > - */
> > -static void gf_set_gpios(struct async_state *state, unsigned long ofs)
> > -{
> > -       int i;
> > -
> > -       ofs >>=3D state->win_order;
> > -
> > -       if (ofs =3D=3D state->gpio_values)
> > -               return;
> > -
> > -       for (i =3D 0; i < state->gpios->ndescs; i++) {
> > -               if ((ofs & BIT(i)) =3D=3D (state->gpio_values & BIT(i)))
> > -                       continue;
> > -
> > -               gpiod_set_value(state->gpios->desc[i], !!(ofs & BIT(i))=
);
> > -       }
> > -
> > -       state->gpio_values =3D ofs;
> > -}
> > -
> > -/**
> > - * gf_read() - read a word at the specified offset
> > - *     @map: MTD map state
> > - *     @ofs: desired offset to read
> > - */
> > -static map_word gf_read(struct map_info *map, unsigned long ofs)
> > -{
> > -       struct async_state *state =3D gf_map_info_to_state(map);
> > -       uint16_t word;
> > -       map_word test;
> > -
> > -       gf_set_gpios(state, ofs);
> > -
> > -       word =3D readw(map->virt + (ofs & win_mask(state->win_order)));
> > -       test.x[0] =3D word;
> > -       return test;
> > -}
> > -
> > -/**
> > - * gf_copy_from() - copy a chunk of data from the flash
> > - *     @map:  MTD map state
> > - *     @to:   memory to copy to
> > - *     @from: flash offset to copy from
> > - *     @len:  how much to copy
> > - *
> > - * The "from" region may straddle more than one window, so toggle the =
GPIOs for
> > - * each window region before reading its data.
> > - */
> > -static void gf_copy_from(struct map_info *map, void *to, unsigned long=
 from, ssize_t len)
> > -{
> > -       struct async_state *state =3D gf_map_info_to_state(map);
> > -
> > -       int this_len;
> > -
> > -       while (len) {
> > -               this_len =3D from & win_mask(state->win_order);
> > -               this_len =3D BIT(state->win_order) - this_len;
> > -               this_len =3D min_t(int, len, this_len);
> > -
> > -               gf_set_gpios(state, from);
> > -               memcpy_fromio(to,
> > -                             map->virt + (from & win_mask(state->win_o=
rder)),
> > -                             this_len);
> > -               len -=3D this_len;
> > -               from +=3D this_len;
> > -               to +=3D this_len;
> > -       }
> > -}
> > -
> > -/**
> > - * gf_write() - write a word at the specified offset
> > - *     @map: MTD map state
> > - *     @ofs: desired offset to write
> > - */
> > -static void gf_write(struct map_info *map, map_word d1, unsigned long =
ofs)
> > -{
> > -       struct async_state *state =3D gf_map_info_to_state(map);
> > -       uint16_t d;
> > -
> > -       gf_set_gpios(state, ofs);
> > -
> > -       d =3D d1.x[0];
> > -       writew(d, map->virt + (ofs & win_mask(state->win_order)));
> > -}
> > -
> > -/**
> > - * gf_copy_to() - copy a chunk of data to the flash
> > - *     @map:  MTD map state
> > - *     @to:   flash offset to copy to
> > - *     @from: memory to copy from
> > - *     @len:  how much to copy
> > - *
> > - * See gf_copy_from() caveat.
> > - */
> > -static void gf_copy_to(struct map_info *map, unsigned long to,
> > -                      const void *from, ssize_t len)
> > -{
> > -       struct async_state *state =3D gf_map_info_to_state(map);
> > -
> > -       int this_len;
> > -
> > -       while (len) {
> > -               this_len =3D to & win_mask(state->win_order);
> > -               this_len =3D BIT(state->win_order) - this_len;
> > -               this_len =3D min_t(int, len, this_len);
> > -
> > -               gf_set_gpios(state, to);
> > -               memcpy_toio(map->virt + (to & win_mask(state->win_order=
)),
> > -                           from, len);
> > -
> > -               len -=3D this_len;
> > -               to +=3D this_len;
> > -               from +=3D this_len;
> > -       }
> > -}
> > -
> > -static const char * const part_probe_types[] =3D {
> > -       "cmdlinepart", "RedBoot", NULL };
> > -
> > -/**
> > - * gpio_flash_probe() - setup a mapping for a GPIO assisted flash
> > - *     @pdev: platform device
> > - *
> > - * The platform resource layout expected looks something like:
> > - * struct mtd_partition partitions[] =3D { ... };
> > - * struct physmap_flash_data flash_data =3D { ... };
> > - * static struct gpiod_lookup_table addr_flash_gpios =3D {
> > - *             .dev_id =3D "gpio-addr-flash.0",
> > - *             .table =3D {
> > - *             GPIO_LOOKUP_IDX("gpio.0", 15, "addr", 0, GPIO_ACTIVE_HI=
GH),
> > - *             GPIO_LOOKUP_IDX("gpio.0", 16, "addr", 1, GPIO_ACTIVE_HI=
GH),
> > - *             );
> > - * };
> > - * gpiod_add_lookup_table(&addr_flash_gpios);
> > - *
> > - * struct resource flash_resource[] =3D {
> > - *     {
> > - *             .name  =3D "cfi_probe",
> > - *             .start =3D 0x20000000,
> > - *             .end   =3D 0x201fffff,
> > - *             .flags =3D IORESOURCE_MEM,
> > - *     },
> > - * };
> > - * struct platform_device flash_device =3D {
> > - *     .name          =3D "gpio-addr-flash",
> > - *     .dev           =3D { .platform_data =3D &flash_data, },
> > - *     .num_resources =3D ARRAY_SIZE(flash_resource),
> > - *     .resource      =3D flash_resource,
> > - *     ...
> > - * };
> > - */
> > -static int gpio_flash_probe(struct platform_device *pdev)
> > -{
> > -       struct physmap_flash_data *pdata;
> > -       struct resource *memory;
> > -       struct async_state *state;
> > -
> > -       pdata =3D dev_get_platdata(&pdev->dev);
> > -       memory =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -
> > -       if (!memory)
> > -               return -EINVAL;
> > -
> > -       state =3D devm_kzalloc(&pdev->dev, sizeof(*state), GFP_KERNEL);
> > -       if (!state)
> > -               return -ENOMEM;
> > -
> > -       state->gpios =3D devm_gpiod_get_array(&pdev->dev, "addr", GPIOD=
_OUT_LOW);
> > -       if (IS_ERR(state->gpios))
> > -               return PTR_ERR(state->gpios);
> > -
> > -       state->win_order      =3D get_bitmask_order(resource_size(memor=
y)) - 1;
> > -
> > -       state->map.name       =3D DRIVER_NAME;
> > -       state->map.read       =3D gf_read;
> > -       state->map.copy_from  =3D gf_copy_from;
> > -       state->map.write      =3D gf_write;
> > -       state->map.copy_to    =3D gf_copy_to;
> > -       state->map.bankwidth  =3D pdata->width;
> > -       state->map.size       =3D BIT(state->win_order + state->gpios->=
ndescs);
> > -       state->map.virt       =3D devm_ioremap_resource(&pdev->dev, mem=
ory);
> > -       if (IS_ERR(state->map.virt))
> > -               return PTR_ERR(state->map.virt);
> > -
> > -       state->map.phys       =3D NO_XIP;
> > -       state->map.map_priv_1 =3D (unsigned long)state;
> > -
> > -       platform_set_drvdata(pdev, state);
> > -
> > -       dev_notice(&pdev->dev, "probing %d-bit flash bus\n",
> > -                  state->map.bankwidth * 8);
> > -       state->mtd =3D do_map_probe(memory->name, &state->map);
> > -       if (!state->mtd)
> > -               return -ENXIO;
> > -       state->mtd->dev.parent =3D &pdev->dev;
> > -
> > -       mtd_device_parse_register(state->mtd, part_probe_types, NULL,
> > -                                 pdata->parts, pdata->nr_parts);
> > -
> > -       return 0;
> > -}
> > -
> > -static int gpio_flash_remove(struct platform_device *pdev)
> > -{
> > -       struct async_state *state =3D platform_get_drvdata(pdev);
> > -
> > -       mtd_device_unregister(state->mtd);
> > -       map_destroy(state->mtd);
> > -       return 0;
> > -}
> > -
> > -static struct platform_driver gpio_flash_driver =3D {
> > -       .probe          =3D gpio_flash_probe,
> > -       .remove         =3D gpio_flash_remove,
> > -       .driver         =3D {
> > -               .name   =3D DRIVER_NAME,
> > -       },
> > -};
> > -
> > -module_platform_driver(gpio_flash_driver);
> > -
> > -MODULE_AUTHOR("Mike Frysinger <vapier@gentoo.org>");
> > -MODULE_DESCRIPTION("MTD map driver for flashes addressed physically an=
d with gpios");
> > -MODULE_LICENSE("GPL");
> > diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap=
-core.c
> > index 7a50ff9ef812..2dc33ae71335 100644
> > --- a/drivers/mtd/maps/physmap-core.c
> > +++ b/drivers/mtd/maps/physmap-core.c
> > @@ -13,6 +13,14 @@
> >   *
> >   *    Revised to handle newer style flash binding by:
> >   *    Copyright (C) 2007 David Gibson, IBM Corporation.
> > + *
> > + * GPIO address extension:
> > + *    Handle the case where a flash device is mostly addressed using p=
hysical
> > + *    line and supplemented by GPIOs.  This way you can hook up say a =
8MiB flash
> > + *    to a 2MiB memory range and use the GPIOs to select a particular =
range.
> > + *
> > + *    Copyright =C2=A9 2000 Nicolas Pitre <nico@cam.org>
> > + *    Copyright =C2=A9 2005-2009 Analog Devices Inc.
> >   */
> >
> >  #include <linux/module.h>
> > @@ -30,6 +38,7 @@
> >  #include <linux/mtd/cfi_endian.h>
> >  #include <linux/io.h>
> >  #include <linux/of_device.h>
> > +#include <linux/gpio/consumer.h>
> >
> >  #include "physmap_of_gemini.h"
> >  #include "physmap_of_versatile.h"
> > @@ -45,6 +54,9 @@ struct physmap_flash_info {
> >         const char * const      *part_types;
> >         unsigned int            nparts;
> >         const struct mtd_partition *parts;
> > +       struct gpio_descs       *gpios;
> > +       unsigned int            gpio_values;
> > +       unsigned int            win_order;
> >  };
> >
> >  static int physmap_flash_remove(struct platform_device *dev)
> > @@ -104,6 +116,119 @@ static void physmap_set_vpp(struct map_info *map,=
 int state)
> >         spin_unlock_irqrestore(&info->vpp_lock, flags);
> >  }
> >
> > +#if IS_ENABLED(CONFIG_MTD_PHYSMAP_GPIO_ADDR)
> > +static void physmap_set_addr_gpios(struct physmap_flash_info *info,
> > +                                  unsigned long ofs)
> > +{
> > +       unsigned int i;
> > +
> > +       ofs >>=3D info->win_order;
> > +       if (info->gpio_values =3D=3D ofs)
> > +               return;
> > +
> > +       for (i =3D 0; i < info->gpios->ndescs; i++) {
> > +               if ((BIT(i) & ofs) =3D=3D (BIT(i) & info->gpio_values))
> > +                       continue;
> > +
> > +               gpiod_set_value(info->gpios->desc[i], !!(BIT(i) & ofs));
> > +       }
> > +}
> > +
> > +#define win_mask(order)                (BIT(order) - 1)
> > +
> > +static map_word physmap_addr_gpios_read(struct map_info *map,
> > +                                       unsigned long ofs)
> > +{
> > +       struct platform_device *pdev;
> > +       struct physmap_flash_info *info;
> > +       map_word mw;
> > +       u16 word;
> > +
> > +       pdev =3D (struct platform_device *)map->map_priv_1;
> > +       info =3D platform_get_drvdata(pdev);
> > +       physmap_set_addr_gpios(info, ofs);
> > +
> > +       word =3D readw(map->virt + (ofs & win_mask(info->win_order)));
> > +       mw.x[0] =3D word;
> > +       return mw;
> > +}
> > +
> > +static void physmap_addr_gpios_copy_from(struct map_info *map, void *b=
uf,
> > +                                        unsigned long ofs, ssize_t len)
> > +{
> > +       struct platform_device *pdev;
> > +       struct physmap_flash_info *info;
> > +
> > +       pdev =3D (struct platform_device *)map->map_priv_1;
> > +       info =3D platform_get_drvdata(pdev);
> > +
> > +       while (len) {
> > +               unsigned int winofs =3D ofs & win_mask(info->win_order);
> > +               unsigned int chunklen =3D min_t(unsigned int, len,
> > +                                             BIT(info->win_order) - wi=
nofs);
> > +
> > +               physmap_set_addr_gpios(info, ofs);
> > +               memcpy_fromio(buf, map->virt + winofs, chunklen);
> > +               len -=3D chunklen;
> > +               buf +=3D chunklen;
> > +               ofs +=3D chunklen;
> > +       }
> > +}
> > +
> > +static void physmap_addr_gpios_write(struct map_info *map, map_word mw,
> > +                                    unsigned long ofs)
> > +{
> > +       struct platform_device *pdev;
> > +       struct physmap_flash_info *info;
> > +       u16 word;
> > +
> > +       pdev =3D (struct platform_device *)map->map_priv_1;
> > +       info =3D platform_get_drvdata(pdev);
> > +       physmap_set_addr_gpios(info, ofs);
> > +
> > +       word =3D mw.x[0];
> > +       writew(word, map->virt + (ofs & win_mask(info->win_order)));
> > +}
> > +
> > +static void physmap_addr_gpios_copy_to(struct map_info *map, unsigned =
long ofs,
> > +                                      const void *buf, ssize_t len)
> > +{
> > +       struct platform_device *pdev;
> > +       struct physmap_flash_info *info;
> > +
> > +       pdev =3D (struct platform_device *)map->map_priv_1;
> > +       info =3D platform_get_drvdata(pdev);
> > +
> > +       while (len) {
> > +               unsigned int winofs =3D ofs & win_mask(info->win_order);
> > +               unsigned int chunklen =3D min_t(unsigned int, len,
> > +                                             BIT(info->win_order) - wi=
nofs);
> > +
> > +               physmap_set_addr_gpios(info, ofs);
> > +               memcpy_toio(map->virt + winofs, buf, chunklen);
> > +               len -=3D chunklen;
> > +               buf +=3D chunklen;
> > +               ofs +=3D chunklen;
> > +       }
> > +}
> > +
> > +static int physmap_addr_gpios_map_init(struct map_info *map)
> > +{
> > +       map->phys =3D NO_XIP;
> > +       map->read =3D physmap_addr_gpios_read;
> > +       map->copy_from =3D physmap_addr_gpios_copy_from;
> > +       map->write =3D physmap_addr_gpios_write;
> > +       map->copy_to =3D physmap_addr_gpios_copy_to;
> > +
> > +       return 0;
> > +}
> > +#else
> > +static int physmap_addr_gpios_map_init(struct map_info *map)
> > +{
> > +       return -ENOTSUPP;
> > +}
> > +#endif
> > +
> >  #if IS_ENABLED(CONFIG_MTD_PHYSMAP_OF)
> >  static const struct of_device_id of_flash_match[] =3D {
> >         {
> > @@ -343,6 +468,16 @@ static int physmap_flash_probe(struct platform_dev=
ice *dev)
> >
> >         platform_set_drvdata(dev, info);
> >
> > +       info->gpios =3D devm_gpiod_get_array_optional(&dev->dev, "addr",
> > +                                                   GPIOD_OUT_LOW);
> > +       if (IS_ERR(info->gpios))
> > +               return PTR_ERR(info->gpios);
> > +
> > +       if (info->gpios && info->nmaps > 1) {
> > +               dev_err(&dev->dev, "addr-gpios only supported for nmaps=
 =3D=3D 1\n");
> > +               return -EINVAL;
> > +       }
> > +
> >         err =3D physmap_flash_of_init(dev);
> >         if (err)
> >                 err =3D physmap_flash_pdata_init(dev);
> > @@ -368,10 +503,20 @@ static int physmap_flash_probe(struct platform_de=
vice *dev)
> >                 if (!info->maps[i].phys)
> >                         info->maps[i].phys =3D res->start;
> >
> > -               info->maps[i].size =3D resource_size(res);
> > +               info->win_order =3D get_bitmask_order(resource_size(res=
)) - 1;
> > +               info->maps[i].size =3D BIT(info->win_order +
> > +                                        (info->gpios ?
> > +                                         info->gpios->ndescs : 0));
> > +
> >                 info->maps[i].map_priv_1 =3D (unsigned long)dev;
> >
> > -               simple_map_init(&info->maps[i]);
> > +               if (info->gpios) {
> > +                       err =3D physmap_addr_gpios_map_init(&info->maps=
[i]);
> > +                       if (err)
> > +                               goto err_out;
> > +               } else {
> > +                       simple_map_init(&info->maps[i]);
> > +               }
> >
> >                 probe_type =3D rom_probe_types;
> >                 if (!info->probe_type) {
> > @@ -496,6 +641,7 @@ module_exit(physmap_exit);
> >  MODULE_LICENSE("GPL");
> >  MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
> >  MODULE_AUTHOR("Vitaly Wool <vwool@ru.mvista.com>");
> > +MODULE_AUTHOR("Mike Frysinger <vapier@gentoo.org>");
> >  MODULE_DESCRIPTION("Generic configurable MTD map driver");
> >
> >  /* legacy platform drivers can't hotplug or coldplg */
> > --
> > 2.14.1
> > =20
>=20
>=20
