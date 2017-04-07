Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwNie-0000zE-Gj
 for linux-mtd@lists.infradead.org; Fri, 07 Apr 2017 06:50:06 +0000
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
 [209.85.213.177]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id v376nOqF024895
 for <linux-mtd@lists.infradead.org>; Fri, 7 Apr 2017 15:49:24 +0900
Received: by mail-yb0-f177.google.com with SMTP id f204so15039057ybc.2
 for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2017 23:49:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1491487722.4829.11.camel@nxp.com>
References: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
 <1490861708-27813-3-git-send-email-yamada.masahiro@socionext.com>
 <1491487722.4829.11.camel@nxp.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 7 Apr 2017 15:49:23 +0900
Message-ID: <CAK7LNAQiO0Jx-qp=-pGWeknAbcTsf9VBPDdR65BP-5f3c4hXEA@mail.gmail.com>
Subject: Re: [PATCH v3 33/37] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Octavian Purdila <octavian.purdila@nxp.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Leonard,

2017-04-06 23:08 GMT+09:00 Leonard Crestez <leonard.crestez@nxp.com>:
> On Thu, Mar 30, 2017 at 11:15 AM, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>>
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
>
>> @@ -4914,8 +4930,12 @@ void nand_cleanup(struct nand_chip *chip)
>> >         /* Free bad block table memory */
>>         kfree(chip->bbt);
>> -       if (!(chip->options & NAND_OWN_BUFFERS))
>> +       if (!(chip->options & NAND_OWN_BUFFERS)) {
>> +               kfree(chip->buffers->databuf);
>> +               kfree(chip->buffers->ecccode);
>> +               kfree(chip->buffers->ecccalc);
>>                 kfree(chip->buffers);
>> +       }
>
> It seems that chip->buffers might not be allocated at this point, for
> example if nand_cleanup is called during a failed probe. You should
> check if (chip->buffers != NULL) before freeing stuff inside it.

You are right.

The failure path in NAND drivers is messy.   :-(
nand_cleanup() may be called before nand_scan_tail()
finishes successfully...

I will send a fixup patch.  Thanks!



-- 
Best Regards
Masahiro Yamada
