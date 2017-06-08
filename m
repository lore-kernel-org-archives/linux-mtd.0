Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIqfZ-00032r-5Z
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 06:11:49 +0000
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
 [209.85.213.177]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v586B4xY017288
 for <linux-mtd@lists.infradead.org>; Thu, 8 Jun 2017 15:11:05 +0900
Received: by mail-yb0-f177.google.com with SMTP id f192so7437708yba.2
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2017 23:11:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170607153318.7e341dff@bbrezillon>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-8-git-send-email-yamada.masahiro@socionext.com>
 <20170607153318.7e341dff@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Jun 2017 15:11:03 +0900
Message-ID: <CAK7LNAR55jsT4Ch-vwhvEMvSmEGJPBQQc6Tw2gkiTianer2zjQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] mtd: nand: denali: do not propagate
 NAND_STATUS_FAIL to waitfunc()
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-mtd@lists.infradead.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Enrico Jorns <ejo@pengutronix.de>
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


2017-06-07 22:33 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Wed,  7 Jun 2017 20:52:16 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Currently, the error handling of denali_write_page(_raw) is a bit
>> complicated.  If the program command fails, NAND_STATUS_FAIL is set
>> to the driver internal denali->status, then read out later by
>> denali_waitfunc().
>>
>> We can avoid it by exploiting the nand_write_page() implementation.
>> If chip->ecc.write_page(_raw) returns negative code (i.e. -EIO), it
>> errors out immediately.  This gives the same result as returning
>> NAND_STATUS_FAIL from chip->waitfunc.  In either way, -EIO is
>> returned to the upper MTD layer.
>
> Actually, this is how it's supposed to work now (when they set
> the NAND_ECC_CUSTOM_PAGE_ACCESS flag, drivers are expected to wait for
> the program operation to finish and return -EIO if it failed), so you're
> all good ;-).
>
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> Changes in v5: None
>> Changes in v4: None
>> Changes in v3: None
>> Changes in v2:
>>   - Newly added
>>
>>  drivers/mtd/nand/denali.c | 12 ++++--------
>>  drivers/mtd/nand/denali.h |  1 -
>>  2 files changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
>> index 1897fe238290..22acfc34b546 100644
>> --- a/drivers/mtd/nand/denali.c
>> +++ b/drivers/mtd/nand/denali.c
>> @@ -1005,6 +1005,7 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
>>       size_t size = mtd->writesize + mtd->oobsize;
>>       uint32_t irq_status;
>>       uint32_t irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
>
> As mentioned in my previous patch, I think you should wait for
> INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL here.

No.
It is intentional to use INTR__DMA_CMD_COMP
instead of INTR__PROGRAM_COMP here.


This is very strange of this IP,
INTR__PROGRAM_COMP is never set when DMA mode is being used.
(INTR__DMA_CMD_COMP is set instead.)


As far as I tested this IP,
INTR__PROGRAM_COMP is set only when data are written by PIO mode.


I introduced PIO transfer in
http://patchwork.ozlabs.org/patch/772398/

I used INTR__PROGRAM_COMP in denali_pio_write().



>> +     int ret = 0;
>>
>>       denali->page = page;
>>
>> @@ -1038,13 +1039,13 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
>>       if (irq_status == 0) {
>>               dev_err(denali->dev, "timeout on write_page (type = %d)\n",
>>                       raw_xfer);
>> -             denali->status = NAND_STATUS_FAIL;
>> +             ret = -EIO;
>>       }
>
>         if (irq_status & INTR__PROGRAM_FAIL) {
>                 dev_err(denali->dev, "page program failed (type = %d)\n",
>                         raw_xfer);
>                 ret = -EIO;
>         }

This will be fixed anyway by
http://patchwork.ozlabs.org/patch/772414/


I do not want to include unrelated change.


-- 
Best Regards
Masahiro Yamada
