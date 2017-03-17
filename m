Received: from mail-lf0-f67.google.com ([209.85.215.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coplh-0001EW-SG
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 11:10:04 +0000
Received: by mail-lf0-f67.google.com with SMTP id v2so5274577lfi.2
 for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2017 04:09:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170317120237.716e5ae1@bbrezillon>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-5-git-send-email-peterpandong@micron.com>
 <66c56e27-56e1-1352-6804-4e1e402b4d1a@gmail.com>
 <CAAyFORJVOhG+3QiDkPD=ezXzOzg-Sh5sh1x-7NgLJcuWrVLQpQ@mail.gmail.com>
 <20170317120237.716e5ae1@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Fri, 17 Mar 2017 19:09:38 +0800
Message-ID: <CAAyFORJTb3carTggc0TP4ar6SU5Uw6Fm6WNYA0cYVrVQxyynvQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] nand: spi: add basic operations support
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Arnaud Mouiche <arnaud.mouiche@gmail.com>,
 Peter Pan <peterpandong@micron.com>,
 Richard Weinberger <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
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

On Fri, Mar 17, 2017 at 7:02 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri, 17 Mar 2017 18:49:08 +0800
> Peter Pan <peterpansjtu@gmail.com> wrote:
>
>> Hi Arnaud,
>>
>> On Fri, Mar 17, 2017 at 6:33 PM, Arnaud Mouiche
>> <arnaud.mouiche@gmail.com> wrote:
>> >
>> >
>> > On 16/03/2017 07:47, Peter Pan wrote:
>> >>
>> >> [...]
>> >>
>> >> +
>> >> +/*
>> >> + * spinand_read_pages - read data from device to buffer
>> >> + * @mtd: MTD device structure
>> >> + * @from: offset to read from
>> >> + * @ops: oob operations description structure
>> >> + * @max_bitflips: maximum bitflip count
>> >> + */
>> >> +static int spinand_read_pages(struct mtd_info *mtd, loff_t from,
>> >> +                             struct mtd_oob_ops *ops,
>> >> +                             unsigned int *max_bitflips)
>> >> +{
>> >> +       struct spinand_device *chip = mtd_to_spinand(mtd);
>> >> +       struct nand_device *nand = mtd_to_nand(mtd);
>> >> +       int size, ret;
>> >> +       unsigned int corrected = 0;
>> >> +       bool ecc_off = ops->mode == MTD_OPS_RAW;
>> >> +       int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
>> >> +                    mtd->oobavail : mtd->oobsize;
>> >> +       bool oob_only = !ops->datbuf;
>> >> +       struct nand_page_iter iter;
>> >> +
>> >> +       ops->retlen = 0;
>> >> +       ops->oobretlen = 0;
>> >> +       *max_bitflips = 0;
>> >> +
>> >
>> >
>> > I'm stuck in a infinite bad block scan on the very first nand bad block mark
>> > read attempt.
>> > Indeed, here I'm in the first page read attempt of scan_block_fast() where
>> > scan_block_fast() fills "struct mtd_oob_ops ops" the following way
>> >     struct mtd_oob_ops ops;
>> >
>> >     ops.ooblen = nand_per_page_oobsize(this);   <= 64
>> >     ops.oobbuf = buf;
>> >     ops.ooboffs = 0;
>> >     ops.datbuf = NULL;
>> >     ops.mode = MTD_OPS_PLACE_OOB;
>> >
>> > It just forget to also set ops.len which is left to its uninitialized value,
>> > and is equal to 0xFFFFFFFF in my case.
>> > Since we only try to read from oob, obviously retlen is never increased, and
>> > we never except the loop.
>> > But more obviously, either ops.len should have been set to zero somewhere
>> > because we only read oob, either nand_for_each_page() should take in count
>> > this fact.
>>
>> Yes, you are right. I added some code to assign ops->len to 0 when ops->datbuf
>> is NULL. It is lost somehow...  Thanks for your quick debug.
>> I'm still thinking whether the caller should guarantee ops->len is 0
>> when reading
>> oob only or core.c guarantee it. What's your opinion Boris and Arnaud?
>
> Hm, we could add something to the core to check the mtd op consistency,
> but, in any case, we should probably fix the nand-bbt code to
> initialize the ops object to 0:
>
>         struct mtd_oob_ops ops = { };

I will fix the bbt code in v4 if you like. Add warning message in core.c?

Peter Pan
