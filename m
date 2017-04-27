Received: from 15.mo5.mail-out.ovh.net ([178.33.107.29])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3kTb-0003hM-Gw
 for linux-mtd@lists.infradead.org; Thu, 27 Apr 2017 14:33:02 +0000
Received: from player760.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id D7156EA1B0
 for <linux-mtd@lists.infradead.org>; Thu, 27 Apr 2017 16:32:34 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: stm32: remove broken MODULE_ALIAS
To: Ludovic BARRE <ludovic.barre@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Marek Vasut <marek.vasut@gmail.com>
References: <20170427111001.2587551-1-arnd@arndb.de>
 <dc7d8b5e-0f0e-1593-4c6b-0c93a828818c@st.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <48e14a7d-d105-3773-626f-04446a19254d@wedev4u.fr>
Date: Thu, 27 Apr 2017 16:32:20 +0200
MIME-Version: 1.0
In-Reply-To: <dc7d8b5e-0f0e-1593-4c6b-0c93a828818c@st.com>
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

Le 27/04/2017 à 14:17, Ludovic BARRE a écrit :
> thanks a lot Arnd
>

Indeed, thanks Arnd!

Since commit ("mtd: spi-nor: add driver for STM32 quad spi flash
controller") was included with the spi-nor PR for 4.12 I've sent
yesterday to Brian, I will check with him to know how he wants us to
proceed:

- If Brian has not started yet to review the PR and if he agrees on
that, I can rework a little bit the history in github/spi-nor to squash
Arnd's patch into Ludovic's one.
Ludovic's patch is already in linux-next but not yet in any release
candiate.

- or I can send an new PR keeping the fixup patch aside.

Best regards,

Cyrille


> Oops, I've not tested in Module :-(.
> Just tested in built-in, and used bind/unbind and device tree overlays.
> 
> BR
> Ludo
> On 04/27/2017 01:09 PM, Arnd Bergmann wrote:
>> The MODULE_ALIAS statement refers to a macro that has never been defined
>> in this driver, causing a build error:
>>
>> drivers/mtd/spi-nor/stm32-quadspi.c:694:150: error: expected ',' or
>> ';' before 'DRIVER_NAME'
>>
>> Unless there is a specific alias we need other then the driver name,
>> we don't need an alias here and can simply remove the line to fix the
>> build.
>>
>> Fixes: dc5e400611c5 ("mtd: spi-nor: add driver for STM32 quad spi
>> flash controller")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/mtd/spi-nor/stm32-quadspi.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c
>> b/drivers/mtd/spi-nor/stm32-quadspi.c
>> index 90d9152ddf98..1056e7408d2a 100644
>> --- a/drivers/mtd/spi-nor/stm32-quadspi.c
>> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
>> @@ -691,7 +691,6 @@ static struct platform_driver stm32_qspi_driver = {
>>   };
>>   module_platform_driver(stm32_qspi_driver);
>>   -MODULE_ALIAS("platform:" DRIVER_NAME);
>>   MODULE_AUTHOR("Ludovic Barre <ludovic.barre@st.com>");
>>   MODULE_DESCRIPTION("STMicroelectronics STM32 quad spi driver");
>>   MODULE_LICENSE("GPL v2");
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
