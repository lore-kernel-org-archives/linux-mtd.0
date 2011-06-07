Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwSd-0001Qj-VH
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:36:49 +0000
Received: by wyb28 with SMTP id 28so4898888wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:36:43 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 00/44] Cleanup of parse/register scenario
Date: Tue,  7 Jun 2011 17:35:59 +0400
Message-Id: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lots of mtd drivers have more or less the same common logic:
parse partitions, then register them. Currently this ends up
with lots of code duplication, each copy having it's own features
and bugs. In this patch serie I create a special function
(mtd_device_parse_register) which handles all issues with acquiring
partition information, registering mtd device(s) and returning correct
error code.

The following changes since commit 85bd7e882840f4cb4d213768d252c754f22440ac:

  mtd: pxa3xx_nand: Fix blank page ECC mismatch (2011-06-07 15:40:29 +0300)

are available in the git repository at:
  git://git.infradead.org/users/dbaryshkov/mtd-cleanup.git mtd-parse-1st

Dmitry Eremin-Solenikov (44):
      mtd: add new API for handling MTD registration
      mtd: lart.c: use mtd_device_parse_register
      mtd: mtd_dataflash.c: use mtd_device_parse_register
      mtd: sst25l.c: use mtd_device_parse_register
      mtd: bfin-async-flash.c: use mtd_device_parse_register
      mtd: dc21285.c: use mtd_device_parse_register
      mtd: gpio-addr-flash.c: use mtd_device_parse_register
      mtd: h720x-flash.c: use mtd_device_parse_register
      mtd: impa7.c: use mtd_device_parse_register
      mtd: intel_vr_nor.c: use mtd_device_parse_register
      mtd: ixp2000.c: use mtd_device_parse_register
      mtd: ixp4xx.c: use mtd_device_parse_register
      mtd: lantiq-flash.c: use mtd_device_parse_register
      mtd: latch-addr-flash.c: use mtd_device_parse_register
      mtd: physmap.c: use mtd_device_parse_register
      mtd: plat-ram.c: use mtd_device_parse_register
      mtd: pxa2xx-flash.c: use mtd_device_parse_register
      mtd: rbtx4939-flash.c: use mtd_device_parse_register
      mtd: sa1100-flash.c: use mtd_device_parse_register
      mtd: solutionengine.c: use mtd_device_parse_register
      mtd: wr_sbc82xx_flash.c: use mtd_device_parse_register
      mtd: atmel_nand.c: use mtd_device_parse_register
      mtd: bcm_umi_nand.c: use mtd_device_parse_register
      mtd: cafe_nand.c: use mtd_device_parse_register
      mtd: cmx270_nand.c: use mtd_device_parse_register
      mtd: cs553x_nand.c: use mtd_device_parse_register
      mtd: davinci_nand.c: use mtd_device_parse_register
      mtd: edb7312.c: use mtd_device_parse_register
      mtd: fsmc_nand.c: use mtd_device_parse_register
      mtd: h1910.c: use mtd_device_parse_register
      mtd: jz4740_nand.c: use mtd_device_parse_register
      mtd: mxc_nand.c: use mtd_device_parse_register
      mtd: omap2.c: use mtd_device_parse_register
      mtd: orion_nand.c: use mtd_device_parse_register
      mtd: plat_nand.c: use mtd_device_parse_register
      mtd: ppchameleonevb.c: use mtd_device_parse_register
      mtd: pxa3xx_nand.c: use mtd_device_parse_register
      mtd: s3c2410.c: use mtd_device_parse_register
      mtd: sharpsl.c: use mtd_device_parse_register
      mtd: tmio_nand.c: use mtd_device_parse_register
      mtd: txx9ndfmc.c: use mtd_device_parse_register
      mtd: onenand/generic.c: use mtd_device_parse_register
      mtd: onenand/omap2.c: use mtd_device_parse_register
      mtd: onenand/samsung.c: use mtd_device_parse_register

 drivers/mtd/devices/lart.c          |   12 ++----
 drivers/mtd/devices/mtd_dataflash.c |   21 ++---------
 drivers/mtd/devices/sst25l.c        |   32 ++---------------
 drivers/mtd/maps/bfin-async-flash.c |   16 +-------
 drivers/mtd/maps/dc21285.c          |    9 +----
 drivers/mtd/maps/gpio-addr-flash.c  |   16 +-------
 drivers/mtd/maps/h720x-flash.c      |   21 +----------
 drivers/mtd/maps/impa7.c            |   25 ++-----------
 drivers/mtd/maps/intel_vr_nor.c     |    6 +---
 drivers/mtd/maps/ixp2000.c          |   11 +-----
 drivers/mtd/maps/ixp4xx.c           |   29 ++-------------
 drivers/mtd/maps/lantiq-flash.c     |   14 +------
 drivers/mtd/maps/latch-addr-flash.c |   21 +----------
 drivers/mtd/maps/physmap.c          |   23 +-----------
 drivers/mtd/maps/plat-ram.c         |   23 +-----------
 drivers/mtd/maps/pxa2xx-flash.c     |   20 +----------
 drivers/mtd/maps/rbtx4939-flash.c   |   18 +--------
 drivers/mtd/maps/sa1100-flash.c     |   30 ++--------------
 drivers/mtd/maps/solutionengine.c   |   30 ++++------------
 drivers/mtd/maps/wr_sbc82xx_flash.c |   30 ++++++----------
 drivers/mtd/mtdcore.c               |   30 ++++++++++++++++
 drivers/mtd/nand/atmel_nand.c       |   19 +---------
 drivers/mtd/nand/bcm_umi_nand.c     |   19 +---------
 drivers/mtd/nand/cafe_nand.c        |   11 +-----
 drivers/mtd/nand/cmx270_nand.c      |   20 +---------
 drivers/mtd/nand/cs553x_nand.c      |    7 +---
 drivers/mtd/nand/davinci_nand.c     |   25 +------------
 drivers/mtd/nand/edb7312.c          |   17 +--------
 drivers/mtd/nand/fsmc_nand.c        |   66 +++++------------------------------
 drivers/mtd/nand/h1910.c            |   15 +-------
 drivers/mtd/nand/jz4740_nand.c      |   11 ++----
 drivers/mtd/nand/mxc_nand.c         |   15 ++------
 drivers/mtd/nand/omap2.c            |   10 +----
 drivers/mtd/nand/orion_nand.c       |   12 +-----
 drivers/mtd/nand/plat_nand.c        |   22 ++----------
 drivers/mtd/nand/ppchameleonevb.c   |   42 +++++-----------------
 drivers/mtd/nand/pxa3xx_nand.c      |   11 +-----
 drivers/mtd/nand/s3c2410.c          |   18 ++-------
 drivers/mtd/nand/sharpsl.c          |   11 +-----
 drivers/mtd/nand/tmio_nand.c        |   12 ++-----
 drivers/mtd/nand/txx9ndfmc.c        |    7 +---
 drivers/mtd/onenand/generic.c       |   11 ++----
 drivers/mtd/onenand/omap2.c         |   13 ++-----
 drivers/mtd/onenand/samsung.c       |   11 ++----
 include/linux/mtd/mtd.h             |    5 +++
 45 files changed, 163 insertions(+), 684 deletions(-)
