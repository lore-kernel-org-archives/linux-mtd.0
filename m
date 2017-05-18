Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBEv1-00022M-0M
 for linux-mtd@lists.infradead.org; Thu, 18 May 2017 06:28:16 +0000
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
 [209.85.161.172]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v4I6RCfl017659
 for <linux-mtd@lists.infradead.org>; Thu, 18 May 2017 15:27:13 +0900
Received: by mail-yw0-f172.google.com with SMTP id b68so16343368ywe.3
 for <linux-mtd@lists.infradead.org>; Wed, 17 May 2017 23:27:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170515135433.2edda630@bbrezillon>
References: <1492585618-13655-1-git-send-email-yamada.masahiro@socionext.com>
 <1492585618-13655-2-git-send-email-yamada.masahiro@socionext.com>
 <20170428183250.4c43e107@bbrezillon>
 <CAK7LNAQZyMoKJjzPjr12TE9s=G8GJbHGgfequtLE4h+meJT03w@mail.gmail.com>
 <20170515135433.2edda630@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 May 2017 15:27:11 +0900
Message-ID: <CAK7LNAQzPcM6T+3yG8=ezd0vRetW-vcibHWYSw5yJC5TorPKVQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add generic helpers to check, match,
 maximize ECC settings
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
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



2017-05-15 20:54 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> Hi Masahiro,
>
> Sorry for the late reply.
>
> On Mon, 8 May 2017 12:40:47 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Hi Boris,
>>
>>
>> 2017-04-29 1:32 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>>
>> >> +     for (setting = caps->ecc_settings; setting->step; setting++) {
>> >> +             /* If chip->ecc.size is already set, respect it. */
>> >> +             if (chip->ecc.size && setting->step != chip->ecc.size)
>> >> +                     continue;
>> >> +
>> >> +             /* If chip->ecc.strength is already set, respect it. */
>> >> +             if (chip->ecc.strength &&
>> >> +                 setting->strength != chip->ecc.strength)
>> >> +                     continue;
>> >
>> > Hm, I don't get it. If chip->ecc.strength and chip->ecc.size are
>> > explicitly set, you should just call nand_check_ecc_caps() and skip
>> > nand_try_to_match_ecc_req(). Why would you call
>> > nand_try_to_match_ecc_req() in this case?
>>
>>
>> I want to call this function if
>> ecc.size is specified but ecc.strength is not
>> (or vice versa).
>
> That's not a valid combination. I accepted the case where
> nand-ecc-step-size is not defined in the DT just because sometime you
> only have one possible setting which is imposed by the controller. In
> this case ecc.size should be explicitly set by the driver not left to 0.
>
>>
>>
>> If both ecc.size and ecc.strength are already specified,
>> you are right, no need to call this function.
>> This function can check the sanity of the specified
>> combination of (step, strength), but this is the same
>> as what nand_check_ecc_caps() does.


I am working on the next version because I really need to
merge all of my Denali controller patches for my SoCs.


One question about this part.


       /* If chip->ecc.size is already set, respect it. */
       if (chip->ecc.size && step_size != chip->ecc.size)
               continue;

Does this make sense for nand_try_to_maximize_ecc()?

(In other words, can nand-ecc-maximize stand together with nand-ecc-step-size?)


-- 
Best Regards
Masahiro Yamada
