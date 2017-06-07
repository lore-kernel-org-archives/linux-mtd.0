Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIQ62-0002ii-W4
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 01:49:21 +0000
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
 [209.85.161.179]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id v571mYTR029736
 for <linux-mtd@lists.infradead.org>; Wed, 7 Jun 2017 10:48:34 +0900
Received: by mail-yw0-f179.google.com with SMTP id 141so10081856ywe.2
 for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2017 18:48:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170606234733.0cbec509@bbrezillon>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
 <1496704922-12261-4-git-send-email-yamada.masahiro@socionext.com>
 <20170606234733.0cbec509@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 7 Jun 2017 10:48:33 +0900
Message-ID: <CAK7LNASq-tPL+bHHp9OC3GKi5M07F917kXkUT9BcdcA7-Ao2yw@mail.gmail.com>
Subject: Re: [PATCH v4 03/23] mtd: nand: add generic helpers to check, match,
 maximize ECC settings
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-mtd@lists.infradead.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Enrico Jorns <ejo@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-06-07 6:47 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Tue,  6 Jun 2017 08:21:42 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Driver are responsible for setting up ECC parameters correctly.
>> Those include:
>>   - Check if ECC parameters specified (usually by DT) are valid
>>   - Meet the chip's ECC requirement
>>   - Maximize ECC strength if NAND_ECC_MAXIMIZE flag is set
>>
>> The logic can be generalized by factoring out common code.
>>
>> This commit adds 3 helpers to the NAND framework:
>> nand_check_ecc_caps - Check if preset step_size and strength are valid
>> nand_match_ecc_req - Match the chip's requirement
>> nand_maximize_ecc - Maximize the ECC strength
>>
>> To use the helpers above, a driver needs to provide:
>>   - Data array of supported ECC step size and strength
>>   - A hook that calculates ECC bytes from the combination of
>>     step_size and strength.
>>
>> By using those helpers, code duplication among drivers will be
>> reduced.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> Changes since the previous version:
>>
>>  - Step size info holds an array of associated strengths
>>  - nand_match_ecc_req() does not take care of the case
>>    where ecc_size/strength is already set
>>  - Reflect more comments from Boris
>>
>> Previous version:
>> http://patchwork.ozlabs.org/patch/752107/
>>
>>
>> Changes in v4: None
>> Changes in v3: None
>> Changes in v2: None
>>
>>  drivers/mtd/nand/nand_base.c | 219 +++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/nand.h     |  35 +++++++
>>  2 files changed, 254 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index bdfa903..f2da4f2 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -4509,6 +4509,225 @@ static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
>>       }
>>  }
>>
>> +/**
>> + * nand_check_ecc_caps - check the sanity of preset ECC settings
>> + * @mtd: mtd info structure
>> + * @chip: nand chip info structure
>> + * @caps: ECC caps info structure
>> + *
>> + * When ECC step size and strength are already set, check if they are supported
>> + * by the controller and the calculated ECC bytes fit within the chip's OOB.
>> + * On success, the calculated ECC bytes is set.
>> + */
>> +int nand_check_ecc_caps(struct mtd_info *mtd, struct nand_chip *chip,
>> +                     const struct nand_ecc_caps *caps)
>> +{
>> +     const struct nand_ecc_step_info *stepinfo;
>> +     int avail_oobsize = mtd->oobsize - caps->oob_reserve_bytes;
>> +     int preset_step = chip->ecc.size;
>> +     int preset_strength = chip->ecc.strength;
>> +     int ecc_bytes;
>> +     int i, j;
>> +
>> +     if (WARN_ON(avail_oobsize < 0))
>> +             return -EINVAL;
>> +
>> +     if (!preset_step || !preset_strength)
>> +             return -ENODATA;
>> +
>> +     for (i = 0; i < caps->nstepinfos; i++) {
>> +             stepinfo = &caps->stepinfos[i];
>> +
>> +             if (stepinfo->stepsize != preset_step)
>> +                     continue;
>> +
>> +             for (j = 0; j < stepinfo->nstrengths; j++) {
>> +                     if (stepinfo->strengths[j] == preset_strength)
>> +                             goto found;
>> +             }
>> +     }
>> +
>> +     pr_err("ECC (step, strength) = (%d, %d) not supported on this controller",
>> +            preset_step, preset_strength);
>> +
>> +     return -ENOTSUPP;
>> +
>> +found:
>
> I prefer something like:
>
>         if (i == caps->nstepinfos) {
>                 pr_err(...);
>                 return -ENOTSUPP;
>         }
>
>         ...
>
> instead of this 'found' label.


I want to bail-out if (step, strength) matches.
In this version, the for-loop is double-nested by "step" and "strength".
In C language, it is not possible to bail-out from multi-nested loop
with a single "break;" statement.  That is why I used "found:" label to do it.

In my first version where there was a single for-loop,
I did not use the goto label.
http://patchwork.ozlabs.org/patch/752107/

Do you have any suggestion for cleaner implementation?






>> +     ecc_bytes = caps->calc_ecc_bytes(preset_step, preset_strength);
>> +     if (WARN_ON_ONCE(ecc_bytes < 0))
>> +             return ecc_bytes;
>> +
>> +     if (ecc_bytes * mtd->writesize / preset_step > avail_oobsize) {
>> +             pr_err("ECC (step, strength) = (%d, %d) does not fit in OOB",
>> +                    preset_step, preset_strength);
>> +             return -ENOSPC;
>> +     }
>> +
>> +     chip->ecc.bytes = ecc_bytes;
>> +
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(nand_check_ecc_caps);
>> +
>> +/**
>> + * nand_match_ecc_req - meet the chip's requirement with least ECC bytes
>> + * @mtd: mtd info structure
>> + * @chip: nand chip info structure
>> + * @caps: ECC engine caps info structure
>> + *
>> + * If a chip's ECC requirement is provided, try to meet it with the least
>> + * number of ECC bytes (i.e. with the largest number of OOB-free bytes).
>> + * On success, the chosen ECC settings are set.
>> + */
>> +int nand_match_ecc_req(struct mtd_info *mtd, struct nand_chip *chip,
>> +                    const struct nand_ecc_caps *caps)
>> +{
>> +     const struct nand_ecc_step_info *stepinfo;
>> +     int avail_oobsize = mtd->oobsize - caps->oob_reserve_bytes;
>> +     int req_step = chip->ecc_step_ds;
>> +     int req_strength = chip->ecc_strength_ds;
>> +     int req_corr, step_size, strength, steps, ecc_bytes, ecc_bytes_total;
>> +     int best_step, best_strength, best_ecc_bytes;
>> +     int best_ecc_bytes_total = INT_MAX;
>
> Just nitpicking, but why not -1 instead of INT_MAX?

Because nand_match_ecc_req() prefers a smaller ecc_bytes_total.
So I chose the largest int number as an init value.
If we started from -1, the following if-conditional would have no effect.

     /*
      * We assume the best is to meet the chip's requrement
      * with the least number of ECC bytes.
      */
     if (ecc_bytes_total < best_ecc_bytes_total) {
                best_ecc_bytes_total = ecc_bytes_total;
                best_step = step_size;
                best_strength = strength;
                best_ecc_bytes = ecc_bytes;
     }






>> +     int i, j;
>> +
>> +     if (WARN_ON(avail_oobsize < 0))
>> +             return -EINVAL;
>> +
>> +     /* No information provided by the NAND chip */
>> +     if (!req_step || !req_strength)
>> +             return -ENOTSUPP;
>> +
>> +     /* number of correctable bits the chip requires in a page */
>> +     req_corr = mtd->writesize / req_step * req_strength;
>> +
>> +     for (i = 0; i < caps->nstepinfos; i++) {
>> +             stepinfo = &caps->stepinfos[i];
>> +             step_size = stepinfo->stepsize;
>> +
>> +             for (j = 0; j < stepinfo->nstrengths; j++) {
>> +                     strength = stepinfo->strengths[j];
>> +
>> +                     /*
>> +                      * If both step size and strength are smaller than the
>> +                      * chip's requirement, it is not easy to compare the
>> +                      * resulted reliability.
>> +                      */
>> +                     if (step_size < req_step && strength < req_strength)
>> +                             continue;
>> +
>> +                     if (mtd->writesize % step_size)
>> +                             continue;
>> +
>> +                     steps = mtd->writesize / step_size;
>> +
>> +                     ecc_bytes = caps->calc_ecc_bytes(step_size, strength);
>> +                     if (WARN_ON_ONCE(ecc_bytes < 0))
>> +                             continue;
>> +                     ecc_bytes_total = ecc_bytes * steps;
>> +
>> +                     if (ecc_bytes_total > avail_oobsize ||
>> +                         strength * steps < req_corr)
>> +                             continue;
>> +
>> +                     /*
>> +                      * We assume the best is to meet the chip's requrement
>> +                      * with the least number of ECC bytes.
>> +                      */
>> +                     if (ecc_bytes_total < best_ecc_bytes_total) {
>> +                             best_ecc_bytes_total = ecc_bytes_total;
>> +                             best_step = step_size;
>> +                             best_strength = strength;
>> +                             best_ecc_bytes = ecc_bytes;
>> +                     }
>> +             }
>> +     }
>> +
>> +     if (best_ecc_bytes_total == INT_MAX)
>> +             return -ENOTSUPP;
>> +
>> +     chip->ecc.size = best_step;
>> +     chip->ecc.strength = best_strength;
>> +     chip->ecc.bytes = best_ecc_bytes;
>> +
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(nand_match_ecc_req);
>> +
>> +/**
>> + * nand_maximize_ecc - choose the max ECC strength available
>> + * @mtd: mtd info structure
>> + * @chip: nand chip info structure
>> + * @caps: ECC engine caps info structure
>> + *
>> + * Choose the max ECC strength that is supported on the controller, and can fit
>> + * within the chip's OOB.  On success, the chosen ECC settings are set.
>> + */
>> +int nand_maximize_ecc(struct mtd_info *mtd, struct nand_chip *chip,
>> +                   const struct nand_ecc_caps *caps)
>> +{
>> +     const struct nand_ecc_step_info *stepinfo;
>> +     int avail_oobsize = mtd->oobsize - caps->oob_reserve_bytes;
>> +     int step_size, strength, steps, ecc_bytes, corr;
>> +     int best_corr = 0;
>> +     int best_step = 0;
>> +     int best_strength, best_ecc_bytes;
>> +     int i, j;
>> +
>> +     if (WARN_ON(avail_oobsize < 0))
>> +             return -EINVAL;
>> +
>> +     for (i = 0; i < caps->nstepinfos; i++) {
>> +             stepinfo = &caps->stepinfos[i];
>> +             step_size = stepinfo->stepsize;
>> +
>> +
>
> Extra blank line here.

OK. I will remove it.



>> +
>> +/**
>> + * struct nand_ecc_caps - capability of ECC engine
>> + * @stepinfos: array of ECC step information
>> + * @nstepinfos: number of ECC step information
>> + * @calc_ecc_bytes: driver's hook to calculate ECC bytes per step
>> + * @oob_reserve_bytes: number of bytes in OOB that must be reserved
>> + */
>> +struct nand_ecc_caps {
>> +     const struct nand_ecc_step_info *stepinfos;
>> +     int nstepinfos;
>> +     int (*calc_ecc_bytes)(int step_size, int strength);
>> +     int oob_reserve_bytes;
>
> Why is this needed? I thought we agreed on passing oobavail as an
> argument to these helper funcs. If a driver needs to reserve a few OOB
> bytes, then doing mtd->oobsize - rsvd_bytes is not such a big deal.


oobavail is really chip-dependent, so I agreed
that it can not be included in the caps struct.

Then, I flipped the logic.
The number of reserved bytes will be more chip-independent.
But, oob_reserve_bytes may not necessarily a fixed value.

I can pass oobavail as a function argument.


-- 
Best Regards
Masahiro Yamada
