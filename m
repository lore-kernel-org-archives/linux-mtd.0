Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FA2D5CCAE
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 13:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETCYANdoBXV8yNrEeZo8XA8papmL3zTvQlmypt2fJx0=; b=rNwjO9rGCNLNDr
	Cl+ndcQa9cMBasnmkuXaEedCDZdvR9ET6t1nYTCegL7S0lvOGsGppIaOgXLp71bs75mwgEEzBWM4f
	EtiIZWwQoqPShYwrF4rEKyLliQYCfoKGt/13gPNncQQwRgzEiMJ7yO430MIPc74fzM9446eex5sKJ
	D7f9HoUaGL6MsfO0QMxXANEisj3tVhxiS243Ya8xG8CbuuA15q3IxjXESUhQTPnYBY5UyGA+WbQnL
	+0wVUr7ZN7x4KIesUyFMsLzBdUe7oZhBP6FkgYX/JT0uNx+fAfNZkgENBmixinkYCqE2Q5Zx48Uvz
	yIZ7J3A6AHWArrKH6TSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68mg-00000000Toy-1YcP;
	Wed, 30 Oct 2024 13:30:50 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67gn-00000000IM8-0v1q
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 12:20:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5836EFF806;
	Wed, 30 Oct 2024 12:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730290838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRUeD1doCo6p8A+A2Bqu6AeqcwQMQ7NrDrHpImOiBc0=;
	b=cyg++nh2R662+x6rQcsukVOxP265jpPaGbIVQib6OKkjHPoAmvalngoxzxYbtmeiXs0iWs
	BRSARrukO5+aYeJeODKno0orGPDCCERI4AJ0JWjyqhYAfLP9ztxCuEWoH/gYa35brNzgA/
	A10aAXXsOImO0GSW/lQQVaaIlblIT1SINTQVnIvI4njNQUhQEwN8PUzVmXJv8pzdY0ALPC
	r51I4P1lG52f8qFcCswY5lRErQ2IwjXTP+4jC20Mz6LQxdpSgan2gH2bWg5s8NULjZSRfQ
	RxIWtEro/OWwkyDlOOIABjYmOsufHdCqKmAX9vx+B/CFn+mAk8xi4d45ngf7HA==
Message-ID: <58a1b909-7ed7-40a4-8845-b8327a1d740c@bootlin.com>
Date: Wed, 30 Oct 2024 13:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] mtd: rawnand: davinci: Add clock resource
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20241030104717.88688-1-bastien.curutchet@bootlin.com>
 <20241030104717.88688-5-bastien.curutchet@bootlin.com>
 <3035aa2e-dbab-4224-a5db-d18e37003d5e@kernel.org>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <3035aa2e-dbab-4224-a5db-d18e37003d5e@kernel.org>
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_052041_450687_03692166 
X-CRM114-Status: GOOD (  15.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On 10/30/24 12:17 PM, Krzysztof Kozlowski wrote:
> On 30/10/2024 11:47, Bastien Curutchet wrote:
>> NAND controller has a reference clock but the driver doesn't use it.
>>
>> Add a struct clock in the struct davinci_nand_info so it can be used
>> to compute timings.
>>
>> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
>> ---
>>   drivers/mtd/nand/raw/davinci_nand.c | 9 +++++++++
> 
> Where are the bindings?
> 

The NAND controller bindings are in 
Documentation/devicetree/bindings/mtd/davinci-nand.txt but this clock is 
defined in the AEMIF bindings in 
Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt

>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
>> index 3c0efbdd789e..11dc30c29957 100644
>> --- a/drivers/mtd/nand/raw/davinci_nand.c
>> +++ b/drivers/mtd/nand/raw/davinci_nand.c
>> @@ -10,6 +10,7 @@
>>    *   Dirk Behme <Dirk.Behme@gmail.com>
>>    */
>>   
>> +#include <linux/clk.h>
>>   #include <linux/err.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/kernel.h>
>> @@ -117,6 +118,8 @@ struct davinci_nand_info {
>>   	uint32_t		mask_cle;
>>   
>>   	uint32_t		core_chipsel;
>> +
>> +	struct clk		*clk;
>>   };
>>   
>>   static DEFINE_SPINLOCK(davinci_nand_lock);
>> @@ -822,6 +825,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
>>   		return -EADDRNOTAVAIL;
>>   	}
>>   
>> +	info->clk = devm_clk_get(&pdev->dev, "aemif");
>> +	if (IS_ERR(info->clk)) {
>> +		dev_err(&pdev->dev, "failed to get clock %ld", PTR_ERR(info->clk));
> 
> Syntax is return dev_err_probe.
> 

Ok, I'll correct this in V2


Best regards,
Bastien

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
