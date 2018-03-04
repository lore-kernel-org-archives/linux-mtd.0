Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esbNE-00075R-KY
 for linux-mtd@lists.infradead.org; Sun, 04 Mar 2018 21:40:55 +0000
Subject: Re: [RFC PATCH 0/6] spi: Extend the framework to generically support
 memory devices
To: Mark Brown <broonie@kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Sourav Poddar <sourav.poddar@ti.com>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180219162510.GG32761@sirena.org.uk>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <f173a962-3a1c-338f-3c17-1b8792009842@wedev4u.fr>
Date: Sun, 4 Mar 2018 22:40:33 +0100
MIME-Version: 1.0
In-Reply-To: <20180219162510.GG32761@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

Le 19/02/2018 à 17:25, Mark Brown a écrit :
> On Tue, Feb 06, 2018 at 12:21:14AM +0100, Boris Brezillon wrote:
> 
>> SPI NAND layer): you can register a SPI NOR device directly from the
>> dedicated SPI memory controller, or it can be registered through the
>> SPI layer if the SPI controller is a generic SPI controller. While
>> the generic SPI controller path works fine, the dedicated SPI NOR
>> controller path brings its own set of issues:
> 
>> * the SPI bus is not represented in sysfs
> 
> I'm not sure if this is a big deal or not - at some point it's just an
> implementation detail of the hardware rather than something we're aware
> of or interested in.
> 
>> * because there's no bus, there's no uevent, which means you'll have to
>>   select both the SPI NAND and SPI NOR logic as soon as one driver
>>   supports both interfaces if you don't want to run into loading
>>   dependency issues
> 
> This is sounding like we want a class (well, virtual bus in the new
> world) for these devices with a SPI based driver sitting on top of that
> for use with genuine SPI controllers.  If the intention is as the
> comments in the code suggested that controllers implementing the memory
> mapping stuff don't use SPI at all then we could have the legacy SPI bus
> support be just another driver for this class.  However when I look at
> what the drivers are actually doing it seems like that's not the case
> and the new API is intended to sit alongside normal SPI support, perhaps
> only implementing certain operations and using regular SPI for others.
> In that case it makes a lot more sense to have this be bolted on the
> side of SPI.
> 

Indeed, if we take the example of the Atmel QSPI controller, the hardware
mode supports two modes:
- the legacy SPI mode: almost the same API (register layout) as the SPI
controller driver in the SPI sub-system (drivers/spi/spi-atmel.c)
- the SPI flash mode: using a new set of registers dedicated to SPI flash
command support and used by the spi-nor driver
(drivers/mtd/spi-nor/atmel_quadspi.c).

With the sama5d2 version for the QSPI controller, in SPI flash mode, all
SPI flash commands - not only Fast Read but also Page Program, register
read/write, ... - must be sent through the AHB memory mapping.
That's why the spi_flash_read() API proposed by the SPI sub-system was not
suited to the Atmel QSPI controller: this current API only supports (Fast)
Read operations but nothing else.

With the API proposed by Boris, the Atmel QSPI driver could be moved into
the SPI sub-system and the controller could also be used if connected to
something else but a SPI flash.

This is only an example but I guess other SPI controllers could be connected
at the same time to both flash and non-flash SPI devices and handle them as
needed from the SPI sub-system, using some dedicated API more suited than
the legacy one when dealing with SPI flash devices.

We already know that other SPI controllers may want to use the "SPI flash"
API only for Fast Read but still rely on the legacy SPI API for all other
SPI flash commands.

So, as you've noticed, the two APIs are not exclusive but should live together.
Then implementing a single SPI controller driver, supporting both APIs, would
really help dealing with concurrency issues between SPI device drivers.

Best regards,

Cyrille
