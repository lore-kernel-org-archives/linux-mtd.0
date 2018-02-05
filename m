Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eiq5A-0005oA-7q
 for linux-mtd@lists.infradead.org; Mon, 05 Feb 2018 23:21:54 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RFC PATCH 0/6] spi: Extend the framework to generically support
 memory devices
Date: Tue,  6 Feb 2018 00:21:14 +0100
Message-Id: <20180205232120.5851-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I know a lot of you have already tried to address some of the flaws in
the SPI NOR framework, and I'm coming with yet another proposal to solve
some of the problems I faced recently :-/. The approach I'm proposing
here has been motivated by the recent work done on SPI NANDs.

Peter has proposed a SPI NAND controller interface (based on my
suggestions) where the controller had to implement hooks that the SPI
NAND framework could use to execute SPI NAND operations. I thought the
approach was acceptable as a first step before we move to a solution
where we share even more logic between SPI NOR and SPI NAND frameworks.
But I recently changed my mind after working with Frieder to support
his SPI NAND (Frieder has a SPI NAND connected to the FSL QSPI
controller).

And here come the problems: we definitely want one FSL QSPI driver
that works for both NANDs and NORs. In the current state, that means
forcing the FSL QSPI driver to implement both the SPI NAND and SPI NOR
interfaces. When you look at the internal controller logic, if we want
to support this without duplicating too much code, we have to add
an intermediate representation that abstracts away the NOR/NAND
specificities and pass only basic information to the controller:

* the opcode
* the number of address cycles
* the number of dummy cycles
* the number of data bytes to receive/transmit

And the same problem is likely to hit most of the controller drivers
placed in drivers/mtd/spi-nor.

Another problem I see with the current approach is the duplication
of DT parsing code in almost all drivers, even though most of them
follow the generic SPI controller/device bindings.

And finally, there's the confusion brought by the 2 entry points
exposed by the SPI NOR layer (and that we had planned to mimic in the
SPI NAND layer): you can register a SPI NOR device directly from the
dedicated SPI memory controller, or it can be registered through the
SPI layer if the SPI controller is a generic SPI controller. While
the generic SPI controller path works fine, the dedicated SPI NOR
controller path brings its own set of issues:

* the SPI bus is not represented in sysfs
* because there's no bus, there's no uevent, which means you'll have to
  select both the SPI NAND and SPI NOR logic as soon as one driver
  supports both interfaces if you don't want to run into loading
  dependency issues

Not to mention that, in order to work properly, the SPI flash ids may
have to be exported so that all QSPI controller drivers can use the
same database.

For all these reasons, I decided to try a new approach: move the
generic "SPI memory" logic in the SPI framework (what I call the SPI
memory interface here is actually not limited to SPI memories, and
I'm pretty sure other QSPI devices use the same kind of protocol).

So, basically, all kind of operations that can be done on a SPI
memory are encoded with a  CMD[+ADDR][+DUMMY][+DATA_{IN,OUT}] sequence,
and that's pretty much what I'm adding here: a way to ask the SPI
framework to execute a SPI memory operation. If the SPI controller
this memory is connected to is a generic SPI controller, then those
operations will be converted to generic SPI messages, but, if the
controller has an high-level interface to send those operations, then
it can expose it and the framework will use it.

One last comment: this new interface makes the spi_flash_read() API
redundant, because it's able to handle both read/write path and allows
the same kind of optimizations you could achieve with the
spi_flash_read hooks.

To sum-up: the idea behind this series is to converge to a
common/generic interface that could be used by any kind of SPI memory
driver and still allow per-controller optimizations.

Right now, the design is quite simple, and drivers can easily implement
the various mem_ops to optimize things. I'm currently working on the
conversion of the FSL driver, but I'm pretty sure most of the QSPI
drivers lying in drivers/mtd/spi-nor can easily be converted to this
new interface.

Once, we'll have that done, the SPI NOR layer will declare itself as
a regular spi_mem_driver and we'll be done with all the funky things
we have there. The SPI NAND patches have already been converted to this
approach.

If you want to see the big picture, my development branch is here [1]
and contains this series + the SPI NAND patches + a hack-ish FSL
QSPI ported to this driver which will hopefully support both SPI NANDs
and SPI NORs (only tested with a SPI NAND so far).

I know it's a big introduction, and I probably have lost most of my
readers before this point :-). But I'd really like to have feedback on
this series, because I'd hate to have to add yet another layer of
insane hacks in existing QSPI drivers to support both NORs and NANDs.

Mark, Cyrille, Marek, and all people that have been involved in SPI-NOR
development lately, please have a quick look at this RFC, and let me
know what you think.

Thanks,

Boris

[1]https://github.com/bbrezillon/linux/tree/spi-mem

Boris Brezillon (6):
  spi: Extend the core to ease integration of SPI memory controllers
  spi: bcm-qspi: Implement the spi_mem interface
  spi: bcm53xx: Implement the spi_mem interface
  spi: ti-qspi: Implement the spi_mem interface
  mtd: spi-nor: Use the spi_mem_xx() API
  spi: Get rid of the spi_flash_read() API

 drivers/mtd/devices/m25p80.c | 240 ++++++++--------------
 drivers/spi/spi-bcm-qspi.c   | 173 ++++++++--------
 drivers/spi/spi-bcm53xx.c    |  38 +++-
 drivers/spi/spi-ti-qspi.c    |  86 +++++---
 drivers/spi/spi.c            | 480 +++++++++++++++++++++++++++++++++++++------
 include/linux/spi/spi.h      | 263 ++++++++++++++++++++----
 6 files changed, 898 insertions(+), 382 deletions(-)

-- 
2.14.1
