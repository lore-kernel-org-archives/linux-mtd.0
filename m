MIME-Version: 1.0
In-Reply-To: <7cd7060b403b448d74649cec5c28c795bcbbdbc3.1283161023.git.viresh.kumar@st.com>
References: <cover.1283161023.git.viresh.kumar@st.com>
	<07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>
	<7cd7060b403b448d74649cec5c28c795bcbbdbc3.1283161023.git.viresh.kumar@st.com>
Date: Thu, 2 Sep 2010 00:36:24 +0200
Message-ID: <AANLkTik9Di4k183t+wuY-1eprsO3xBOESaOY5dnxt6ii@mail.gmail.com>
Subject: Re: [PATCH 27/74] ST SPEAr : NAND interface driver for spear platforms
From: Linus Walleij <linus.ml.walleij@gmail.com>
To: Viresh KUMAR <viresh.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: pratyush.anand@st.com, vipulkumar.samar@st.com, bhupesh.sharma@st.com,
	Sebastian Rasmussen <sebastian.rasmussen@stericsson.com>,
	armando.visconti@st.com, Alessandro Rubini <rubini-list@gnudd.com>,
	Vipin Kumar <vipin.kumar@st.com>, shiraz.hashim@st.com,
	rajeev-dlh.kumar@st.com, linux-mtd@lists.infradead.org,
	deepak.sikri@st.com, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/8/30 Viresh KUMAR <viresh.kumar@st.com>:

> From: Vipin Kumar <vipin.kumar@st.com>
>
> SPEAr platforms use Flexible Static Memory Controller(FSMC) provided by S=
T for
> interfacing with NAND devices.
> This patch adds the support for glue logic for NAND flash on SPEAr boards

OK...

> (...)
> =A0create mode 100644 arch/arm/plat-spear/include/plat/fsmc.h
> =A0create mode 100644 arch/arm/plat-spear/include/plat/nand.h
> =A0create mode 100644 drivers/mtd/nand/spear_nand.c

spear_nand.c?

Why not fsmc-nand.c or similar if this is the name of the block.
We have this in U300, Nomadik NHK8815 and other platforms too,
it doesn't have much to do with SPEAr actually...

Also, what are the include files doing in plat-spear since we have
the same hardware in other platforms? Move them to include/linux/mtd/
so we can use them please.

I *highly* suspect that this driver duplicates some code found in
drivers/mtd/nand/nomadik_nand.c because it's the same silicon.

Alessandro can judge on this, but I have a feeling that driver
should be replaced by this, more mature driver.

> (...)
> diff --git a/arch/arm/plat-spear/include/plat/fsmc.h b/arch/arm/plat-spea=
r/include/plat/fsmc.h
> new file mode 100644
> index 0000000..c0fdcd3
> --- /dev/null
> +++ b/arch/arm/plat-spear/include/plat/fsmc.h
> @@ -0,0 +1,109 @@
> +/*
> + * arch/arm/plat-spear/include/plat/fsmc.h
> + *
> + * SPEAr platform nand interface header file

Replace "SPEAr platform" for "FSMC - Flexible Static Media Controller"

> + *
> + * Copyright (C) 2010 ST Microelectronics
> + * Vipin Kumar <vipin.kumar@st.com>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#ifndef __PLAT_FSMC_H
> +#define __PLAT_FSMC_H

Change these according to the new suggested placement.

> +
> +#include <linux/delay.h>
> +#include <linux/types.h>
> +#include <asm/param.h>
> +
> +#define FSMC_MAX_NAND_BANKS =A0 =A04
> +
> +struct nand_bank_regs {
> + =A0 =A0 =A0 u32 pc;
> + =A0 =A0 =A0 u32 sts;
> + =A0 =A0 =A0 u32 comm;
> + =A0 =A0 =A0 u32 attrib;
> + =A0 =A0 =A0 u32 ioata;
> + =A0 =A0 =A0 u32 ecc1;
> + =A0 =A0 =A0 u32 ecc2;
> + =A0 =A0 =A0 u32 ecc3;
> +};
> +
> +struct fsmc_regs {
> + =A0 =A0 =A0 u8 reserved_1[0x40];
> + =A0 =A0 =A0 struct nand_bank_regs bank_regs[FSMC_MAX_NAND_BANKS];
> + =A0 =A0 =A0 u8 reserved_2[0xfe0 - 0xc0];
> + =A0 =A0 =A0 u32 peripid0; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 0xfe0 =
*/
> + =A0 =A0 =A0 u32 peripid1; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 0xfe4 =
*/
> + =A0 =A0 =A0 u32 peripid2; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 0xfe8 =
*/
> + =A0 =A0 =A0 u32 peripid3; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 0xfec =
*/
> + =A0 =A0 =A0 u32 pcellid0; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 0xff0 =
*/
> + =A0 =A0 =A0 u32 pcellid1; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 0xff4 =
*/
> + =A0 =A0 =A0 u32 pcellid2; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 0xff8 =
*/
> + =A0 =A0 =A0 u32 pcellid3; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 0xffc =
*/

