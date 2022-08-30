Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F1AECAAA1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Aug 2022 07:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COaOOBCT6lwJjBv6OzTt3HTm+1/2i3fpib11B958UGw=; b=3XTzBW4y4mpOLTh4DcNVj+QRu1
	F9d71ZioCti2n6Vi3OyhsHW3mLRl59EnUVULcBje78w1ONPyE6X7heSom6cl04i4NKHrtEY85rHNi
	p2vVhzf9qdwkacEL8kCYbg0eGwbKUY4belpaUxiBbsNZEz1d0Wm1pAIClMsr8i1UnHUOYMD5JRX1y
	FYY9ETTS7r9vPB6+0FEr8ZPey7EA0Iz2ZrhFVs2gbf6KCyvFZYqEoYcpIF+TwWhn9j3xmWKEnhVcX
	x5hAV38RjmmEdnn5esGMRsgwuc+Q6ipLZQK8CuEAY7gU8lYE96Eo3l2EaACh6Qb8DsHFdlxovOghC
	YHrbks1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvNx-00Egor-8V; Tue, 30 Aug 2022 07:10:09 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvNt-00Egkh-AD
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2022 07:10:07 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id F1BD522CF;
	Tue, 30 Aug 2022 09:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661843399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hScyyeCa0BmstvGNDpCO3ZSKhM4Kp3uqyQiW++JqWEU=;
	b=w2pNUXpOjZEfSq1m6zK74et7XtGnFGdMWB5OFvnQLv6Wo2MmPIaXkTxGNR3oLeoS6PDT/8
	pFocCw6DeaxSnXFlHsAWDBfl4Z9IdQezWxlEMY9MJjd1kJMFPEwX4+Oe8LbyQ7SMplPkl2
	MfSXwBfP/kUixWlEy85X97X/sjI0urygVSqRv+P7GDKxUPBWzbOezFlof21V6V6VvzE5yW
	DmRlwExy3Z7NmAKImsCTCaI/64ZyBYpFITfo0OfgrHOaGDXpv36RaWz7W0tCSum8RjKIKj
	Bun+pnXUlb5e9D/svynlYop+EQBH+N9xScWSckQlKHM6Q2MmrVuop79FTnmR+A==
MIME-Version: 1.0
Date: Tue, 30 Aug 2022 09:09:58 +0200
From: Michael Walle <michael@walle.cc>
To: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 saikrishna12468@gmail.com, "git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add support for flash reset
In-Reply-To: <BY5PR12MB425817D90687D37ABDC638EADB799@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20220829090528.21613-1-sai.krishna.potthuri@amd.com>
 <20220829090528.21613-3-sai.krishna.potthuri@amd.com>
 <be7f0b7bbb25d86ac079502babbf5f1b@walle.cc>
 <BY5PR12MB425817D90687D37ABDC638EADB799@BY5PR12MB4258.namprd12.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <c7fd841b2244cbe60e174be3babb1607@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_001005_648029_6E7A5C91 
X-CRM114-Status: GOOD (  14.14  )
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

Hi,

Am 2022-08-30 08:32, schrieb Potthuri, Sai Krishna:

>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	/*
>> > +	 * Experimental Minimum Chip select high to Reset delay value
>> > +	 * based on the flash device spec.
>> > +	 */
>> 
>> Which flash device spec?
> I referred some of the qspi, ospi flash vendors datasheets like Micron,
> Macronix, ISSI, gigadevice, spansion.

Please mention here that you've looked at datasheets of different 
vendors.
And maybe instead of doing three comments, just one and then the reset
sequence.

>> 
>> > +	usleep_range(1, 5);
>> > +	gpiod_set_value(reset, 0);
>> 
>> Mh, is your logic inverted here? If I read the code correctly,
>> you should use a value of 1 to take the device into reset. The
>> device tree should then have a flag "active low", which will
> Reset Sequence which I implemented here is high(1)->low(0)->high(1).
> By doing this sequence (active low), flash device is getting reset,
> this sequence
> is tested using Octal SPI flash device.

How does the device tree property for your look like?
Has it the GPIO_ACTIVE_LOW flag set?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
