Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cop2G-0002Ts-Uk
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 10:23:06 +0000
Received: by mail-lf0-x234.google.com with SMTP id y193so31173079lfd.3
 for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2017 03:22:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <43bedbd0-0a0c-e30d-2158-fcf7c936480d@gmail.com>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-4-git-send-email-peterpandong@micron.com>
 <43bedbd0-0a0c-e30d-2158-fcf7c936480d@gmail.com>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Fri, 17 Mar 2017 18:22:42 +0800
Message-ID: <CAAyFORKVzMC9N9GMO0Ryh161mF9HoqVkgVKwDqc2FY9o+3d_KQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] nand: spi: add basic blocks for infrastructure
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
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

Hi Arnaud,

On Fri, Mar 17, 2017 at 6:20 PM, Arnaud Mouiche
<arnaud.mouiche@gmail.com> wrote:
> [...]
>>
>> +/*
>> + * spinand_detect - [SPI NAND Interface] detect the SPI NAND device
>> + * @chip: SPI NAND device structure
>> + */
>> +int spinand_detect(struct spinand_device *chip)
>> +{
>> +       struct nand_device *nand = &chip->base;
>> +       u8 raw_id[SPINAND_MAX_ID_LEN] = {0};
>> +       u8 id[SPINAND_MAX_ID_LEN] = {0};
>> +       int ret;
>> +
>> +       spinand_reset(chip);
>> +       spinand_read_id(chip, raw_id);
>> +       ret = spinand_manufacturer_detect(chip, raw_id, id);
>> +       if (ret)
>
>
> Would be great to return an error or warning message when the raw_id doesn't
> match any known manufacturer, or when the manufacturer doesn't know about
> this device.
> something like:
>
>     pr_err("SPI NAND: unknown raw ID %*phN\n", SPINAND_MAX_ID_LEN, raw_id);
>

Yes, you are right. I missed this part! I will add it in v4

Thanks
Peter Pan