Do you need to have an u32 for each of these registers?
I think this is the AMBA PrimeCell ID registers which means
that the latter four are just "0xB105F00D" (clever) and
then padded to 32 bits. (Correct me if I'm wrong.)

You can find macros for extracting the important parts of the
field in include/linux/amba/bus.h

> +};
> +
> +#define FSMC_BUSY_WAIT_TIMEOUT (1 * HZ)
> +
> +/* pc register definitions */
> +#define FSMC_RESET =A0 =A0 =A0 =A0 =A0 =A0 (1 << 0)
> +#define FSMC_WAITON =A0 =A0 =A0 =A0 =A0 =A0(1 << 1)
> +#define FSMC_ENABLE =A0 =A0 =A0 =A0 =A0 =A0(1 << 2)
> +#define FSMC_DEVTYPE_NAND =A0 =A0 =A0(1 << 3)
> +#define FSMC_DEVWID_8 =A0 =A0 =A0 =A0 =A0(0 << 4)
> +#define FSMC_DEVWID_16 =A0 =A0 =A0 =A0 (1 << 4)
> +#define FSMC_ECCEN =A0 =A0 =A0 =A0 =A0 =A0 (1 << 6)
> +#define FSMC_ECCPLEN_512 =A0 =A0 =A0 (0 << 7)
> +#define FSMC_ECCPLEN_256 =A0 =A0 =A0 (1 << 7)
> +#define FSMC_TCLR_1 =A0 =A0 =A0 =A0 =A0 =A0(1 << 9)
> +#define FSMC_TAR_1 =A0 =A0 =A0 =A0 =A0 =A0 (1 << 13)
> +
> +/* sts register definitions */
> +#define FSMC_CODE_RDY =A0 =A0 =A0 =A0 =A0(1 << 15)
> +
> +/* comm register definitions */
> +#define FSMC_TSET_0 =A0 =A0 =A0 =A0 =A0 =A0(0 << 0)
> +#define FSMC_TWAIT_6 =A0 =A0 =A0 =A0 =A0 (6 << 8)
> +#define FSMC_THOLD_4 =A0 =A0 =A0 =A0 =A0 (4 << 16)
> +#define FSMC_THIZ_1 =A0 =A0 =A0 =A0 =A0 =A0(1 << 24)
> +
> +/* peripid2 register definitions */
> +#define FSMC_REVISION_MSK =A0 =A0 =A0(0xf)
> +#define FSMC_REVISION_SHFT =A0 =A0 (0x4)
> +
> +#define FSMC_VER1 =A0 =A0 =A0 =A0 =A0 =A0 =A01
> +#define FSMC_VER2 =A0 =A0 =A0 =A0 =A0 =A0 =A02
> +#define FSMC_VER3 =A0 =A0 =A0 =A0 =A0 =A0 =A03
> +#define FSMC_VER4 =A0 =A0 =A0 =A0 =A0 =A0 =A04
> +#define FSMC_VER5 =A0 =A0 =A0 =A0 =A0 =A0 =A05
> +#define FSMC_VER6 =A0 =A0 =A0 =A0 =A0 =A0 =A06
> +#define FSMC_VER7 =A0 =A0 =A0 =A0 =A0 =A0 =A07
> +#define FSMC_VER8 =A0 =A0 =A0 =A0 =A0 =A0 =A08
> +
> +static inline u32 get_fsmc_version(struct fsmc_regs *regs)
> +{
> + =A0 =A0 =A0 return (readl(&regs->peripid2) >> FSMC_REVISION_SHFT) &
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 FSMC_REVISI=
ON_MSK;

Use macros from <linux/amba/bus.h> to extract version if
possible.

> +}
> +
> +/*
> + * There are 13 bytes of ecc for every 512 byte block in FSMC version 8
> + * and it has to be read consecutively and immediately after the 512
> + * byte data block for hardware to generate the error bit offsets
> + * Managing the ecc bytes in the following way is easier. This way is
> + * similar to oobfree structure maintained already in u-boot nand driver
> + */
> +#define MAX_ECCPLACE_ENTRIES =A0 32
> +
> +struct fsmc_nand_eccplace {
> + =A0 =A0 =A0 u8 offset;
> + =A0 =A0 =A0 u8 length;
> +};
> +
> +struct fsmc_eccplace {
> + =A0 =A0 =A0 struct fsmc_nand_eccplace eccplace[MAX_ECCPLACE_ENTRIES];
> +};
> +
> +#endif /* __PLAT_FSMC_H */
> diff --git a/arch/arm/plat-spear/include/plat/nand.h b/arch/arm/plat-spea=
r/include/plat/nand.h
> new file mode 100644
> index 0000000..712b4b0
> --- /dev/null
> +++ b/arch/arm/plat-spear/include/plat/nand.h
> @@ -0,0 +1,76 @@
> +/*
> + * arch/arm/plat-spear/include/plat/nand.h
> + *
> + * NAND macros for SPEAr platform
> + *

Replace "SPEAr platform" for "FSMC - Flexible Static Media Controller"

> + * Copyright (C) 2010 ST Microelectronics
> + * Vipin Kumar <vipin.kumar@st.com>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#ifndef __PLAT_NAND_H
> +#define __PLAT_NAND_H

Change this to reflect the new suggested placement.

> +
> +#include <linux/mtd/partitions.h>
> +
> +#define SPEAR_NAND_BW8 =A0 =A0 =A0 =A0 1
> +#define SPEAR_NAND_BW16 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02

FSMC_NAND*?

> +
> +#if defined(CONFIG_MACH_SPEAR310)
> +#define PLAT_NAND_CLE =A0 =A0 =A0 =A0 =A0(1 << 17)
> +#define PLAT_NAND_ALE =A0 =A0 =A0 =A0 =A0(1 << 16)
> +#else
> +#define PLAT_NAND_CLE =A0 =A0 =A0 =A0 =A0(1 << 16)
> +#define PLAT_NAND_ALE =A0 =A0 =A0 =A0 =A0(1 << 17)
> +#endif

You have to handle this some other way using platform data
I think.

> +
> +struct nand_platform_data {

fsmc_platform_data!

> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Board specific information
> + =A0 =A0 =A0 =A0* Set from arch/arm/mach-spear<mach>/spear<mach>_evb.c
> + =A0 =A0 =A0 =A0*/

