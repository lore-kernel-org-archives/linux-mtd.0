Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A5EC25B4F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2024 19:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnLZCq4Bu0rkpw4S06WaNw0ox2WqmCRtQGUKNVtalbY=; b=boHvCvI/N3KecK
	/Y9TiVSFuTlaH9RPWk2o1UUJW4iayj9B+rcDaeV+4bHgvQD39I+ZAzxTYJ9eENMuTbMtUVdf2XJrZ
	uEL9A9wirhnRdIfhKzHUspCH/trLMgZQ7x4+PQjqFVytOOnoH+5E9DHzIjdz9oJGvhSUlCJAs0mab
	V5SVr7yugfKBkvG1bLWx61Ws7Il1+lyaM0CedhO/gh7pOmQIwtEp10lpT8K1koCOMnp04PdkhRvQI
	uQpeUyZbhc39KYvcFoXTLdC7SC1qEhRaQ2PP55QO6PKEFZ8BbjcAt+Yk6umWvOJ3qE0Pi7ASf2NTX
	H4A892+3+68P5IvoLs3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mno-0000000GgZN-2auu;
	Wed, 08 May 2024 19:18:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mnk-0000000GgYW-3Sw2
	for linux-mtd@lists.infradead.org;
	Wed, 08 May 2024 19:18:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E04C61447;
	Wed,  8 May 2024 19:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CF2C113CC;
	Wed,  8 May 2024 19:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715195883;
	bh=7Z+dow/wYnQpsydDXRcGA9YIG/FXSQ1KPQIUUAkiOzY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bbRkWQmFrGim7pO7PgTY7Yo8FFDh7qNPa+SJMYqbqFUI1T2YSZsZicA6fy+bCe+ZP
	 bQyouUqkRVWOUClEIJPvYLhM1ilDnwPNoF01DNKxSZvZV87hCVlJgUlKYcqA7+fSlf
	 XK2rLrIN0w4tfs0vqm4kpoyoM96vSjPOnp+sIFqyEoWiGgib6RXF05e1xTbujX16Fh
	 RFD7wxAcamXDVXFjsF75mMaDVgf6a1aZW3bHE68FM4nG4hZWYkiIrU5kdUjEyseJct
	 Tegq+uPcca75o8d1WHkBYEUqAPCJt0FfG5IPWg9DHMWojrNtL+xp1h8jcv7tuhIIhG
	 LuOmTIQ8e+HiQ==
Message-ID: <cb8df682-c006-46d7-bcf1-7a0548e65c98@kernel.org>
Date: Wed, 8 May 2024 21:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] eeprom: 93xx46: drop unneeded MODULE_ALIAS
To: Arnd Bergmann <arnd@arndb.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240414154957.127113-1-krzk@kernel.org>
 <20240414154957.127113-3-krzk@kernel.org>
 <Zju8HpBCiOjjIZ1j@smile.fi.intel.com>
 <6599e2a3-3b04-4ea2-aa5c-a916b66c8009@kernel.org>
 <ZjvEam5paLD0Iv6V@smile.fi.intel.com>
 <9a26dac6-d776-4b84-830d-6f622719d7eb@kernel.org>
 <5b29d981-aa8a-413e-8250-5fb33802f32d@app.fastmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5b29d981-aa8a-413e-8250-5fb33802f32d@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_121805_002384_DFD2E8FF 
X-CRM114-Status: GOOD (  17.87  )
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

On 08/05/2024 21:11, Arnd Bergmann wrote:
> On Wed, May 8, 2024, at 20:44, Krzysztof Kozlowski wrote:
>> On 08/05/2024 20:28, Andy Shevchenko wrote:
>>> On Wed, May 08, 2024 at 08:15:00PM +0200, Krzysztof Kozlowski wrote:
>>>> On 08/05/2024 19:53, Andy Shevchenko wrote:
>>>>> On Sun, Apr 14, 2024 at 05:49:57PM +0200, Krzysztof Kozlowski wrote:
>>>>>> The ID table already has respective entry and MODULE_DEVICE_TABLE and
>>>>>> creates proper alias for SPI driver.  Having another MODULE_ALIAS causes
>>>>>> the alias to be duplicated.
>>>
>>> ...
>>>
>>>>>>  MODULE_ALIAS("spi:93xx46");
>>>>>
>>>>> I was stumbled over this (leftover?).
>>>>> Commit message doesn't elaborate this bit.
>>>>> Any comments?
>>>>
>>>> It is not present in ID table and commit msg removes only duplicated
>>>> aliases. That alias has meaning - someone might be actually relying on it.
>>>
>>> It seems no users for it. The only user of platform data of this EEPROM uses
>>> board files which AFAIU bypasses modalias matching.
>>
>> I don't think that's correct. The modalias of SPI board is there on
>> purpose. 
> 
> Right, but I think a better workaround would have been to change
> the board_info to pick a modalias that is part of the ID table:
> 
> --- a/drivers/misc/eeprom/digsy_mtc_eeprom.c
> +++ b/drivers/misc/eeprom/digsy_mtc_eeprom.c
> @@ -76,7 +76,7 @@ static struct gpiod_lookup_table eeprom_spi_gpiod_table = {
>  
>  static struct spi_board_info digsy_mtc_eeprom_info[] __initdata = {
>         {
> -               .modalias               = "93xx46",
> +               .modalias               = "eeprom-93xx46",
>                 .max_speed_hz           = 1000000,
>                 .bus_num                = EE_SPI_BUS_NUM,
>                 .chip_select            = 0,
> 

That's kind of independent change. This commit *only* removed duplicated
aliases, thus should have not functional impact except dropping
redundant code. What you propose is to change spi board matching, which
is reasonable, just a different thing.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
