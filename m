Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE2AC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQf7Arug5szuwxK8U3qP7yu/EfrVVNwfV6yL9CR5+gk=; b=bAwBLEdnwem6LW
	F45dD/27sJIltXJEJrauuXYfJ01j4LqLCC8M8OM7hTO6oy0Dp67jzhnITQMheNq8AvMJ2F/FNEtdP
	JGdvsM0C8uvJ4tynmFPwhnHEjbE4wE6NE8/XgqibS7qnk9sbp8JUxNNyaI7i7kYaTRrookIDMep/H
	t4Ivw9aKnutIewydtZSxH9FbUm7Y/2VztuCSoCq1RAuaesdSvyf62Ul7GhSxQlX33n3PY1QLe0Zjx
	s89N9+3fJpiTlAxdeC+8GtYamXVlBm+SBZIQc3YSvpiqWRejoL2RDTZMEZfcGLFOmiGuOtNpbynXm
	UEtCD4QNC7unqIFaKxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUqvV-00GOlz-6e; Thu, 17 Mar 2022 14:16:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUqvS-00GOl8-Lg
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 14:16:28 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nUqvK-0007yR-L5; Thu, 17 Mar 2022 15:16:18 +0100
Message-ID: <201907b1-c43a-8c45-7ab1-4a4606591bef@pengutronix.de>
Date: Thu, 17 Mar 2022 15:16:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 2/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Tokunori Ikegami <ikegami.t@gmail.com>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org
References: <20220316155455.162362-1-ikegami.t@gmail.com>
 <20220316155455.162362-3-ikegami.t@gmail.com> <20220316182100.6e2e5876@xps13>
 <01fed0aa-8844-1db9-f167-e7e7944bc092@ti.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <01fed0aa-8844-1db9-f167-e7e7944bc092@ti.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_071626_749604_D27FC0F5 
X-CRM114-Status: GOOD (  27.39  )
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

Hello Vignesh,

On 17.03.22 11:01, Vignesh Raghavendra wrote:
> 
> 
> On 16/03/22 10:51 pm, Miquel Raynal wrote:
>> Hi Tokunori,
>>
>> ikegami.t@gmail.com wrote on Thu, 17 Mar 2022 00:54:54 +0900:
>>
>>> As pointed out by this bug report [1], buffered writes are now broken on
>>> S29GL064N. This issue comes from a rework which switched from using chip_good()
>>> to chip_ready(), because DQ true data 0xFF is read on S29GL064N and an error
>>> returned by chip_good().
>>
>> Vignesh, I believe you understand this issue better than I do, can you
>> propose an improved commit log?
> 
> How about:
> 
> Since commit dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to
> check correct value") buffered writes fail on S29GL064N. This is
> because, on S29GL064N, reads return 0xFF at the end of DQ polling for
> write completion, where as, chip_good() check expects actual data
> written to the last location to be returned post DQ polling completion.
> Fix is to revert to using chip_good() for S29GL064N which only checks
> for DQ lines to settle down to determine write completion.

Message sounds good to me with one remark: The issue is independent of
whether buffered writes are used or not. It's just because buffered writes
are the default, that it was broken by dfeae1073583 ("mtd: cfi_cmdset_0002:
Change write buffer to check correct value"). The word write case was broken
by 37c673ade35c ("mtd: cfi_cmdset_0002: Use chip_good() to retry in
do_write_oneword()"), so the commit message should probably reference
both. as this commit indeed fixes both FORCE_WORD_WRITE == 0 and == 1.

Thanks,
Ahmad


> 
>>
>>> One way to solve the issue is to revert the change
>>> partially to use chip_ready for S29GL064N.
>>>
>>> [1] https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
>>>
>>> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
>>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
>>> Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>>> Cc: stable@vger.kernel.org
>>> ---
>>>  drivers/mtd/chips/cfi_cmdset_0002.c | 25 +++++++++++++++++++++----
>>>  1 file changed, 21 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
>>> index e68ddf0f7fc0..6c57f85e1b8e 100644
>>> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
>>> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
>>> @@ -866,6 +866,23 @@ static int __xipram chip_check(struct map_info *map, struct flchip *chip,
>>>  		chip_check(map, chip, addr, &datum); \
>>>  	})
>>>  
>>> +static bool __xipram cfi_use_chip_ready_for_write(struct map_info *map)
>>
>> At the very least I would call this function:
>> cfi_use_chip_ready_for_writes()
>>
>> Yet, I still don't fully get what chip_ready is versus chip_good.
>>
>>> +{
>>> +	struct cfi_private *cfi = map->fldrv_priv;
>>> +
>>> +	return cfi->mfr == CFI_MFR_AMD && cfi->id == 0x0c01;
>>> +}
>>> +
>>> +static int __xipram chip_good_for_write(struct map_info *map,
>>> +					struct flchip *chip, unsigned long addr,
>>> +					map_word expected)
>>> +{
>>> +	if (cfi_use_chip_ready_for_write(map))
>>> +		return chip_ready(map, chip, addr);
>>
>> If possible and not too invasive I would definitely add a "quirks" flag
>> somewhere instead of this cfi_use_chip_ready_for_write() check.
>>
>> Anyway, I would move this to the chip_good() implementation directly so
>> we partially hide the quirks complexity from the core.
> 
> Yeah, unfortunately this driver does not use quirk flags and tends to
> hide quirks behind bool functions like above
> 
> Regards
> Vignesh
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
