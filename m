Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D9EC433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 13:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB54461040
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 13:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB54461040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebXi8xV0fzGvLpYvIdsfolGXrEdr94laHK2SLE/r4y4=; b=opiI7OA+tmZFuc
	R1xMtF3cktKNPhhCaE9+byc4M5bMpyyyZwOp8CuLV3pM1ijUB2Y61Pgh1odtAtH7pBFcoSpv099Dc
	lCbuOiu44rQ8u+VCleF2c5YJi8/iQ64SMzNPWBN83vqeJZwxbNQt/gXUJejtkhH4qspzpUZmJGpeI
	jSQMRoVwyorop45/sGpODQfzeo1PMhcqph3w95uu54WS1cSD+QkRkuzJqAbV7bdN1iOMcLyRldc/a
	rYZtMXezOTQx/zvTQps5BtlDpOBcFC7RTk0uuQKwTPVbeOgx8XpKOC7UbpvRMv8+XeFtihv4MDnPD
	TKGwilkpsBCmmUci9YCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYpfi-002qgA-0U; Fri, 08 Oct 2021 13:12:22 +0000
Received: from mailout09.rmx.de ([94.199.88.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYpfb-002qej-T3
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 13:12:18 +0000
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout09.rmx.de (Postfix) with ESMTPS id 4HQpWH68Cczbhd3;
 Fri,  8 Oct 2021 15:12:11 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by kdin02.retarus.com (Postfix) with ESMTPS id 4HQpW46QPYz2TTKZ;
 Fri,  8 Oct 2021 15:12:00 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.55.107) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 8 Oct
 2021 15:12:00 +0200
From: Christian Eggers <ceggers@arri.de>
To: Stefan =?ISO-8859-1?Q?Riedm=FCller?= <S.Riedmueller@phytec.de>, Miquel
 Raynal <miquel.raynal@bootlin.com>
CC: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "michael@amarulasolutions.com"
 <michael@amarulasolutions.com>, Christian Hemp <C.Hemp@phytec.de>,
 "gerg@kernel.org" <gerg@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Date: Fri, 8 Oct 2021 15:11:59 +0200
Message-ID: <13290228.RDIVbhacDa@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20211008142724.7fbeed6a@xps13>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <b6cc888f8211790ddee6683204f3b8e31a9facd4.camel@phytec.de>
 <20211008142724.7fbeed6a@xps13>
MIME-Version: 1.0
X-Originating-IP: [192.168.55.107]
X-RMX-ID: 20211008-151200-HdtJpbtqWtlT-0@out02.hq
X-RMX-SOURCE: 217.111.95.66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_061216_133710_8960ACF2 
X-CRM114-Status: GOOD (  15.84  )
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

On Friday, 8 October 2021, 11:55:56 CEST, Christian Eggers wrote:

> I got another solution from PHYTEC ([2], not lengthy tested yet), which
> disables all GPMI/BCH clocks on CCGR4

> -static void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
> +static int gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
> 
>  {
>  
>  	struct gpmi_nfc_hardware_timing *hw = &this->hw;
>  	struct resources *r = &this->resources;
>  	void __iomem *gpmi_regs = r->gpmi_regs;
>  	unsigned int dll_wait_time_us;
> 
> +	int ret;
> 
> +	ret = __gpmi_enable_clk(this, false);
> +	if (ret)
> +		return ret;
> 
>  	clk_set_rate(r->clock[0], hw->clk_rate);
> 
> +	ret = __gpmi_enable_clk(this, true);
> +	if (ret)
> +		return ret;
> 
>  	writel(hw->timing0, gpmi_regs + HW_GPMI_TIMING0);
>  	writel(hw->timing1, gpmi_regs + HW_GPMI_TIMING1);


I think that this is also required for the first call to clk_set_rate() in
gpmi_get_clks(). From the kernel's point of view, the clocks are not enabled
yet, so no "guard" is required. Putting the same guard here will actually give
a warning at runtime that I am trying to disable a clock which is not enabled.
But on my system, all clock gates are enabled by the bootloader (barebox)
and therefore the glitch could also happen here.

If setting the clock to a "default" rate is really required (on my system, the
clock is switched from 99 MHz to 22 MHz, and back to 99 MHz on a later call...),
I suggest moving this call to gpmi_nand_probe() (below __gpmi_enable_clock())
and guard it. The result would look like:

...
	ret = acquire_resources(this);
	if (ret)
		goto exit_acquire_resources;

	ret = __gpmi_enable_clk(this, true);
	if (ret)
		goto exit_acquire_resources;

	if (GPMI_IS_MX6(this)) {
		/*
		 * Set the default value for the gpmi clock.
		 *
		 * If you want to use the ONFI nand which is in the
		 * Synchronous Mode, you should change the clock as you need.
		 */
		__gpmi_enable_clk(this, false);
		clk_set_rate(this->resources.clock[0], 22000000);
		__gpmi_enable_clk(this, true);
	}

	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
...

It looks a little bit useless to enable the clocks and immediately disable
them. But probably this is the only way to make sure that clocks enabled by
the bootloader are certainly off.

regards
Christian




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
