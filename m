Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an55x-0002Ty-Ee
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 14:03:10 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH v5 0/3] mtd: spi-nor: add an alternative method to support
 memory > 16MiB
Date: Mon, 4 Apr 2016 16:03:19 +0200
Message-ID: <cover.1459776391.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

This series of patches was tested on a sama5d2 xplained board + Macronix
mx25l25673g. The flash was declared in the DT with the following
'compatible' string:
compatible = "mxicy,mx25l25673g", "jedec,spi-nor";

It provides us with an alternative method to support SPI NOR memory above
16MiB (128Mib). Indeed the previous method (still default) makes the
memory enter it's 4byte-address method. However this mode has some
annoying side effects for early bootloarders: it changes the internal
state of the memory hence when using regular (Fast) Read op codes
(0x03, 0x0b, 0x6b, ...) the memory now expects 4byte addresses whereas
some bootloaders still use these op codes with 3byte addresses.

The new method translates the 3byte address op codes into their 4byte
address version:
0x03 -> 0x13  Read
0x0b -> 0x0c  Fast Read
0x6b -> 0x6c  Fast Read 1-1-4
0x02 -> 0x12  Page Program
0xd8 -> 0xdc  Sector Erase
...

The internal state of the SPI NOR memory is left unchanged.

However the 4byte address op codes are not supported by all memories.
For instance Macronix mx25l25635e and mx25l25673g share the very same
JEDEC ID (C22019) with no additional ext_id bytes to differentiate them.
The 35e doesn't support the 4byte address op codes whereas the 73g does.
So there is no mean for the software to discover at runtime whether the
hardware supports these op codes.

Hence this series of patches also allows to add multiple entries in the
spi_nor_ids[] table sharing the same JEDEC ID. Then the right entry
is selected according to the 'name' argument of spi_nor_scan(), which
most of the time is set according to the DT 'compatible' string.


Best regards,

Cyrille


ChangeLog:

v4 -> v5:
- use a new SPI_NOR_4B_OPCODES flag instead of a new
  "spi-nor-4byte-opcodes" DT property.
- add a patch to allow multiple entries in the spi_nor_ids[] to share the
  same JEDEC ID: the right entry is selected according to the 'name'
  argument of spi_nor_scan().
- add a patch to support Macronix MX25L25673G as un usage example of this
  series.

v3 -> v4:
- rename "m25p,4byte-opcodes" DT property into "spi-nor-4byte-opcodes".
- replace "can not" by "cannot" in DT binding documentation.

v2 -> v3:
- fix errors reported by kbuild test robot: replace SPINOR_OP_READ4.* op
  codes by SPINOR_OP_READ.*_4B in st_spi_fsm.c
- rename QUAD_PP into PP_1_1_4 and QUAD_PP_MX into PP_1_4_4

v1 -> v2:
- remove the Kconfig option and use the new "m25p,4byte-opcodes" DT
  property instead.

Cyrille Pitchen (3):
  mtd: spi-nor: add an alternative method to support memory >16MiB
  mtd: spi-nor: allow different flash_info entries to share the same
    JEDEC ID
  mtd: spi-nor: add entry for Macronix mx25l25673g

 drivers/mtd/devices/serial_flash_cmds.h |   7 ---
 drivers/mtd/devices/st_spi_fsm.c        |  28 ++++-----
 drivers/mtd/spi-nor/spi-nor.c           | 107 +++++++++++++++++++++++++-------
 include/linux/mtd/spi-nor.h             |  21 +++++--
 4 files changed, 114 insertions(+), 49 deletions(-)

-- 
1.8.2.2
