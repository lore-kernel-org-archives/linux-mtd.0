Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45180C5AD7B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 22:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwWUrPWDP3JEBeX1y4PsJUig6mjloes1mwwqSXNU8ko=; b=W08i5PqkrH4guq
	+/EwiXtV5W6cQhM8QUMjraUL/ReaukDUBnupcN7NagWkQR996IDSVUVKGzIaS4aW0SpkfemMh6gw8
	Qy+Ie92iMSK9WJCUZKfikv72O00pnOWLBpOUvPu62Urh0Qs3hxkZ6LeOyw+Z7HA6lQtVGGCXu8YCD
	59MJmhVJgEBmO+FTYuUp8nL0zs6hs5vYKk3W1EGTzrre9OrQAvSHkx5yUdSaJvYMmHClSPVU3hvke
	arkoI/IvimpcCiiLQeR/It0Bf8kKUe+/IOAbNnAt05J5ETWBpVEdNENuUHQNpIupL+ga1g5t/tpm3
	vS+p5TFqVH49KR8civ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtYiF-0000000CyzR-437X;
	Mon, 10 Aug 2026 22:43:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtYiE-0000000CyzL-1hia
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 22:43:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 78D8740A2E;
	Mon, 10 Aug 2026 22:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB841F000E9;
	Mon, 10 Aug 2026 22:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786401797;
	bh=S3Nx0KYGlbaQ5NYEXpDEi2n/Rdo9pkHGeCmFJ3YLfl8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BmBTx0m0bfoCv/H1nZjcSWYQvJIH5Yl5lwa7m1xWjmWIo/HmUFDWCU4hivj7EipuJ
	 LRZ8a3EMEtXzsc/mtXtTn+oQ5jl6jtVDsc5pYPQkqTgpO1SsWFFpL3latQiFEcX2Lb
	 mVUR7LdzocNT0kuT6GWUJKydG9lRN/2PLMJfseMD2EO9yfu586wziKKcWuJLJ8GJOk
	 hVncBsH9LcRP59Lr2ori4liD1nm7sZlTSd3CoH3fdZh+safTgV/ujNGV6vyocLRFeW
	 aZ0jpPJCwhhzo08j65xPKoeUx9iLV/xsx6PXrPRvuvd/UJ92/fk5xxV5jfGxVNy2J/
	 TdcDpOjMPhO7w==
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
In-Reply-To: <20260810-winbond-nand-next-phy-tuning-v3-0-a97c3a61e675@bootlin.com>
References: <20260810-winbond-nand-next-phy-tuning-v3-0-a97c3a61e675@bootlin.com>
Subject: Re: (subset) [PATCH v3 0/3] mtd/spi-mem: Enable DQS support
Message-Id: <178638127767.155010.4353834320826597950.b4-ty@b4>
Date: Mon, 10 Aug 2026 18:01:17 +0100
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9NnheU22Odpz1y5Y2xIs9SQi9OreAJaEt6jPIy5crRE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqelQCRn02kb6ZYgBDmt++bfRr+a+9fws30hFSf
 Np2DXuwY5aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanpUAgAKCRAk1otyXVSH
 0PWvB/4sjE9j1H3UUoHHc9S14oxHHOeqsGN/7mkNYcFWkCclbwLGhfyWunpAT6J8m4JRiQMUlxk
 dS7RNEtwn5GJp0YwOryZW3Ino9C34NnzXYN+kOmAmA/5ZNUXcG7hsnY792a2FLtx+vrpzjzj3Rt
 ccFHM1SVyAbE5gKGTwuW3rtMXQH6STRwecNG7vJbJGMlBSvvH6mTySdNmfk1PLyPJaRZVgvnMAe
 Is6IZvACZOQGMPWbs/2gcZ2uknWlpyo2EKF3gFf7yRFoXg+f0MxFEafLzPvkAG4Z0ZyFv/VzWzl
 i6fRbQBceE+50tV1gJNIbH4z3hy7ihF+KVJ3FFTAzp7cmDJs
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Mon, 10 Aug 2026 17:10:41 +0200, Miquel Raynal wrote:
> mtd/spi-mem: Enable DQS support
> 
> For his PHY tuning series on the Cadence QSPI controller embedded in TI
> SoCs, Santhosh initially needed to access the availability of the DQS
> (data strobe) signal. This is a chip dependent capability, which may
> sometimes be enabled.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/3] spi: spi-mem: Flag DQS capability
      https://git.kernel.org/broonie/spi/c/391144742324

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
