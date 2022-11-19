Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF1BC43217
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Nov 2022 06:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PJE0fys2m/T3ElaoDO+FOXukvepTDAoF2sbCnmXkXs=; b=ciE5BG9ddm9P0s
	Da6fKmJYGTWzbG4KNcJWdXd5qk4Er/HO2qe3bAdruMFgcz5goBdTUd8lwmIdxLxybCQOlSkuH0CIn
	Wo4XZofHh1aAzg2ALVF0QioipggtuE3fbnsRSitTPx3R1RsXD9RbpYynIwzue74k1Al+B0EyCZXcC
	t8s/rEJJAAMTzAd68gLej1iFQhPP4Cd39gJ2wEp5ZVRbgzaCL4F7tsYyxArww7RkcRQm2eAQK+Xz4
	wQOtWyErLNf8gW7VjGE60rKXs/Q15iMTO7SrJz5FdwQW13KtzihScERME4g+tsYxcaeIphuTHD+HC
	r+BRrZebbADGJZTp+ZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owHgY-00Bvhv-As; Sat, 19 Nov 2022 06:50:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owHgA-00BvC5-Fu; Sat, 19 Nov 2022 06:50:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3CA6560A36;
	Sat, 19 Nov 2022 06:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86E7AC433B5;
	Sat, 19 Nov 2022 06:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668840616;
	bh=J6A2zN+GaxubPoA4pynMpJ9aRQjTm1qSEAaKvZV9V00=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d+WNCYrodp79kOfNGIXr5PvvIs5GCF6E/TB0CDa2g+OZEp77Ua/U5QlZvwsWMDrK4
	 OlLD/U4jjbYyhWaiA4rct4JoYkz9IWVscixQD26JhUaXY3yUQEg8Y11+kSP0F7KpB8
	 zMZfwDOJzrlQ9jze8VoIW1mJ3xn1MyS9umDxW8U4aWjYwb6wOYhonyX7dPSQGn//c3
	 ES9sycuBVsgfSKQQ6UBEnGpryiRSmirdvQs2tXppPiSbnayeSEWB/Bx525GuMc+yZz
	 4Kon/n6VmXCwbfBd8TB8yHub9wkc/uggzN+T8rGWKeov06QFTXG5sVNeaRlrWw+yQP
	 EzUp1tL6honhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 64E94E524E4;
	Sat, 19 Nov 2022 06:50:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
From: patchwork-bot+chrome-platform@kernel.org
Message-Id:  <166884061640.19423.12726268813615488480.git-patchwork-notify@kernel.org>
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
X-CRM114-CacheID: sfid-20221118_225018_613576_DBFA7505 
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

This patch was applied to chrome-platform/linux.git (for-next)
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
