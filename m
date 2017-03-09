Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clnPN-0002Yw-Ld
 for linux-mtd@lists.infradead.org; Thu, 09 Mar 2017 02:02:27 +0000
Received: by mail-lf0-x243.google.com with SMTP id y193so3573495lfd.1
 for <linux-mtd@lists.infradead.org>; Wed, 08 Mar 2017 18:02:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170308094425.694c5e07@bbrezillon>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-7-git-send-email-peterpandong@micron.com>
 <20170308094425.694c5e07@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Thu, 9 Mar 2017 10:02:03 +0800
Message-ID: <CAAyFORLpv7QoBDz5MQ8g98MEVsKrnN3fnoB-7s1XaEttFkOXHw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] nand: spi: Add generic SPI controller support
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

On Wed, Mar 8, 2017 at 4:44 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Wed, 1 Mar 2017 16:52:10 +0800
> Peter Pan <peterpandong@micron.com> wrote:
>
>> This commit supports to use generic spi controller
>> as spi nand controller.
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  drivers/mtd/nand/spi/Kconfig             |   2 +
>>  drivers/mtd/nand/spi/Makefile            |   1 +
>>  drivers/mtd/nand/spi/chips/Kconfig       |   5 +
>>  drivers/mtd/nand/spi/chips/Makefile      |   1 +
>>  drivers/mtd/nand/spi/chips/generic_spi.c | 158 +++++++++++++++++++++++++++++++
>
> Hm, I would name the directory controllers and not chips. What could go
> into chips are all the vendor specific drivers.

You are right. Should be controllers. Fix this in v3

>
>>  5 files changed, 167 insertions(+)
>>  create mode 100644 drivers/mtd/nand/spi/chips/Kconfig
>>  create mode 100644 drivers/mtd/nand/spi/chips/Makefile
>>  create mode 100644 drivers/mtd/nand/spi/chips/generic_spi.c
>
> Just controllers/generic.c?

generic.c or just spi.c?

Thanks,
Peter Pan
