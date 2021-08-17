Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC256C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 14:23:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7619660FA0
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 14:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7619660FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VhQ93dBhH/s/DJkyR/Jn3rb3n8dSuv1vHPp74Deiy4=; b=tZvCUUdqY/OHHE
	5j2OsmRxaNrUJkf49zRqFBQALtBCCQ8zrXPWGaUwdN3+QQdge2hTpJUX8ADxdee1Sn29hUkv8j9/n
	fsmA/miFOx4pYy7zlys6OrViVZYMrWEnB7+AwPCrSDeO9Nz4lVyZsGAURMX6hbKYlLNZ0l98uWGLA
	YzB8/pFvwC67rGvEm1LpOAVcMulhGrtVeoyLxBXsMwrlRDCxis7ERkWd5JpWevBFcwm7XOHERUwpg
	gvMhN8jDCIC7ZldXmML+ncecwOhV+4ruuR7BYDs+ITrWt+4O0dcro3sFr0vsRS3gDgGJfwR224wPC
	gH2QTBVPiYKMQW7hyiLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFzzk-002fvE-G7; Tue, 17 Aug 2021 14:23:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFzzW-002frt-GQ; Tue, 17 Aug 2021 14:23:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7758260FD7;
 Tue, 17 Aug 2021 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629210178;
 bh=6FJLsHWGhCXNnGMIy1qZpzrJFMhBYFoGAIzuJAUWN4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TZFC3jWYXQYZ0MkWa+cX5aDIJ/wGtkLimDf8ewNNLwjx99Ar5roxN0hls+7n2A3KZ
 qNzQ/l6GTw8+H7I7Mw/Xvmdt9imB4HwiAoCFPxLgV3h0x80eV5OGk0duC5hk8HRSbU
 0foyZnVTWKwTKnCsSLsbVY8Hb2v9yvXe8LGmacLAGzRIYbjRO34EE8uKwT77860FrO
 PJOgVQw2w71NcsbETJ4K6qm3WJUQcSO0+kKpefgFC0wNXsiEy8dAnU7tadHwwv99tD
 qb/gpm/J6n4Ko1+2ZgdMiE9ZRxK5VYrs01za8l9Umb+zoSslFzkHF5qKdrqFttlaLl
 rabOOaFTYkusQ==
From: Mark Brown <broonie@kernel.org>
To: Jon Lin <jon.lin@rock-chips.com>,
	linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 mturquette@baylibre.com, hjc@rock-chips.com, linux-kernel@vger.kernel.org,
 jbx6244@gmail.com, sugar.zhang@rock-chips.com, yifeng.zhao@rock-chips.com,
 robh+dt@kernel.org, heiko@sntech.de, p.yadav@ti.com,
 macroalpha82@gmail.com, linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v13 0/6] Add Rockchip SFC(serial flash
 controller) support
Date: Tue, 17 Aug 2021 15:22:32 +0100
Message-Id: <162921014496.3711.7793277648760166515.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812134546.31340-1-jon.lin@rock-chips.com>
References: <20210812134546.31340-1-jon.lin@rock-chips.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_072258_624506_F46F76FD 
X-CRM114-Status: GOOD (  11.63  )
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

On Thu, 12 Aug 2021 21:45:40 +0800, Jon Lin wrote:
> Changes in v13:
> - Provide independent interfaces to obtain RX TX FIFO status respectively
> - Add more debug information
> - Depress DMA limitation
> 
> Changes in v12:
> - Remove useless oneOf lable
> - Add sfc controller discription
> - Remove the limitation of SFC_MIN_SPEED_HZ
> - Add IRQ_NONE method for irq handler
> - Add SPI_MASTER_HALF_DUPLEX flags
> - Add sfc interrupt mask bits and status register initial progress
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/6] dt-bindings: rockchip-sfc: Bindings for Rockchip serial flash controller
      commit: 538d7c2ed73098850fe80be14eed2739d37e419b
[2/6] spi: rockchip-sfc: add rockchip serial flash controller
      commit: 0b89fc0a367edab09065af722894d186bd0ccb0d

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
