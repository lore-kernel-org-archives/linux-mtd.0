Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2F1C48BCD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 15:48:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D8AB61078
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 15:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D8AB61078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSx+QZz+HjA6T+bE1Vjxtl4sW6eo1cUe8l26Fui+6EA=; b=JZxNxx4hqs+2hqwwweRWzA9yv2
	WwRNP0X555XGZsGPGs6JBLUJiqh9vC8VHAQR82ykP25Wm8wg5Gx2/ZX46Yr71TO1mgy+UHixCG+JQ
	s5ZsOVooed6PUOW8F52MHK2K6oAmylEqnZc3WctY3JF6hOgQaSlJCZsO1rPGvNacIZ87OhQSWN2WQ
	ln3ANI9+cQmhMXtcieWT/uv8OIQSurArNMdFtQgFe9n+qkZqMVDwmqCDI6Ff87GwwG220cOuu6MkO
	cjMY2d3VbFsOocQNPGUOwzrbghG2TRNDbKD5FfYz2cg/zdz+Z3J8sacjHurf5aICTIa97DAytgfc2
	ie7dVGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr0QB-00EgSF-Ae; Wed, 09 Jun 2021 15:47:11 +0000
Received: from regular1.263xmail.com ([211.150.70.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqz7V-00EHvb-EZ; Wed, 09 Jun 2021 14:23:53 +0000
Received: from localhost (unknown [192.168.167.69])
 by regular1.263xmail.com (Postfix) with ESMTP id B1F9B3A4;
 Wed,  9 Jun 2021 22:23:45 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.73] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P31907T140446225393408S1623248622928502_; 
 Wed, 09 Jun 2021 22:23:44 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <aaef219e8ac562c7c20e5d7e0c19fa90>
X-RL-SENDER: jon.lin@rock-chips.com
X-SENDER: jon.lin@rock-chips.com
X-LOGIN-NAME: jon.lin@rock-chips.com
X-FST-TO: macromorgan@hotmail.com
X-RCPT-COUNT: 16
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH v6 4/8] clk: rockchip: Add support for hclk_sfc on rk3036
To: Johan Jonker <jbx6244@gmail.com>, linux-spi@vger.kernel.org
Cc: broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de,
 hjc@rock-chips.com, yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, macroalpha82@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20210608022644.21074-1-jon.lin@rock-chips.com>
 <20210608022644.21074-5-jon.lin@rock-chips.com>
 <4a4524f5-ee85-c7f6-aa95-1df84f2a8a99@gmail.com>
From: Jon Lin <jon.lin@rock-chips.com>
Message-ID: <90752de9-786d-171c-26a4-ee2851168c11@rock-chips.com>
Date: Wed, 9 Jun 2021 22:23:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4a4524f5-ee85-c7f6-aa95-1df84f2a8a99@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_072351_478280_944DE528 
X-CRM114-Status: GOOD (  22.89  )
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


On 6/9/21 12:31 AM, Johan Jonker wrote:
> Hi Jon,
>
> For rk3036 we might need another fix added to this serie as well.
>
> clk: rockchip: rk3036: fix up the sclk_sfc parent error
> https://github.com/rockchip-linux/kernel/commit/100718ef0d44872db1672b6a88030374c0d1613b
>
> ===
> Add more people for clk driver changes:
>
> M:	Michael Turquette <mturquette@baylibre.com>
> M:	Stephen Boyd <sboyd@kernel.org>
> L:	linux-clk@vger.kernel.org
>
> ===
>
> Johan
>
> On 6/8/21 4:26 AM, Jon Lin wrote:
>
>> From: Chris Morgan <macromorgan@hotmail.com>
> From: Randy Li <randy.li@rock-chips.com>
>
>> Add support for the bus clock for the serial flash controller on the
>> rk3036. Taken from the Rockchip BSP kernel but not tested on real
>> hardware (as I lack a 3036 based SoC to test).
>>
> Signed-off-by: Randy Li <randy.li@rock-chips.com>
>
> Maybe give credit to the original author?
> clk: rockchip: rk3036: export the sfc clocks
> https://github.com/rockchip-linux/kernel/commit/600925e8ef6edbdda0a4ac6b3c55b0199be1e03e
Randy Li has resigned from RK
>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
>> ---
>>
>> Changes in v6: None
>> Changes in v5: None
>> Changes in v4: None
>> Changes in v3: None
>> Changes in v2: None
>> Changes in v1: None
>>
>>   drivers/clk/rockchip/clk-rk3036.c      | 2 +-
>>   include/dt-bindings/clock/rk3036-cru.h | 1 +
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
>> index 91d56ad45817..ebb628733f6d 100644
>> --- a/drivers/clk/rockchip/clk-rk3036.c
>> +++ b/drivers/clk/rockchip/clk-rk3036.c
>> @@ -403,7 +403,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
>>   	GATE(HCLK_OTG0, "hclk_otg0", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 13, GFLAGS),
>>   	GATE(HCLK_OTG1, "hclk_otg1", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(7), 3, GFLAGS),
>>   	GATE(HCLK_I2S, "hclk_i2s", "hclk_peri", 0, RK2928_CLKGATE_CON(7), 2, GFLAGS),
>> -	GATE(0, "hclk_sfc", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 14, GFLAGS),
>> +	GATE(HCLK_SFC, "hclk_sfc", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 14, GFLAGS),
> Maybe CLK_IGNORE_UNUSED should be changed to 0 ?
>
>>   	GATE(HCLK_MAC, "hclk_mac", "hclk_peri", 0, RK2928_CLKGATE_CON(3), 5, GFLAGS),
>>   
>>   	/* pclk_peri gates */
>> diff --git a/include/dt-bindings/clock/rk3036-cru.h b/include/dt-bindings/clock/rk3036-cru.h
>> index 35a5a01f9697..a96a9870ad59 100644
>> --- a/include/dt-bindings/clock/rk3036-cru.h
>> +++ b/include/dt-bindings/clock/rk3036-cru.h
>> @@ -81,6 +81,7 @@
>>   #define HCLK_OTG0		449
>>   #define HCLK_OTG1		450
>>   #define HCLK_NANDC		453
>> +#define HCLK_SFC		454
>>   #define HCLK_SDMMC		456
>>   #define HCLK_SDIO		457
>>   #define HCLK_EMMC		459
>>
>
>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
