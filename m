Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coki6-0005Xt-CQ
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 05:46:00 +0000
Received: by mail-lf0-x22f.google.com with SMTP id y193so28761996lfd.3
 for <linux-mtd@lists.infradead.org>; Thu, 16 Mar 2017 22:45:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170316105533.343e183a@bbrezillon>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-4-git-send-email-peterpandong@micron.com>
 <20170316105533.343e183a@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Fri, 17 Mar 2017 13:45:34 +0800
Message-ID: <CAAyFORJuLL-Hd4YnRNrAjXQqF3ufO5z8kL_+qcn=c-wq8WFX0g@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] nand: spi: add basic blocks for infrastructure
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Arnaud Mouiche <arnaud.mouiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-mtd@lists.infradead.org,
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

On Thu, Mar 16, 2017 at 5:55 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Thu, 16 Mar 2017 14:47:32 +0800
> Peter Pan <peterpandong@micron.com> wrote:
>
>> +
>> +#define SPINAND_CAP_RD_X1 BIT(0)
>> +#define SPINAND_CAP_RD_X2 BIT(1)
>> +#define SPINAND_CAP_RD_X4 BIT(2)
>> +#define SPINAND_CAP_RD_DUAL BIT(3)
>> +#define SPINAND_CAP_RD_QUAD BIT(4)
>> +#define SPINAND_CAP_WR_X1 BIT(5)
>> +#define SPINAND_CAP_WR_X2 BIT(6)
>> +#define SPINAND_CAP_WR_X4 BIT(7)
>> +#define SPINAND_CAP_WR_DUAL BIT(8)
>> +#define SPINAND_CAP_WR_QUAD BIT(9)
>> +#define SPINAND_CAP_HW_ECC BIT(10)
>
> Empty line please.

Fix this in v4

>
>> +struct spinand_controller {
>> +     struct spinand_controller_ops *ops;
>> +     u32 caps;
>> +     void *priv;
>
> Nope, the ->priv field is a per-device private data, so it should be
> placed in struct spinand_device (see below), otherwise, if you have the
> same controller connected to 2 different chips, each time you call
> spinand_set_controller_data() you will overwrite the ->priv value.
>
> Each spinand_controller should then inherit from struct
> spinand_controller:
>
> struct my_spinand_controller {
>         struct spinand_controller base;
>
>         /* put your SPI NAND controller specific fields here. */
> };

Yes, you are right Boris, I wasn't think so deeply. I will fix this in v4

Thanks
Peter Pan
