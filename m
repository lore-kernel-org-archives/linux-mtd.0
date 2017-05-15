Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAEaf-00020C-S3
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 11:55:08 +0000
Date: Mon, 15 May 2017 13:54:33 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 1/2] mtd: nand: add generic helpers to check, match,
 maximize ECC settings
Message-ID: <20170515135433.2edda630@bbrezillon>
In-Reply-To: <CAK7LNAQZyMoKJjzPjr12TE9s=G8GJbHGgfequtLE4h+meJT03w@mail.gmail.com>
References: <1492585618-13655-1-git-send-email-yamada.masahiro@socionext.com>
 <1492585618-13655-2-git-send-email-yamada.masahiro@socionext.com>
 <20170428183250.4c43e107@bbrezillon>
 <CAK7LNAQZyMoKJjzPjr12TE9s=G8GJbHGgfequtLE4h+meJT03w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Masahiro,

Sorry for the late reply.

On Mon, 8 May 2017 12:40:47 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 2017-04-29 1:32 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> 
> >> +     for (setting = caps->ecc_settings; setting->step; setting++) {
> >> +             /* If chip->ecc.size is already set, respect it. */
> >> +             if (chip->ecc.size && setting->step != chip->ecc.size)
> >> +                     continue;
> >> +
> >> +             /* If chip->ecc.strength is already set, respect it. */
> >> +             if (chip->ecc.strength &&
> >> +                 setting->strength != chip->ecc.strength)
> >> +                     continue;  
> >
> > Hm, I don't get it. If chip->ecc.strength and chip->ecc.size are
> > explicitly set, you should just call nand_check_ecc_caps() and skip
> > nand_try_to_match_ecc_req(). Why would you call
> > nand_try_to_match_ecc_req() in this case?  
> 
> 
> I want to call this function if
> ecc.size is specified but ecc.strength is not
> (or vice versa).

That's not a valid combination. I accepted the case where
nand-ecc-step-size is not defined in the DT just because sometime you
only have one possible setting which is imposed by the controller. In
this case ecc.size should be explicitly set by the driver not left to 0.

> 
> 
> If both ecc.size and ecc.strength are already specified,
> you are right, no need to call this function.
> This function can check the sanity of the specified
> combination of (step, strength), but this is the same
> as what nand_check_ecc_caps() does.

Really, this function is just about trying to match ecc_strength_ds and
ecc_step_size_ds, and not a partial combination of DT def + _ds def.

> 
> 
> 
> 
> >> +
> >> +             /*
> >> +              * If the controller's step size is smaller than the chip's
> >> +              * requirement, comparison of the strength is not simple.
> >> +              */  
> >
> > There's one thing we can easily do in this case: try to apply the
> > same strength but on the smaller step size. If it fits the OOB area, we
> > have a valid match, if it doesn't, then we can fallback to ECC
> > maximization in case no valid settings were found after iterating over
> > ECC settings.
> >
> > How about:
> >
> >                 if (setting->step < req_step &&
> >                     setting->strength < req_strength)
> >                         continue;  
> 
> Make sense.  I will do this.
> 
> 
> 
> >> +             if (setting->step < req_step)
> >> +                     continue;  
> >
> > You should probably check that setting->step < mtd->writesize.
> >  
> >> +
> >> +             steps = mtd->writesize / setting->step;  
> >
> > Not sure it will ever happen to have a step which is not a multiple of  
> > ->writesize, but it's probably safer to do DIV_ROUND_UP(), or simply  
> > skip the ECC setting entry if mtd->writesize % setting->step != 0.  
> 
> OK.
> 
> mtd->writesize % setting->step != 0
> will guarantee
> setting->step <= mtd->writesize
> 

Indeed.

> 
> 
> 
> 
> >> +
> >> +             ecc_bytes = caps->calc_ecc_bytes(setting);
> >> +             if (WARN_ON_ONCE(ecc_bytes < 0))
> >> +                     continue;
> >> +             ecc_bytes_total = ecc_bytes * steps;
> >> +
> >> +             if (ecc_bytes_total > caps->avail_oobsize ||
> >> +                 setting->strength * steps < req_corr)
> >> +                     continue;
> >> +
> >> +             /*
> >> +              * We assume the best is to meet the chip's requrement
> >> +              * with the least number of ECC bytes.
> >> +              */  
> >
> > If ecc_settings entries were in ascending order (lowest step-size and
> > strength first), you could bail out as soon as you find a suitable
> > config, because following settings would necessarily take more bits.  
> 
> If we want to achieve this,
> step-size must be descending order,
> while strength must be ascending order.
> 
> This is a bit confusing (and I have no idea
> how to statically check if every driver follows this order).

Well, I was not suggesting to check the ordering statically. It's more a
convention and reviews should allow us to detect offenders. This being
said, maybe it's not such a big deal to iterate over all configs before
taking a decision.

> 
> 
> 
> >> +             /*
> >> +              * If the number of correctable bits is the same,
> >> +              * bigger ecc_step has more reliability.
> >> +              */
> >> +             if (corr > best_corr ||
> >> +                 (corr == best_corr && setting->step > best_setting->step)) {
> >> +                     best_corr = corr;
> >> +                     best_setting = setting;
> >> +                     best_ecc_bytes = ecc_bytes;
> >> +             }  
> >
> > Same comment as earlier: you could probably skip a few entries by
> > enforcing ordering in the ecc_settings array.  
> 
> 
> Assuming that step-size is descending order and strength is ascending order,
> it may be possible by iterating backward.
> 
> But, I think the array should be terminated by zero or NULL.

Well, you decided to do that. Actually I'd prefer to have an object
containing both a pointer to the array and the array size. I'm really
not a big fan of the sentinel entry approach, because it's error prone
compared to an ARRAY_SIZE(def).

> How to find the last entry we want to start iterating from?

If you store the array size, it's just a matter of doing:

	for (i = ARRAY_SIZE(def); i >= 0; i--)
		...

> 
> Assuming the array size is small, is this worthwhile?

Maybe not.

> 
> 
> 
> >> +     }
> >> +
> >> +     if (!best_setting)
> >> +             return -ENOTSUPP;
> >> +
> >> +     chip->ecc.size = best_setting->step;
> >> +     chip->ecc.strength = best_setting->strength;
> >> +     chip->ecc.bytes = best_ecc_bytes;
> >> +
> >> +     return 0;
> >> +}
> >> +EXPORT_SYMBOL_GPL(nand_try_to_maximize_ecc);
> >> +
> >>  /*
> >>   * Check if the chip configuration meet the datasheet requirements.
> >>
> >> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> >> index 2ae781e..394128f 100644
> >> --- a/include/linux/mtd/nand.h
> >> +++ b/include/linux/mtd/nand.h
> >> @@ -486,6 +486,28 @@ static inline void nand_hw_control_init(struct nand_hw_control *nfc)
> >>  }
> >>
> >>  /**
> >> + * struct nand_ecc_setting - information of ECC step supported by ECC engine
> >> + * @step: data bytes per ECC step
> >> + * @bytes: ECC bytes per step
> >> + */
> >> +struct nand_ecc_setting {
> >> +     int step;
> >> +     int strength;
> >> +};  
> >
> > I think I already mentioned that I'd prefer to have the step and
> > strength info separated in 2 different objects so that we can easily
> > re-use the strength definitions for all step-size supported by the
> > engine (ECC engines usually provide the same set of strengths for all
> > supported step-size).
> >
> > struct nand_ecc_step_size_caps {
> >         int step_size;
> >         int *strengths;
> > };
> >
> > struct nand_ecc_engine_caps {
> >         const struct nand_ecc_step_size_caps *step_sizes;
> >         /* ... */
> > };
> >
> > static int my_strengths[] = { 8, 16, 24, 0 };
> > static const struct nand_ecc_step_size_caps my_step_sizes[] = {
> >         { 512, my_strengths },
> >         { 1024, my_strengths },
> >         /* sentinel */
> > };
> >
> > static const struct nand_ecc_engine_caps my_ecc_caps = {
> >         .step_sizes = my_step_sizes,
> >         /* ... */
> > };  
> 
> 
> At first, I implemented as you suggested, but I did not like the taste
> of the code.

