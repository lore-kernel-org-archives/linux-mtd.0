Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7ZYM-0005qv-Jx
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 03:41:45 +0000
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
 [209.85.161.170]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id v483emuA007744
 for <linux-mtd@lists.infradead.org>; Mon, 8 May 2017 12:40:48 +0900
Received: by mail-yw0-f170.google.com with SMTP id 203so23810030ywe.0
 for <linux-mtd@lists.infradead.org>; Sun, 07 May 2017 20:40:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170428183250.4c43e107@bbrezillon>
References: <1492585618-13655-1-git-send-email-yamada.masahiro@socionext.com>
 <1492585618-13655-2-git-send-email-yamada.masahiro@socionext.com>
 <20170428183250.4c43e107@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 8 May 2017 12:40:47 +0900
Message-ID: <CAK7LNAQZyMoKJjzPjr12TE9s=G8GJbHGgfequtLE4h+meJT03w@mail.gmail.com>
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


2017-04-29 1:32 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:

>> +     for (setting = caps->ecc_settings; setting->step; setting++) {
>> +             /* If chip->ecc.size is already set, respect it. */
>> +             if (chip->ecc.size && setting->step != chip->ecc.size)
>> +                     continue;
>> +
>> +             /* If chip->ecc.strength is already set, respect it. */
>> +             if (chip->ecc.strength &&
>> +                 setting->strength != chip->ecc.strength)
>> +                     continue;
>
> Hm, I don't get it. If chip->ecc.strength and chip->ecc.size are
> explicitly set, you should just call nand_check_ecc_caps() and skip
> nand_try_to_match_ecc_req(). Why would you call
> nand_try_to_match_ecc_req() in this case?


I want to call this function if
ecc.size is specified but ecc.strength is not
(or vice versa).


If both ecc.size and ecc.strength are already specified,
you are right, no need to call this function.
This function can check the sanity of the specified
combination of (step, strength), but this is the same
as what nand_check_ecc_caps() does.




>> +
>> +             /*
>> +              * If the controller's step size is smaller than the chip's
>> +              * requirement, comparison of the strength is not simple.
>> +              */
>
> There's one thing we can easily do in this case: try to apply the
> same strength but on the smaller step size. If it fits the OOB area, we
> have a valid match, if it doesn't, then we can fallback to ECC
> maximization in case no valid settings were found after iterating over
> ECC settings.
>
> How about:
>
>                 if (setting->step < req_step &&
>                     setting->strength < req_strength)
>                         continue;

Make sense.  I will do this.



>> +             if (setting->step < req_step)
>> +                     continue;
>
> You should probably check that setting->step < mtd->writesize.
>
>> +
>> +             steps = mtd->writesize / setting->step;
>
> Not sure it will ever happen to have a step which is not a multiple of
> ->writesize, but it's probably safer to do DIV_ROUND_UP(), or simply
> skip the ECC setting entry if mtd->writesize % setting->step != 0.

OK.

mtd->writesize % setting->step != 0
will guarantee
setting->step <= mtd->writesize





>> +
>> +             ecc_bytes = caps->calc_ecc_bytes(setting);
>> +             if (WARN_ON_ONCE(ecc_bytes < 0))
>> +                     continue;
>> +             ecc_bytes_total = ecc_bytes * steps;
>> +
>> +             if (ecc_bytes_total > caps->avail_oobsize ||
>> +                 setting->strength * steps < req_corr)
>> +                     continue;
>> +
>> +             /*
>> +              * We assume the best is to meet the chip's requrement
>> +              * with the least number of ECC bytes.
>> +              */
>
> If ecc_settings entries were in ascending order (lowest step-size and
> strength first), you could bail out as soon as you find a suitable
> config, because following settings would necessarily take more bits.

If we want to achieve this,
step-size must be descending order,
while strength must be ascending order.

This is a bit confusing (and I have no idea
how to statically check if every driver follows this order).



>> +             /*
>> +              * If the number of correctable bits is the same,
>> +              * bigger ecc_step has more reliability.
>> +              */
>> +             if (corr > best_corr ||
>> +                 (corr == best_corr && setting->step > best_setting->step)) {
>> +                     best_corr = corr;
>> +                     best_setting = setting;
>> +                     best_ecc_bytes = ecc_bytes;
>> +             }
>
> Same comment as earlier: you could probably skip a few entries by
> enforcing ordering in the ecc_settings array.


Assuming that step-size is descending order and strength is ascending order,
it may be possible by iterating backward.

But, I think the array should be terminated by zero or NULL.
How to find the last entry we want to start iterating from?

Assuming the array size is small, is this worthwhile?



>> +     }
>> +
>> +     if (!best_setting)
>> +             return -ENOTSUPP;
>> +
>> +     chip->ecc.size = best_setting->step;
>> +     chip->ecc.strength = best_setting->strength;
>> +     chip->ecc.bytes = best_ecc_bytes;
>> +
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(nand_try_to_maximize_ecc);
>> +
>>  /*
>>   * Check if the chip configuration meet the datasheet requirements.
>>
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index 2ae781e..394128f 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -486,6 +486,28 @@ static inline void nand_hw_control_init(struct nand_hw_control *nfc)
>>  }
>>
>>  /**
>> + * struct nand_ecc_setting - information of ECC step supported by ECC engine
>> + * @step: data bytes per ECC step
>> + * @bytes: ECC bytes per step
>> + */
>> +struct nand_ecc_setting {
>> +     int step;
>> +     int strength;
>> +};
>
> I think I already mentioned that I'd prefer to have the step and
> strength info separated in 2 different objects so that we can easily
> re-use the strength definitions for all step-size supported by the
> engine (ECC engines usually provide the same set of strengths for all
> supported step-size).
>
> struct nand_ecc_step_size_caps {
>         int step_size;
>         int *strengths;
> };
>
> struct nand_ecc_engine_caps {
>         const struct nand_ecc_step_size_caps *step_sizes;
>         /* ... */
> };
>
> static int my_strengths[] = { 8, 16, 24, 0 };
> static const struct nand_ecc_step_size_caps my_step_sizes[] = {
>         { 512, my_strengths },
>         { 1024, my_strengths },
>         /* sentinel */
> };
>
> static const struct nand_ecc_engine_caps my_ecc_caps = {
>         .step_sizes = my_step_sizes,
>         /* ... */
> };


