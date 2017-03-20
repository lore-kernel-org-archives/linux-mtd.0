Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cppGm-0006Hq-1e
 for linux-mtd@lists.infradead.org; Mon, 20 Mar 2017 04:50:14 +0000
Received: by mail-lf0-x241.google.com with SMTP id v2so9136095lfi.2
 for <linux-mtd@lists.infradead.org>; Sun, 19 Mar 2017 21:49:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170317133142.3815f9d0@bbrezillon>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-6-git-send-email-peterpandong@micron.com>
 <911b755d-87a1-26c1-8b75-84383b7c0076@gmail.com>
 <20170317133142.3815f9d0@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Mon, 20 Mar 2017 12:49:43 +0800
Message-ID: <CAAyFORJsa7_BDk=k-p=zDMeRFHmQxzLa0S31meCG_=f+OAqx7Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] nand: spi: Add bad block support
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

Hi Arnaud and Boris,

On Fri, Mar 17, 2017 at 8:31 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri, 17 Mar 2017 13:22:17 +0100
> Arnaud Mouiche <arnaud.mouiche@gmail.com> wrote:
>
>> On 16/03/2017 07:47, Peter Pan wrote:
>> > [...]
>> > +
>> > +/*
>> > + * spinand_scan_bbt - scan BBT in SPI NAND device
>> > + * @chip: SPI NAND device structure
>> > + */
>> > +static int spinand_scan_bbt(struct spinand_device *chip)
>> > +{
>> > +   struct nand_device *nand = &chip->base;
>> > +   int ret;
>> > +
>> > +   nand->bbt.options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
>> > +   nand->bbt.td = NULL;
>> > +   nand->bbt.md = NULL;
>> > +
>> > +   ret = spinand_create_badblock_pattern(chip);
>> > +   if (ret)
>> > +           return ret;
>> > +
>> > +   return nand_scan_bbt(nand);
>> > +}
>> > +
>>
>> Boris, Peter,
>>
>> I'm not a big fan of NAND_BBT_USE_FLASH for small capacity nand flash
>> (eg. 1Gb with 1024 blocks, where a complete bad block scan on boot is
>> fast enough).
>> Do you consider NAND_BBT_USE_FLASH as mandatory, or does a optional
>> "of_get_nand_on_flash_bbt(dn))" device tree configuration is something
>> possible ?
>
> It should be optional indeed.

I agree with you. Let's make it optional.

Thanks,
Peter Pan
