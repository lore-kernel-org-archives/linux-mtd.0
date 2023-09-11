Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F161EEE7FF4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 04:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIyIErJhTX4tafUa0+hnW2GC5UZW9XrSQVGbqch7l34=; b=L6zHGL1Ty2sfPC
	96jmn5RaDPfnVN9hAHrFshwAzIR0ls8sD/WYnC3eN2LIBD+1vL1WxSjTXwiBUdXzAN8uksI61ybw2
	jgN9ZMla8/B3qKNwSTVLW5aAN3Rn0twwwj/IfgJacgfBBktRXhcg1IB87InLxfJ1wQble6L5I+NMP
	aTzTfDd/HnsJI1bg0wHLV38StxMKfQEXFfox4zfWDO3aVar2ropTEv9VBpW2GrRZDojjmhaHqVc0D
	Wg+x4Ng1G6RavjSkgOj0IxnLb1l0W/k3bcvQovQ1NPRMgG9xxWcltkBVnRRqD6FdPLgFyLocVfJgP
	Q7TpJu0ogDrUcnI5SHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfYrJ-00HEoZ-39;
	Mon, 11 Sep 2023 04:49:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfYrF-00HEkR-1E;
	Mon, 11 Sep 2023 04:49:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 12C0FCE0F28;
	Mon, 11 Sep 2023 04:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E1D7C433C8;
	Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694407740;
	bh=jRbGX37pKE/flPAVK4KmRTNNYn+YjmtCaP+B5V/gVX0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hRTK/O7zd2EVcyRIHv/i0CAjz9UpjidahDXSIXk4ACb38jZ+6K0Q30pzOqZOLqypY
	 C75nnrtT8Yv6GiMTvD61pKvkFLRfhtUBVWtZcBLARUs5c+zflqjKF2vVtznLpozQoM
	 GCNDa18FhndrrkuE6m/0q7HCv7yOAC6mlWVm+BRnredL6UXg7U1td5nMObALXI8tDQ
	 4sZzvZ12uCsLziIZXf9AsxgF8FMszCNitekMmUlSZhzGlOAtLbZ6bAuUGQovA8xlPE
	 s6xIC6qIfoHYkDG9jnYDNje1UTc0fpBvjr9tsdVWGYlC4/aJBTcr3g4fKbEVro77gN
	 eo2XoPvZ0aheA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 122E7E1F67E;
	Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] mfd: Explicitly include correct DT includes
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <169440774007.22573.6670993122914766002.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 04:49:00 +0000
References: <20230714174731.4059811-1-robh@kernel.org>
In-Reply-To: <20230714174731.4059811-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linus.walleij@linaro.org, lee@kernel.org, thor.thayer@linux.intel.com,
 mani@kernel.org, cristian.ciocaltea@gmail.com, bleung@chromium.org,
 groeck@chromium.org, support.opensource@diasemi.com,
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 cw00.choi@samsung.com, krzysztof.kozlowski@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 tony@atomide.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, mazziesaccount@gmail.com, orsonzhai@gmail.com,
 baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 chrome-platform@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_214909_603592_F7132623 
X-CRM114-Status: GOOD (  10.14  )
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
by Lee Jones <lee@kernel.org>:

On Fri, 14 Jul 2023 11:47:27 -0600 you wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Here is the summary with links:
  - mfd: Explicitly include correct DT includes
    https://git.kernel.org/chrome-platform/c/dc0c386e09a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
