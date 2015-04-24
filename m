Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlRdX-0001Kr-KY
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2015 00:38:32 +0000
Received: by pacyx8 with SMTP id yx8so32434441pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 23 Apr 2015 17:38:09 -0700 (PDT)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <5538EA69.2080702@monstr.eu>
References: <1429192597-23519-1-git-send-email-punnaia@xilinx.com>
 <6ba05766-d8b9-436d-a953-447edc24b179@BN1BFFO11FD051.protection.gbl>
 <5538EA69.2080702@monstr.eu>
Date: Fri, 24 Apr 2015 06:08:09 +0530
Message-ID: <CAGnW=BbqL3pVm=W3S7QqEtEqMmkihOfpbZ4HKjyhcHUFXWitWA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: Add support for Arasan Nand Flash
 Controller
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: Michal Simek <monstr@monstr.eu>
Content-Type: text/plain; charset=UTF-8
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "joern@logfs.org" <joern@logfs.org>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 punnaiah choudary kalluri <kalluripunnaiahchoudary@gmail.com>,
 Punnaiah Choudary <kpc528@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, "Khoronzhuk,
 Ivan" <ivan.khoronzhuk@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 23, 2015 at 6:19 PM, Michal Simek <monstr@monstr.eu> wrote:
> On 04/16/2015 03:56 PM, Punnaiah Choudary Kalluri wrote:
>> Added the basic driver for Arasan Nand Flash Controller used in
>> Zynq UltraScale+ MPSoC. It supports only Hw Ecc and upto 24bit
>> correction.
>>
>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>> ---
>>  drivers/mtd/nand/Kconfig      |    7 +
>>  drivers/mtd/nand/Makefile     |    1 +
>>  drivers/mtd/nand/arasan_nfc.c |  861 +++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 869 insertions(+), 0 deletions(-)
>>  create mode 100644 drivers/mtd/nand/arasan_nfc.c
>>
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 5897d8d..64e497c 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -530,4 +530,11 @@ config MTD_NAND_HISI504
>>       help
>>         Enables support for NAND controller on Hisilicon SoC Hip04.
>>
>> +config MTD_NAND_ARASAN
>> +     tristate "Support for Arasan Nand Flash controller"
>> +     depends on MTD_NAND
>> +     help
>> +       Enables the driver for the Arasan Nand Flash controller on
>> +       Zynq UltraScale+ MPSoC.
>> +
>>  endif # MTD_NAND
>> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
>> index 582bbd05..fd863ea 100644
>> --- a/drivers/mtd/nand/Makefile
>> +++ b/drivers/mtd/nand/Makefile
>> @@ -52,5 +52,6 @@ obj-$(CONFIG_MTD_NAND_XWAY)         += xway_nand.o
>>  obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH) += bcm47xxnflash/
>>  obj-$(CONFIG_MTD_NAND_SUNXI)         += sunxi_nand.o
>>  obj-$(CONFIG_MTD_NAND_HISI504)               += hisi504_nand.o
>> +obj-$(CONFIG_MTD_NAND_ARASAN)                += arasan_nfc.o
>>
>>  nand-objs := nand_base.o nand_bbt.o nand_timings.o
>> diff --git a/drivers/mtd/nand/arasan_nfc.c b/drivers/mtd/nand/arasan_nfc.c
>> new file mode 100644
>> index 0000000..a4b407b
>> --- /dev/null
>> +++ b/drivers/mtd/nand/arasan_nfc.c
>> @@ -0,0 +1,861 @@
>> +/*
>> + * Arasan Nand Flash Controller Driver
>> + *
>> + * Copyright (C) 2014 - 2015 Xilinx, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it under
>> + * the terms of the GNU General Public License version 2 as published by the
>> + * Free Software Foundation; either version 2 of the License, or (at your
>> + * option) any later version.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/module.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/nand.h>
>> +#include <linux/mtd/partitions.h>
>
> For !CONFIG_OF_MTD here should be also. Kbuild system just reported this
> problem.
>
> #include <linux/of.h>
>
> For the rest
> Tested-by: Michal Simek <michal.simek@xilinx.com>

Ok. I will check and update this.

Thanks
Punnaiah

>
> Thanks,
> Michal
>
> --
> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
> Maintainer of Linux kernel - Xilinx Zynq ARM architecture
> Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform
>
>
