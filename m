Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUucH-0006Q1-52
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 13:54:47 +0000
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
 [209.85.213.53]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id w5IDrwCV002182
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2018 22:53:58 +0900
Received: by mail-vk0-f53.google.com with SMTP id b134-v6so9544674vke.13
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2018 06:53:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <34780659.LX1KsSZy9L@blindfold>
References: <1529025532-22087-1-git-send-email-yamada.masahiro@socionext.com>
 <1529025532-22087-4-git-send-email-yamada.masahiro@socionext.com>
 <34780659.LX1KsSZy9L@blindfold>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 18 Jun 2018 22:53:17 +0900
Message-ID: <CAK7LNAR8QTP6nMuR9j5-+Yxg5yzP2Dyq-rKGN-MaYg8xgr-3Ng@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] mtd: rawnand: denali: optimize timing parameters
 for data interface
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,


2018-06-18 16:22 GMT+09:00 Richard Weinberger <richard@nod.at>:
> Am Freitag, 15. Juni 2018, 03:18:52 CEST schrieb Masahiro Yamada:
>> This commit improves the ->setup_data_interface() hook.
>>
>> The denali_setup_data_interface() needs the frequency of clk_x
>> and the ratio of clk_x / clk.
>>
>> The latter is currently hardcoded in the driver, like this:
>>
>>   #define DENALI_CLK_X_MULT       6
>>
>> The IP datasheet requires that clk_x / clk be 4, 5, or 6.  I just
>> chose 6 because it is the most defensive value, but it is not optimal.
>> By getting the clock rate of both "clk" and "clk_x", the driver can
>> compute the timing values more precisely.
>
> What datasheet do you have, is it public?

No.  Not available in public.

I got the datasheet
because Socionext (formerly, Panasonic) bought this IP.


> Mine clearly states that the factor is 4.
> "The frequency of nand_x_clk is four times the frequency of nand_clk."

I checked
"Denali NAND Flash Memory Controller User's Guide"
released by Denali.

I also get access to a newer version
"Cadence Design IP - NAND Flash Memory Controller User's Guide"
because Cadence acquired Denali.


My datasheet says:
"clk_x - Cadence NAND Flash Memory Controller bus
interface clock. This runs at a configured
multiple of clk as is phase aligned. Configured
multiple can be between 4-6 times."



Various parts of this IP are configurable.
Is yours talking about this IP,
or about a particular configuration for SOCFPGA?



>> To not break the existing platforms, the fallback value, 50 MHz is
>> provided.  It is true for all upstreamed platforms.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Reviewed-by: Richard Weinberger <richard@nod.at>
>
> Thanks,
> //richard
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
