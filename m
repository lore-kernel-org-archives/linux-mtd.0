Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYEUL-0004lc-Ld
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 18:16:35 +0000
Date: Sat, 15 Dec 2018 19:16:11 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Marek Vasut <marex@denx.de>, Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for 4.21/5.0
Message-ID: <20181215191611.2e19b6af@bbrezillon>
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

Hello,

Here is the SPI NOR PR for 4.21/5.0.

I'd like to thank Tudor for reviewing SPI NOR patches during this release
(and the previous one). 19 patches merged is still not a lot and I'm sure
we can do better, but I have the feeling the review latency has decreased.
Maybe it's a false feeling, we'll see how many patches are merged in the
next release ;-).

Thanks,

Boris=20

The following changes since commit 2595646791c319cadfdbf271563aac97d0843dc7:

  Linux 4.20-rc5 (2018-12-02 15:07:55 -0800)

are available in the Git repository at:

  git://git.infradead.org/linux-mtd.git tags/spi-nor/for-4.21

for you to fetch changes up to b422847877e35d6818f65cb359a60f529fe22c4b:

  mtd: spi-nor: Add support for is25lp016d (2018-12-10 21:59:08 +0100)

----------------------------------------------------------------
Core changes:
- Parse the 4BAIT SFDP section
- Add a bunch of SPI NOR entries to the flash_info table
- Add the concept of SFDP fixups and use it to fix a bug on MX25L25635F
- A bunch of minor cleanups/comestic changes

----------------------------------------------------------------
Alexander Sverdlin (1):
      mtd: spi-nor: Add support for mx25u12835f

Boris Brezillon (8):
      mtd: spi-nor: Add the SNOR_F_4B_OPCODES flag
      mtd: spi-nor: Add a post BFPT parsing fixup hook
      mtd: spi-nor: Add a post BFPT fixup for MX25L25635E
      mtd: spi-nor: Drop inline on all internal helpers
      mtd: spi-nor: Avoid forward declaration of internal functions
      mtd: spi-nor: Stop passing flash_info around
      mtd: spi-nor: Make the enable argument passed to set_byte() a bool
      mtd: spi-nor: Add an SPDX tag to spi-nor.{c,h}

Cyrille Pitchen (1):
      mtd: spi-nor: parse SFDP 4-byte Address Instruction Table

Fabrizio Castro (1):
      mtd: spi-nor: Add support for is25lp016d

Liu Xiang (1):
      mtd: spi-nor: Add 4B_OPCODES flag to is25lp256

Robert Marko (1):
      mtd: spi-nor: Add Winbond w25q128jv support

Tudor.Ambarus@microchip.com (2):
      mtd: spi-nor: remove unneeded smpt zeroization
      mtd: spi-nor: mark desirable switch case fall through

Uwe Kleine-K=C3=B6nig (1):
      mtd: spi-nor: Add support for IS25LP032/064

Yogesh Narayan Gaur (2):
      mtd: spi-nor: add macros related to MICRON flash
      mtd: spi-nor: add entry for mt35xu512aba flash

huijin.park (1):
      mtd: spi-nor: cast to u64 to avoid uint overflows

 drivers/mtd/spi-nor/spi-nor.c | 1342 +++++++++++++++++++++++++++++++++++++=
++--------------------------
 include/linux/mtd/cfi.h       |    1 +
 include/linux/mtd/spi-nor.h   |   11 +-
 3 files changed, 809 insertions(+), 545 deletions(-)
