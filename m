From: "Philip, Avinash" <avinashphilip@ti.com>
To: <dwmw2@infradead.org>, <artem.bityutskiy@linux.intel.com>, <afzal@ti.com>,
 <tony@atomide.com>, <broonie@opensource.wolfsonmicro.com>,
 <rmk+kernel@arm.linux.org.uk>, <gregkh@linuxfoundation.org>
Subject: [PATCH v3 0/3] mtd: nand: OMAP: ELM error correction support for BCH
 ecc
Date: Thu, 29 Nov 2012 17:16:31 +0530
Message-ID: <1354189595-12784-1-git-send-email-avinashphilip@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, gururaja.hebbar@ti.com,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Support to use ELM as BCH 4 & 8 bit error correction module. Also performance
enhancement by adding single shot read_page and write_page functions for the
nand flashes with page size less than 4 KB.

ELM module can be used to correct errors reported by BCH 4, 8 & 16 bit
ECC scheme. For now only 4 & 8 bit support is added.

BCH 4 & 8 bit error detection support is already available in mainline
kernel and works with software error correction.

This series is based on [1] and tested with RFC: OMAP GPMC bindings
patch series

1. linux-next/20121129

Tested on am335x-evm for BCH 4 and 8 bit error correction.

Changes since v1:
	- Erased page is identified by checking byte [13/7] in read
	  ecc. To filter out bit flips in OOB area, check 0 bits in
	  the byte greater than 4.
	- GPMC ecc engine configuration moves to omap2.c NAND driver.

Changes since v2:
	- Added runtime detection of elm module, instead of depending
	  on platform data.
	- Added bit flip correction in OOB ecc data if bit flip happen
	  OOB data.

Philip, Avinash (3):
  mtd: nand: omap2: Update nerrors using ecc.strength
  mtd: devices: elm: Add support for ELM error correction
  mtd: nand: omap2: Support for hardware BCH error correction.

 Documentation/devicetree/bindings/mtd/elm.txt |   17 +
 drivers/mtd/devices/Makefile                  |    4 +-
 drivers/mtd/devices/elm.c                     |  418 ++++++++++++++++++
 drivers/mtd/nand/omap2.c                      |  563 +++++++++++++++++++++++--
 include/linux/platform_data/elm.h             |   55 +++
 5 files changed, 1017 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/elm.txt
 create mode 100644 drivers/mtd/devices/elm.c
 create mode 100644 include/linux/platform_data/elm.h
