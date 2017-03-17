Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cooie-0004He-MV
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 10:02:54 +0000
Received: by mail-wr0-x241.google.com with SMTP id l37so8890802wrc.3
 for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2017 03:02:28 -0700 (PDT)
Subject: Re: [PATCH v3 0/8] Introduction to SPI NAND framework
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 richard@nod.at, computersforpeace@gmail.com,
 thomas.petazzoni@free-electrons.com, linux-mtd@lists.infradead.org
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <da605583-7d98-186a-b42e-1417d8217cd1@gmail.com>
Date: Fri, 17 Mar 2017 11:02:23 +0100
MIME-Version: 1.0
In-Reply-To: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Do some test on MT29F1G01AAADD.
Finally, I don't have MT29F1G01AAADD spares
(Peter, If you have 1 or 2 MT29F1G01AAADD samples to send to me, I would 
be pleased).

MT29Fn1G01AAADD are little different. They have 64bytes oob and ecc 
layout is different. But all the rest should be the nearly same.
I did some change to support this device, and I'm now locked in the bad 
block scan, as for some reasons, the scan tries to read all pages from 
all blocks...

I will comment the different things I have seen in the various patches.

Arnaud

On 16/03/2017 07:47, Peter Pan wrote:
> First of all, thanks for Boris Brezillon, Arnaud Mouiche and
> Thomas Petazzoni. This v3 cannot come out without your valuable
> comments on v2.
>
> This series introductes a SPI NAND framework.
> SPI NAND is a new NAND family device with SPI protocol as
> its interface. And its command set is totally different
> with parallel NAND.
>
> Our first attempt was more than 2 years ago[1]. At that
> time, I didn't make BBT shareable and there were too many
> duplicate code with parallel NAND, so that serie stoped.
> But the discussion never stops. Now Boris has a plan to
> make a generic NAND framework which can be shared with
> both parallel and SPI NAND. Now the first step of the
> new generic NAND framework is finished. And it is waiting
> for a user. After discussion with Boris. We both think it's
> time to rebuild SPI NAND framework based on the new NAND
> framework and send out for reviewing.
>
> This series is based on Boris's nand/generic branch[2], which
> is on 4.11-rc1. In this serie, BBT code is totally shared.
> Of course SPI NAND can share more code with parallel, this
> requires to put more in new NAND core (now only BBT included).
> I'd like to send this serie out first, then we can decide
> which part should be in new NAND core.
>
> This series only supports basic SPI NAND features and uses
> generic spi controller for data transfer, on-die ECC for data
> correction. Support advanced features and specific SPI NAND
> controller with hardware ECC is the next step.
>
> This series is tested on Xilinx Zedboard with Micron
> MT29F2G01ABAGDSF SPI NAND chip.
>
>
> [1]http://lists.infradead.org/pipermail/linux-mtd/2015-January/057223.html
> [2]https://github.com/bbrezillon/linux-0day/tree/nand/generic
>
> v3 changes:
> - rebase patch on 4.11-rc1[1]
> - change read ID method. read 4 bytes ID out then let ->detect() of each
>    manufacutre driver to decode ID and detect the device.
> - make SPI NAND id table private to each manufacutre driver
> - fix coding style to make checkpatch.pl happy
> - update the MAINTAINERS file for spi nand code
> - add nand_size() helper in nand.h
> - use nand_for_each_page() helper in spinand_do_read/write_ops()
> - create helper to check boundaries in generic NAND code and use it
>    in SPI NAND core
> - rename spinand_base.c to core.c
> - manufactures' drivers expose spinand_manufacturer struct instead of
>    spinand_manufacturer_ops struct to keep Manufacture ID macro in
>    manufactures' drivers and rename spinand_ids.c to manufacture.c
> - rename spinand_micron.c to micron.c
> - rename chips/ directory to controllers/
> - rename generic_spi.c to generic-spi.c
> - replace ->build_column_addr() and ->get_dummy() hooks with ->prepare_op() in
>    spinand_manufacturer_ops struct
> - rename __spinand_erase() to spinand_erase()
> - rename spinand_erase() to spinand_erase_skip_bbt()
> - rename spinand_scan_ident() to spinand_detect()
> - rename spinand_scan_tail() to spinand_init()
> - move non detect related code from spinand_detect() to spinand_init()
> - remove spinand_fill_nandd, assign nand->ops in spinand_detect()
> - merge v2 patch 3(bad block support) and patch 4(BBT support)
> - drop getchip parameter, remove spinand_get/remove_device(), take the lock
>    by caller directly
> - fix function comment headers
> - use nand_bbt_is_initialized() helper
> - replace spinand_ecc_engine and spinand_controller object in spinand_device
>    struct with pointer
> - replace struct spinand_manufacturer_ops pointer in spinand_device struct
>    with spinand_manufacturer struct
>
>
> v2 changes:
> - replace "spi_nand" with "spinand".
> - rename spi nand related structs for better understanding.
> - introduce spi nand controller, manufacturer and ecc_engine struct.
> - add spi nand manufacturer initialization function refer to Boris's
>    manuf-init branch.
> - remove NAND_SKIP_BBTSCAN from series. Add it later when enabling HW ECC.
> - reorganize series according to Boris's suggestion.
>
> Peter Pan (8):
>    mtd: nand: add more helpers in nand.h
>    mtd: nand: add oob iterator in nand_for_each_page
>    nand: spi: add basic blocks for infrastructure
>    nand: spi: add basic operations support
>    nand: spi: Add bad block support
>    nand: spi: add Micron spi nand support
>    nand: spi: Add generic SPI controller support
>    MAINTAINERS: Add SPI NAND entry
>
>   MAINTAINERS                                    |    9 +
>   drivers/mtd/nand/Kconfig                       |    1 +
>   drivers/mtd/nand/Makefile                      |    1 +
>   drivers/mtd/nand/spi/Kconfig                   |    7 +
>   drivers/mtd/nand/spi/Makefile                  |    4 +
>   drivers/mtd/nand/spi/controllers/Kconfig       |    5 +
>   drivers/mtd/nand/spi/controllers/Makefile      |    1 +
>   drivers/mtd/nand/spi/controllers/generic-spi.c |  158 +++
>   drivers/mtd/nand/spi/core.c                    | 1456 ++++++++++++++++++++++++
>   drivers/mtd/nand/spi/manufactures.c            |   27 +
>   drivers/mtd/nand/spi/micron.c                  |  243 ++++
>   include/linux/mtd/nand.h                       |   87 +-
>   include/linux/mtd/spinand.h                    |  285 +++++
>   13 files changed, 2281 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/mtd/nand/spi/Kconfig
>   create mode 100644 drivers/mtd/nand/spi/Makefile
>   create mode 100644 drivers/mtd/nand/spi/controllers/Kconfig
>   create mode 100644 drivers/mtd/nand/spi/controllers/Makefile
>   create mode 100644 drivers/mtd/nand/spi/controllers/generic-spi.c
>   create mode 100644 drivers/mtd/nand/spi/core.c
>   create mode 100644 drivers/mtd/nand/spi/manufactures.c
>   create mode 100644 drivers/mtd/nand/spi/micron.c
>   create mode 100644 include/linux/mtd/spinand.h
>
