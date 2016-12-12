Received: from 16.mo5.mail-out.ovh.net ([87.98.174.144])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGNMk-0003LJ-0P
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 09:57:51 +0000
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id E3AA154E2F
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2016 10:57:22 +0100 (CET)
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
To: Joel Stanley <joel@jms.id.au>, Marek Vasut <marek.vasut@gmail.com>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-2-git-send-email-clg@kaod.org>
 <CACPK8XeTw4uNCjzp7qmbwkojrSAJw_U=7vXD-wTjDL2gb220qQ@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Brendan Higgins <brendanhiggins@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4e6a5528-cd26-582c-3ddf-33db0194d024@kaod.org>
Date: Mon, 12 Dec 2016 10:57:10 +0100
MIME-Version: 1.0
In-Reply-To: <CACPK8XeTw4uNCjzp7qmbwkojrSAJw_U=7vXD-wTjDL2gb220qQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/12/2016 06:02 AM, Joel Stanley wrote:
> On Sat, Dec 10, 2016 at 3:49 AM, Cédric Le Goater <clg@kaod.org> wrote:
> 
>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>> index 4a682ee0f632..5c0efbd9dd89 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -29,6 +29,16 @@ config MTD_SPI_NOR_USE_4K_SECTORS
>>           Please note that some tools/drivers/filesystems may not work with
>>           4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
>>
>> +config SPI_ASPEED
>> +       tristate "Aspeed flash controllers in SPI mode"
>> +       depends on ARCH_ASPEED || COMPILE_TEST
>> +       depends on HAS_IOMEM && OF
>> +       help
>> +         This enables support for the Firmware Memory controller (FMC)
>> +         in the Aspeed AST2500 SoC when attached to SPI NOR chips,
>> +         and support for the SPI flash memory controller (SPI) for
>> +         the host firmware. The implementation only supports SPI NOR.
>> +
>>  config SPI_ATMEL_QUADSPI
>>         tristate "Atmel Quad SPI Controller"
>>         depends on ARCH_AT91 || (ARM && COMPILE_TEST)
>> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
>> index 121695e83542..d73d772c689c 100644
>> --- a/drivers/mtd/spi-nor/Makefile
>> +++ b/drivers/mtd/spi-nor/Makefile
>> @@ -1,4 +1,5 @@
>>  obj-$(CONFIG_MTD_SPI_NOR)      += spi-nor.o
>> +obj-$(CONFIG_SPI_ASPEED)       += aspeed-smc.o
> 
> Can we make the symbol CONFIG_SPI_ASPEED_SMC?

sure. I will change the config option name and leave room for a 
potential generic SPI driver.

Thanks,

C. 

> Brendan has proposed a generic SPI master driver for the Aspeed SoC
> that would allow the controller to be used for non-flash devices. The
> obvious symbol for that driver is CONFIG_SPI_ASPEED.
> 
> Cheers,
> 
> Joel
> 
