Received: from mail-qy0-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MW1Kb-0000Jj-D6
	for linux-mtd@lists.infradead.org; Wed, 29 Jul 2009 05:04:05 +0000
Received: by qyk6 with SMTP id 6so776261qyk.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jul 2009 22:04:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090728215632.GC3279@n2100.arm.linux.org.uk>
References: <20090728095928.GA26063@mail.gnudd.com>
	<20090728215632.GC3279@n2100.arm.linux.org.uk>
From: vimal singh <vimal.newwork@gmail.com>
Date: Wed, 29 Jul 2009 10:33:38 +0530
Message-ID: <ce9ab5790907282203v5d6ac204ica9c77d2d1e62016@mail.gmail.com>
Subject: Re: [PATCH V6] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: STEricsson_nomadik_linux@list.st.com, linux-mtd@lists.infradead.org,
	Alessandro Rubini <ru@gnudd.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 29, 2009 at 3:26 AM, Russell King - ARM
Linux<linux@arm.linux.org.uk> wrote:
> Just some trivial comments, which I leave you to decide what to do with.
>
> Either way...
>
> Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
>
> On Tue, Jul 28, 2009 at 11:59:28AM +0200, Alessandro Rubini wrote:
>> =A0 =A0 =A0 =A0 andrea.gallo@stericsson.com
>> From: Alessandro Rubini <rubini-list@gnudd.com>
>> Sender: rubini-list@gnudd.com
>> Cc: andrea.gallo@stericsson.com
>> Cc: STEricsson_nomadik_linux@list.st.com
>> Cc: linux@arm.linux.org.uk,vimal.newwork@gmail.com
>
> Not sure what the above is, but it doesn't look like it should be part
> of this patch.
>
>> diff --git a/arch/arm/mach-nomadik/board-nhk8815.c b/arch/arm/mach-nomad=
ik/board-nhk8815.c
>> index 79bdea9..3fde972 100644
>> --- a/arch/arm/mach-nomadik/board-nhk8815.c
>> +++ b/arch/arm/mach-nomadik/board-nhk8815.c
>> @@ -16,12 +16,103 @@
>> =A0#include <linux/amba/bus.h>
>> =A0#include <linux/interrupt.h>
>> =A0#include <linux/gpio.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/nand.h>
>> +#include <linux/mtd/partitions.h>
>> +#include <asm/sizes.h>
>> +#include <asm/io.h>
>
> My mailer's setup to show asm/io.h includes in red, so it's something
> I'm hot on. =A0This should be linux/io.h
>
>> +static struct platform_device nhk8815_nand_device =3D {
>> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "nomadik_nand",
>> + =A0 =A0 .dev =A0 =A0 =A0 =A0 =A0 =A0=3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data=
 =3D &nhk8815_nand_data,
>
> Not sure why this is tabbed so far over. =A0Just two tabs seems sane.
>
>> + =A0 =A0 },
>> + =A0 =A0 .resource =A0 =A0 =A0 =3D nhk8815_nand_resources,
>> + =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(nhk8815_nand_resources),
>> +};
>> +
>> +
>> =A0#define __MEM_4K_RESOURCE(x) \
>> =A0 =A0 =A0 .res =3D {.start =3D (x), .end =3D (x) + SZ_4K - 1, .flags =
=3D IORESOURCE_MEM}
>>
>> @@ -81,6 +172,7 @@ static int __init nhk8815_eth_init(void)
>> =A0device_initcall(nhk8815_eth_init);
>>
>> =A0static struct platform_device *nhk8815_platform_devices[] __initdata =
=3D {
>> + =A0 =A0 &nhk8815_nand_device,
>> =A0 =A0 =A0 &nhk8815_eth_device,
>> =A0 =A0 =A0 /* will add more devices */
>> =A0};
>> diff --git a/arch/arm/mach-nomadik/include/mach/fsmc.h b/arch/arm/mach-n=
omadik/include/mach/fsmc.h
>> new file mode 100644
>> index 0000000..8c2c051
>> --- /dev/null
>> +++ b/arch/arm/mach-nomadik/include/mach/fsmc.h
>> @@ -0,0 +1,29 @@
>> +
>> +/* Definitions for the Nomadik FSMC "Flexible Static Memory controller"=
 */
>> +
>> +#ifndef __ASM_ARCH_FSMC_H
>> +#define __ASM_ARCH_FSMC_H
>> +
>> +#include <mach/hardware.h>
>> +/*
>> + * Register list
>> + */
>> +
>> +/* bus control reg. and bus timing reg. for CS0..CS3 */
>> +#define FSMC_BCR(x) =A0 =A0 (NOMADIK_FSMC_VA + (x << 3))
>> +#define FSMC_BTR(x) =A0 =A0 (NOMADIK_FSMC_VA + (x << 3) + 0x04)
>> +
>> +/* PC-card and NAND:
>> + * PCR =3D control register
>> + * PMEM =3D memory timing
>> + * PATT =3D attribute timing
>> + * PIO =3D I/O timing
>> + * PECCR =3D ECC result
>> + */
>> +#define FSMC_PCR(x) =A0 =A0 (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x00)
>> +#define FSMC_PMEM(x) =A0 =A0(NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x08)
>> +#define FSMC_PATT(x) =A0 =A0(NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x0c)
>> +#define FSMC_PIO(x) =A0 =A0 (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x10)
>> +#define FSMC_PECCR(x) =A0 (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x14)
>> +
>> +#endif /* __ASM_ARCH_FSMC_H */
>> diff --git a/arch/arm/mach-nomadik/include/mach/nand.h b/arch/arm/mach-n=
omadik/include/mach/nand.h
>> new file mode 100644
>> index 0000000..c3c8254
>> --- /dev/null
>> +++ b/arch/arm/mach-nomadik/include/mach/nand.h
>> @@ -0,0 +1,16 @@
>> +#ifndef __ASM_ARCH_NAND_H
>> +#define __ASM_ARCH_NAND_H
>> +
>> +struct nomadik_nand_platform_data {
>> + =A0 =A0 struct mtd_partition *parts;
>> + =A0 =A0 int nparts;
>> + =A0 =A0 int options;
>
> What's 'options' - it doesn't seem to be used by the driver, other than
> taking a copy.

There are a few 'options' provided by board specific file to the
driver. Which will be used by generic layer of NAND driver (i.e.
nand_base.c, nand_bbt.c).

for example in this driver 'options' provided by board file are:
       .options        =3D NAND_COPYBACK | NAND_CACHEPRG | NAND_NO_PADDING =
\
                       | NAND_NO_READRDY | NAND_NO_AUTOINCR,

-vimal

>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
