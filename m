Received: from us2.outbound.mailhostbox.com ([208.91.199.209])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQYtZ-00042o-Rq
 for linux-mtd@lists.infradead.org; Sun, 07 Sep 2014 09:36:30 +0000
Message-ID: <540C26F7.7020005@pek-sem.com>
Date: Sun, 07 Sep 2014 15:05:51 +0530
From: pekon <pekon@pek-sem.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 2/3] nand: omap2: Remove horrible ifdefs to fix module
 probe
References: <1410033389-32357-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410033389-32357-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <540B785C.3070400@pek-sem.com> <20140906231728.GA4663@arch.cereza>
In-Reply-To: <20140906231728.GA4663@arch.cereza>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 Tony Lindgren <tony@atomide.com>, linux-mtd@lists.infradead.org,
 linux-omap <linux-omap@vger.kernel.org>,
 =?UTF-8?B?R3VpZG8gTWFydMOtbmV6?= <guido@vanguardiasur.com.ar>,
 Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Sunday 07 September 2014 04:47 AM, Ezequiel Garcia wrote:
> On 07 Sep 02:40 AM, pekon wrote:

>> [...]
>>
>>> diff --git a/include/linux/platform_data/elm.h b/include/linux/platform_data/elm.h
>>> index 780d1e9..25d1bca 100644
>>> --- a/include/linux/platform_data/elm.h
>>> +++ b/include/linux/platform_data/elm.h
>>> @@ -42,8 +42,22 @@ struct elm_errorvec {
>>>   	int error_loc[16];
>>>   };
>>>
>>> +#if IS_ENABLED(CONFIG_MTD_NAND_OMAP_BCH)
>>>   void elm_decode_bch_error_page(struct device *dev, u8 *ecc_calc,
>>>   		struct elm_errorvec *err_vec);
>>>   int elm_config(struct device *dev, enum bch_ecc bch_type,
>>>   	int ecc_steps, int ecc_step_size, int ecc_syndrome_size);
>>> +#else
>>> +void elm_decode_bch_error_page(struct device *dev, u8 *ecc_calc,
>>> +		struct elm_errorvec *err_vec)
>>> +{
>>> +}
>>> +
>>> +int elm_config(struct device *dev, enum bch_ecc bch_type,
>>> +	int ecc_steps, int ecc_step_size, int ecc_syndrome_size)
>>> +{
>>> +	return -ENOSYS;
>>> +}
>>> +#endif /* CONFIG_MTD_NAND_ECC_BCH */
>>> +
>>>   #endif /* __ELM_H */
>>>
>> If I'm not wrong, this is all you need in this patch
>> empty functions for CONFIG_MTD_NAND_ECC_BCH exposed symbols are already
>> handled in /include/linux/mtd/nand_bch.h
>>
>> So, after this change, you can most of #ifdefs and IS_ENABLED()
>> and this patch should be simplified.
>>
>
> If I understand your proposal correctly you are suggesting to drop the
> checks for CONFIG_MTD_NAND_ECC_BCH, CONFIG_MTD_NAND_OMAP_BCH, and the ELM
> devicetree node.
>
Absolutely ..
(1) Just the change marked above handles whether
     CONFIG_MTD_NAND_OMAP_BCH is defined or not.
(2) Same way nand_bch.c takes care whether CONFIG_MTD_NAND_ECC_BCH is
     defined or not.
(3) And gpmc.c @@gpmc_probe_nand_child(...) already checks for
     ELM DTS node.

> However, I'd say that change is even more invasive than this one. This commit
> merely replaces the current #ifdefs check with IS_ENABLED and tries to do so
> in a cleaner way.
>
I would say you can get rid of most of #ifdefs and IS_ENABLED()
in this patch itself. And testing it that should be easy, you just
need to compile with CONFIG_MTD_NAND_xxx_BCH enabled one at a time.

> This is done on purpose, to keep the current behavior as much as possible.
>
> In addition, if we don't check for the configs explicitly at probe time,
> we would only defer the error until some later point, for instance in the call to
> nand_chip->ecc.correct(). I don't think that's user-friendly.
>
As ECC-scheme is selected in GPMC driver based on DTS settings, so
any mis-match is easily handled there.
Moreover, error will occur when we change ECC-scheme on-the-fly,
which is still not supported by framework, and require many other
updates if we plan to support that in near future.
So considering ECC-scheme as static configuration is a safe assumption.

But surely you can drop new check in omap2_nand_ecc_check(), which
is already covered in @@gpmc_probe_nand_child(...)

However, I leave it to you and rogerq@ti.com (as he currently
maintains OMAP NAND driver from TI side) to decide how to go about it.


with regards, pekon

------------------------
Powered by BigRock.com
