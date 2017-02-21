Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg6Ye-0002p9-RT
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 09:16:33 +0000
Received: by mail-lf0-x243.google.com with SMTP id z127so8571511lfa.2
 for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2017 01:16:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170221094444.68b006c1@bbrezillon>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
 <1487664010-25926-2-git-send-email-peterpandong@micron.com>
 <20170221094444.68b006c1@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Tue, 21 Feb 2017 17:16:06 +0800
Message-ID: <CAAyFOR+a2TW8PVMxGi3iQAsztDYs1t=0uPzoXQory=c2EG5ERw@mail.gmail.com>
Subject: Re: [PATCH 01/11] nand: Add SPI NAND cmd set and register definition
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Tue, Feb 21, 2017 at 4:44 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 21 Feb 2017 16:00:00 +0800
> Peter Pan <peterpandong@micron.com> wrote:
>
>> This commit adds SPI NAND command set and register
>> definition according Micron SPI NAND data sheet.
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  include/linux/mtd/spi-nand.h | 112 +++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 112 insertions(+)
>>  create mode 100644 include/linux/mtd/spi-nand.h
>>
>> diff --git a/include/linux/mtd/spi-nand.h b/include/linux/mtd/spi-nand.h
>> new file mode 100644
>> index 0000000..68442e08
>> --- /dev/null
>> +++ b/include/linux/mtd/spi-nand.h
>> @@ -0,0 +1,112 @@
>> +/**
>> +* spi-nand.h
>> +*
>> +* Copyright (c) 2009-2017 Micron Technology, Inc.
>> +*
>> +* This program is free software; you can redistribute it and/or
>> +* modify it under the terms of the GNU General Public License
>> +* as published by the Free Software Foundation; either version 2
>> +* of the License, or (at your option) any later version.
>> +*
>> +* This program is distributed in the hope that it will be useful,
>> +* but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +* GNU General Public License for more details.
>> +*/
>> +#ifndef __LINUX_MTD_SPI_NAND_H
>> +#define __LINUX_MTD_SPI_NAND_H
>> +
>> +/*
>> + * Standard SPI-NAND flash commands
>> + */
>> +#define SPINAND_CMD_RESET                    0xff
>> +#define SPINAND_CMD_GET_FEATURE                      0x0f
>> +#define SPINAND_CMD_SET_FEATURE                      0x1f
>> +#define SPINAND_CMD_PAGE_READ                        0x13
>> +#define SPINAND_CMD_READ_PAGE_CACHE_RDM              0x30
>> +#define SPINAND_CMD_READ_PAGE_CACHE_LAST     0x3f
>> +#define SPINAND_CMD_READ_FROM_CACHE          0x03
>> +#define SPINAND_CMD_READ_FROM_CACHE_FAST     0x0b
>> +#define SPINAND_CMD_READ_FROM_CACHE_X2               0x3b
>> +#define SPINAND_CMD_READ_FROM_CACHE_DUAL_IO  0xbb
>> +#define SPINAND_CMD_READ_FROM_CACHE_X4               0x6b
>> +#define SPINAND_CMD_READ_FROM_CACHE_QUAD_IO  0xeb
>> +#define SPINAND_CMD_BLK_ERASE                        0xd8
>> +#define SPINAND_CMD_PROG_EXC                 0x10
>> +#define SPINAND_CMD_PROG_LOAD                        0x02
>> +#define SPINAND_CMD_PROG_LOAD_RDM_DATA               0x84
>> +#define SPINAND_CMD_PROG_LOAD_X4             0x32
>> +#define SPINAND_CMD_PROG_LOAD_RDM_DATA_X4    0x34
>> +#define SPINAND_CMD_READ_ID                  0x9f
>> +#define SPINAND_CMD_WR_DISABLE                       0x04
>> +#define SPINAND_CMD_WR_ENABLE                        0x06
>> +#define SPINAND_CMD_END                              0x0
>> +
>> +
>> +/* feature registers */
>> +#define REG_BLOCK_LOCK               0xa0
>> +#define REG_CFG                      0xb0
>> +#define REG_STATUS           0xc0
>> +#define REG_DIE_SELECT               0xd0
>> +
>> +/* status */
>> +#define STATUS_OIP_MASK              0x01
>> +#define STATUS_CRBSY_MASK    0x80
>> +#define STATUS_READY         (0 << 0)
>> +#define STATUS_BUSY          (1 << 0)
>> +
>> +#define STATUS_E_FAIL_MASK   0x04
>> +#define STATUS_E_FAIL                (1 << 2)
>> +
>> +#define STATUS_P_FAIL_MASK   0x08
>> +#define STATUS_P_FAIL                (1 << 3)
>> +
>> +
>> +/*Configuration register defines*/
>> +#define CFG_QE_MASK          0x01
>> +#define CFG_QE_ENABLE                0x01
>> +#define CFG_ECC_MASK         0x10
>> +#define CFG_ECC_ENABLE               0x10
>> +#define CFG_LOT_MASK         0x20
>> +#define CFG_LOT_ENABLE               0x20
>> +#define CFG_OTP_MASK         0xc2
>> +#define CFG_OTP_ENTER                0x40
>> +#define CFG_OTP_EXIT         0x00
>> +
>> +/* block lock */
>> +#define BL_ALL_LOCKED                0x7c
>> +#define BL_U_1_1024_LOCKED           0x08
>> +#define BL_U_1_512_LOCKED            0x10
>> +#define BL_U_1_256_LOCKED            0x18
>> +#define BL_U_1_128_LOCKED            0x20
>> +#define BL_U_1_64_LOCKED             0x28
>> +#define BL_U_1_32_LOCKED             0x30
>> +#define BL_U_1_16_LOCKED             0x38
>> +#define BL_U_1_8_LOCKED              0x40
>> +#define BL_U_1_4_LOCKED              0x48
>> +#define BL_U_1_2_LOCKED              0x50
>> +#define BL_L_1_1024_LOCKED           0x0c
>> +#define BL_L_1_512_LOCKED            0x14
>> +#define BL_L_1_256_LOCKED            0x1c
>> +#define BL_L_1_128_LOCKED            0x24
>> +#define BL_L_1_64_LOCKED             0x2c
>> +#define BL_L_1_32_LOCKED             0x34
>> +#define BL_L_1_16_LOCKED             0x3c
>> +#define BL_L_1_8_LOCKED              0x44
>> +#define BL_L_1_4_LOCKED              0x4c
>> +#define BL_L_1_2_LOCKED              0x54
>> +#define BL_ALL_UNLOCKED              0X00
>> +
>> +/* die select */
>> +#define DIE_SELECT_MASK              0x40
>> +#define DIE_SELECT_DS0               0x00
>> +#define DIE_SELECT_DS1               0x40
>> +
>> +#define SPI_NAND_MT29F_ECC_MASK              0x70
>> +#define SPI_NAND_MT29F_ECC_0_BIT     0x00
>> +#define SPI_NAND_MT29F_ECC_1_3_BIT   0x10
>> +#define SPI_NAND_MT29F_ECC_4_6_BIT   0x30
>> +#define SPI_NAND_MT29F_ECC_7_8_BIT   0x50
>> +#define SPI_NAND_MT29F_ECC_UNCORR    0x20
>
> These are manufacturer specific definitions, and I don't think they
> should be exposed in the generic header.

Totally agree. Fix this in v2

Thanks,
Peter Pan
