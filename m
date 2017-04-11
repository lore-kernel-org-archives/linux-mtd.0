Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxp9q-0002N3-Gu
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 06:20:08 +0000
Received: from mail-yb0-f179.google.com (mail-yb0-f179.google.com
 [209.85.213.179]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id v3B6JMs6031056
 for <linux-mtd@lists.infradead.org>; Tue, 11 Apr 2017 15:19:23 +0900
Received: by mail-yb0-f179.google.com with SMTP id l201so41382743ybf.0
 for <linux-mtd@lists.infradead.org>; Mon, 10 Apr 2017 23:19:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170409183301.037d3f95@bbrezillon>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-15-git-send-email-yamada.masahiro@socionext.com>
 <20170330160238.59e5a2c1@bbrezillon>
 <CAK7LNARUKwMHd79ALDx_SDY9XKcHPY96xTAOMQx6XarFgwb-AA@mail.gmail.com>
 <20170331114659.4964be35@bbrezillon>
 <CAK7LNAToTmirpkhNmPCLhcTXG_SFqS762mEGK3mjyqLKXuWa1Q@mail.gmail.com>
 <20170409183301.037d3f95@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 11 Apr 2017 15:19:21 +0900
Message-ID: <CAK7LNARxR722uRE9SnJPuOqictrpnbFmcKBsW_g=f1OnNgvpRA@mail.gmail.com>
Subject: Re: [PATCH v3 14/37] mtd: nand: denali: support "nand-ecc-strength"
 DT property
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
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



2017-04-10 1:33 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Mon, 3 Apr 2017 12:16:34 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Hi Boris,
>>
>>
>>
>> 2017-03-31 18:46 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>>
>> > You can try something like that when no explicit ecc.strength and
>> > ecc.size has been set in the DT and when ECC_MAXIMIZE was not passed.
>> >
>> > static int
>> > denali_get_closest_ecc_strength(struct denali_nand_info *denali,
>> >                                 int strength)
>> > {
>> >         /*
>> >          * Whatever you need to select a strength that is greater than
>> >          * or equal to strength.
>> >          */
>> >
>> >         return X;
>> > }
>>
>>
>> Is here anything specific to Denali?
>
> Well, only the denali driver knows what the hardware supports, though
> having a generic function that takes a table of supported strengths
> would work.
>
>>
>>
>> > static int denali_try_to_match_ecc_req(struct denali_nand_info *denali)
>> > {
>> >         struct nand_chip *chip = &denali->nand;
>> >         struct mtd_info *mtd = nand_to_mtd(chip);
>> >         int max_ecc_bytes = mtd->oobsize - denali->bbtskipbytes;
>> >         int ecc_steps, ecc_strength, ecc_bytes;
>> >         int ecc_size = chip->ecc_step_ds;
>> >         int ecc_strength = chip->ecc_strength_ds;
>> >
>> >         /*
>> >          * No information provided by the NAND chip, let the core
>> >          * maximize the strength.
>> >          */
>> >         if (!ecc_size || !ecc_strength)
>> >                 return -ENOTSUPP;
>> >
>> >         if (ecc_size > 512)
>> >                 ecc_size = 1024;
>> >         else
>> >                 ecc_size = 512;
>> >
>> >         /* Adjust ECC step size based on hardware support. */
>> >         if (ecc_size == 1024 &&
>> >             !(denali->caps & DENALI_CAP_ECC_SIZE_1024))
>> >                 ecc_size = 512;
>> >         else if(ecc_size == 512 &&
>> >                 !(denali->caps & DENALI_CAP_ECC_SIZE_512))
>> >                 ecc_size = 1024;
>> >
>> >         if (ecc_size < chip->ecc_size_ds) {
>> >                 /*
>> >                  * When the selected size if smaller than the expected
>> >                  * one we try to use the same strength but on 512 blocks
>> >                  * so that we can still fix the same number of errors
>> >                  * even if they are concentrated in the first 512bytes
>> >                  * of a 1024bytes portion.
>> >                  */
>> >                 ecc_strength = chip->ecc_strength_ds;
>> >                 ecc_strength = denali_get_closest_ecc_strength(denali,
>> >                                                                ecc_strength);
>> >         } else {
>> >                 /* Always prefer 1024bytes ECC blocks when possible. */
>> >                 if (ecc_size != 1024 &&
>> >                     (denali->caps & DENALI_CAP_ECC_SIZE_1024) &&
>> >                     mtd->writesize > 1024)
>> >                         ecc_size = 1024;
>> >
>> >                 /*
>> >                  * Adjust the strength based on the selected ECC step
>> >                  * size.
>> >                  */
>> >                 ecc_strength = DIV_ROUND_UP(ecc_size,
>> >                                             chip->ecc_step_ds) *
>> >                                chip->ecc_strength_ds;
>> >         }
>> >
>> >         ecc_bytes = denali_calc_ecc_bytes(ecc_size,
>> >                                           ecc_strength);
>> >         ecc_bytes *= mtd->writesize / ecc_size;
>> >
>> >         /*
>> >          * If we don't have enough space, let the core maximize
>> >          * the strength.
>> >          */
>> >         if (ecc_bytes > max_ecc_bytes)
>> >                 return -ENOTSUPP;
>> >
>> >         chip->ecc.strength = ecc_strength;
>> >         chip->ecc.size = ecc_size;
>> >
>> >         return 0;
>> > }
>>
>>
>> As a whole, this does not seem to driver-specific.
>
> It's almost controller-agnostic, except for the denali_calc_ecc_bytes()
> function, but I guess we could ask drivers to implement a hook that is
> passed the ECC step size and strength and returns the associated
> number of ECC bytes.
>
>>
>>
>> [1] A driver provides some pairs of (ecc_strength, ecc_size)
>>     it can support.
>>
>> [2] The core framework knows the chip's requirement
>>     (ecc_strength_ds, ecc_size_ds).
>>
>>
>> Then, the core framework provides a function
>> to return a most recommended (ecc_strength, ecc_size).
>>
>>
>>
>> struct nand_ecc_spec {
>>        int ecc_strength;
>>        int ecc_size;
>> };
>>
>> /*
>>  * This function choose the most recommented (ecc_str, ecc_size)
>>  * "recommended" means: minimum ecc stregth that meets
>>  * the chip's requirment.
>>  *
>>  *
>>  * @chip   - nand_chip
>>  * @controller_ecc_spec - Array of (ecc_str, ecc_size) supported by the
>>                           controller. (terminated by NULL as sentinel)
>>  */
>> struct nand_ecc_spec * nand_try_to_match_ecc_req(struct nand_chip *chip,
>>                                                  struct nand_ecc_spec
>> *controller_ecc_spec)
>> {
>>       /*
>>        * Return the pointer to the most recommended
>>        * struct nand_ecc_spec.
>>        * If nothing suitable found, return NULL.
>>        */
>> }
>>
>
> I like the idea, except I would do this slightly differently to avoid
> declaring all combinations of stepsize and strengths
>
> struct nand_ecc_stepsize_info {
>         int stepsize;
>         int nstrengths;
>         int *strengths;
> };
>
> struct nand_ecc_engine_caps {
>         int nstepsizes;
>         struct nand_ecc_stepsize_info *stepsizes;
>         int (*calc_ecc_bytes)(int stepsize, int strength);
> };
>
> int nand_try_to_match_ecc_req(struct nand_chip *chip,
>                               const struct nand_ecc_engine_caps *caps,
>                               struct nand_ecc_spec *spec)
> {
>         /*
>          * Find the most appropriate setting based on the ECC engine
>          * caps and fill the spec object accordingly.
>          * Returns 0 in case of success and a negative error code
>          * otherwise.
>          */
> }
>
> Note that nand_try_to_match_ecc_req() has to be more generic than
> denali_try_to_match_ecc_req() WRT step sizes, which will probably
> complexify the logic.


After I fiddle with this generic approach for a while,
I started to feel like giving up.

I wonder if we really want over-implementation
for covering _theoretically_ possible cases.

In practice, there are not so many ECC settings possible
on a single controller.

As for Denali IP, it would be theoretically possible to instantiate
multiple ECC engines.  However, in practice, there is no sensible
reason to do so.  At least, I do not know any real chip to support that.

So, I'd like to simplify the logic for Denali.

  - Support either 512 or 1024 ECC size.
    If there is (ever) a controller that supports both,
    1024 should be chosen.

  - ECC strength is not specified via DT, it is simply maximized.

This simplifies the logic much and I believe this is enough.

One more reason is, as we talked before,
we need to match ECC setting between Linux and firmware (boot-loader),
so anyway we end up with using a fixed setting specified by DT.


-- 
Best Regards
Masahiro Yamada
