Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2SIb-0000yq-QA
 for linux-mtd@lists.infradead.org; Thu, 12 Oct 2017 01:28:35 +0000
Received: by mail-lf0-x244.google.com with SMTP id 90so1344878lfs.4
 for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2017 18:28:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171011153559.0b1efb28@bbrezillon>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-12-git-send-email-peterpandong@micron.com>
 <20171011153559.0b1efb28@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Thu, 12 Oct 2017 09:28:10 +0800
Message-ID: <CAAyFORKKBX+OHzUGiT-40Tp6EHKjQY9Vm8amp+sVEe7AHwSfwQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/15] nand: spi: add basic operations support
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Arnaud Mouiche <arnaud.mouiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Wed, Oct 11, 2017 at 9:35 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Peter,
>
> I'm resurrecting this series, and I still have on question on this
> patch (probably not my last question ;-)).

Please feel free to comment on it. :)

>
> On Wed, 24 May 2017 15:07:07 +0800
> Peter Pan <peterpandong@micron.com> wrote:
>
>
>
>> +/**
>> + * spinand_do_write_ops - write data from buffer to device
>> + * @mtd: MTD device structure
>> + * @to: offset to write to
>> + * @ops: oob operations description structure
>> + */
>> +static int spinand_do_write_ops(struct mtd_info *mtd, loff_t to,
>> +                             struct mtd_oob_ops *ops)
>> +{
>> +     struct spinand_device *spinand = mtd_to_spinand(mtd);
>> +     struct nand_device *nand = mtd_to_nand(mtd);
>> +     int ret = 0;
>> +
>> +     ret = nand_check_address(nand, to);
>> +     if (ret) {
>> +             dev_err(spinand->dev, "%s: invalid write address\n", __func__);
>> +             return ret;
>> +     }
>> +
>> +     ret = nand_check_oob_ops(nand, to, ops);
>> +     if (ret) {
>> +             dev_err(spinand->dev,
>> +                     "%s: invalid oob operation input\n", __func__);
>> +             return ret;
>> +     }
>> +
>> +     if (nand_oob_ops_across_page(mtd_to_nand(mtd), ops)) {
>> +             dev_err(spinand->dev,
>> +                     "%s: try to across page when writing with OOB\n",
>> +                     __func__);
>> +             return -EINVAL;
>> +     }
>
> Why do you prevent writing more than one OOB region?

Well, actually this is not my original intention. If we remove the across page
check, the mtd_oobtest.ko will failed in "write past end of device" test. And
I checked nand_base.c, I found that nand_do_write_oob() had this check.

An interesting thing is in part_read_oob() we have check for "read pass the
end of partition" while in part_write_oob() we don't have. I don't
know the history
so I just followed raw NAND code.

Thanks

Peter Pan

>
>> +
>> +     mutex_lock(&spinand->lock);
>> +     ret = spinand_write_pages(mtd, to, ops);
>> +     mutex_unlock(&spinand->lock);
>> +
>> +     return ret;
>> +}
