Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F03DC4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Nov 2022 06:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMHBDmrS6JulJmAeI3/4bVuZnsvqZVJ2uxy9rt5ac+A=; b=wAPqZcxbsQsius
	HncVkn3hF/kOMRWaRzHUQ0Pv2Dapd6AdX13Es5MAsKPhUEQFlZVLVtqWCHNh0MYFUbDOFuSWj8IX4
	MCeTzil96YfFCruKLeHikwN9Gde61M6hrx0WmrZ70G6YT95XzzEF7BG2MYXzzNqf8IhoFC1R/Bxm8
	/pXTenZTJd4lWr3loT/pNbKd9hVIDPmwS1y/gaLenOwWrzbD6W2THSRqwXtynEOw9zExjMhb+TRDN
	NqQI5xUQtPZKrq+l/O9sgGW+DwI0IgRIACv6691/4FXcJ+98sZU1RexHRygk+wbKobHafy7+M296j
	s+dEONxkIWDfJYfqpPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owHgj-00BvoC-Il; Sat, 19 Nov 2022 06:50:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owHgB-00BvCA-9G; Sat, 19 Nov 2022 06:50:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B256EB82713;
	Sat, 19 Nov 2022 06:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5944BC433D6;
	Sat, 19 Nov 2022 06:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668840616;
	bh=ak6M5fgrTHQ1MM2vf+n5AubLq+AMYqmK/RRzz3/3gig=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=seXipkg9CAyFA9/DRpiD01V8ITXAB4g0Feuk+M72plAUXo40561rs1dMVurztjC0R
	 UGqXlOdf3JC5VrI2IWVezRWqsbHRKhLTyD3mEBicEAh2WBWvOY+SAmQ5aoJgjdz1Vk
	 5aq4YUvgNncdPRSw5IsP6xY0s8PudX8SdTsR/EyWyOmZxNi+pkZtOu70losD9BrvnB
	 Du21LerJzoVvVs4d9eSLNMvDcUU7T0jOw29zyRduMgSnRBWCRcfu03u6uXJN2UHbLy
	 DMpzJwBt86Z35Odc5hTd6y/3r7eqH4zheZmOWuKtOuYVHcjUBHn5l00sWabdAIfdsG
	 FRNiHf2EtKUDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 37F78E29F44;
	Sat, 19 Nov 2022 06:50:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
From: patchwork-bot+chrome-platform@kernel.org
Message-Id:  <166884061622.19423.870710096225259467.git-patchwork-notify@kernel.org>
Date: Sat, 19 Nov 2022 06:50:16 +0000
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cuwe=40kleine-koenig=2Eorg=3E?=@ci.codeaurora.org
Cc: ang.iglesiasg@gmail.com, lee.jones@linaro.org, grant.likely@linaro.org,
 wsa@kernel.org, linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org,
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-pm@vger.kernel.org, kernel@puri.sm,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_225019_491651_B76DFA57 
X-CRM114-Status: GOOD (  10.79  )
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

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Fri, 18 Nov 2022 23:35:34 +0100 you wrote:
> Hello,
> 
> since commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type") from 2016 there is a "temporary" alternative probe
> callback for i2c drivers.
> 
> This series completes all drivers to this new callback (unless I missed
> something). It's based on current next/master.
> A part of the patches depend on commit 662233731d66 ("i2c: core:
> Introduce i2c_client_get_device_id helper function"), there is a branch that
> you can pull into your tree to get it:
> 
> [...]

Here is the summary with links:
  - [512/606] platform/chrome: cros_ec: Convert to i2c's .probe_new()
    https://git.kernel.org/chrome-platform/c/f9e510dc92df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
