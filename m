Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D107C54ED1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBKVChEW6t86qWu7Qkwjvd8CKPqhigUw4WzjTPQYVE4=; b=mVhv0Y1y8IR1Y/
	Gl4fekMByZaiOcFkyC0kmSPjjG6eW5HnKdjwp1rGW652XzC0CsR2OCZqSrq5PJT5X2YSY5F5DAvEC
	cFu87jzI0AWuanQRnDXM04fair3BXNLIRr290IJ0XUOuBZ/UlqSxoueBTyan7yijef+UQggpH8XTi
	oDa32YqNT9QXolATzCHxDFgvoTw3Hd+Sco25MDkB1ApLpQHNG3pvaA4eTLpvhWa1Qf23jOE2ZF1tB
	u+LrU2v12+sCdyGIXNcu8hIlYpLaOJOLu181LBjWiT94C/LHmL/xAoALiLS1JSg/hqZ6QF+uVrHDs
	6SxtFA2Y8OgAAQgmrfmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxQ9-0000000BC0S-2XIM;
	Tue, 27 May 2025 16:44:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxQ8-0000000BBzh-2DLm;
	Tue, 27 May 2025 16:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FBA460EDF;
	Tue, 27 May 2025 16:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C984C4CEE9;
	Tue, 27 May 2025 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748364295;
	bh=/jj76ajhqfDNRJG/rDNhF9m8qFgvPrdlQW38Y/d1ho4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XS/eYLBiG9Kj5HpjFD9Mdod1eCkAnuyluBZpxjtfHIKHRNwSTjUQv56z9qDudfB59
	 1cINU97WXtz+KvLbUjWVj4hHT7dR15FygrzgoCfyk3a8KnBDFOJxPcd152vBM/3MiB
	 P+rwdLZgta1AaUnaY4nZ4gHhUMrYS0qtnMDKjl9HplWuDUIaDVo1+iANSa0mTjU6BG
	 cw++bTqqwpFlE5AgMf7L2Rt2+U3bYy/SHXBvvlEXXlIgezaHbgNh/q1jVJ+0uMsCXX
	 pi7FwG2lpb/5J7ByP/ekB4iysZxdExFvgOre+5S6Hah5G2Qu7Ykgxi+PAInmqoxjwJ
	 0x/X91F06o55A==
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
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
In-Reply-To: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
References: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] spi: sophgo: Add SPI NOR controller
 for SG2042
Message-Id: <174836429126.109342.7717810791199744277.b4-ty@kernel.org>
Date: Tue, 27 May 2025 17:44:51 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
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

On Sun, 25 May 2025 22:58:40 +0800, Zixian Zeng wrote:
> Add support SPI NOR flash memory controller for SG2042, using upstreamed
> SG2044 SPI NOR driver.
> 
> Tested on SG2042 Pioneer Box, read, write operations.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: dt-bindings: spi-sg2044-nor: Add SOPHGO SG2042
      commit: 8450f1e0d3d0e0b200eb14d14dfb8ef5ddb9bda9

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