At first, I implemented as you suggested, but I did not like the taste
of the code.

I want each compatible string has only one associated data array
as you see in 2/2.


If we follow the separate structure approach, each compatible
has a chain of caps arrays.


One more thing, the loop nest will become deeper,
for the outer loop with ecc-step,
and inter loop with strength.


Just in case, I copy-pasted the compatible array I wrote first.


static const int denali_socfpga_ecc_strengths[] = {8, 15, 0};
static const struct nand_ecc_step_caps denali_socfpga_ecc_step_caps[] = {
        { .step_size = 512, .strengths = denali_socfpga_ecc_strengths, },
        {},
};

static const struct denali_dt_data denali_socfpga_data = {
        .caps = DENALI_CAP_HW_ECC_FIXUP,
        .ecc_step_caps = denali_socfpga_ecc_step_caps,
};

static const int denali_uniphier_v5a_strengths[] = {8, 16, 24, 0};
static const struct nand_ecc_step_caps denali_uniphier_v5a_ecc_step_caps[] = {
        { .step_size = 1024, .strengths = denali_uniphier_v5a_strengths, },
        {},
};

static const struct denali_dt_data denali_uniphier_v5a_data = {
        .caps = DENALI_CAP_HW_ECC_FIXUP |
                DENALI_CAP_DMA_64BIT,
        .ecc_step_caps = denali_uniphier_v5a_ecc_step_caps,
};

static const int denali_uniphier_v5b_strengths[] = {8, 16, 0};
static const struct nand_ecc_step_caps denali_uniphier_v5b_ecc_step_caps[] = {
        { .step_size = 1024, .strengths = denali_uniphier_v5b_strengths, },
        {},
};

static const struct denali_dt_data denali_uniphier_v5b_data = {
        .revision = 0x0501,
        .caps = DENALI_CAP_HW_ECC_FIXUP |
                DENALI_CAP_DMA_64BIT,
        .ecc_step_caps = denali_uniphier_v5b_ecc_step_caps,
};

static const struct of_device_id denali_nand_dt_ids[] = {
        {
                .compatible = "altr,socfpga-denali-nand",
                .data = &denali_socfpga_data,
        },
        {
                .compatible = "socionext,uniphier-denali-nand-v5a",
                .data = &denali_uniphier_v5a_data,
        },
        {
                .compatible = "socionext,uniphier-denali-nand-v5b",
                .data = &denali_uniphier_v5b_data,
        },
        { /* sentinel */ }
};



>
>> +
>> +/**
>> + * struct nand_ecc_engine_caps - capability of ECC engine
>> + * @ecc_settings: array of (step, strength) supported by this ECC engine
>> + * @calc_ecc_bytes: driver's hook to calculate ECC bytes per step
>> + * @avail_oobsize: OOB size that the ECC engine can use for ECC correction
>> + */
>> +struct nand_ecc_engine_caps {
>> +     const struct nand_ecc_setting *ecc_settings;
>> +     int (*calc_ecc_bytes)(const struct nand_ecc_setting *ecc_setting);
>> +     int avail_oobsize;
>
> avail_oobsize should be passed as an argument to the different helpers
> you define above, because it's completely dependent on the NAND chip,
> which means you would have change it dynamically, which in turn
> prevents you from defining this object as 'static const' in your driver.


Make sense.




-- 
Best Regards
Masahiro Yamada
