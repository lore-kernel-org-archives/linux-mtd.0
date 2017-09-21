Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1duvDo-00077E-K6
 for linux-mtd@lists.infradead.org; Thu, 21 Sep 2017 06:44:30 +0000
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 kernel@pengutronix.de
From: Oleksij Rempel <ore@pengutronix.de>
Subject: nand: denali: issue with 4.13
Message-ID: <25edd455-ad6c-f222-f552-2aa3d807112a@pengutronix.de>
Date: Thu, 21 Sep 2017 08:44:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Masahiro,

you are probably the expert of denali nand driver.
With kernel v4.13 i have following issue, it works on FPGASoC 
5CSEBA5U... but is now working on FPGASoC 5CSXFC6C6U... both of them 
have same NAND chip, and seems to have similar IP core.

FPGASoC 5CSXFC6C6U...:
====================================================================
[    0.095899] console [ttyS0] disabled
[    0.095941] ffc02000.serial0: ttyS0 at MMIO 0xffc02000 (irq = 38,
base_baud = 6250000) is a 16550A
[    0.702041] console [ttyS0] enabled
[    0.706986] brd: module loaded
[    0.716232] loop: module loaded
[    0.720074] nand: device found, Manufacturer ID: 0x00, Chip ID: 0x2c
[    0.726404] nand: Unknown denali-nand
[    0.730077] nand: bus width 8 instead of 16 bits
[    0.734673] nand: No NAND device found
[    0.738465] denali-nand-dt: probe of ff900000.nand failed with error
-22
[    0.745458] cadence-qspi ff705000.spi: n25q256a (32768 Kbytes)

FPGASoC 5CSEBA5U... :
====================================================================
[    0.711498] console [ttyS0] enabled
[    0.716657] brd: module loaded
[    0.726372] loop: module loaded
[    0.732726] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x38
[    0.739059] nand: Micron MT29F8G08ABABAWP
[    0.743233] nand: 1024 MiB, SLC, erase size: 512 KiB, page size:
4096, OOB size: 224
[    0.753583] Bad block table found at page 262016, version 0x05
[    0.761743] Bad block table found at page 261888, version 0x05
[    0.769900] nand_read_bbt: bad block at 0x000000000000
[    0.775045] nand_read_bbt: bad block at 0x000000080000
[    0.780185] nand_read_bbt: bad block at 0x000000100000
[    0.785301] nand_read_bbt: bad block at 0x000000180000
[    0.790706] 1 ofpart partitions found on MTD device denali-nand
[    0.796602] Creating 1 MTD partitions on "denali-nand":
[    0.801827] 0x000000000000-0x000040000000 : "root"
[    0.808657] cadence-qspi ff705000.spi: n25q256a (32768 Kbytes)
[    0.814704] 13 ofpart partitions found on MTD device ff705000.spi.0
[    0.820966] Creating 13 MTD partitions on "ff705000.spi.0":
[    0.826521] 0x000000000000-0x000000010000 : "prebootloader0"
[    0.832580] 0x000000010000-0x000000020000 : "prebootloader1"
[    0.838567] 0x000000020000-0x000000030000 : "prebootloader2"
[    0.844602] 0x000000030000-0x000000040000 : "prebootloader3"
[    0.850638] 0x000000040000-0x0000000c0000 : "barebox0"
[    0.856085] 0x0000000c0000-0x000000140000 : "barebox1"
[    0.861532] 0x000000140000-0x000000150000 : "barebox_env"
[    0.867215] 0x000000150000-0x000000170000 : "barebox_state"
[    0.873127] 0x000000170000-0x000000190000 : "barebox_fallback"
[    0.879240] 0x000000190000-0x000000f90000 : "fallback_sys"
[    0.885044] 0x000000f90000-0x000001010000 : "io_rbf0"
[    0.890470] 0x000001010000-0x000001090000 : "io_rbf1"
[    0.895811] 0x000001090000-0x000002000000 : "data"
[    0.901254] libphy: Fixed MDIO Bus: probed
[    0.905808] CAN device driver interface


Initially both of SoCs worked with this patch:
commit 9a10df06caeecf39ceb32193c41a3b42c4b7cac3
Author: Graham Moore <grmoore@altera.com>
Date:   Mon Oct 28 11:01:37 2013 -0500

     FogBugz #163905: Support Denali NAND driver on socfpga platform


At least part of this patch is upstreamed. Are there any other pending, 
WIP patches on the way? Any of them covering this issue?

Thank you for work!
Kind regards,
Oleksij
