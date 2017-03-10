Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cm9p1-00069R-D3
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 01:58:25 +0000
Received: by mail-lf0-x241.google.com with SMTP id r36so5847827lfi.0
 for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2017 17:58:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ff44417c-303b-576a-d2df-2870b8e67ecb@gmail.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-3-git-send-email-peterpandong@micron.com>
 <20170307185740.327ed9d0@bbrezillon>
 <CAAyFOR+vSOSGH_XoZt5Tr5h1fetFUvkMFKGo-iG68obP9eNujg@mail.gmail.com>
 <20170309070213.3eaaa44e@bbrezillon>
 <ff44417c-303b-576a-d2df-2870b8e67ecb@gmail.com>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Fri, 10 Mar 2017 09:58:00 +0800
Message-ID: <CAAyFORKO3ZRXORiTKjBEnmBx4NCbnQa5dKdM7ANg8tvX92NEYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] nand: spi: add basic operations support
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
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

On Fri, Mar 10, 2017 at 1:09 AM, Arnaud Mouiche
<arnaud.mouiche@gmail.com> wrote:
>
>
> On 09/03/2017 07:02, Boris Brezillon wrote:
>>
>> [...]
>>>>
>>>>
>>>>>
>>>>> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
>>>>> index f3d0351..ee447c1 100644
>>>>> --- a/include/linux/mtd/spinand.h
>>>>> +++ b/include/linux/mtd/spinand.h
>>>>> @@ -135,6 +135,8 @@ struct spinand_manufacturer_ops {
>>>>>        bool(*detect)(struct spinand_device *chip);
>>>>>        int (*init)(struct spinand_device *chip);
>>>>>        void (*cleanup)(struct spinand_device *chip);
>>>>> +     void (*build_column_addr)(struct spinand_device *chip,
>>>>> +                               struct spinand_op *op, u32 page, u32
>>>>> column);
>>>>
>>>> Okay, I think Arnaud was right, maybe we should have vendor specific
>>>> ops for basic operations like ->prepare_read/write_op(), instead of
>>>> having these ->get_dummy() and ->build_column_addr() hooks.
>>>> Or maybe just a ->prepare_op() hook that can prepare things for any
>>>> basic operation (read, write, ...).
>>>
>>> I prefer ->prepare_read_op() and ->prepare_write_op. Fix this in v3
>>
>> I'd like to have Arnaud's feedback on this. Can you wait a bit before
>> sending a new version?
>
>
> ->prepare_read_op() and ->prepare_write_op
> looks fine to me.

Arnaud and Boris,

For prepare_read/write_op, should we put common code in
spinand_read_from_cache(), spinand_program_data_to_cache() of spinandbase.c
and then prepare_read/write_op hook just do some fixing ? Code likes this:
      static int spinand_read_from_cache(struct spinand_device *chip,
                  u32 page_addr, u32 column, size_t len, u8 *rbuf)
     {
           struct spinand_op cmd;

           spinand_op_init(&cmd);
           cmd.cmd = chip->read_cache_op;
           cmd.n_addr = 2;
           cmd.addr[0] = (u8)(column >> 8);
           cmd.addr[1] = (u8)column;
           cmd.addr_nbits = spinand_get_address_bits(chip->read_cache_op);
           cmd.n_rx = len;
           cmd.rx_buf = rbuf;
           cmd.data_nbits = spinand_get_data_bits(chip->read_cache_op);
           if (chip->manufacturer.manu->ops->prepare_op)
                  chip->manufacturer.manu->ops->prepare_op(chip, &cmd,

      page_addr, column);

          return spinand_exec_cmd(chip, &cmd);
    }


>
> FYI: I have prepared a imx6sl board which can run vanilla mtd/master
> kernels.
> On this board, I can swap the various spinand samples I have:
> - Micron (the one supported by those patches)
> - winbond
> - macronix
> - ESMT
>
> Looking forward to test v3 ;)

Arnaud,

Thanks for your help in advance!


> Arnaud
>
