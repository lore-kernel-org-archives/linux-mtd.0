Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctBpK-00023B-QN
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 11:31:49 +0000
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
 [209.85.161.182]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id v2TBUtf9004707
 for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2017 20:30:56 +0900
Received: by mail-yw0-f182.google.com with SMTP id d191so8233495ywe.2
 for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2017 04:30:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170329091947.3619fd81@bbrezillon>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
 <1490191680-14481-21-git-send-email-yamada.masahiro@socionext.com>
 <20170327173146.655f090f@bbrezillon>
 <CAK7LNARNng6WuuF9OEfJmPkzR=-f1dmM0Q-ypdrAFNxRarATTw@mail.gmail.com>
 <20170328234023.0c887a51@bbrezillon>
 <CAK7LNATbpQuouRLQJqixpFMqxByQs9dNjB3yFssf9RJpzLpAoQ@mail.gmail.com>
 <20170329091947.3619fd81@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 29 Mar 2017 20:30:54 +0900
Message-ID: <CAK7LNAR9M2vYra_EnUBEPAD4ruxF6GMSXz2NJ2cHPACL0k5Q=Q@mail.gmail.com>
Subject: Re: [PATCH v2 20/53] mtd: nand: denali: do not set mtd->name
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Laurent Monat <laurent.monat@idquantique.com>,
 thorsten.christiansson@idquantique.com, Enrico Jorns <ejo@pengutronix.de>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
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

Hi Boris,


2017-03-29 16:19 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Wed, 29 Mar 2017 10:19:02 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Hi Boris,
>>
>> 2017-03-29 6:40 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>> > On Wed, 29 Mar 2017 06:32:24 +0900
>> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> >
>> >> Hi Boris,
>> >>
>> >> 2017-03-28 0:31 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>> >> > On Wed, 22 Mar 2017 23:07:27 +0900
>> >> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> >> >
>> >> >> This will be filled by nand_scan_ident() later.
>> >> >>
>> >> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> >> >> ---
>> >> >>
>> >> >> Changes in v2: None
>> >> >>
>> >> >>  drivers/mtd/nand/denali.c | 1 -
>> >> >>  1 file changed, 1 deletion(-)
>> >> >>
>> >> >> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
>> >> >> index 3badb1d..1706975 100644
>> >> >> --- a/drivers/mtd/nand/denali.c
>> >> >> +++ b/drivers/mtd/nand/denali.c
>> >> >> @@ -1495,7 +1495,6 @@ int denali_init(struct denali_nand_info *denali)
>> >> >>
>> >> >>       /* now that our ISR is registered, we can enable interrupts */
>> >> >>       denali_set_intr_modes(denali, true);
>> >> >> -     mtd->name = "denali-nand";
>> >> >
>> >> > Are you sure this is safe to do that? When mtd->name is NULL, the core
>> >> > takes the parent name, and in the denali_dt case it's not "denali-nand",
>> >> > which means you're breaking mtdparts compat.
>> >>
>> >> How big impact is this?
>> >
>> > Breaking boot on some platforms (those defining partitions through
>> > mtdparts= cmdline parameter), which is not negligible :P.
>> >
>> >>
>> >> I think a bootloader could give mtdparts=denali-nand:...
>> >> but, now we are able to have partitions in DT nodes.
>> >
>> > Just because you have a new way to describe partitions (using DT) does
>> > not mean people are not using the old one (mtdparts= parameter).
>>
>>
>> I thought DT-node derived name can identify the hardware
>> even if multiple Denali controllers exist on an SoC.
>>
>> Anyway, I admit this is a kind of breakage.
>>
>> If this one is reject, I will drop it drop v3.
>>
>
> Yes, please keep the existing name, changing that without extra
> precautions has proven to be a bad idea [1].
>
> Note that we now have a way to give user-friendly names to MTD devices
> through DT definitions [2]. So, if you ever want to assing a specific
> name to your NAND, all you have to do is add a label property to the
> NAND device node, and then, in the driver:
>
>         nand_set_flash_node(chip, denali->dev->of_node);
>
>         /*
>          * Fallback to the default name if no label property was
>          * defined.
>          */
>         if (!mtd->name)
>                 mtd->name = "denali-nand";
>
>
> [1]https://patchwork.ozlabs.org/patch/707065/

I will replace it with this solution.
Thanks for the tip!



-- 
Best Regards
Masahiro Yamada
