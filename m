Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1efL8d-0006cn-OT
 for linux-mtd@lists.infradead.org; Sat, 27 Jan 2018 07:43:02 +0000
Received: by mail-io0-x241.google.com with SMTP id f34so2712810ioi.13
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2018 23:42:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171030093426.30827ef5@bbrezillon>
References: <20171028074351.13118-1-prasannatsmkumar@gmail.com>
 <20171030093426.30827ef5@bbrezillon>
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Sat, 27 Jan 2018 13:12:47 +0530
Message-ID: <CANc+2y4=1GdfzzMeyO6=vrQDBQKca5NtrHbXtUH9f4yp5wJ-xg@mail.gmail.com>
Subject: Re: [RFC] NAND: Optimize NAND_ECC_HW_OOB_FIRST read
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
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

On 30 October 2017 at 14:04, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi PrasannaKumar,
>
> On Sat, 28 Oct 2017 13:13:51 +0530
> PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com> wrote:
>
>> From: Lars-Peter Clausen <lars@metafoo.de>
>>
>> Avoid sending unnecessary READ commands to the chip.
>>
>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>> ---
>> This patch is taken from git://projects.qi-hardware.com/qi-kernel.git
>> branch jz-3.16. From [1] and [2] it can be seen that the patch author
>> thinks this can be sent upstream but it never happened so far. This
>> patch is used in OpenWRT as seen from [3].
>
> Sounds reasonable, but it's likely to conflict with something I'd like
> to queue for 4.16 [1]. I'll rebase this patch on nand/next once the
> ->exec_op() series is merged. Don't hesitate to ping me if I forget.
>
> Regards,
>
> Boris
>
> [1]http://patchwork.ozlabs.org/project/linux-mtd/list/?series=8923
>
>>
>> I have only compile tested the patch.
>>
>> 1. https://www.mail-archive.com/discussion@lists.en.qi-hardware.com/msg04635.html
>> 2. https://www.mail-archive.com/discussion@lists.en.qi-hardware.com/msg04639.html
>> 3. https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/xburst/patches-3.18/002-NAND-Optimize-NAND_ECC_HW_OOB_FIRST-read.patch;h=046da51912de3cd4444779df5de13d2c1999719a;hb=c03d4317a6bc891cb4a5e89cbdd77f37c23aff86
>>
>>  drivers/mtd/nand/nand_base.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 12edaae..4bf3bdb 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -1680,9 +1680,15 @@ static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
>>       unsigned int max_bitflips = 0;
>>
>>       /* Read the OOB area first */
>> -     chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
>> -     chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>> -     chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
>> +     if (mtd->writesize > 512) {
>> +             chip->cmdfunc(mtd, NAND_CMD_READ0, mtd->writesize, page);
>> +             chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>> +             chip->cmdfunc(mtd, NAND_CMD_RNDOUT, 0, -1);
>> +     } else {
>> +             chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
>> +             chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>> +             chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
>> +     }
>>
>>       ret = mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0,
>>                                        chip->ecc.total);
>> @@ -1902,8 +1908,10 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>>                                                __func__, buf);
>>
>>  read_retry:
>> -                     if (nand_standard_page_accessors(&chip->ecc))
>> +                     if (nand_standard_page_accessors(&chip->ecc) &&
>> +                         chip->ecc.mode != NAND_ECC_HW_OOB_FIRST) {
>>                               chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>> +                     }
>>
>>                       /*
>>                        * Now read the page into the buffer.  Absent an error,
>

Can you please revisit this?

Thanks,
PrasannaKumar
