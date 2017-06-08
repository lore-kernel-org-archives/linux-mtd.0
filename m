Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIrwl-0004Iq-7b
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 07:33:36 +0000
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
 [209.85.161.176]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v587WnRX015911
 for <linux-mtd@lists.infradead.org>; Thu, 8 Jun 2017 16:32:50 +0900
Received: by mail-yw0-f176.google.com with SMTP id e142so2360340ywa.1
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2017 00:32:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170607152658.51c90ba9@bbrezillon>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-7-git-send-email-yamada.masahiro@socionext.com>
 <20170607152658.51c90ba9@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Jun 2017 16:32:48 +0900
Message-ID: <CAK7LNAT6o+RCW4ibOxr_5iYspcDY1THVWLrB4LM0p040DKC1Dg@mail.gmail.com>
Subject: Re: [PATCH v5 06/23] mtd: nand: denali: set
 NAND_ECC_CUSTOM_PAGE_ACCESS
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

Hi Boris

2017-06-07 22:26 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Wed,  7 Jun 2017 20:52:15 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> The denali_cmdfunc() actually does nothing valuable for
>> NAND_CMD_{PAGEPROG,READ0,SEQIN}.
>>
>> For NAND_CMD_{READ0,SEQIN}, it copies "page" to "denali->page", then
>> denali_read_page() and denali_read_page_raw() compare them to check
>> if the NAND framework called the callbacks in correct order.
>> (Inconsistently, this check is missing from the denali_write_page()
>> and denali_write_page_raw().)
>>
>> The framework is widely tested by many drivers, so this kind of
>> sanity check is unneeded.  The Denali controller is equipped with
>> high level interface for read/write, so let's skip unneeded call
>> of cmdfunc().
>
> I recently changed the semantic of ecc->write_page[_raw]() when
> NAND_ECC_CUSTOM_PAGE_ACCESS is set [1]. I'm not sure your driver waits
> for the program command to finish.
> I think you should wait for INTR_STATUS__PROGRAM_COMP instead of
> INTR_STATUS__DMA_CMD_COMP in write_page() [2], as is done in
> write_oob_data().

Thanks for the pointer.

I missed your commit because I usually develop based on
Linus' tree instead of linux-next.

I will fix this commit.



-- 
Best Regards
Masahiro Yamada