Skip this comment...

> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Use the default partition table present in the NAND dr=
iver if
> + =A0 =A0 =A0 =A0* partitions is set to NULL.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 struct mtd_partition =A0 =A0*partitions;
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0nr_partitions;
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0options;
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0width;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Machine specific information
> + =A0 =A0 =A0 =A0* Set from arch/arm/mach-spear<mach>/spear<mach>.c
> + =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0bank;
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Set to NULL if bank selection is not supported by mach=
ine
> + =A0 =A0 =A0 =A0* architecture
> + =A0 =A0 =A0 =A0* -> eg. when controller supports only one bank
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(*select_bank)(=
u32 bank, u32 busw);
> +};
> +
> +/* This function is used to set platform data field of pdev->dev */
> +static inline void nand_set_plat_data(struct platform_device *pdev,

What about naming this fsmc_set_plat_data()

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mtd_partition *partitions, unsigned =
int nr_partitions,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int options, unsigned int width)
> +{
> + =A0 =A0 =A0 struct nand_platform_data *nand_plat_data;
> + =A0 =A0 =A0 nand_plat_data =3D dev_get_platdata(&pdev->dev);
> +
> + =A0 =A0 =A0 if (partitions) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand_plat_data->partitions =3D partitions;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand_plat_data->nr_partitions =3D nr_partit=
ions;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 nand_plat_data->options =3D options;
> + =A0 =A0 =A0 nand_plat_data->width =3D width;
> +}
> +
> +#endif /* __PLAT_NAND_H */
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 8b4b67c..89d35d1 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -531,4 +531,10 @@ config MTD_NAND_JZ4740
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Enables support for NAND Flash on JZ4740 S=
oC based boards.
>
> +config MTD_NAND_SPEAR

