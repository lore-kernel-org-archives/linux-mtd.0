Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clnMu-0000bw-Ru
 for linux-mtd@lists.infradead.org; Thu, 09 Mar 2017 01:59:55 +0000
Received: by mail-lf0-x233.google.com with SMTP id j90so22199137lfk.2
 for <linux-mtd@lists.infradead.org>; Wed, 08 Mar 2017 17:59:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170308093239.67235da9@bbrezillon>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-6-git-send-email-peterpandong@micron.com>
 <20170308093239.67235da9@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Thu, 9 Mar 2017 09:59:29 +0800
Message-ID: <CAAyFOR+SO6u1vmzLaB7VPR=H5pX1XFEhBDxm2yGZkDHqXmuQAw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] nand: spi: add Micron spi nand support
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

On Wed, Mar 8, 2017 at 4:32 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Wed, 1 Mar 2017 16:52:09 +0800
> Peter Pan <peterpandong@micron.com> wrote:
>
>> This commit is to add support for Micron MT29F2G01ABAGD
>> spi nand chip.
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  drivers/mtd/nand/spi/Makefile         |   1 +
>>  drivers/mtd/nand/spi/spinand_ids.c    |   5 ++
>>  drivers/mtd/nand/spi/spinand_micron.c | 133 ++++++++++++++++++++++++++++++++++
>
> micron.c should be enough.

Noted. Fix this in v3

Thanks
Peter Pan