Well, I prefer it this way, and since, as you say, it's a matter of
taste, I think I'll abuse of my maintainer's position and push for this
approach :-).

> 
> I want each compatible string has only one associated data array
> as you see in 2/2.
> 
> 
> If we follow the separate structure approach, each compatible
> has a chain of caps arrays.
> 
> 
> One more thing, the loop nest will become deeper,
> for the outer loop with ecc-step,
> and inter loop with strength.
> 
> 
> Just in case, I copy-pasted the compatible array I wrote first.

Note that your use case is a bit biased because the strength arrays is
not reusable in the denali driver. But I have a real use case
(sunxi_nand) where the strength array is exactly the same for 512 and
1024 step size.

> 
> 
> static const int denali_socfpga_ecc_strengths[] = {8, 15, 0};
> static const struct nand_ecc_step_caps denali_socfpga_ecc_step_caps[] = {
>         { .step_size = 512, .strengths = denali_socfpga_ecc_strengths, },
>         {},
> };
> 
> static const struct denali_dt_data denali_socfpga_data = {
>         .caps = DENALI_CAP_HW_ECC_FIXUP,
>         .ecc_step_caps = denali_socfpga_ecc_step_caps,
> };
> 
> static const int denali_uniphier_v5a_strengths[] = {8, 16, 24, 0};
> static const struct nand_ecc_step_caps denali_uniphier_v5a_ecc_step_caps[] = {
>         { .step_size = 1024, .strengths = denali_uniphier_v5a_strengths, },
>         {},
> };
> 
> static const struct denali_dt_data denali_uniphier_v5a_data = {
>         .caps = DENALI_CAP_HW_ECC_FIXUP |
>                 DENALI_CAP_DMA_64BIT,
>         .ecc_step_caps = denali_uniphier_v5a_ecc_step_caps,
> };
> 
> static const int denali_uniphier_v5b_strengths[] = {8, 16, 0};
> static const struct nand_ecc_step_caps denali_uniphier_v5b_ecc_step_caps[] = {
>         { .step_size = 1024, .strengths = denali_uniphier_v5b_strengths, },
>         {},
> };

If you store the size of the array in the struct as I suggested above,
you can even re-use the strength array here:

static const int denali_uniphier_v5_strengths[] = {8, 16, 24};
static const struct nand_ecc_step_caps denali_uniphier_v5a_ecc_step_caps[] = {
	{
		.step_size = 1024,
		.nstrengths = ARRAY_SIZE(denali_uniphier_v5_strengths),
		.strengths = denali_uniphier_v5a_strengths,
	}
};

static const struct nand_ecc_step_caps denali_uniphier_v5b_ecc_step_caps[] = {
	{
		.step_size = 1024,
		.nstrengths = ARRAY_SIZE(denali_uniphier_v5_strengths) - 1,
		.strengths = denali_uniphier_v5_strengths,
	}
};
