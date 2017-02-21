Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5dr-0007Of-V7
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 08:17:49 +0000
Received: by mail-lf0-x22f.google.com with SMTP id l12so22986244lfe.0
 for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2017 00:17:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2ad6a42c-598d-b1e9-8487-63dbeae5e0bb@nod.at>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
 <1487664010-25926-11-git-send-email-peterpandong@micron.com>
 <2ad6a42c-598d-b1e9-8487-63dbeae5e0bb@nod.at>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Tue, 21 Feb 2017 16:17:25 +0800
Message-ID: <CAAyFORJVjcEWP0s8FMiTU+pDp5BP3RN9VjjciEQ4seUNRmp4yg@mail.gmail.com>
Subject: Re: [PATCH 10/11] nand: spi: Add generic SPI controller support
To: Richard Weinberger <richard@nod.at>
Cc: Peter Pan <peterpandong@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
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

Hi Richard,


On Tue, Feb 21, 2017 at 4:03 PM, Richard Weinberger <richard@nod.at> wrote:
> Peter,
>
> Am 21.02.2017 um 09:00 schrieb Peter Pan:
>> This commit supports to use generic spi controller
>> as SPI NAND controller.
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>
> ...
>
>> +static void spi_nand_mt29f_ecc_status(struct spi_nand_chip *chip,
>> +                                     unsigned int status,
>> +                                     unsigned int *corrected,
>> +                                     unsigned int *ecc_error)
>> +{
>> +     unsigned int ecc_status = status & SPI_NAND_MT29F_ECC_MASK;
>> +
>> +     *ecc_error = (ecc_status == SPI_NAND_MT29F_ECC_UNCORR);
>> +     switch (ecc_status) {
>> +     case SPI_NAND_MT29F_ECC_0_BIT:
>> +             *corrected = 0;
>> +             break;
>> +     case SPI_NAND_MT29F_ECC_1_3_BIT:
>> +             *corrected = 3;
>> +             break;
>> +     case SPI_NAND_MT29F_ECC_4_6_BIT:
>> +             *corrected = 6;
>> +             break;
>> +     case SPI_NAND_MT29F_ECC_7_8_BIT:
>> +             *corrected = 8;
>> +             break;
>> +     }
>> +}
>
> I'm confused. What value will the corrected value be when only 1 bit flipped and got corrected?

According to Micron data sheet, Micron MT29F SPI NAND series only
report 5 level ECC status:
     No errors
     1-3 bit errors detected and corrected
     4-6 bit errors detected and corrected. This indicates data
refreshment might be taken
     7-8 bit errors detected and corrected. This indicates data
refreshment must be taken to guarantee the data retention
     Bit errors greater than 8 bits detected and not corrected

So I report 3 when only 1 bit flipped.

Thanks,
Peter Pan
