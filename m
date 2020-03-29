Return-Path: <SRS0=lLdJ=5O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05167C43331
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Mar 2020 23:37:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB63B20733
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Mar 2020 23:37:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+7Jrea8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB63B20733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VU56aIHlRwOeA9fPq0XQVtJhmPzR27PLSQ23rUo8ivk=; b=G+7Jrea8awKKF/
	4XRm3UnPYj97JB4qSIuJr6NKiDnguh4EfxlP3J08iMqe2A+RO8xbjOHwrT5genW0mTEtuFG0k0LeB
	J+bVZLTQ153fDPEkE7hClJmmWp3vLF8Ln0sSujFAkpAvlP82Zo3NRpI2A4/9dv2/usKbc6RFAtpX6
	7me87j+fB/sZ2xsh6gJuvvPokeCkPHJ/wmSd8p7XWV29MjMWXoCcBnhSFwjLttZjk4zyKQGlIcY5g
	8d0IP+ywXif6TCOPKFxDMWdFvw0tz+gofQRH5gNHeFzYjvkRJWFtvJ3qYO/nYnqtYht2OZxeRC3Qo
	EeSmeSARisz+OOkqA+WA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIhU1-0004GT-GQ; Sun, 29 Mar 2020 23:36:49 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIhTv-0004Fo-20
 for linux-mtd@lists.infradead.org; Sun, 29 Mar 2020 23:36:46 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48rBnD51Mwz1rlhj;
 Mon, 30 Mar 2020 01:36:32 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48rBnD2Smhz1qqkB;
 Mon, 30 Mar 2020 01:36:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id tu7qrZhZFbeu; Mon, 30 Mar 2020 01:36:31 +0200 (CEST)
X-Auth-Info: TuBlfyg55OdrcAq2t30Y8Fj8aDbl6+CnTBYSKAxGkzg=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 30 Mar 2020 01:36:31 +0200 (CEST)
Subject: Re: [02/12] mfd: stm32-fmc2: add STM32 FMC2 controller driver
To: Christophe Kerello <christophe.kerello@st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 tony@atomide.com
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-3-git-send-email-christophe.kerello@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <a989ce31-740d-8f0f-4c55-026c65259104@denx.de>
Date: Mon, 30 Mar 2020 01:36:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584975532-8038-3-git-send-email-christophe.kerello@st.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200329_163643_246497_C6C7A7EB 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/23/20 3:58 PM, Christophe Kerello wrote:
> The driver adds the support for the STMicroelectronics FMC2 controller
> found on STM32MP SOCs.
> 
> The FMC2 functional block makes the interface with: synchronous and
> asynchronous static memories (such as PSNOR, PSRAM or other
> memory-mapped peripherals) and NAND flash memories.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
[...]
> +static const struct of_device_id stm32_fmc2_match[] = {
> +	{.compatible = "st,stm32mp1-fmc2"},

stm32mp151.dtsi uses "st,stm32mp15-fmc2" compatible string for FMC (with
extra "5" in the string).

> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, stm32_fmc2_match);
> +
> +static struct platform_driver stm32_fmc2_driver = {
> +	.probe	= stm32_fmc2_probe,
> +	.driver	= {
> +		.name = "stm32_fmc2",
> +		.of_match_table = stm32_fmc2_match,
> +		.pm = &stm32_fmc2_pm_ops,
> +	},
> +};
> +module_platform_driver(stm32_fmc2_driver);
[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
