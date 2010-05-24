MIME-Version: 1.0
In-Reply-To: <4BFA2B5B.4080105@compulab.co.il>
References: <AANLkTinVBXhT77Zd-LNpufgJAl7WZdic0oxDFwvNkvJg@mail.gmail.com>
	<4BFA2B5B.4080105@compulab.co.il>
Date: Mon, 24 May 2010 16:27:21 +0800
Message-ID: <AANLkTilLYFVPcel-rE8RbuTWEir4RJOBqmyxirb6Vozn@mail.gmail.com>
Subject: Re: [PATCH 01/20] mtd: pxa3xx_nand: refuse the flash definition get
	from platform
From: Lei Wen <adrian.wenl@gmail.com>
To: Mike Rapoport <mike@compulab.co.il>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

This patch set is applied to mtd-2.6 git. We submit the patch with a
package in attachment already.
http://permalink.gmane.org/gmane.linux.ports.arm.kernel/79818

Best regards,
Lei

On Mon, May 24, 2010 at 3:31 PM, Mike Rapoport <mike@compulab.co.il> wrote:
> Hi Haojian,
> This is a comment to the entire series, and should have been Re: [PATCH
> 0/20], but there's no cover letter for these patches.
>
> The patches are all line-wrapped and do not apply. It's really hard to re=
ad
> them because of hunks added inside the existing functions. Please try to
> organize your changes in a more straight =C2=A0forward way.
>
> Haojian Zhuang wrote:
>>
>> From 16057e690aa4a2fd8a9c07c70ab48ffc2f76204f Mon Sep 17 00:00:00 2001
>> From: Lei Wen <leiwen@marvell.com>
>> Date: Sat, 20 Mar 2010 19:01:23 +0800
>> Subject: [PATCH] mtd: pxa3xx_nand: refuse the flash definition get from
>> platform
>>
>> For current usage, it is little reason to use a platform defined flash
>> info
>> for the flash detection. Flash timing through platform should be the sam=
e.
>> And allow multiple platform to define the same flash chip would be a
>> waste.
>>
>> Also condense the flash definition way in the c file to simplify adding =
a
>> new chip.
>>
>> Signed-off-by: Lei Wen <leiwen@marvell.com>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
>> ---
>> =C2=A0arch/arm/plat-pxa/include/plat/pxa3xx_nand.h | =C2=A0 40 ----
>> =C2=A0drivers/mtd/nand/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A07 -
>> =C2=A0drivers/mtd/nand/pxa3xx_nand.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0262
>> ++++++--------------------
>> =C2=A03 files changed, 60 insertions(+), 249 deletions(-)
>>
>> diff --git a/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
>> b/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
>> index 3478eae..c494f68 100644
>> --- a/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
>> +++ b/arch/arm/plat-pxa/include/plat/pxa3xx_nand.h
>> @@ -4,43 +4,6 @@
>> =C2=A0#include <linux/mtd/mtd.h>
>> =C2=A0#include <linux/mtd/partitions.h>
>>
>> -struct pxa3xx_nand_timing {
>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tCH; =C2=A0/* Enable si=
gnal hold time */
>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tCS; =C2=A0/* Enable si=
gnal setup time */
>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tWH; =C2=A0/* ND_nWE hi=
gh duration */
>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tWP; =C2=A0/* ND_nWE pu=
lse time */
>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tRH; =C2=A0/* ND_nRE hi=
gh duration */
>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tRP; =C2=A0/* ND_nRE pu=
lse width */
>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tR; =C2=A0 /* ND_nWE hi=
gh to ND_nRE low for read */
>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tWHR; /* ND_nWE high to=
 ND_nRE low for status read
>> */
>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tAR; =C2=A0/* ND_ALE lo=
w to ND_nRE low delay */
>> -};
>> -
>> -struct pxa3xx_nand_cmdset {
>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read1;
>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read2;
>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0program;
>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read_status;
>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read_id;
>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0erase;
>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0reset;
>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0lock;
>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0unlock;
>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0lock_status;
>> -};
>> -
>> -struct pxa3xx_nand_flash {
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_timing *timing; /* NAND =
Flash timing */
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 uint32_t page_per_block;/* Pages per block (PG_PE=
R_BLK) */
>> - =C2=A0 =C2=A0 =C2=A0 uint32_t page_size; =C2=A0 =C2=A0 /* Page size in=
 bytes (PAGE_SZ) */
>> - =C2=A0 =C2=A0 =C2=A0 uint32_t flash_width; =C2=A0 /* Width of Flash me=
mory (DWIDTH_M) */
>> - =C2=A0 =C2=A0 =C2=A0 uint32_t dfc_width; =C2=A0 =C2=A0 /* Width of fla=
sh controller(DWIDTH_C) */
>> - =C2=A0 =C2=A0 =C2=A0 uint32_t num_blocks; =C2=A0 =C2=A0/* Number of ph=
ysical blocks in Flash */
>> - =C2=A0 =C2=A0 =C2=A0 uint32_t chip_id;
>> -};
>> -
>> =C2=A0struct pxa3xx_nand_platform_data {
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the data flash bus is shared between the S=
tatic Memory
>> @@ -54,9 +17,6 @@ struct pxa3xx_nand_platform_data {
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct mtd_partition =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*parts;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nr_parts;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_flash * =C2=A0 =C2=A0 =
=C2=A0 =C2=A0flash;
>> - =C2=A0 =C2=A0 =C2=A0 size_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0num_flash;
>> =C2=A0};
>>
>> =C2=A0extern void pxa3xx_set_nand_info(struct pxa3xx_nand_platform_data =
*info);
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 98a04b3..9a35d92 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -399,13 +399,6 @@ config MTD_NAND_PXA3xx
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This enables the driver for the NAND f=
lash device found on
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PXA3xx processors
>>
>> -config MTD_NAND_PXA3xx_BUILTIN
>> - =C2=A0 =C2=A0 =C2=A0 bool "Use builtin definitions for some NAND chips=
 (deprecated)"
>> - =C2=A0 =C2=A0 =C2=A0 depends on MTD_NAND_PXA3xx
>> - =C2=A0 =C2=A0 =C2=A0 help
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 This enables builtin definitions for some =
NAND chips. This
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 is deprecated in favor of platform specifi=
c data.
>> -
>> =C2=A0config MTD_NAND_CM_X270
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "Support for NAND Flash on CM-X270 m=
odules"
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on MTD_NAND && MACH_ARMCORE
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c
>> b/drivers/mtd/nand/pxa3xx_nand.c
>> index e02fa4f..da40b9a 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -113,6 +113,41 @@ enum {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0STATE_PIO_WRITING,
>> =C2=A0};
>>
>> +struct pxa3xx_nand_timing {
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0tCH; =C2=A0/*=
 Enable signal hold time */
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0tCS; =C2=A0/*=
 Enable signal setup time */
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0tWH; =C2=A0/*=
 ND_nWE high duration */
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0tWP; =C2=A0/*=
 ND_nWE pulse time */
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0tRH; =C2=A0/*=
 ND_nRE high duration */
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0tRP; =C2=A0/*=
 ND_nRE pulse width */
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0tAR; =C2=A0/*=
 ND_ALE low to ND_nRE low delay */
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0tWHR; /* ND_n=
WE high to ND_nRE low for status read
>> */
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0tR; =C2=A0 /*=
 ND_nWE high to ND_nRE low for read */
>> +};
>> +
>> +struct pxa3xx_nand_cmdset {
>> + =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read1;
>> + =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read2;
>> + =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0program;
>> + =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read_status;
>> + =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read_id;
>> + =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0erase;
>> + =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0reset;
>> + =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0lock;
>> + =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0unlock;
>> + =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0lock_status;
>> +};
>> +
>> +struct pxa3xx_nand_flash {
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0chip_id;
>> + =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0page_per_bloc=
k; /* Pages per block (PG_PER_BLK) */
>> + =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0page_size; =
=C2=A0 =C2=A0 =C2=A0/* Page size in bytes (PAGE_SZ) */
>> + =C2=A0 =C2=A0 =C2=A0 uint8_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 flash_width; =
=C2=A0 =C2=A0/* Width of Flash memory
>> (DWIDTH_M) */
>> + =C2=A0 =C2=A0 =C2=A0 uint8_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 dfc_width; =
=C2=A0 =C2=A0 =C2=A0/* Width of flash
>> controller(DWIDTH_C) */
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0num_blocks; =
=C2=A0 =C2=A0 /* Number of physical blocks in
>> Flash */
>> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_timing timing; =C2=A0 =C2=A0 =
=C2=A0 /* NAND Flash timing */
>> +};
>> +
>> =C2=A0struct pxa3xx_nand_info {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nand_chip =C2=A0 =C2=A0 =C2=A0 =C2=A0n=
and_chip;
>>
>> @@ -177,20 +212,7 @@ MODULE_PARM_DESC(use_dma, "enable DMA for data
>> transfering to/from NAND HW");
>> =C2=A0static struct pxa3xx_nand_timing default_timing;
>> =C2=A0static struct pxa3xx_nand_flash default_flash;
>>
>> -static struct pxa3xx_nand_cmdset smallpage_cmdset =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .read1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x00=
00,
>> - =C2=A0 =C2=A0 =C2=A0 .read2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x00=
50,
>> - =C2=A0 =C2=A0 =C2=A0 .program =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x1080,
>> - =C2=A0 =C2=A0 =C2=A0 .read_status =C2=A0 =C2=A0=3D 0x0070,
>> - =C2=A0 =C2=A0 =C2=A0 .read_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0090,
>> - =C2=A0 =C2=A0 =C2=A0 .erase =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xD0=
60,
>> - =C2=A0 =C2=A0 =C2=A0 .reset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x00=
FF,
>> - =C2=A0 =C2=A0 =C2=A0 .lock =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x00=
2A,
>> - =C2=A0 =C2=A0 =C2=A0 .unlock =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x2423,
>> - =C2=A0 =C2=A0 =C2=A0 .lock_status =C2=A0 =C2=A0=3D 0x007A,
>> -};
>> -
>> -static struct pxa3xx_nand_cmdset largepage_cmdset =3D {
>> +const static struct pxa3xx_nand_cmdset cmdset =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.read1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
0x3000,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.read2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
0x0050,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.program =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x108=
0,
>> @@ -203,143 +225,17 @@ static struct pxa3xx_nand_cmdset largepage_cmdset=
 =3D
>> {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.lock_status =C2=A0 =C2=A0=3D 0x007A,
>> =C2=A0};
>>
>> -#ifdef CONFIG_MTD_NAND_PXA3xx_BUILTIN
>> -static struct pxa3xx_nand_timing samsung512MbX16_timing =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .tCH =C2=A0 =C2=A0=3D 10,
>> - =C2=A0 =C2=A0 =C2=A0 .tCS =C2=A0 =C2=A0=3D 0,
>> - =C2=A0 =C2=A0 =C2=A0 .tWH =C2=A0 =C2=A0=3D 20,
>> - =C2=A0 =C2=A0 =C2=A0 .tWP =C2=A0 =C2=A0=3D 40,
>> - =C2=A0 =C2=A0 =C2=A0 .tRH =C2=A0 =C2=A0=3D 30,
>> - =C2=A0 =C2=A0 =C2=A0 .tRP =C2=A0 =C2=A0=3D 40,
>> - =C2=A0 =C2=A0 =C2=A0 .tR =C2=A0 =C2=A0 =3D 11123,
>> - =C2=A0 =C2=A0 =C2=A0 .tWHR =C2=A0 =3D 110,
>> - =C2=A0 =C2=A0 =C2=A0 .tAR =C2=A0 =C2=A0=3D 10,
>> -};
>> -
>> -static struct pxa3xx_nand_flash samsung512MbX16 =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &samsung5=
12MbX16_timing,
>> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &smallpag=
e_cmdset,
>> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 32,
>> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 512,
>> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 16,
>> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 16,
>> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 4096,
>> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x46ec,
>> -};
>> -
>> -static struct pxa3xx_nand_flash samsung2GbX8 =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &samsung5=
12MbX16_timing,
>> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &smallpag=
e_cmdset,
>> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 64,
>> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 2048,
>> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 8,
>> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 8,
>> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 2048,
>> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xdaec,
>> -};
>> -
>> -static struct pxa3xx_nand_flash samsung32GbX8 =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &samsung5=
12MbX16_timing,
>> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &smallpag=
e_cmdset,
>> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 128,
>> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 4096,
>> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 8,
>> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 8,
>> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 8192,
>> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xd7ec,
>> +static struct pxa3xx_nand_flash __devinitdata builtin_flash_types[] =3D=
 {
>> +{ 0x46ec, 32, 512, 16, 16, 4096, { 10, 0, 20, 40, 30, 40, 11123, 110, 1=
0,
>> }, },
>> +{ 0xdaec, 64, 2048, 8, 8, 2048, { 10, 0, 20, 40, 30, 40, 11123, 110, 10=
,
>> }, },
>> +{ 0xd7ec, 128, 4096, 8, 8, 8192, { 10, 0, 20, 40, 30, 40, 11123, 110, 1=
0,
>> }, },
>> +{ 0xa12c, 64, 2048, 8, 8, 1024, { 10, 25, 15, 25, 15, 30, 25000, 60, 10=
,
>> }, },
>> +{ 0xb12c, 64, 2048, 16, 16, 1024, { 10, 25, 15, 25, 15, 30, 25000,
>> 60, 10, }, },
>> +{ 0xdc2c, 64, 2048, 8, 8, 4096, { 10, 25, 15, 25, 15, 30, 25000, 60, 10=
,
>> }, },
>> +{ 0xcc2c, 64, 2048, 16, 16, 4096, { 10, 25, 15, 25, 15, 30, 25000,
>> 60, 10, }, },
>> +{ 0xba20, 64, 2048, 16, 16, 2048, { 10, 35, 15, 25, 15, 25, 25000,
>> 60, 10, }, },
>> =C2=A0};
>>
>> -static struct pxa3xx_nand_timing micron_timing =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .tCH =C2=A0 =C2=A0=3D 10,
>> - =C2=A0 =C2=A0 =C2=A0 .tCS =C2=A0 =C2=A0=3D 25,
>> - =C2=A0 =C2=A0 =C2=A0 .tWH =C2=A0 =C2=A0=3D 15,
>> - =C2=A0 =C2=A0 =C2=A0 .tWP =C2=A0 =C2=A0=3D 25,
>> - =C2=A0 =C2=A0 =C2=A0 .tRH =C2=A0 =C2=A0=3D 15,
>> - =C2=A0 =C2=A0 =C2=A0 .tRP =C2=A0 =C2=A0=3D 30,
>> - =C2=A0 =C2=A0 =C2=A0 .tR =C2=A0 =C2=A0 =3D 25000,
>> - =C2=A0 =C2=A0 =C2=A0 .tWHR =C2=A0 =3D 60,
>> - =C2=A0 =C2=A0 =C2=A0 .tAR =C2=A0 =C2=A0=3D 10,
>> -};
>> -
>> -static struct pxa3xx_nand_flash micron1GbX8 =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &micron_t=
iming,
>> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &largepag=
e_cmdset,
>> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 64,
>> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 2048,
>> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 8,
>> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 8,
>> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 1024,
>> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xa12c,
>> -};
>> -
>> -static struct pxa3xx_nand_flash micron1GbX16 =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &micron_t=
iming,
>> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &largepag=
e_cmdset,
>> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 64,
>> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 2048,
>> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 16,
>> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 16,
>> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 1024,
>> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xb12c,
>> -};
>> -
>> -static struct pxa3xx_nand_flash micron4GbX8 =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &micron_t=
iming,
>> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &largepag=
e_cmdset,
>> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 64,
>> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 2048,
>> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 8,
>> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 8,
>> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 4096,
>> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xdc2c,
>> -};
>> -
>> -static struct pxa3xx_nand_flash micron4GbX16 =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .timing =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &micron_t=
iming,
>> - =C2=A0 =C2=A0 =C2=A0 .cmdset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &largepag=
e_cmdset,
>> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 64,
>> - =C2=A0 =C2=A0 =C2=A0 .page_size =C2=A0 =C2=A0 =C2=A0=3D 2048,
>> - =C2=A0 =C2=A0 =C2=A0 .flash_width =C2=A0 =C2=A0=3D 16,
>> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =C2=A0 =C2=A0 =C2=A0=3D 16,
>> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =C2=A0 =C2=A0 =3D 4096,
>> - =C2=A0 =C2=A0 =C2=A0 .chip_id =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xcc2c,
>> -};
>> -
>> -static struct pxa3xx_nand_timing stm2GbX16_timing =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .tCH =3D 10,
>> - =C2=A0 =C2=A0 =C2=A0 .tCS =3D 35,
>> - =C2=A0 =C2=A0 =C2=A0 .tWH =3D 15,
>> - =C2=A0 =C2=A0 =C2=A0 .tWP =3D 25,
>> - =C2=A0 =C2=A0 =C2=A0 .tRH =3D 15,
>> - =C2=A0 =C2=A0 =C2=A0 .tRP =3D 25,
>> - =C2=A0 =C2=A0 =C2=A0 .tR =3D 25000,
>> - =C2=A0 =C2=A0 =C2=A0 .tWHR =3D 60,
>> - =C2=A0 =C2=A0 =C2=A0 .tAR =3D 10,
>> -};
>> -
>> -static struct pxa3xx_nand_flash stm2GbX16 =3D {
>> - =C2=A0 =C2=A0 =C2=A0 .timing =3D &stm2GbX16_timing,
>> - =C2=A0 =C2=A0 =C2=A0 .cmdset =3D &largepage_cmdset,
>> - =C2=A0 =C2=A0 =C2=A0 .page_per_block =3D 64,
>> - =C2=A0 =C2=A0 =C2=A0 .page_size =3D 2048,
>> - =C2=A0 =C2=A0 =C2=A0 .flash_width =3D 16,
>> - =C2=A0 =C2=A0 =C2=A0 .dfc_width =3D 16,
>> - =C2=A0 =C2=A0 =C2=A0 .num_blocks =3D 2048,
>> - =C2=A0 =C2=A0 =C2=A0 .chip_id =3D 0xba20,
>> -};
>> -
>> -static struct pxa3xx_nand_flash *builtin_flash_types[] =3D {
>> - =C2=A0 =C2=A0 =C2=A0 &samsung512MbX16,
>> - =C2=A0 =C2=A0 =C2=A0 &samsung2GbX8,
>> - =C2=A0 =C2=A0 =C2=A0 &samsung32GbX8,
>> - =C2=A0 =C2=A0 =C2=A0 &micron1GbX8,
>> - =C2=A0 =C2=A0 =C2=A0 &micron1GbX16,
>> - =C2=A0 =C2=A0 =C2=A0 &micron4GbX8,
>> - =C2=A0 =C2=A0 =C2=A0 &micron4GbX16,
>> - =C2=A0 =C2=A0 =C2=A0 &stm2GbX16,
>> -};
>> -#endif /* CONFIG_MTD_NAND_PXA3xx_BUILTIN */
>> -
>> =C2=A0#define NDTR0_tCH(c) =C2=A0 (min((c), 7) << 19)
>> =C2=A0#define NDTR0_tCS(c) =C2=A0 (min((c), 7) << 16)
>> =C2=A0#define NDTR0_tWH(c) =C2=A0 (min((c), 7) << 11)
>> @@ -412,7 +308,6 @@ static int prepare_read_prog_cmd(struct
>> pxa3xx_nand_info *info,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uint16_t cmd, int column, int page_addr)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct pxa3xx_nand_flash *f =3D info->f=
lash_info;
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D f->cm=
dset;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* calculate data size */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (f->page_size) {
>> @@ -445,7 +340,7 @@ static int prepare_read_prog_cmd(struct
>> pxa3xx_nand_info *info,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb1 =3D p=
age_addr << 8;
>>
>> - =C2=A0 =C2=A0 =C2=A0 if (cmd =3D=3D cmdset->program)
>> + =C2=A0 =C2=A0 =C2=A0 if (cmd =3D=3D cmdset.program)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb0 |=3D =
NDCB0_CMD_TYPE(1) | NDCB0_AUTO_RS;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> @@ -463,20 +358,18 @@ static int prepare_erase_cmd(struct
>> pxa3xx_nand_info *info,
>>
>> =C2=A0static int prepare_other_cmd(struct pxa3xx_nand_info *info, uint16=
_t cmd)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D
>> info->flash_info->cmdset;
>> -
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb0 =3D cmd | ((cmd & 0xff00) ? NDCB0=
_DBC : 0);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb1 =3D 0;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb2 =3D 0;
>>
>> - =C2=A0 =C2=A0 =C2=A0 if (cmd =3D=3D cmdset->read_id) {
>> + =C2=A0 =C2=A0 =C2=A0 if (cmd =3D=3D cmdset.read_id) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb0 |=3D =
NDCB0_CMD_TYPE(3);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->data_size =
=3D 8;
>> - =C2=A0 =C2=A0 =C2=A0 } else if (cmd =3D=3D cmdset->read_status) {
>> + =C2=A0 =C2=A0 =C2=A0 } else if (cmd =3D=3D cmdset.read_status) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb0 |=3D =
NDCB0_CMD_TYPE(4);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->data_size =
=3D 8;
>> - =C2=A0 =C2=A0 =C2=A0 } else if (cmd =3D=3D cmdset->reset || cmd =3D=3D=
 cmdset->lock ||
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D=
=3D cmdset->unlock) {
>> + =C2=A0 =C2=A0 =C2=A0 } else if (cmd =3D=3D cmdset.reset || cmd =3D=3D =
cmdset.lock ||
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D=
=3D cmdset.unlock) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb0 |=3D =
NDCB0_CMD_TYPE(5);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0} else
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;
>> @@ -700,8 +593,6 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info
>> *mtd, unsigned command,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int column, int page_addr)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa3xx_nand_info *info =3D mtd->priv;
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_flash *flash_info =3D in=
fo->flash_info;
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D flash=
_info->cmdset;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->use_dma =3D (use_dma) ? 1 : 0;
>> @@ -718,7 +609,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info
>> *mtd, unsigned command,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->buf_start =
=3D mtd->writesize + column;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(info->data=
_buff, 0xFF, info->buf_count);
>>
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prepare_read_prog=
_cmd(info, cmdset->read1, column,
>> page_addr))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prepare_read_prog=
_cmd(info, cmdset.read1, column,
>> page_addr))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa3xx_nand_do_cm=
d(info, NDSR_RDDREQ | NDSR_DBERR |
>> NDSR_SBERR);
>> @@ -735,7 +626,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info
>> *mtd, unsigned command,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->buf_count =
=3D mtd->writesize + mtd->oobsize;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(info->data=
_buff, 0xFF, info->buf_count);
>>
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prepare_read_prog=
_cmd(info, cmdset->read1, column,
>> page_addr))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prepare_read_prog=
_cmd(info, cmdset.read1, column,
>> page_addr))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa3xx_nand_do_cm=
d(info, NDSR_RDDREQ | NDSR_DBERR |
>> NDSR_SBERR);
>> @@ -761,14 +652,14 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info
>> *mtd, unsigned command,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_PAGEPROG:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->use_ecc =3D=
 (info->seqin_column >=3D mtd->writesize) ? 0
