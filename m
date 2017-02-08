Received: from mail-wm0-f44.google.com ([74.125.82.44])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbLCu-00051p-LI
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 05:54:22 +0000
Received: by mail-wm0-f44.google.com with SMTP id r141so174723732wmg.1
 for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2017 21:53:58 -0800 (PST)
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 4.11
To: Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>
References: <2f46eee5-35c1-291a-52e9-132ced5749a9@atmel.com>
 <1e124883-d21a-8066-2c22-e9aae98dd775@gmail.com>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <0e2e8e2b-4003-5dae-2f6d-f72375d9ca03@gmail.com>
Date: Wed, 8 Feb 2017 06:52:47 +0100
MIME-Version: 1.0
In-Reply-To: <1e124883-d21a-8066-2c22-e9aae98dd775@gmail.com>
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

Am 08.02.2017 um 02:09 schrieb Marek Vasut:
> On 02/07/2017 04:31 PM, Cyrille Pitchen wrote:
>> Hi Brian,
>>
>> this is the spi-nor PR for 4.11. There are few new controller drivers and
>> support to some memory parts. Otherwise about the spi-nor framework itself,
>> the main update is the support of the 4-byte address instruction set, which
>> is stateless, as opposed to the 4-byte address mode, which is stateful hence
>> creates issues with some bootloaders when spurious reboot occurs.
>>
>> Best regards,
>>
>> Cyrille
>>
>> The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:
>>
>>   Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)
>>
>> are available in the git repository at:
>>
>>   git://github.com/spi-nor/linux.git tags/spi-nor/for-4.11
>>
>> for you to fetch changes up to dc12bcccadafb5441170e6b7c8a438c91d4f385b:
>>
>>   mtd: spi-nor: cqspi: remove redundant dead code on error return check (2017-02-02 10:42:36 +0100)
>>
>> ----------------------------------------------------------------
>> This pull request contains the following notable changes:
>> - add support to the 4-byte address instruction set.
>> - add support to new memory parts.
>> - add support to S3AN memories.
>> - add support to the Intel SPI controller.
>> - add support to the Aspeed AST2400 and AST2550 controllers.
>> - fix max SPI transfer and message sizes in m25p80_read().
>> - fix the Candence QSPI driver.
>> - fix the Freescale QSPI driver.
>>
>> ----------------------------------------------------------------
>> Colin Ian King (1):
>>       mtd: spi-nor: cqspi: remove redundant dead code on error return check
>>
>> Cyrille Pitchen (5):
>>       mtd: spi-nor: improve macronix_quad_enable()
>>       mtd: spi-nor: remove WARN_ONCE() message in spi_nor_write()
>>       mtd: spi-nor: rename SPINOR_OP_* macros of the 4-byte address op codes
>>       mtd: spi-nor: add a stateless method to support memory size above 128Mib
>>       Merge tag 'ib-mfd-mtd-v4.11' of git://git.kernel.org/.../lee/mfd
>>
>> Cédric Le Goater (4):
>>       mtd: spi-nor: add memory controllers for the Aspeed AST2500 SoC
>>       mtd: aspeed: add memory controllers for the Aspeed AST2400 SoC
>>       mtd: spi-nor: bindings for the Aspeed memory controllers
>>       mtd: aspeed: fix compile warning in aspeed_smc_read_from_ahb()
>>
>> Guochun Mao (1):
>>       Documentation: mtk-quadspi: update DT bindings
>>
>> Heiner Kallweit (1):
>>       mtd: m25p80: consider max message size in m25p80_read
> 
> I cannot say I'm super-happy about this particular patch, still ...
> 
W/o it at least the fsl-espi driver is broken for transfers >= 64kB.

>> Kamal Dasu (1):
>>       mtd: spi-nor: Add support for gd25q16
>>
>> Marek Vasut (1):
>>       mtd: spi-nor: cqspi: Fix build on arches missing readsl/writesl
>>
>> Mika Westerberg (3):
>>       spi-nor: Add support for Intel SPI serial flash controller
>>       mfd: lpc_ich: Add support for SPI serial flash host controller
>>       mfd: lpc_ich: Add support for Intel Apollo Lake SoC
>>
>> Ricardo Ribalda Delgado (2):
>>       mtd: spi-nor: Add support for S3AN spi-nor devices
>>       mtd: spi-nor: Fix S3AN addressing calculation
>>
>> Uwe Kleine-König (1):
>>       mtd: spi-nor: add dt support for Everspin MRAMs
>>
>> Victor Shyba (1):
>>       mtd: spi-nor: Add lock/unlock support for f25l32pa
>>
>> Yunhui Cui (2):
>>       mtd:fsl-quadspi:use the property fields of SPI-NOR
>>       mtd: fsl-quadspi: Rename SEQID_QUAD_READ to SEQID_READ
>>
>>  Documentation/devicetree/bindings/mtd/aspeed-smc.txt    |  51 +++++
>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt |   2 +
>>  Documentation/devicetree/bindings/mtd/mtk-quadspi.txt   |   8 +-
>>  Documentation/mtd/intel-spi.txt                         |  88 +++++++++
>>  drivers/mfd/lpc_ich.c                                   | 131 +++++++++++++
>>  drivers/mtd/devices/m25p80.c                            |   9 +-
>>  drivers/mtd/devices/serial_flash_cmds.h                 |   7 -
>>  drivers/mtd/devices/st_spi_fsm.c                        |  28 +--
>>  drivers/mtd/spi-nor/Kconfig                             |  32 +++-
>>  drivers/mtd/spi-nor/Makefile                            |   3 +
>>  drivers/mtd/spi-nor/aspeed-smc.c                        | 758 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/mtd/spi-nor/cadence-quadspi.c                   |  10 +-
>>  drivers/mtd/spi-nor/fsl-quadspi.c                       |  48 ++---
>>  drivers/mtd/spi-nor/intel-spi-platform.c                |  57 ++++++
>>  drivers/mtd/spi-nor/intel-spi.c                         | 777 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/mtd/spi-nor/intel-spi.h                         |  24 +++
>>  drivers/mtd/spi-nor/spi-nor.c                           | 271 ++++++++++++++++++++++++---
>>  drivers/spi/spi-bcm-qspi.c                              |   6 +-
>>  include/linux/mfd/lpc_ich.h                             |   3 +
>>  include/linux/mtd/spi-nor.h                             |  34 +++-
>>  include/linux/platform_data/intel-spi.h                 |  31 +++
>>  21 files changed, 2278 insertions(+), 100 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
>>  create mode 100644 Documentation/mtd/intel-spi.txt
>>  create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
>>  create mode 100644 drivers/mtd/spi-nor/intel-spi-platform.c
>>  create mode 100644 drivers/mtd/spi-nor/intel-spi.c
>>  create mode 100644 drivers/mtd/spi-nor/intel-spi.h
>>  create mode 100644 include/linux/platform_data/intel-spi.h
>>
> 
> 
