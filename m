Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cm1Zz-0001vI-Dj
 for linux-mtd@lists.infradead.org; Thu, 09 Mar 2017 17:10:21 +0000
Received: by mail-wr0-x244.google.com with SMTP id u48so8721600wrc.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2017 09:09:58 -0800 (PST)
Subject: Re: [PATCH v2 2/6] nand: spi: add basic operations support
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Peter Pan <peterpansjtu@gmail.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-3-git-send-email-peterpandong@micron.com>
 <20170307185740.327ed9d0@bbrezillon>
 <CAAyFOR+vSOSGH_XoZt5Tr5h1fetFUvkMFKGo-iG68obP9eNujg@mail.gmail.com>
 <20170309070213.3eaaa44e@bbrezillon>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <ff44417c-303b-576a-d2df-2870b8e67ecb@gmail.com>
Date: Thu, 9 Mar 2017 18:09:54 +0100
MIME-Version: 1.0
In-Reply-To: <20170309070213.3eaaa44e@bbrezillon>
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



On 09/03/2017 07:02, Boris Brezillon wrote:
> [...]
>>>   
>>>> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
>>>> index f3d0351..ee447c1 100644
>>>> --- a/include/linux/mtd/spinand.h
>>>> +++ b/include/linux/mtd/spinand.h
>>>> @@ -135,6 +135,8 @@ struct spinand_manufacturer_ops {
>>>>        bool(*detect)(struct spinand_device *chip);
>>>>        int (*init)(struct spinand_device *chip);
>>>>        void (*cleanup)(struct spinand_device *chip);
>>>> +     void (*build_column_addr)(struct spinand_device *chip,
>>>> +                               struct spinand_op *op, u32 page, u32 column);
>>> Okay, I think Arnaud was right, maybe we should have vendor specific
>>> ops for basic operations like ->prepare_read/write_op(), instead of
>>> having these ->get_dummy() and ->build_column_addr() hooks.
>>> Or maybe just a ->prepare_op() hook that can prepare things for any
>>> basic operation (read, write, ...).
>> I prefer ->prepare_read_op() and ->prepare_write_op. Fix this in v3
> I'd like to have Arnaud's feedback on this. Can you wait a bit before
> sending a new version?

->prepare_read_op() and ->prepare_write_op
looks fine to me.

FYI: I have prepared a imx6sl board which can run vanilla mtd/master kernels.
On this board, I can swap the various spinand samples I have:
- Micron (the one supported by those patches)
- winbond
- macronix
- ESMT

Looking forward to test v3 ;)
Arnaud