MTD_NAND_FSMC

> + =A0 =A0 =A0 tristate "Support for NAND on SPEAr platforms"

skip "on SPEAr platforms", there will be more.

> + =A0 =A0 =A0 depends on MTD_NAND && PLAT_SPEAR
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Enables support for NAND Flash chips wired onto SPEAr b=
oards.

Update help text to fit with U300 and Nomadik etc use.
Something more generic.

> +
> =A0endif # MTD_NAND
> diff --git a/drivers/mtd/nand/spear_nand.c b/drivers/mtd/nand/spear_nand.=
c
> new file mode 100644
> index 0000000..da9661b
> --- /dev/null
> +++ b/drivers/mtd/nand/spear_nand.c

Name the file fsmc-nand.c or so.

> @@ -0,0 +1,860 @@
> +/*
> + * drivers/mtd/nand/spear_nand.c
> + *
> + * SPEAr13XX machines common source file

No... "FSMC Flexible Static Media Controller NAND portions driver"

> + *
> + * Copyright (C) 2010 ST Microelectronics
> + * Vipin Kumar <vipin.kumar@st.com>
> + * Ashish Priyadarshi
> + *
> + * Based on drivers/mtd/nand/nomadik_nand.c

Aha :-)

But why did you fork it instead of merging the drivers??

> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/resource.h>
> +#include <linux/sched.h>
> +#include <linux/types.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/nand_ecc.h>
> +#include <linux/platform_device.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <plat/fsmc.h>
> +#include <plat/nand.h>
> +#include <mtd/mtd-abi.h>
> +
> +static struct nand_ecclayout fsmc_ecc1_layout =3D {
> + =A0 =A0 =A0 .eccbytes =3D 24,
> + =A0 =A0 =A0 .eccpos =3D {2, 3, 4, 18, 19, 20, 34, 35, 36, 50, 51, 52,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 66, 67, 68, 82, 83, 84, 98, 99, 100, 114, 1=
15, 116},
> + =A0 =A0 =A0 .oobfree =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 8, .length =3D 8},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 24, .length =3D 8},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 40, .length =3D 8},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 56, .length =3D 8},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 72, .length =3D 8},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 88, .length =3D 8},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 104, .length =3D 8},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 120, .length =3D 8}
> + =A0 =A0 =A0 }
> +};
> +
> +static struct nand_ecclayout fsmc_ecc4_lp_layout =3D {
> + =A0 =A0 =A0 .eccbytes =3D 104,
> + =A0 =A0 =A0 .eccpos =3D { =A02, =A0 3, =A0 4, =A0 5, =A0 6, =A0 7, =A0 =
8,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 9, =A010, =A011, =A012, =A013, =A014,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 18, =A019, =A020, =A021, =A022, =A023, =A02=
4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 25, =A026, =A027, =A028, =A029, =A030,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 34, =A035, =A036, =A037, =A038, =A039, =A04=
0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 41, =A042, =A043, =A044, =A045, =A046,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 50, =A051, =A052, =A053, =A054, =A055, =A05=
6,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 57, =A058, =A059, =A060, =A061, =A062,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 66, =A067, =A068, =A069, =A070, =A071, =A07=
2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 73, =A074, =A075, =A076, =A077, =A078,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 82, =A083, =A084, =A085, =A086, =A087, =A08=
8,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 89, =A090, =A091, =A092, =A093, =A094,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 98, =A099, 100, 101, 102, 103, 104,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 105, 106, 107, 108, 109, 110,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 114, 115, 116, 117, 118, 119, 120,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 121, 122, 123, 124, 125, 126
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .oobfree =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 15, .length =3D 3},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 31, .length =3D 3},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 47, .length =3D 3},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 63, .length =3D 3},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 79, .length =3D 3},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 95, .length =3D 3},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 111, .length =3D 3},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 127, .length =3D 1}
> + =A0 =A0 =A0 }
> +};
> +
> +/*
> + * ECC placement definitions in oobfree type format.
> + * There are 13 bytes of ecc for every 512 byte block and it has to be r=
ead
> + * consecutively and immediately after the 512 byte data block for hardw=
are to
> + * generate the error bit offsets in 512 byte data.
> + * Managing the ecc bytes in the following way makes it easier for softw=
are to
> + * read ecc bytes consecutive to data bytes. This way is similar to
> + * oobfree structure maintained already in generic nand driver
> + */
> +static struct fsmc_eccplace fsmc_ecc4_lp_place =3D {
> + =A0 =A0 =A0 .eccplace =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 2, .length =3D 13},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 18, .length =3D 13},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 34, .length =3D 13},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 50, .length =3D 13},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 66, .length =3D 13},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 82, .length =3D 13},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 98, .length =3D 13},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 114, .length =3D 13}
> + =A0 =A0 =A0 }
> +};
> +
> +static struct nand_ecclayout fsmc_ecc4_sp_layout =3D {
> + =A0 =A0 =A0 .eccbytes =3D 13,
> + =A0 =A0 =A0 .eccpos =3D { 0, =A01, =A02, =A03, =A06, =A07, 8,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 9, 10, 11, 12, 13, 14
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .oobfree =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 15, .length =3D 1},
> + =A0 =A0 =A0 }
> +};
> +
> +static struct fsmc_eccplace fsmc_ecc4_sp_place =3D {
> + =A0 =A0 =A0 .eccplace =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 0, .length =3D 4},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {.offset =3D 6, .length =3D 9}
> + =A0 =A0 =A0 }
> +};

