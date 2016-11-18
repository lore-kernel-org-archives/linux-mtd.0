Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7elr-00053W-Vt
 for linux-mtd@lists.infradead.org; Fri, 18 Nov 2016 08:43:45 +0000
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
 [209.85.213.178]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id uAI8guRB013797
 for <linux-mtd@lists.infradead.org>; Fri, 18 Nov 2016 17:42:57 +0900
Received: by mail-yb0-f178.google.com with SMTP id a184so78884610ybb.0
 for <linux-mtd@lists.infradead.org>; Fri, 18 Nov 2016 00:42:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5a1b5ef5-5c1a-ce20-f0be-ed6abed6996e@gmail.com>
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
 <1478666130-13413-6-git-send-email-yamada.masahiro@socionext.com>
 <5a1b5ef5-5c1a-ce20-f0be-ed6abed6996e@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 18 Nov 2016 17:42:55 +0900
Message-ID: <CAK7LNAQYAcGcXnwgKYohgyDNN=5S3czCbDm7enKnVUBVhf3T8g@mail.gmail.com>
Subject: Re: [PATCH 05/11] mtd: nand: denali: remove "Spectra:" prefix from
 printk strings
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Alan Cox <alan@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Dinh Nguyen <dinguyen@altera.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,


2016-11-13 6:35 GMT+09:00 Marek Vasut <marek.vasut@gmail.com>:
> On 11/09/2016 05:35 AM, Masahiro Yamada wrote:
>> As far as I understood from the Kconfig menu deleted by commit
>> be7f39c5ecf5 ("Staging: delete spectra driver"), the "Spectra" is
>> specific to Intel Moorestown Platform.
>>
>> The Denali NAND controller IP is used for various SoCs such as
>> Altera SOCFPGA, Socionext UniPhier, etc.  The platform specific
>> strings are not preferred in this driver.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
>
>> ---
>>
>> As an ARM-SoC developer, I only need denali.c and denali_dt.c.
>>
>> I see some "Spectra:" in drivers/mtd/nand/denali_pci.c as well.
>> I was not quite sure if they are needed or not.
>> If desired, I can update this patch to remove them too.
>
> Is anyone even using Denali on Intel now ?
>
>>  drivers/mtd/nand/denali.c | 11 +++++------
>>  1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
>> index 80d3e26..78d795b 100644
>> --- a/drivers/mtd/nand/denali.c
>> +++ b/drivers/mtd/nand/denali.c
>> @@ -402,7 +402,7 @@ static void get_hynix_nand_para(struct denali_nand_info *denali,
>>               break;
>>       default:
>>               dev_warn(denali->dev,
>> -                      "Spectra: Unknown Hynix NAND (Device ID: 0x%x).\n"
>> +                      "Unknown Hynix NAND (Device ID: 0x%x).\n"
>>                        "Will use default parameter values instead.\n",
>>                        device_id);
>>       }
>> @@ -1458,7 +1458,7 @@ int denali_init(struct denali_nand_info *denali)
>>        */
>>       if (request_irq(denali->irq, denali_isr, IRQF_SHARED,
>>                       DENALI_NAND_NAME, denali)) {
>> -             pr_err("Spectra: Unable to allocate IRQ\n");
>> +             dev_err(denali->dev, "Unable to request IRQ\n");
>>               return -ENODEV;
>>       }
>>
>> @@ -1495,7 +1495,7 @@ int denali_init(struct denali_nand_info *denali)
>>       /* Is 32-bit DMA supported? */
>>       ret = dma_set_mask(denali->dev, DMA_BIT_MASK(32));
>>       if (ret) {
>> -             pr_err("Spectra: no usable DMA configuration\n");
>> +             dev_err(denali->dev, "no usable DMA configuration\n");
>>               goto failed_req_irq;
>>       }
>>
>> @@ -1503,7 +1503,7 @@ int denali_init(struct denali_nand_info *denali)
>>                            mtd->writesize + mtd->oobsize,
>>                            DMA_BIDIRECTIONAL);
>>       if (dma_mapping_error(denali->dev, denali->buf.dma_buf)) {
>> -             dev_err(denali->dev, "Spectra: failed to map DMA buffer\n");
>> +             dev_err(denali->dev, "failed to map DMA buffer\n");
>
> Nit: For consistency's sake, use Failed with capital F . Fix the "No
> usable DMA ..." too.


Even if we fix those two, we still have some more printk strings
that start with a lower case.


line 177:  dev_err(denali->dev, "reset bank failed.\n");

line 699:  pr_err("timeout occurred, status = 0x%x, mask = 0x%x\n",

line 863:  dev_err(denali->dev, "unable to send pipeline command\n");

line 1074:  dev_err(denali->dev, "timeout on write_page (type = %d)\n",

line 1309:  pr_err(": unsupported command received 0x%x\n", cmd);



If you say "consistency's sake" and
you are a big fan of capital letters instead of lower cases,
will you send a patch that touches those globally?


Your comments against this series are just about
"upper cases vs lower cases".

If I get more useful comments, I am happy to send v2.

But, at this moment, I see no good reason for v2
because changing those two lines does not give us any consistency.


-- 
Best Regards
Masahiro Yamada
