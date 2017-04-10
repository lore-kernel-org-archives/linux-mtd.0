Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxN4t-0002Gz-3r
 for linux-mtd@lists.infradead.org; Mon, 10 Apr 2017 00:21:09 +0000
Received: from mail-yb0-f173.google.com (mail-yb0-f173.google.com
 [209.85.213.173]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v3A0KJG4000838
 for <linux-mtd@lists.infradead.org>; Mon, 10 Apr 2017 09:20:20 +0900
Received: by mail-yb0-f173.google.com with SMTP id m133so27531578ybb.1
 for <linux-mtd@lists.infradead.org>; Sun, 09 Apr 2017 17:20:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170409161717.0f59bc9d@bbrezillon>
References: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
 <1490861708-27813-3-git-send-email-yamada.masahiro@socionext.com>
 <20170409161717.0f59bc9d@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 10 Apr 2017 09:20:18 +0900
Message-ID: <CAK7LNARd8F+E+9ej6Ndw2Y+W1uy9zy_PEczSUzrxt2_Nrn+vqw@mail.gmail.com>
Subject: Re: [PATCH v3 33/37] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>
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


2017-04-09 23:17 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Thu, 30 Mar 2017 17:15:04 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Some NAND controllers are using DMA engine requiring a specific
>> buffer alignment.  The core provides no guarantee on the nand_buffers
>> pointers, which forces some drivers to allocate their own buffers
>> and pass the NAND_OWN_BUFFERS flag.
>>
>> Rework the nand_buffers allocation logic to allocate each buffer
>> independently.  This should make most NAND controllers/DMA engine
>> happy, and allow us to get rid of these custom buf allocation in
>> NAND controller drivers.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> Changes in v3:
>>   - Reword git-log
>>
>> Changes in v2:
>>   - Newly added
>>
>>  drivers/mtd/nand/nand_base.c | 34 +++++++++++++++++++++++++++-------
>>  1 file changed, 27 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index f828ad7..e9d3195 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -4613,13 +4613,25 @@ int nand_scan_tail(struct mtd_info *mtd)
>>       }
>>
>>       if (!(chip->options & NAND_OWN_BUFFERS)) {
>> -             nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
>> -                             + mtd->oobsize * 3, GFP_KERNEL);
>> +             nbuf = kzalloc(sizeof(*nbuf), GFP_KERNEL);
>>               if (!nbuf)
>>                       return -ENOMEM;
>> -             nbuf->ecccalc = (uint8_t *)(nbuf + 1);
>> -             nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
>> -             nbuf->databuf = nbuf->ecccode + mtd->oobsize;
>> +             nbuf->ecccalc = kmalloc(mtd->oobsize, GFP_KERNEL);
>> +             if (!nbuf->ecccalc) {
>> +                     ret = -EINVAL;
>> +                     goto err_free;
>
> You have a memory leak here, because chip->buffers = nbuf is only done
> after all allocations have succeeded.


Indeed.


>> +             }
>> +             nbuf->ecccode = kmalloc(mtd->oobsize, GFP_KERNEL);
>> +             if (!nbuf->ecccode) {
>> +                     ret = -EINVAL;
>
>                         ret = -ENOMEM;
>
> I have the following fixup patch, let me know if you're okay with it
> and I'll squash it in the original commit.


Thank you for your fixup patch.  The code-diff looks all good.
Please squash this.

Sorry for my many mistakes.







-- 
Best Regards
Masahiro Yamada
