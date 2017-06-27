Received: from 2.mo173.mail-out.ovh.net ([178.33.251.49])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPx07-0004sa-GW
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 20:22:21 +0000
Received: from player739.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 55D7F5AF45
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2017 22:21:56 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: cqspi: remove duplicate const
To: Marek Vasut <marek.vasut@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20170627153508.1329697-1-arnd@arndb.de>
 <77950900-a78b-b5b7-5baf-1df7075fc6d3@gmail.com>
 <f5b3de86-ff3d-7d4d-65b0-83b45079461f@wedev4u.fr>
 <8fec019c-0e8f-b9d6-3554-d88f6735460c@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <6956fba6-ab14-fc53-1da2-c80df0adf85a@wedev4u.fr>
Date: Tue, 27 Jun 2017 22:21:47 +0200
MIME-Version: 1.0
In-Reply-To: <8fec019c-0e8f-b9d6-3554-d88f6735460c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 27/06/2017 à 21:51, Marek Vasut a écrit :
> On 06/27/2017 09:48 PM, Cyrille Pitchen wrote:
>> Le 27/06/2017 à 18:11, Marek Vasut a écrit :
>>> On 06/27/2017 05:34 PM, Arnd Bergmann wrote:
>>>> The variable was already marked 'const' before the previous
>>>> patch, but the qualifier was in an unusual place, and now the
>>>> extra 'const' causes a harmless warning:
>>>>
>>>> drivers/mtd/spi-nor/cadence-quadspi.c:1286:34: error: duplicate 'const' declaration specifier [-Werror=duplicate-decl-specifier]
>>>>
>>>> This removes the other 'const' instead.
>>>
>>> Isn't that const array const elements , thus two consts ?
>>> IMO the original code is correct.
>>
>> Indeed the 2 'const' don't have the same meaning so the original code
>> may be correct but with an array like cqspi_dt_ids[] we can't write
>> "cqspi_dt_ids = (const struct of_device_id *)<right value>;" anyway.
> 
> Not sure I understand what you're trying to say here.
>

Just that once an array like cqspi_dt_ids[] has been defined, you can
never assign it a new value later:

cqspi_dt_ids = <new value>; /* that doesn't work */

For this specific point, an array behaves like a constant pointer (but
otherwise I agree that arrays and constant pointers are not the same
things). So I guess the 2nd 'const' could be considered as implicit :)



>> So I think the 2nd 'const' is useless here then if this patch removes a
>> warning, let's apply it, right?
>>
>>>
>>>> Fixes: f993c123b461 ("mtd: spi-nor: cqspi: make of_device_ids const")
>>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>>> ---
>>>>  drivers/mtd/spi-nor/cadence-quadspi.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
>>>> index d315c326e72f..53c7d8e0327a 100644
>>>> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
>>>> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
>>>> @@ -1283,7 +1283,7 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
>>>>  #define CQSPI_DEV_PM_OPS	NULL
>>>>  #endif
>>>>  
>>>> -static const struct of_device_id const cqspi_dt_ids[] = {
>>>> +static const struct of_device_id cqspi_dt_ids[] = {
>>>>  	{.compatible = "cdns,qspi-nor",},
>>>>  	{ /* end of table */ }
>>>>  };
>>>>
>>>
>>>
>>
> 
> 
