Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AFAC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Dec 2021 18:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FoeP5bMziiUZ1GjhPkgIhiWaWl0J7fx+bsmgheTOhB8=; b=dlTgxg/sxNsbn/
	id6N0Zjy8FwCbVjTwqpmZ3TGlvnYZamxW+hUkyotA98XBH5C1PZXteMvnW1ayHkgNOy+tRs9BzKSL
	N+ZkHglPiTyYfFj5y/un2qIy3pANrIY/A9JobpKfZClWAKQbrqNqP1Zp+SPTcbnjvawZ9pZqTsoOy
	XmIYn085K0/tY4Iz9UNidJPZdFa+q4j0ixvUl82Sx/iqAA0rm4GxhKoKxQlSfHSNhTLLm5UWQu0HB
	+rosqx/E8RbqEMysLHRZlWv8jNzqftKJsFtOqU4vzAcrFitDi7mDPaY6TTOQJ0/KfC1514x8VHxXr
	v1Z4fDLaDJFO8iSp75iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msUPp-009oLN-VZ; Wed, 01 Dec 2021 18:33:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msUPL-009o32-Mk
 for linux-mtd@lists.infradead.org; Wed, 01 Dec 2021 18:32:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6AD84B820FF;
 Wed,  1 Dec 2021 18:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A617DC53FCC;
 Wed,  1 Dec 2021 18:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383561;
 bh=XMwothHRCXVzZ7qmcrWNOO81dC0kkr6UvNf5WH7ltLM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Y1nuZMGHOzUV0Ug1r3QA0CeX9J7FOZKu4HRVU1axUgnUZDxVpj2qLy4uwCO2/dGTA
 QeUar4guoqNcudmg3u5RsCpuo7xm/sZS2981z2hmHOErkVbLT2uTU1r9ovleILRCrn
 WR1fki0IuRMn2D+ZR9R4g5AvXrAbY5D788eQnRG5My6rXnzMpLnAyVQcy4oSYQHAWN
 7wase2qkq3sJuc5Tb5s+r2B80UKr7dT2pbV7V105eosxrnFfKUghlIxeoupf7d66Qv
 P8ISnA2JAHKpLlZWC2my+Jw2Or8VgXaTPoPVnekPT+XYEhZvUQF9Tu+Nw6achlZz4+
 bqjq4mp9mxB/Q==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Pratyush Yadav <p.yadav@ti.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Nishanth Menon <nm@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Michael Walle <michael@walle.cc>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org
In-Reply-To: <20211109181911.2251-1-p.yadav@ti.com>
References: <20211109181911.2251-1-p.yadav@ti.com>
Subject: Re: [PATCH v3 0/3] Add bindings for peripheral-specific SPI
 controller properties
Message-Id: <163838355839.2179973.4774761056314884390.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:32:38 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_103243_941959_8E24177C 
X-CRM114-Status: GOOD (  16.20  )
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

On Tue, 9 Nov 2021 23:49:08 +0530, Pratyush Yadav wrote:
> This series adds bindings for peripheral-specific SPI controller properties.
> See patch 1 for more info on the motivations behind this.
> 
> This is the best approach that I came up with with my limited knowledge
> of JSON schema. It has some limitations that are mentioned in patch 1. I
> don't know of any better ways to model this. Suggestions are welcome!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: dt-bindings: add schema listing peripheral-specific properties
      commit: 8762b07c95c18fbbe1c6b3eb1e8e686091c346b5
[2/3] spi: dt-bindings: cdns,qspi-nor: Move peripheral-specific properties out
      commit: b6bdc6e043906c70e949b2747772e6aa1d36f2a3
[3/3] dt-bindings: mtd: spi-nor: Add a reference to spi-peripheral-props.yaml
      commit: e9d7c323cfbbd07c365a419b4ce3dc2f161442c7

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
