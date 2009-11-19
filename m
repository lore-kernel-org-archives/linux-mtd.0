Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NB85u-0008EU-Kd
	for linux-mtd@lists.infradead.org; Thu, 19 Nov 2009 14:34:51 +0000
Received: by fxm22 with SMTP id 22so2772033fxm.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Nov 2009 06:34:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B055414.8060200@ti.com>
References: <ce9ab5790911190616r6808feacr78d581dd958e6362@mail.gmail.com>
	<4B055414.8060200@ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 19 Nov 2009 20:04:25 +0530
Message-ID: <ce9ab5790911190634i1e9e9878s6e7edc9fc2d693e3@mail.gmail.com>
Subject: Re: [PATCH-v6 2/4] OMAP3: Add support for NAND on ZOOM/LDP boards
To: Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Tony Lindgren <tony@atomide.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	Linux MTD <linux-mtd@lists.infradead.org>, "Singh,
	Vimal" <vimalsingh@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 19, 2009 at 7:50 PM, Nishanth Menon <nm@ti.com> wrote:
> Vimal Singh had written, on 11/19/2009 08:16 AM, the following:
>>
>> From 43df1ee9e29d454100e59ee4902db157072b81b6 Mon Sep 17 00:00:00 2001
>> From: Vimal Singh <vimalsingh@ti.com>
>> Date: Thu, 19 Nov 2009 14:37:44 +0530
>> Subject: [PATCH] OMAP3: Add support for NAND on ZOOM/LDP boards
>>
>> Adding NAND support for ZOOM2/3 and LDP board.
>> I have tested it for ZOOM2 boards. Someone can verify it for LDP
>> and ZOOM3 boards, hopefully it should not have any problem.
>>
>> The size of the U-Boot environment partition was increased to 1.25MB.
>>
>> Vikram: Changed ldp name to zoom.
>> =A0 =A0 =A0Future boards will be called Zoom2/3/4 etc.
>> =A0 =A0 =A0LDP is a Zoom1. Somhow the LDP name got stuck to that.
>>
>> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> Cc: Vikram Pandita <vikram.pandita@ti.com>
>> Cc: Tony Lindgren <tony@atomide.com>
>> ---
>> =A0arch/arm/mach-omap2/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A03 +
>> =A0arch/arm/mach-omap2/board-ldp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02=
 +
