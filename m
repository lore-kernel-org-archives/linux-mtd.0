Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4130C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Miy+/ZPZuwrgCIIjoBxnTj78pRky3UQf1+W9lbyUDE=; b=RX63bCdad6Uyrp
	CzfvMBsbggEgpt0yiH0FJspd+MGhRz6+4F/v/Jbyf+XSn56GupBwLUravx0m4MipqPCVwwK/uDx77
	aQ9DjtAZndLlTYeZzuVSNhjMWmc+zJ3woARYoHI+qHgk8Na9L2eeDVxjgOsSd8XTJDjrS1QyCkozQ
	QN+OCryMn8H0RlBSuBbkk7kDwzH5I30SqboNB3mAlyn3w7ToxtFaFAuPh4LjRxu0BY/rObxAH9ryG
	y5uE+4NAstCgB1cqBqoAY9sEBbcxYIPGDCVsAt7HyVkzPxHDNKUHq9OalCIt7UmwA+jl3eJVghYZ7
	lfDibSZjzv/w/8lEwTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTrKl-006nFn-1z; Mon, 14 Mar 2022 20:30:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTrKW-006nB8-CT; Mon, 14 Mar 2022 20:30:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8B156125A;
 Mon, 14 Mar 2022 20:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 395EAC340EE;
 Mon, 14 Mar 2022 20:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647289811;
 bh=5slkzW/wYFCAJdfNlCFTBba0nZcr16X7BRShsWGs8e4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=leggAOjDGLqu5Y16iRzmCapGpn9MgtEwT4CrU4eyl+t2E31oSfK39qKDLg3AehmbU
 40wH8plobcUAZegoJFqfw9/xkqsBBPmZP9vZVSFOcI/Xp23ZGUf+pgmWTjQguJdafL
 aR+7p6LxqiE9iThzqyS8jQ9G6EB+4tZZi+yCfGQiapJJIo9jcBYm9fR9I2LX08BkN2
 bFDWmepy5ZVI6q23q7h6GXJ7SL0Svf5wH1oJCuTgacReCjqPgety1pGCFxOBEiOwa4
 z9SA1gQwBNf2EwKLfJ+KdExejyFckwalTlOP/U5FXz63cZ94Vo7u6CrKogKN+nyC4B
 +CVXdED/jOy7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0DC0AE6D3DE; Mon, 14 Mar 2022 20:30:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 00/30] fix typos in comments
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164728981105.21494.10764025984714254687.git-patchwork-notify@kernel.org>
Date: Mon, 14 Mar 2022 20:30:11 +0000
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
In-Reply-To: <20220314115354.144023-1-Julia.Lawall@inria.fr>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: linux-can@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-spi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, linux-leds@vger.kernel.org,
 shayne.chen@mediatek.com, sean.wang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, rafael@kernel.org,
 linux-rdma@vger.kernel.org, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 linux-s390@vger.kernel.org, matti.vaittinen@fi.rohmeurope.com,
 linux-power@fi.rohmeurope.com, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, namhyung@kernel.org,
 linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_133012_520285_15D8A9C3 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Mar 2022 12:53:24 +0100 you wrote:
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
> 
> ---
> 
>  drivers/base/devres.c                               |    4 ++--
>  drivers/clk/qcom/gcc-sm6125.c                       |    2 +-
>  drivers/clk/ti/clkctrl.c                            |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c              |    4 ++--
>  drivers/gpu/drm/amd/display/dc/bios/command_table.c |    6 +++---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                  |    2 +-
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  |    4 ++--
>  drivers/gpu/drm/sti/sti_gdp.c                       |    2 +-
>  drivers/infiniband/hw/qib/qib_iba7220.c             |    4 ++--
>  drivers/leds/leds-pca963x.c                         |    2 +-
>  drivers/media/i2c/ov5695.c                          |    2 +-
>  drivers/mfd/rohm-bd9576.c                           |    2 +-
>  drivers/mtd/ubi/block.c                             |    2 +-
>  drivers/net/can/usb/ucan.c                          |    4 ++--
>  drivers/net/ethernet/packetengines/yellowfin.c      |    2 +-
>  drivers/net/wireless/ath/ath6kl/htc_mbox.c          |    2 +-
>  drivers/net/wireless/cisco/airo.c                   |    2 +-
>  drivers/net/wireless/mediatek/mt76/mt7915/init.c    |    2 +-
>  drivers/net/wireless/realtek/rtlwifi/rtl8821ae/dm.c |    6 +++---
>  drivers/platform/x86/uv_sysfs.c                     |    2 +-
>  drivers/s390/crypto/pkey_api.c                      |    2 +-
>  drivers/scsi/aic7xxx/aicasm/aicasm.c                |    2 +-
>  drivers/scsi/elx/libefc_sli/sli4.c                  |    2 +-
>  drivers/scsi/lpfc/lpfc_mbox.c                       |    2 +-
>  drivers/scsi/qla2xxx/qla_gs.c                       |    2 +-
>  drivers/spi/spi-sun4i.c                             |    2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c           |    2 +-
>  drivers/usb/gadget/udc/snps_udc_core.c              |    2 +-
>  fs/kernfs/file.c                                    |    2 +-
>  kernel/events/core.c                                |    2 +-
>  30 files changed, 39 insertions(+), 39 deletions(-)

Here is the summary with links:
  - [03/30] ath6kl: fix typos in comments
    (no matching commit)
  - [10/30] mt76: mt7915: fix typos in comments
    (no matching commit)
  - [12/30] drivers: net: packetengines: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/ebc0b8b5374e
  - [19/30] rtlwifi: rtl8821ae: fix typos in comments
    (no matching commit)
  - [20/30] airo: fix typos in comments
    (no matching commit)
  - [27/30] can: ucan: fix typos in comments
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
