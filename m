Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5146AC982CD
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jan 2026 15:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wPbXbYKCZftVDMo/K5XhWDQSy+jZLfowJYwHHyg0UA=; b=kN0LlEuMo8V38k
	bDpIkI/aBHMHytIWBfsDGfIIoDEp5gjkOxPUqKV+ZMcjogtQbrfgZtnwNa9zQEUtyGtembcRS8/c3
	hzDnRxCg1RnkU5nUxY6vCrU3tlIGGOh4n/Z491q73TYaNZPEJGvVUTZvUNKqfxzUvIBKsm2NRoz5J
	UJVONb5P9SeB9tm5fFpIWzvqrlZZO1BG5PBbOkzg1JR4+dLK1v9XTpg4ZL/eNehf0tg0ne4x1MgMs
	Zx1FSZYa3IYBe99PnSJNb/ao0/NRPySZx+z5UdCMWwb0JLmq2iKtWWmiIHgA0mstJtBgI2h0jhasv
	/W8vh+bTybST9TIcAfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglR4-0000000EJnZ-0Dl1;
	Fri, 16 Jan 2026 15:08:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglR1-0000000EJms-2kVp;
	Fri, 16 Jan 2026 15:08:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6CD760150;
	Fri, 16 Jan 2026 15:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337A6C116C6;
	Fri, 16 Jan 2026 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768576102;
	bh=L/HOSpJtqEp/e3nyMrq+9QjC47mSPiJ2Yziy3NYJolc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d16C+y/Tumd22i1N3bhbuh6anO7hRSMRvfqsosQvfyI6puDbKWSdeAMoEmifacdPV
	 h9xDJLP70dxRnBDSPEKx3bBXmnlCLss2YRLbSL8wnmgqMcnScfX5OcmZIcfBughyF9
	 PKE8T7dtdo4k7s5BWWcEJRIs3X53HkgUMNG3satOdGM9L26bKTa46VM2oTzt3Nf6Nu
	 Iy4fp5NtMrrBWrgtfvO4r4svFtADUNVnmSkYNBGwazaLMc08aFKJQhdO7l290lUsjR
	 r1Jv6zkZ3vkqXcqLWdSUl1PVV0XCg5yRRcyOg1nQ/y3z4GWg68Yzeu9Ustnz+StorA
	 UbTj/lEbA6Uzw==
Date: Fri, 16 Jan 2026 09:08:21 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org,
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com,
	broonie@kernel.org, matthias.bgg@gmail.com,
	julien.massot@collabora.com, eugen.hristev@linaro.org,
	jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm
 to audio-controller
Message-ID: <20260116150821.GA1576159-robh@kernel.org>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115125624.73598-5-angelogioacchino.delregno@collabora.com>
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

On Thu, Jan 15, 2026 at 01:56:24PM +0100, AngeloGioacchino Del Regno wrote:
> Device tree nodes should have generic names, and this one doesn't.
> Rename the mt8192-afe-pcm subnode of audsys to `audio-controller`.
> 
> This commit brings no functional changes, but resolves dtbs_check
> warnings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
