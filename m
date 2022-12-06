Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624BEC4708D
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSGw9Eh7CX6WJ0BxzJJDjiBqpFdItqoDivPRCPHDiCc=; b=h/f7r/Mp4H8lq1
	GxUuauNamZLTtvUajP9dME1DOXCucMitCC/kNIvAy1K7RkPI9foTXgSOaKZRcfnNTCi04bOV0uuys
	2XOStQCya/jblLYOoPSUyMkf6MR/a9Rl9bJjped+PNiUIfg/XAYRVI53lcXoBetyhJvdiK75NZZyq
	KELTmCO2+trZ2OUTRTRoPklvTG+RThMyWevgWWTiZNlBG8RlOUI+WoCDObRrh5yQATRTuXe7SwKkn
	gt53cS8tBOQdjW4SeCNoph8SYiMcJw5UgOdZA+ylY5FgsE6cNy5ZCVBViENLGdsiCX7KNySWOrYmZ
	A2x23rF2NEGOr8dw5GCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2aR1-00E2jw-Lm; Tue, 06 Dec 2022 16:04:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2aQk-00E27h-7i; Tue, 06 Dec 2022 16:04:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 921F8617C2;
	Tue,  6 Dec 2022 16:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263CDC433C1;
	Tue,  6 Dec 2022 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670342665;
	bh=Szlr9bhRSHRa3/F8OFwm0BojO1dnfBM+g8JhZoyroVQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EuHdyOO7jfOqgp/M50bX1Vr0lYkcoMJ0gPiTJr33pdky/0JRMb+5J+sZBvWEU0ENI
	 s264f0V25aj0eqe7VkWzwOS6m7wqx02l7A1MI+USSIqWtVOgFPwF6S1k1JLPWRgOaz
	 L5PSESakgZf5/kmeSOY6ZM+JSIYiTYhs8zi2krXQwXnlJz+/bGfWEhUTgTWuQBY8rX
	 8f2EZtwSdGdJS5ZOizfU6w4fUGlunL/X8/vd+vbPVB+5qMpfhszUeemCdaXdaxCTuP
	 pw0EnSbeFcNeFDfRtEiY4QJo3HIAvrOjJlka1Sy6vacGHi3kbxiQySBwsVkhC9+KES
	 PRzMbhZbDP2PA==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, benliang.zhao@mediatek.com,
 bin.zhang@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
In-Reply-To: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
Subject:  Re: (subset) [PATCH v2 0/9] Add MediaTek MT7986 SPI NAND and ECC support
Message-Id: <167034266187.169562.7872281598428362203.b4-ty@kernel.org>
Date: Tue, 06 Dec 2022 16:04:21 +0000
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-da105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_080426_342214_6C10A8FB 
X-CRM114-Status: GOOD (  15.52  )
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

On Mon, 5 Dec 2022 14:57:47 +0800, Xiangsheng Hou wrote:
> This patch series add MediaTek MT7986 SPI NAND and ECC controller
> support, split ECC engine with rawnand controller in bindings and
> hange to YAML schema.
> 
> Changes since V1:
>  - Use existing sample delay property.
>  - Add restricting for optional nfi_hclk.
>  - Improve and perfect dt-bindings documentation.
>  - Change existing node name to match NAND controller DT bingings.
>  - Fix issues reported by dt_binding_check.
>  - Fix issues reported by dtbs_check.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/9] spi: mtk-snfi: Add snfi support for MT7986 IC
      commit: 7073888c86601389e17f3ee8ab15ab7aef148839

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
