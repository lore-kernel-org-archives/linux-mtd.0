Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C4BC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Feb 2022 06:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75r/RhwrhYOkMMQkNqAdQlVeljYNWuxy/aUdGi5LfnU=; b=0asMlzrtaCnsDA
	LlqRIBD1jxKVQkT4Ds8bd9myLiysNVdFtUNzLFo7Zs8yKx5FYQ+iX4/tQFacPBWcO8MSSMLXKV57n
	+XYLNYZSiy0Kfihqq+EjeRvTSRXrh7aNB9OzimX38jFErHS1jZQstNVs6M3K7bqNmIikmSoVpfRJo
	CpcYpgtBDESTJGenhWVmUwAmskR4JO2iLIqbxxlPG7Oj16DT9b4BdcCjzVHHmLlGTaukbpXMonV6/
	g1ywXPKCkpukHzVHurNSfQVjG/7ESHev5X3VsS9XEsPHUbMvwVpJBryKrMoc035OJ7MYwpZdvdkQX
	WJzNUh2M3TpkbgO1syGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nODT4-008ty2-Ak; Sun, 27 Feb 2022 06:55:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nODSz-008txb-1O
 for linux-mtd@bombadil.infradead.org; Sun, 27 Feb 2022 06:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=uGkwfFG4oU2IF8mA/LqOVsaAtXKwdEqo5q9NlTqW6Ec=; b=tFxG6LJoMhStLrLnbYRZVqD7Tw
 E3FYoNCTtueEYnqHYSO80ZXl6SzegIrNC5IrXFLppG00CEdyR/kCTahiULtivSeoqhldEr7ELzMlT
 jfG5l13oGqF+I5Oeq2EY6k6nLcP+CWeLpy8AY1c8Nfg4Ss5WUQA1v9XUj/X/+wkL8jq/C3eqZhJYj
 hoiIwAwOS8dDYv5AchG+VXxl/oMrU771IfhJltvYHZ2Fyd7h+hpIiy+3ilTuT+/qpdaxjTRSy19vg
 VD2j3Nk4TkAG/8ZpPaQJ2yoojBAiT6C4b0HBW54sdloOzBqsuPCBdI7asIb1bFAZuO6En+RvASvkY
 Ghdciz9Q==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nODSw-007N3w-58; Sun, 27 Feb 2022 06:55:34 +0000
Message-ID: <4bbe337e-8cd8-a4d6-303d-d5aa21bee2e0@infradead.org>
Date: Sat, 26 Feb 2022 22:55:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] mtd: rawnand: omap2: Actually prevent invalid
 configuration and build error
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Roger Quadros <rogerq@kernel.org>
Cc: miquel.raynal@bootlin.com, krzysztof.kozlowski@canonical.com,
 vigneshr@ti.com, nm@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220220004415.GA1519274@roeck-us.net>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220220004415.GA1519274@roeck-us.net>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 2/19/22 16:44, Guenter Roeck wrote:
> On Sat, Feb 19, 2022 at 09:36:00PM +0200, Roger Quadros wrote:
>> The root of the problem is that we are selecting symbols that have
>> dependencies. This can cause random configurations that can fail.
>> The cleanest solution is to avoid using select.
>>
>> This driver uses interfaces from the OMAP_GPMC driver so we have to
>> depend on it instead.
>>
>> Fixes: 4cd335dae3cf ("mtd: rawnand: omap2: Prevent invalid configuration and build error")
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> 
>> ---
>>  drivers/mtd/nand/raw/Kconfig | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
>> index 36e697456ec4..9b078e78f3fa 100644
>> --- a/drivers/mtd/nand/raw/Kconfig
>> +++ b/drivers/mtd/nand/raw/Kconfig
>> @@ -42,8 +42,7 @@ config MTD_NAND_OMAP2
>>  	tristate "OMAP2, OMAP3, OMAP4 and Keystone NAND controller"
>>  	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
>>  	depends on HAS_IOMEM
>> -	select MEMORY
>> -	select OMAP_GPMC
>> +	depends on OMAP_GPMC
>>  	help
>>  	  Support for NAND flash on Texas Instruments OMAP2, OMAP3, OMAP4
>>  	  and Keystone platforms.
>> -- 
>> 2.17.1
>>

-- 
~Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
