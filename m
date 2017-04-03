Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cusUr-0001so-Gt
 for linux-mtd@lists.infradead.org; Mon, 03 Apr 2017 03:17:39 +0000
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
 [209.85.161.173]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id v333GZKq007935
 for <linux-mtd@lists.infradead.org>; Mon, 3 Apr 2017 12:16:36 +0900
Received: by mail-yw0-f173.google.com with SMTP id d191so58059571ywe.2
 for <linux-mtd@lists.infradead.org>; Sun, 02 Apr 2017 20:16:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170331114659.4964be35@bbrezillon>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-15-git-send-email-yamada.masahiro@socionext.com>
 <20170330160238.59e5a2c1@bbrezillon>
 <CAK7LNARUKwMHd79ALDx_SDY9XKcHPY96xTAOMQx6XarFgwb-AA@mail.gmail.com>
 <20170331114659.4964be35@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 3 Apr 2017 12:16:34 +0900
Message-ID: <CAK7LNAToTmirpkhNmPCLhcTXG_SFqS762mEGK3mjyqLKXuWa1Q@mail.gmail.com>
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



2017-03-31 18:46 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:

> You can try something like that when no explicit ecc.strength and
> ecc.size has been set in the DT and when ECC_MAXIMIZE was not passed.
>
> static int
> denali_get_closest_ecc_strength(struct denali_nand_info *denali,
>                                 int strength)
> {
>         /*
>          * Whatever you need to select a strength that is greater than
>          * or equal to strength.
>          */
>
>         return X;
> }


Is here anything specific to Denali?


> static int denali_try_to_match_ecc_req(struct denali_nand_info *denali)
> {
>         struct nand_chip *chip = &denali->nand;
>         struct mtd_info *mtd = nand_to_mtd(chip);
>         int max_ecc_bytes = mtd->oobsize - denali->bbtskipbytes;
>         int ecc_steps, ecc_strength, ecc_bytes;
>         int ecc_size = chip->ecc_step_ds;
>         int ecc_strength = chip->ecc_strength_ds;
>
>         /*
>          * No information provided by the NAND chip, let the core
>          * maximize the strength.
>          */
>         if (!ecc_size || !ecc_strength)
>                 return -ENOTSUPP;
>
>         if (ecc_size > 512)
>                 ecc_size = 1024;
>         else
>                 ecc_size = 512;
>
>         /* Adjust ECC step size based on hardware support. */
>         if (ecc_size == 1024 &&
>             !(denali->caps & DENALI_CAP_ECC_SIZE_1024))
>                 ecc_size = 512;
>         else if(ecc_size == 512 &&
>                 !(denali->caps & DENALI_CAP_ECC_SIZE_512))
>                 ecc_size = 1024;
>
>         if (ecc_size < chip->ecc_size_ds) {
>                 /*
>                  * When the selected size if smaller than the expected
>                  * one we try to use the same strength but on 512 blocks
>                  * so that we can still fix the same number of errors
>                  * even if they are concentrated in the first 512bytes
>                  * of a 1024bytes portion.
>                  */
>                 ecc_strength = chip->ecc_strength_ds;
>                 ecc_strength = denali_get_closest_ecc_strength(denali,
>                                                                ecc_strength);
>         } else {
>                 /* Always prefer 1024bytes ECC blocks when possible. */
>                 if (ecc_size != 1024 &&
>                     (denali->caps & DENALI_CAP_ECC_SIZE_1024) &&
>                     mtd->writesize > 1024)
>                         ecc_size = 1024;
>
>                 /*
>                  * Adjust the strength based on the selected ECC step
>                  * size.
>                  */
>                 ecc_strength = DIV_ROUND_UP(ecc_size,
>                                             chip->ecc_step_ds) *
>                                chip->ecc_strength_ds;
>         }
>
>         ecc_bytes = denali_calc_ecc_bytes(ecc_size,
>                                           ecc_strength);
>         ecc_bytes *= mtd->writesize / ecc_size;
>
>         /*
>          * If we don't have enough space, let the core maximize
>          * the strength.
>          */
>         if (ecc_bytes > max_ecc_bytes)
>                 return -ENOTSUPP;
>
>         chip->ecc.strength = ecc_strength;
>         chip->ecc.size = ecc_size;
>
>         return 0;
> }


As a whole, this does not seem to driver-specific.


[1] A driver provides some pairs of (ecc_strength, ecc_size)
    it can support.

[2] The core framework knows the chip's requirement
    (ecc_strength_ds, ecc_size_ds).


Then, the core framework provides a function
to return a most recommended (ecc_strength, ecc_size).



struct nand_ecc_spec {
       int ecc_strength;
       int ecc_size;
};

/*
 * This function choose the most recommented (ecc_str, ecc_size)
 * "recommended" means: minimum ecc stregth that meets
 * the chip's requirment.
 *
 *
 * @chip   - nand_chip
 * @controller_ecc_spec - Array of (ecc_str, ecc_size) supported by the
                          controller. (terminated by NULL as sentinel)
 */
struct nand_ecc_spec * nand_try_to_match_ecc_req(struct nand_chip *chip,
                                                 struct nand_ecc_spec
*controller_ecc_spec)
{
      /*
       * Return the pointer to the most recommended
       * struct nand_ecc_spec.
       * If nothing suitable found, return NULL.
       */
}



Then, Denali driver can call it:


        recommended_ecc_spec = nand_try_to_match_ecc_req(chip,
                                                         denali->ecc_spec);
        if (recommended_ecc_spec) {
                chip->ecc.strength = recommended_ecc_spec.ecc_strength;
                chip->ecc.size = recommended_ecc_spec.ecc_size;
        } else {
                /*
                 * Do something  (for example, maximize the ECC)
                 */
        }





It seems weird to force this to the Denali driver.



-- 
Best Regards
Masahiro Yamada
