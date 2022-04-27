Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EA7C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 22:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJTwwFBqHwPRa8zXBILGPK8re9vFbo8iXtr+A16f8es=; b=dUTMaH0JR/hjOW
	PKfjSr0xBTCRKqwkQ03fzfTL6o/fY2wwfcsaHjsjwu6dnk47kb0jOjnl5gb1pHJV5k0LmndbXrsmf
	6eM7929969maVr89N0jROaImaTdqhLrQTdfhItrW1MgPQCglShdgfI4XMk4lmJA/s/opuLiWMQSSl
	3YajZU3Dagqx96TdeEC+FnsdK9emfG3Cxyvl2iPPa0bPZKqRJYOAdzluOLyHWuABcvpIhljO//c2R
	lGcfiwH3nU5uVzBfhZkFzFWuE93uSEuPx9K2sQtp/H4GJI3GIDmvimDTuRD0EFvw3a4fBcoh9QS2O
	w2XtLDXv/0eUQVdWFMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njpoR-003jmx-Hh; Wed, 27 Apr 2022 22:07:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njpnz-003jaI-KU; Wed, 27 Apr 2022 22:06:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30C4FB82B02;
 Wed, 27 Apr 2022 22:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59B1C385A7;
 Wed, 27 Apr 2022 22:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651097196;
 bh=489hiLJcs6Ide99fGbIyUUwfO7HB+IkkCGXSwNjrVls=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=G/2cUhuQR3ud2rXBziL0oth7g3hoX2Prqkr1UbESIsL88ApimAswbBe4zAQlK9Wz3
 2n7m/Sij2UzhwGpvx/x/Kvv5dDbKMihZSAXPu2i9pjF5+IDOG/MkNgFDQGrF7gVZk1
 cz5l6d4DdoX1AwJFeI3f48y0gyYwzVktJyeA9r1SkR3d9dHgAlgndCdsMcynqgfoNN
 OG3jhzKpU0TJrOskD+z3GrxODGhLsYDa8jLDolSI+R5FptNvMYRbO/fxhYjAi1U8e4
 ss5/qUdaXYIWtAa3eHZ4xilsuuKDV3h3/ms0xIaWu5kKFvE5n6eiNqSL4IBlpUccQd
 VjkMqDrLL/smA==
From: Mark Brown <broonie@kernel.org>
To: gch981213@gmail.com, linux-spi@vger.kernel.org
Cc: cai.huoqing@linux.dev, paul@crapouillou.net, richard@nod.at,
 krzk+dt@kernel.org, yukuai3@huawei.com, colin.king@intel.com,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, f.fainelli@gmail.com, p.yadav@ti.com,
 tsbogend@alpha.franken.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, rogerq@kernel.org,
 linux-arm-kernel@lists.infradead.org, miquel.raynal@bootlin.com,
 wsa+renesas@sang-engineering.com
In-Reply-To: <20220424032527.673605-1-gch981213@gmail.com>
References: <20220424032527.673605-1-gch981213@gmail.com>
Subject: Re: (subset) [PATCH v6 0/5] spi: add support for Mediatek SPI-NAND
 controller
Message-Id: <165109719250.501011.1358501844817783587.b4-ty@kernel.org>
Date: Wed, 27 Apr 2022 23:06:32 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_150639_860898_E3B5768D 
X-CRM114-Status: GOOD (  12.80  )
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

On Sun, 24 Apr 2022 11:25:22 +0800, Chuanhong Guo wrote:
> Mediatek has an extended version of their NAND Flash Interface which
> has a SPI-NAND mode. In this mode, the controller can perform 1-bit
> spi-mem ops for up-to 0xa0 bytes and typical SPI-NAND single, dual
> and quad IO page cache ops with 2-byte address. Additionally, the
> page cache ops can be performed with ECC and auto data formatting
> using the ECC engine of the controller.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/5] spi: add driver for MTK SPI NAND Flash Interface
      commit: 764f1b7481645b2b4488eda26c4da7f331697e6b
[4/5] spi: dt-bindings: add binding doc for spi-mtk-snfi
      commit: 69bb9b29bf67e850beece45e9c99ca707eac7e41

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
