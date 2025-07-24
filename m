Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785D5C83F26
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jul 2025 23:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2/uVzregUrcmZITtgTGlySDM0qGQQQHQHzBBAF1oec=; b=xMtWLfB8GjrgC5
	yi+a26GTG4iLYEonzAwo0YzyOefNjy+Q5qGTpIqQO0UfXGjWcMyf7HneVk0qJEeaPe1b5N7W/ZEyk
	NCsmRChPtVwhnZj18CxJsRnYoT6KL+F6FuY/l4JkqZMeNtu+BJPYWb8ifpVxYXkNk3l3SY+je0goV
	k0DlBnE1W/otFRHNVUbOxavBRr4L27ezL9aeuMCeTfI1lfV2pieIqteSOmLFlf63yeErQgJxE1ag5
	BJvMvUWn1W3sU1uxE5y/yOy3fpN0sVDLzvlKbRDrUj3fvmelkZ0Lw5hvmkeijx+6PxB4LjfkI1FLz
	dWvvgzhlfqKiW7PLE5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5f0-00000008i9E-2sD7;
	Thu, 24 Jul 2025 23:47:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5Rz-00000008gYc-3R9C;
	Thu, 24 Jul 2025 23:34:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24A695C5EB9;
	Thu, 24 Jul 2025 23:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D46C4CEEF;
	Thu, 24 Jul 2025 23:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753400050;
	bh=V/nVDfUDu3zSIVPxQrgq0fLEk+npFlmaZe5/m6YKPSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ypv9ArK+bgmMc8teMUqXtnSAPN0MNSo+G0YqQESAZ/g8tiixTe3dRHOOdLQZf3AUi
	 PaAebzgijsBynRI4Ii33DPDe0mT+d7eJn9KVTuP1BEnMcV/LSxamLMPXfNDy0bkr1h
	 I7Gmmkia+LNw4kXBZu/7wu3ZYOg+R2QC1U+2rA9GTq0d4iqdlrWzszngmQYQCoiX6E
	 OOpDoH24aknAi5Nl9yzeOCH1EVY5U9+DcFHtenrlAYgxO5SqANqpBcktfWgkxOPaOn
	 DwQ2438D5NC8W7RFOJpS6Dc/MxZxx7HyHJm8XGAAvy2+PtBxq/WZODctPMgD9dSwad
	 PzzSFFZ48DSDw==
From: Mark Brown <broonie@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
References: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
Subject: Re: (subset) [PATCH v4 0/4] spi: sophgo: Add SPI NOR controller
 for SG2042
Message-Id: <175340004627.192002.3302155786508203444.b4-ty@kernel.org>
Date: Fri, 25 Jul 2025 00:34:06 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_163411_901979_F4282521 
X-CRM114-Status: GOOD (  10.68  )
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

On Sun, 20 Jul 2025 16:31:42 +0800, Zixian Zeng wrote:
> Add support SPI NOR flash memory controller for SG2042, using upstreamed
> SG2044 SPI NOR driver.
> 
> Tested on SG2042 Pioneer Box, read, write operations.
> Thanks Chen Wang who provided machine and guidance.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] spi: dt-bindings: spi-sg2044-nor: Change SOPHGO SG2042
      commit: 7438379cfc47046f7507dfdb54906acf56288b9f
[2/4] spi: spi-sg2044-nor: Add configurable chip_info
      commit: 5653b4f8840801d9d141ba6a6c10e7cc15040c5b
[3/4] spi: spi-sg2044-nor: Add SPI-NOR controller for SG2042
      commit: f6b159431697c903da1418e70c825faa0cddbdae

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
