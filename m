Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F22C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:23:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 950BD2067D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oh8EfV0P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eaxlabs.cz header.i=@eaxlabs.cz header.b="XjaCUP7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 950BD2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eaxlabs.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MuvptypYEI7+CD+qlmUl3DIwHshZZA8z1QH00w5Kl8c=; b=oh8EfV0PzPXbVIKmu38oBqvY7
	nERAitFKrS4UPQtV6u74N8ATuw/OAnn0RQWBU7yZp761oPB4D1nU1A3tV4nprNg1e0zWAWb22jeCH
	gAKafVaI1Jczs4QLRrO1wk0TiDHtEn/ysJ9ZfevTqOWY/5PS4CNVTh2JcYrtE/WmI8dnZ2soreP4+
	jsUPJmwGGxnTA9M46TrXmevlSZ5miXlu+2UNUXYDQmmUvB3SUnX8xOyIFDuaBmDJLZLnEYhR6jICp
	z+mNd6fd9/rTw0QCNz2BcI21X/NrTn4Gr1tBPTuNZIRh8f4AWi/FBasGDkfUoZgudb0hbnogZ2g7J
	Hhd0mbiPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipaau-0001eB-F4; Thu, 09 Jan 2020 16:23:36 +0000
Received: from ms9.eaxlabs.cz ([147.135.177.209])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipaVA-0003iU-96
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 16:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=XxKBnJNt9e56ZyYpPr2hAC9xIc4T57rxccAPh3vRQeg=; 
 b=XjaCUP7mKXP2VXRj8RRoOZW/XYPNwgONi0ntcJO2YjeTt6KQpw59oSJeI0bMlTkDPBWdWUQC0LZgXBeUE2ice+ywQ/sAcsrBoro6crgyHy5i6+ZWEVHocE7BPMOJq5XgDbv9uJ3XXDVkdoFKinz11MbYFZ45/fqr5cHmmxGfDr8=;
Received: from [82.99.129.6] (helo=[10.76.6.116])
 by ms9.eaxlabs.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <devik@eaxlabs.cz>)
 id 1ipaV1-00068I-Lx; Thu, 09 Jan 2020 17:17:33 +0100
Subject: Re: [PATCH] mtd: rawnand: Fix unexpected timeouts in waitrdy
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20191210150319.3125-1-devik@eaxlabs.cz>
 <20200109163752.621c6248@xps13>
From: Martin DEVERA <devik@eaxlabs.cz>
Message-ID: <73164aea-d889-21e4-4e7d-345ebd4e5197@eaxlabs.cz>
Date: Thu, 9 Jan 2020 17:17:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200109163752.621c6248@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_081740_629601_B63C34EE 
X-CRM114-Status: GOOD (  21.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, jan.pohanka@merz.cz,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 1/9/20 4:37 PM, Miquel Raynal wrote:
> Hi Martin,
>
> Martin Devera <devik@eaxlabs.cz> wrote on Tue, 10 Dec 2019 16:03:18
> +0100:
>
>> The used way to compute jiffies timeout brokes when
>> jiffie difference is 1. Simply add 1 - it has no other
>> side effects.
>> Fixes STM32MP1 FMC2 NAND controller which sometimes failed
>> exactly in this way.
>>
>> Signed-off-by: Martin Devera <devik@eaxlabs.cz>
>> ---
>>   drivers/mtd/nand/raw/nand_base.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
>> index d527e448ce19..beab3a775cc7 100644
>> --- a/drivers/mtd/nand/raw/nand_base.c
>> +++ b/drivers/mtd/nand/raw/nand_base.c
>> @@ -721,7 +721,11 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
>>   	if (ret)
>>   		return ret;
>>   
>> -	timeout_ms = jiffies + msecs_to_jiffies(timeout_ms);
>> +	/* +1 below is necessary because if we are now in the last fraction
>> +	 * of jiffy and msecs_to_jiffies is 1 then we will wait only that
>> +	 * small jiffy fraction - possibly leading to false timeout
>> +	 */
>> +	timeout_ms = jiffies + msecs_to_jiffies(timeout_ms) + 1;
>>   	do {
>>   		ret = nand_read_data_op(chip, &status, sizeof(status), true);
>>   		if (ret)
> I don't really what you are fixing here, I suspect the root cause to be
> a wrongly calculated timeout_ms in the calling driver.
>
> It is the responsibility of the caller to use this function with a
> relevant timeout_ms parameter. Maybe Christophe can help you here?
>
Hi Miquel,

assume that nand_soft_waitrdy is called with timeout_ms==1. I suppose it is
valid case. Jiffies are 1000 for example (assume something more like 
1000.99 -
just before incrementing to 1001).
We compute timeout_ms = 1000+msecs_to_jiffies(1) = 1001 (at least for my 
jiffies rate).
nand_read_data_op is called for the first time and returns 0. During the 
call jiffies changes
to 1001 thus "while loop" ends here (wrongly).
Notice that routine was called with expected timeout 1ms but actual 
timeout used was something
between 0...1ms (which I also measured by tracing & scope on the bus).
Or is my analysis flawed somewhere ?

Thanks,

Martin


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