I think ECC placement should be in the platform data.

> +
> +/*
> + * Default partition tables to be used if the partition information not =
provided
> + * through platform data
> + */
> +#define PARTITION(n, off, sz) =A0{.name =3D n, .offset =3D off, .size =
=3D sz}
> +
> +/*
> + * Default partition layout for small page(=3D 512 bytes) devices
> + * Size for "Root file system" is updated in driver based on actual devi=
ce size
> + */
> +static struct mtd_partition partition_info_16KB_blk[] =3D {
> + =A0 =A0 =A0 PARTITION("X-loader", 0, 4 * 0x4000),
> + =A0 =A0 =A0 PARTITION("U-Boot", 0x10000, 20 * 0x4000),
> + =A0 =A0 =A0 PARTITION("Kernel", 0x60000, 256 * 0x4000),
> + =A0 =A0 =A0 PARTITION("Root File System", 0x460000, 0),
> +};

Ewwww atleast pass this part in from the platform data.

> +
> +/*
> + * Default partition layout for large page(> 512 bytes) devices
> + * Size for "Root file system" is updated in driver based on actual devi=
ce size
> + */
> +static struct mtd_partition partition_info_128KB_blk[] =3D {
> + =A0 =A0 =A0 PARTITION("X-loader", 0, 4 * 0x20000),
> + =A0 =A0 =A0 PARTITION("U-Boot", 0x80000, 12 * 0x20000),
> + =A0 =A0 =A0 PARTITION("Kernel", 0x200000, 48 * 0x20000),
> + =A0 =A0 =A0 PARTITION("Root File System", 0x800000, 0),
> +};

Dito.

The rest of the driver looks really nice to my untrained eye, but I'm
including Alessandro and Sebastian on the review.

Yours,
Linus Walleij
