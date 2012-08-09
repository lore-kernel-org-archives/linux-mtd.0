Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzU9J-0006yS-TO
 for linux-mtd@lists.infradead.org; Thu, 09 Aug 2012 14:55:47 +0000
Received: by yenq9 with SMTP id q9so456544yen.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Aug 2012 07:55:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5023C82B.3000007@gmail.com>
References: <CAFV5biDrgbhJ=_FyPd8YrNsnOUpSrCu-vhsq2GfNsbZ9M2F6Rg@mail.gmail.com>
 <5023C82B.3000007@gmail.com>
From: peterlingoal <peterlingoal@gmail.com>
Date: Thu, 9 Aug 2012 22:55:24 +0800
Message-ID: <CAFV5biDBEefOdAEZtA9g_JwHJ51XT1DNq-NzcVYGRf9nxpP1BQ@mail.gmail.com>
Subject: Re: [YAFFS] bad block management policy
To: Peter Barada <peter.barada@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes this is also my understanding and what I'm worried about. On one
hand we don't want to have uncorrectable error, on the other hand we
could not let the entire NAND got marked bad before the life cycle. I
wonder how the other file system (or any raw mtd layer implementation)
handle the new small geometry chips.

Will the number of bit errors indicate how 'close' a block is near to
uncorrectable error, For e.g. 3 bit flipping on a chip requiring
minimum 4bit ECC?

regards,
Peter


On Thu, Aug 9, 2012 at 10:24 PM, Peter Barada <peter.barada@gmail.com> wrote:
> On 08/09/2012 06:45 AM, peterlingoal wrote:
>> Hi,
>>
>> I am using YAFFS2 filesystem and some NANDs have hundreds and
>> thousands (out of 4K) blocks identified bad. After checking I found
>> YAFFS2 is marking a block bad if three fixable ECC errors happens
>> within a block. My question is:
>>
>> 1. I am using two Micron NAND chips, one requires minimum 1bit ECC
>> while the other requires 4. Bit flipping (although all fixable) seems
>> happen quite often in both types, is this expected behavior?
>> 2. Micron error management doc requests to mark a block bad only when
>> program or erase operations fails, but not mentioning reading. So is
>> it safe to remove this ECC error counter? Will it lead to un-fixable
>> error?
> the "strike count" is used to predict when a block has been programmed
> enough times that it is close to failure (where programmed data read
> back contains uncorrectable bit errors).
>
> This worked fine for the larger-geometry SLC devices that didn't show
> correctable ECC errors until a block was very near its end of life.
> However newer small-geometry SLC/MLC devices require stronger ECC to
> keep the same UBER (uncorrectable bit error rate) as previous generation
> devices.  Unfortunately this means that more correctable errors will be
> seen, long before the block is near its end of life.
>
> You could modify YAFFS to ignore -EUCLEAN returns from MTD which will
> prevent YAFFS from marking blocks bad prematurely, but then there is no
> way to predict when a block is about to wear out and return
> uncorrectable errors (-EBADMSG).
>
>
> --
> Peter Barada
> peter.barada@gmail.com
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
