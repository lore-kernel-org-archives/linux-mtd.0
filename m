Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csyjn-0001LB-KP
 for linux-mtd@lists.infradead.org; Tue, 28 Mar 2017 21:33:13 +0000
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
 [209.85.161.180]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v2SLWPw8020842
 for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2017 06:32:26 +0900
Received: by mail-yw0-f180.google.com with SMTP id v76so62910425ywg.0
 for <linux-mtd@lists.infradead.org>; Tue, 28 Mar 2017 14:32:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170327173146.655f090f@bbrezillon>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
 <1490191680-14481-21-git-send-email-yamada.masahiro@socionext.com>
 <20170327173146.655f090f@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 29 Mar 2017 06:32:24 +0900
Message-ID: <CAK7LNARNng6WuuF9OEfJmPkzR=-f1dmM0Q-ypdrAFNxRarATTw@mail.gmail.com>
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

2017-03-28 0:31 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Wed, 22 Mar 2017 23:07:27 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> This will be filled by nand_scan_ident() later.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> Changes in v2: None
>>
>>  drivers/mtd/nand/denali.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
>> index 3badb1d..1706975 100644
>> --- a/drivers/mtd/nand/denali.c
>> +++ b/drivers/mtd/nand/denali.c
>> @@ -1495,7 +1495,6 @@ int denali_init(struct denali_nand_info *denali)
>>
>>       /* now that our ISR is registered, we can enable interrupts */
>>       denali_set_intr_modes(denali, true);
>> -     mtd->name = "denali-nand";
>
> Are you sure this is safe to do that? When mtd->name is NULL, the core
> takes the parent name, and in the denali_dt case it's not "denali-nand",
> which means you're breaking mtdparts compat.

How big impact is this?

I think a bootloader could give mtdparts=denali-nand:...
but, now we are able to have partitions in DT nodes.



-- 
Best Regards
Masahiro Yamada