>> =A0arch/arm/mach-omap2/board-zoom-flash.c =A0 =A0 =A0 | =A0 92
>> ++++++++++++++++++++++++++
>> =A0arch/arm/mach-omap2/board-zoom-peripherals.c | =A0 =A02 +
>> =A0arch/arm/plat-omap/include/plat/board-zoom.h | =A0 36 ++++++++++
>> =A05 files changed, 135 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/mach-omap2/board-zoom-flash.c
>> =A0create mode 100644 arch/arm/plat-omap/include/plat/board-zoom.h
>>
>> diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
>> index b0e5b46..c2ca76e 100644
>> --- a/arch/arm/mach-omap2/Makefile
>> +++ b/arch/arm/mach-omap2/Makefile
>> @@ -62,6 +62,7 @@ obj-$(CONFIG_MACH_OMAP_APOLLON) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 +=3D
>> board-apollon.o
>> =A0obj-$(CONFIG_MACH_OMAP3_BEAGLE) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D b=
oard-omap3beagle.o \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 mmc-twl4030.o
>> =A0obj-$(CONFIG_MACH_OMAP_LDP) =A0 =A0 =A0 =A0 =A0 =A0+=3D board-ldp.o \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0board-zoom-flash.o \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 mmc-twl4030.o
>> =A0obj-$(CONFIG_MACH_OVERO) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D board-overo=
.o \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 mmc-twl4030.o
>> @@ -78,10 +79,12 @@ obj-$(CONFIG_MACH_NOKIA_RX51) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 +=3D
>> board-rx51.o \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 board-rx51-peripherals.o \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 mmc-twl4030.o
>> =A0obj-$(CONFIG_MACH_OMAP_ZOOM2) =A0 =A0 =A0 =A0 =A0+=3D board-zoom2.o \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0board-zoom-flash.o \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 board-zoom-peripherals.o \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 mmc-twl4030.o \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 board-zoom-debugboard.o
>> =A0obj-$(CONFIG_MACH_OMAP_ZOOM3) =A0 =A0 =A0 =A0 =A0+=3D board-zoom3.o \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0board-zoom-flash.o \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 board-zoom-peripherals.o \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 mmc-twl4030.o \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 board-zoom-debugboard.o
>> diff --git a/arch/arm/mach-omap2/board-ldp.c
>> b/arch/arm/mach-omap2/board-ldp.c
>> index c062238..8aebdf9 100644
>> --- a/arch/arm/mach-omap2/board-ldp.c
>> +++ b/arch/arm/mach-omap2/board-ldp.c
>> @@ -42,6 +42,7 @@
>> =A0#include <asm/delay.h>
>> =A0#include <plat/control.h>
>> =A0#include <plat/usb.h>
>> +#include <plat/board-zoom.h>
>>
>> =A0#include "mmc-twl4030.h"
>>
>> @@ -385,6 +386,7 @@ static void __init omap_ldp_init(void)
>> =A0 =A0 =A0 =A0ads7846_dev_init();
>> =A0 =A0 =A0 =A0omap_serial_init();
>> =A0 =A0 =A0 =A0usb_musb_init();
>> + =A0 =A0 =A0 zoom_flash_init();
>>
>> =A0 =A0 =A0 =A0twl4030_mmc_init(mmc);
>> =A0 =A0 =A0 =A0/* link regulators to MMC adapters */
>> diff --git a/arch/arm/mach-omap2/board-zoom-flash.c
>> b/arch/arm/mach-omap2/board-zoom-flash.c
>> new file mode 100644
>> index 0000000..1867d6a
>> --- /dev/null
>> +++ b/arch/arm/mach-omap2/board-zoom-flash.c
>> @@ -0,0 +1,92 @@
>> +/*
>> + * board-zoom-flash.c
>> + *
>> + * Copyright (C) 2008-09 Texas Instruments Inc.
>> + *
>> + * Modified from mach-omap2/board-2430sdp-flash.c
>> + * Author(s): Vimal Singh <vimalsingh@ti.com>
>> + * =A0 =A0 =A0 =A0 =A0 =A0Rohit Choraria <rohitkc@ti.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/delay.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/partitions.h>
>> +#include <linux/mtd/nand.h>
>> +#include <linux/types.h>
>> +#include <linux/io.h>
>> +
>> +#include <asm/mach/flash.h>
>> +#include <plat/board.h>
>> +#include <plat/gpmc.h>
>> +#include <plat/nand.h>
>> +
>> +#include <plat/board-zoom.h>
>> +
>> +static struct mtd_partition zoom_nand_partitions[] =3D {
>> + =A0 =A0 =A0 /* All the partition sizes are listed in terms of NAND blo=
ck size
>> */
>> + =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "X-Loader-NA=
ND",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .offset =A0 =A0 =A0 =A0 =3D 0,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .size =A0 =A0 =A0 =A0 =A0 =3D 4 * (64 * 20=
48), =A0 =A0 =A0/* 512KB, 0x80000
>> */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask_flags =A0 =A0 =3D MTD_WRITEABLE, =A0=
 =A0 =A0 =A0/* force read-only
>> */
>> + =A0 =A0 =A0 },
>> + =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "U-Boot-NAND=
",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .offset =A0 =A0 =A0 =A0 =3D MTDPART_OFS_AP=
PEND, =A0 /* Offset =3D
>> 0x80000 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .size =A0 =A0 =A0 =A0 =A0 =3D 10 * (64 * 2=
048), =A0 =A0 /* 1.25MB,
>> 0x140000 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask_flags =A0 =A0 =3D MTD_WRITEABLE, =A0=
 =A0 =A0 =A0/* force read-only
>> */
>> + =A0 =A0 =A0 },
>> + =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "Boot Env-NA=
ND",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .offset =A0 =A0 =A0 =A0 =3D MTDPART_OFS_AP=
PEND, =A0 /* Offset =3D
>> 0x1c0000 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .size =A0 =A0 =A0 =A0 =A0 =3D 2 * (64 * 20=
48), =A0 =A0 =A0/* 256KB, 0x40000
>> */
>> + =A0 =A0 =A0 },
>> + =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "Kernel-NAND=
",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .offset =A0 =A0 =A0 =A0 =3D MTDPART_OFS_AP=
PEND, =A0 /* Offset =3D
>> 0x0200000*/
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .size =A0 =A0 =A0 =A0 =A0 =3D 240 * (64 * =
2048), =A0 =A0/* 30M, 0x1E00000
>> */
>> + =A0 =A0 =A0 },
>> + =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "File System=
 - NAND",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .offset =A0 =A0 =A0 =A0 =3D MTDPART_OFS_AP=
