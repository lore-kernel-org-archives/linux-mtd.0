Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9Zai-0001r4-09
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2016 15:36:10 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: fixed spansion quad enable
To: "Esponde, Joel" <Joel.Esponde@Honeywell.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
 <1479853468-119195-1-git-send-email-joel.esponde@honeywell.com>
 <a60225d9-674e-422c-aa1b-ed232e8650cb@atmel.com>
 <F6CD090A69E64C4289DC608E1C5D20242545B1DA@DE08W1305.global.ds.honeywell.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <23a5fe9d-a2d5-1577-57e1-1e9428e8a6df@denx.de>
Date: Wed, 23 Nov 2016 16:35:40 +0100
MIME-Version: 1.0
In-Reply-To: <F6CD090A69E64C4289DC608E1C5D20242545B1DA@DE08W1305.global.ds.honeywell.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/23/2016 03:27 PM, Esponde, Joel wrote:
> Hi Cyrille,
> 
> Thanks for your explanations and patience!
> I will try to avoid these "noob" mistakes next time! :-)

You can start by NOT top-posting, it's really frowned upon :)

> Joël Esponde
> Honeywell | Safety and Productivity Solutions
> 
>> -----Message d'origine-----
>> De : Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
>> Envoyé : mercredi 23 novembre 2016 11:39
>> À : Esponde, Joel <Joel.Esponde@Honeywell.com>; linux-
>> mtd@lists.infradead.org
>> Objet : Re: [PATCH v2] mtd: spi-nor: fixed spansion quad enable
>>
>> Hi Joel,
>>
>> Le 22/11/2016 à 23:24, Joël Esponde a écrit :
>>> With the S25FL127S nor flash part, each writing to the configuration register
>> takes hundreds of ms. During that  time, no more accesses to the flash
>> should be done (even reads).
>>>
>>> This commit adds a wait loop after the register writing until the flash
>> finishes its work.
>>>
>>> This issue could make rootfs mounting fail when the latter was done too
>> much closely to this quad enable bit setting step. And in this case, a driver as
>> UBIFS may try to recover the filesystem and may broke it completely.
>>
>> Just few formal remarks about common usage and according to
>> Documentation/process/submitting-patches.rst:
>> - The summary phrase of the subject line should describe changes in
>> imperative
>>   mood, so please use something like
>>   "mtd: spi-nor: fix spansion_quad_enable..." instead of
>>   "mtd: spi-nor: fixED spansion_quad_enable...".
>> - The commit message should be line wrapped at 75 columns.
>> - You must add your "Signed-off-by:". It is mandatory to know who's
>> introduced
>>   the commit when browsing the logs.
>>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c
>>> b/drivers/mtd/spi-nor/spi-nor.c index d0fc165..a945122 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -1255,7 +1255,11 @@ static int spansion_quad_enable(struct spi_nor
>> *nor)
>>>  		return -EINVAL;
>>>  	}
>>>
>>> -	/* read back and check it */
>>> +	ret = spi_nor_wait_till_ready(nor);
>>> +	if (ret)
>> I agree this is not done in macronix_quad_enable() but maybe a dev_err()
>> message may notify about the reason of the failure, just like what is done for
>> write_sr_cr() and read_cr().
>> This point is optional!
>>
>>> +		return ret;
>>> +
>> It seems there is a tab at the beginning of the empty line above.
>>
>>> +	/* read CR and check it */
>> Your patch deals with the missing call of spi_nor_wait_till_ready() so there is
>> no strong reason to also modify the comment about read_cr().
>> The general idea is to make the patch modify only what needs to be.
>>
>>>  	ret = read_cr(nor);
>>>  	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
>>>  		dev_err(nor->dev, "Spansion Quad bit not set\n");
>>>
>>
>> Finally, it may help you to run the scripts/checkpatch.pl tool on your patch so
>> this script reports you any warnings and errors in the syntax before
>> submitting your patch.
>>
>> Best regards,
>>
>> Cyrille
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


-- 
Best regards,
Marek Vasut