>> : 1;
>>
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prepare_read_prog=
_cmd(info, cmdset->program,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prepare_read_prog=
_cmd(info, cmdset.program,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->seqin_column, info->seqin_pa=
ge_addr))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa3xx_nand_do_cm=
d(info, NDSR_WRDREQ);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_ERASE1:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prepare_erase_cmd=
(info, cmdset->erase, page_addr))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prepare_erase_cmd=
(info, cmdset.erase, page_addr))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa3xx_nand_do_cm=
d(info, NDSR_CS0_BBD | NDSR_CS0_CMDD);
>> @@ -783,13 +674,13 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info
>> *mtd, unsigned command,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->read_id_bytes : 1;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (prepare_other=
_cmd(info, (command =3D=3D NAND_CMD_READID) ?
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmdset->read_id : cmdset->read_status))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmdset.read_id : cmdset.read_status))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa3xx_nand_do_cm=
d(info, NDSR_RDDREQ);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_RESET:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prepare_other_cmd=
(info, cmdset->reset))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prepare_other_cmd=
(info, cmdset.reset))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pxa3xx_na=
nd_do_cmd(info, NDSR_CS0_CMDD);
>> @@ -925,12 +816,10 @@ static int pxa3xx_nand_ecc_correct(struct mtd_info
>> *mtd,
>>
>> =C2=A0static int __readid(struct pxa3xx_nand_info *info, uint32_t *id)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_flash *f =3D info->flash=
_info;
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D f->cm=
dset;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ndcr;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t =C2=A0id_buff[8];
>>
>> - =C2=A0 =C2=A0 =C2=A0 if (prepare_other_cmd(info, cmdset->read_id)) {
>> + =C2=A0 =C2=A0 =C2=A0 if (prepare_other_cmd(info, cmdset.read_id)) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk(KERN_ERR "=
failed to prepare command\n");
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> @@ -991,7 +880,7 @@ static int pxa3xx_nand_config_flash(struct
>> pxa3xx_nand_info *info,
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->reg_ndcr =3D ndcr;
>>
>> - =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_set_timing(info, f->timing);
>> + =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_set_timing(info, &f->timing);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->flash_info =3D f;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> =C2=A0}
>> @@ -1027,11 +916,6 @@ static int pxa3xx_nand_detect_config(struct
>> pxa3xx_nand_info *info)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0default_flash.flash_width =3D ndcr & NDCR_DWI=
DTH_M ? 16 : 8;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0default_flash.dfc_width =3D ndcr & NDCR_DWIDT=
H_C ? 16 : 8;
>>
>> - =C2=A0 =C2=A0 =C2=A0 if (default_flash.page_size =3D=3D 2048)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_flash.cmdset =
=3D &largepage_cmdset;
>> - =C2=A0 =C2=A0 =C2=A0 else
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_flash.cmdset =
=3D &smallpage_cmdset;
>> -
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set info fields needed to __readid */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->flash_info =3D &default_flash;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->read_id_bytes =3D (default_flash.page_s=
ize =3D=3D 2048) ? 4 : 2;
>> @@ -1067,7 +951,7 @@ static int pxa3xx_nand_detect_config(struct
>> pxa3xx_nand_info *info)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->row_addr_cy=
cles =3D 2;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa3xx_nand_detect_timing(info, &default_timi=
ng);
>> - =C2=A0 =C2=A0 =C2=A0 default_flash.timing =3D &default_timing;
>> + =C2=A0 =C2=A0 =C2=A0 memcpy(&default_flash.timing, &default_timing,
>> sizeof(default_timing));
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> =C2=A0}
>> @@ -1083,23 +967,9 @@ static int pxa3xx_nand_detect_flash(struct
>> pxa3xx_nand_info *info,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pxa3xx_nand_d=
etect_config(info) =3D=3D 0)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 0;
>>
>> - =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i<pdata->num_flash; ++i) {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D pdata->flash + =
i;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pxa3xx_nand_confi=
g_flash(info, f))
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (__readid(info, &i=
d))
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id =3D=3D f->chip=
_id)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return 0;
>> - =C2=A0 =C2=A0 =C2=A0 }
>> -
>> -#ifdef CONFIG_MTD_NAND_PXA3xx_BUILTIN
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i < ARRAY_SIZE(builtin_flash_ty=
pes); i++) {
>>
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D builtin_flash_t=
ypes[i];
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D &builtin_flash_=
types[i];
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pxa3xx_nand_c=
onfig_flash(info, f))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0continue;
>> @@ -1110,7 +980,6 @@ static int pxa3xx_nand_detect_flash(struct
>> pxa3xx_nand_info *info,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (id =3D=3D f->=
chip_id)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 0;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -#endif
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&info->pdev->dev,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "failed to detec=
t configured nand flash; found %04x
>> instead of\n",
>> @@ -1320,17 +1189,6 @@ static int pxa3xx_nand_probe(struct
>> platform_device *pdev)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_free_ir=
q;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>>
>> - =C2=A0 =C2=A0 =C2=A0 if (mtd_has_cmdlinepart()) {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static const char *pr=
obes[] =3D { "cmdlinepart", NULL };
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mtd_partition =
*parts;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int nr_parts;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nr_parts =3D parse_mt=
d_partitions(mtd, probes, &parts, 0);
>> -
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nr_parts)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return add_mtd_partitions(mtd, parts, nr_parts);
>> - =C2=A0 =C2=A0 =C2=A0 }
>> -
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return add_mtd_partitions(mtd, pdata->parts, =
pdata->nr_parts);
>>
>> =C2=A0fail_free_irq:
>
>
> --
> Sincerely yours,
> Mike.
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
