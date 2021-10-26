Return-Path: <SRS0=fZpl=PO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A9AC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 19:07:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5BAD6103C
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 19:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5BAD6103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzmzWpqq4fYDuFTh4FmS4oewH/Gpf5ipSmGAot9uJ1A=; b=w3LfdgcMfV54xr
	NMk8Cr5vW3GLixjUkjGlMVzNTJVoB5jqUvhr+MoxgHrRDdnCkPxNrqjO7Ph7DKxOwcLKSeeCp9jDQ
	mrY9b+r2Q1c8H8ebZSHHOwfHWYXUrXnnGx6UKg84dLWwQWtYCpv5CVGj1/VVi4COEKvedpm4IN21F
	RfMFQJVrCw0rhu4ZyKUU9Ls378UzRd4FHz+L8hLcWBgNEYXdqhrz2xufo7R9ayv5eJg1w8W4v7bND
	aQyaTsK+6xXEYFeOFQaD6ROC2a+35QpkfwAMRXdXEPWkKlVYoWPKxISGLeNl7DM6bVo6FCU6YUnhk
	GzQDYIDXWpdBdw2ZmGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfRmw-002r1R-5J; Tue, 26 Oct 2021 19:07:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfRmt-002r0t-0a
 for linux-mtd@lists.infradead.org; Tue, 26 Oct 2021 19:07:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F3B96109D;
 Tue, 26 Oct 2021 19:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635275226;
 bh=vZTpReTVu8G45pFyoSoR2KCp22nstJkeL/RzTNGG1Ik=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qfK6NGcvyLii2uJZpeLvlkpovnVBvdFnxiETaIMv5jgznWWBvGi3iGMk9wfBugUWi
 Bw0kGMWlWGy/qDI08yvmRfJcGG2gLTBzqPuyAtxOVvSutZxXy4g29u+THRUIgNEmqc
 hoA1uH3iZwd/prK5FGNI+JheGBgdDXRlFCPS25nQg6/jtPJ0Cq9yb/BzLewUZh/d+n
 QdM11okNuFf8cWp3V3SsOi0w/XWgf/z+rJiG//PEhrfp2SU+rtIveOtHKB2VXjuYqZ
 O3O/RLiKiuszRSuR0FV4TfPmZuFd46pVg/9cJuSXR877e2xn0h9DzXjcs+qkXCoHse
 rAGrt2zPLX/Kg==
From: Mark Brown <broonie@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: (subset) [PATCH v2 0/7] Add SPI Multi I/O Bus Controller support
 for RZ/G2L
Message-Id: <163527522326.2033998.11228661564873952732.b4-ty@kernel.org>
Date: Tue, 26 Oct 2021 20:07:03 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_120707_097659_236D0C8E 
X-CRM114-Status: GOOD (  13.93  )
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

On Mon, 25 Oct 2021 21:56:24 +0100, Lad Prabhakar wrote:
> This patch series adds a couple of fixes for rpc-if driver and
> adds support for RZ/G2L SoC, where the SPI Multi I/O Bus Controller
> is identical to the RPC-IF block found on R-Car Gen3 SoC's.
> 
> Cheers,
> Prabhakar
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[3/7] spi: spi-rpc-if: Check return value of rpcif_sw_init()
      commit: 0b0a281ed7001d4c4f4c47bdc84680c4997761ca

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
