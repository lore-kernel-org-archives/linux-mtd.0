Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139A6E8FDC8
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12bvNYRA+G2gv0xQdi2WR5aiUM0S9ExdVoM4sxJhXzo=; b=Vw1yKmmuJLKnlO
	GOS/hHVhoJ1G4R74b+y5WKmAMKecXEzR4NJmtu/fc5ar3K6cMmMmD4bSyymQhbaDWT9X+OhZJuV+0
	fq7pcy2KjOjEVAh4XkLkJQHhN4Br4IvwN1GV8vmb0RdlLrj01msPNIFYrzojpx9AUFVMZ/QFqG+Ie
	yww+yJR46wXCW6zheF8FnJpLJr2wN4BZNFNy3E2feG9KuQ0ZypOAuKl4cyDlD6cZLAlcFwQ9mBTGA
	Wjpfa71Dt3gXCZr+BBPeHu2iNtmEyepnGlRRiSyfKOtSPfd/yKWN7723STuxI904LnCSeuCGJmg1e
	1qTsRBlxF+r7RUyo0CaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLR6-001sdu-19;
	Thu, 05 Oct 2023 10:18:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLR1-001sdR-2l
	for linux-mtd@lists.infradead.org;
	Thu, 05 Oct 2023 10:18:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9BF3FB82256;
	Thu,  5 Oct 2023 10:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7386C197C4;
	Thu,  5 Oct 2023 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696501099;
	bh=cgJYumWvU7ZR9IX6zbsjriqldWc8o7P02AFXbgO2728=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qBur7v2domoKt0HCH7n7GXv6ZcAlFuzMPTi69owysMiEpmrD7gNWzH1MZciOIqyTb
	 dW+c1f3eHqd0z+uPDq4mJdG4K00szarv0txIeZ14eQHr6uI6Dy04aIHEmYb5+GqmIE
	 ANPHUkMhqsayLdA1Q0mh+LpRc1uUfGQwCW+KsXPE18yfKzzyna4EcOUIkcBhdFIuor
	 tkPG2+YQfGGYQuG6VNveLHfKb8/1g/XXkyMBIw5RUPmKef0CnkWwgFQaT6FUiel6sW
	 84fP/81TKA+s17wry+JWS7Gd8rSG+ypax6exTMKZ3rrYYJ20e0xXnbLSeSHx2qFnvD
	 LCJThiS1DvL0g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>,  linux-mtd@lists.infradead.org,
  pratyush@kernel.org,  michael@walle.cc,  miquel.raynal@bootlin.com,
  leoyu@mxic.com.tw,  jaimeliao@mxic.com.tw
Subject: Re: [PATCH v4 2/6] mtd: spi-nor: add Octal DTR support for Macronix
 flash
In-Reply-To: <911a6f0e-73bd-aa24-1b03-dd38bef1deba@linaro.org> (Tudor
	Ambarus's message of "Wed, 20 Sep 2023 15:37:06 +0300")
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
	<20230908064304.27757-3-jaimeliao.tw@gmail.com>
	<911a6f0e-73bd-aa24-1b03-dd38bef1deba@linaro.org>
Date: Thu, 05 Oct 2023 12:18:16 +0200
Message-ID: <mafs07co1pe3b.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_031824_190154_49093E6E 
X-CRM114-Status: GOOD (  25.30  )
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

On Wed, Sep 20 2023, Tudor Ambarus wrote:

> Hi, Jaime,
>
> On 08.09.2023 09:43, Jaime Liao wrote:
>> From: JaimeLiao <jaimeliao@mxic.com.tw>
>> 
>> Create Macronix specify method for enable Octal DTR mode and
>> set 20 dummy cycles to allow running at the maximum supported
>> frequency for Macronix Octal flash.
>
> You didn't answer my question. What happens when you specify 20 dummy
> cycles, thus you configure the dummy cycles for the maximum flash speed,
> but you program the flash to work on 1 MHz for example. Do you still
> have reliable results?

I don't know about this particular flash, but in the past, I have tried
doing this with Spansion and Micron flashes, and they work fine on lower
frequencies even with the maximum dummy cycles set.

When you think about it, the only reason higher frequencies put a
restriction on minimum dummy cycles is because the flash actually has a
restriction on _time_. As time for each cycle gets shorter with higher
frequencies, you need more cycles to wait the same amount of time. Dummy
cycles are just a way to ensure you wait more than the minimum amount of
time needed to get the flash ready to transmit data.

So I see no reason for a flash to break because it waited _longer_ than
the minimum time.

>> 
>> Use number of dummy cycles which is parse by SFDP then convert
>> it to bit pattern and set in CR2 register.
>
> What we should do instead is to determine the flash speed at which the
> flash is operated and then to set the correct number of dummy cycles
> according to what the flash requires. There should be a table somewhere
> in the datasheet that specify a required number of dummy cycles for a
> particular frequency, isn't it? Yeah, see "9-3-1. Dummy Cycle and
> Frequency Table (MHz)" of the mx66lm1g45g datasheet.

Right, most flashes do give such a table, though I don't remember any
more if SFDP has something like this as well.

I remember thinking the same thing when I was adding support for Octal
DTR in SPI NOR. The problem is that SPI NOR currently has no way of
knowing what exact speed the flash will be operated at.

It can look at nor->spimem->spi->max_speed_hz (I am not sure it should
do this directly) which comes from the "spi-max-frequency" DT property,
but that is only the maximum. This can be a good starting point to
decide the maximum number of cycles you would need.

But that is only the maximum. The controller does not guarantee using
the maximum speed. It can use something slower as well. And currently
there is no way for the controller to report that speed back to SPI MEM
or SPI NOR. So if we want to waste the least amount of dummy cycles, we
would need to teach the controller drivers to report back the exact
speed it is going to driver the flash at.

I am not sure this might be worth the trouble though. We should first
quantify how much throughput/latency we stand to gain from doing this.
But I do think looking at "spi-max-frequency" is fairly simple and
should be a good enough start.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