PEND, =A0 /* Offset =3D
>> 0x2000000 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .size =A0 =A0 =A0 =A0 =A0 =3D MTDPART_SIZ_=
FULL,
>> + =A0 =A0 =A0 },
>> +};
>> +
>> +/* NAND chip access: 16 bit */
>> +static struct omap_nand_platform_data zoom_nand_data =3D {
>> + =A0 =A0 =A0 .parts =A0 =A0 =A0 =A0 =A0=3D zoom_nand_partitions,
>> + =A0 =A0 =A0 .nr_parts =A0 =A0 =A0 =3D ARRAY_SIZE(zoom_nand_partitions)=
,
>> + =A0 =A0 =A0 .nand_setup =A0 =A0 =3D NULL,
>> + =A0 =A0 =A0 .dma_channel =A0 =A0=3D -1, =A0 /* disable DMA in OMAP NAN=
D driver */
>> + =A0 =A0 =A0 .dev_ready =A0 =A0 =A0=3D NULL,
>> + =A0 =A0 =A0 .devsize =A0 =A0 =A0 =A0=3D 1, =A0 =A0/* '0' for 8-bit, '1=
' for 16-bit device */
>> +};
>> +
>> +/**
>> + * zoom_flash_init - Identify devices connected to GPMC and register.
>> + *
>> + * @return - void.
>> + */
>> +void __init zoom_flash_init(void)
>
> Should take CS number as a parameter -> this will break SDP3630 otherwise=
.
>
>> +{
>> + =A0 =A0 =A0 u8 nandcs =3D GPMC_CS_NUM + 1;
>> + =A0 =A0 =A0 u32 gpmc_base_add =3D OMAP34XX_GPMC_VIRT;
>> +
>> + =A0 =A0 =A0 /* pop nand part */
>> + =A0 =A0 =A0 nandcs =3D LDP3430_NAND_CS;
>> +
>> + =A0 =A0 =A0 zoom_nand_data.cs =3D nandcs;
>> + =A0 =A0 =A0 zoom_nand_data.gpmc_cs_baseaddr =3D (void *)(gpmc_base_add=
 +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 GPMC_CS0_BASE + nandcs *
>> GPMC_CS_SIZE);
>> + =A0 =A0 =A0 zoom_nand_data.gpmc_baseaddr =3D (void *) (gpmc_base_add);
>> +
>> + =A0 =A0 =A0 gpmc_nand_init(&zoom_nand_data);
>> +}
>> +
>> diff --git a/arch/arm/mach-omap2/board-zoom-peripherals.c
>> b/arch/arm/mach-omap2/board-zoom-peripherals.c
>> index f14baa3..fcc2836 100755
>> --- a/arch/arm/mach-omap2/board-zoom-peripherals.c
>> +++ b/arch/arm/mach-omap2/board-zoom-peripherals.c
>> @@ -21,6 +21,7 @@
>> =A0#include <asm/mach/arch.h>
>> =A0#include <asm/mach/map.h>
>>
>> +#include <plat/board-zoom.h>
>> =A0#include <plat/common.h>
>> =A0#include <plat/usb.h>
>>
>> @@ -264,4 +265,5 @@ void __init zoom_peripherals_init(void)
>> =A0 =A0 =A0 =A0omap_i2c_init();
>> =A0 =A0 =A0 =A0omap_serial_init();
>> =A0 =A0 =A0 =A0usb_musb_init();
>> + =A0 =A0 =A0 zoom_flash_init();
>
> probably should be called by board files independently. zoom-peripherals =
get
> used by sdp3630,zoom2, zoom3.

I did not have idea about 3630sdp. Thanks for pointing this out. I'll
re-post this patch once I get some more info about 3630sdp.

>
>> =A0}
>> diff --git a/arch/arm/plat-omap/include/plat/board-zoom.h
>> b/arch/arm/plat-omap/include/plat/board-zoom.h
>> new file mode 100644
>> index 0000000..8d63f7e
>> --- /dev/null
>> +++ b/arch/arm/plat-omap/include/plat/board-zoom.h
>> @@ -0,0 +1,36 @@
>> +/*
>> + * board-zoom.h
>> + *
>> + * Hardware definitions for TI OMAP3 LDP/ZOOM2.
>> + *
>> + * Copyright (C) 2008-09 Texas Instruments Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> it
>> + * under the terms of the GNU General Public License as published by th=
e
>> + * Free Software Foundation; either version 2 of the License, or (at yo=
ur
>> + * option) any later version.
>> + *
>> + * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED
>> + * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
>> + * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
>> IN
>> + * NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
>> + * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
>> BUT
>> + * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
>> + * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND =
ON
>> + * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
>> TORT
>> + * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E
>> OF
>> + * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> along
>> + * with this program; if not, write to the Free Software Foundation,
>> Inc.,
>> + * 675 Mass Ave, Cambridge, MA 02139, USA.
>> + */
>> +
>> +#ifndef __ASM_ARCH_OMAP_LDP_H
>> +#define __ASM_ARCH_OMAP_LDP_H
>> +
>> +extern void zoom_flash_init(void);
>> +
>> +#define LDP3430_NAND_CS =A0 =A0 =A0 =A0 =A0 =A0 =A0 0
>> +
>> +#endif /* __ASM_ARCH_OMAP_LDP_H */
>
>
> --
> Regards,
> Nishanth Menon
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Regards,
Vimal Singh
