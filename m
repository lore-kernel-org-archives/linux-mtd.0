Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DE1C83F03
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jul 2025 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcWUA443TBRnM3SrtCeAS4+v9FwApDeR2n2ZPvQ74vU=; b=0W/jnkz7ZWu1P/
	CjPwBLbwbUbQkIQ4p6Br7AG1hKdnJJJl1G+K2IIIxJt2kqK/id3cW+b0ThWoF5EcJCh55f6OXZkJE
	thOZsKgZFyVKpPxH/mrhajn0qNODHkMCwXfNbAzHe1ttA6Whf5dIZy2x5fhrCJGh+24MnqO0GwSFq
	kjybFft7RDjwZJNjgAc+NKnqXxeDwnNeInsQfwxgrLHqithkQu1DcAq44RiZGnTZj+3ZijgORjG3J
	8+YI87wMuxKb8tTcnbXCqC/7L4ttw6X8xKYbPtEg5BhCJisf39cpYNgGJs8oLGs2nn49MGI60qiEt
	gjc7wROsLqTP7oHqPsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg9v-0000000ETO4-1uSQ;
	Fri, 04 Jul 2025 13:08:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg6R-0000000ESr1-1ps9
	for linux-mtd@lists.infradead.org;
	Fri, 04 Jul 2025 13:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5D1B444CD;
	Fri,  4 Jul 2025 13:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864D0C4CEE3;
	Fri,  4 Jul 2025 13:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751634318;
	bh=n18TLJdy8oRm425IB+2oUJysVscGffgpBK8bL7uhx0g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qF0CUR60+B0U4xZ7bFWniSc6zlFtqqKo5a5Q2VEQHK8vcVwJcKjJbrjzoiumcYDBp
	 CbBESEuriBSY0pRe+AG6ef8NrKht8Aj4ZuukiFJMn3ukEzhC5VtFl712HFXPVq+w/R
	 C5x4uFADOwdB68eRKlZzUEiFzDCSf/WL0PfJbpYmIGsVCVzIzG+UU6fb0aSsOnNtVQ
	 D+hE8o+4+6qKjvKqceZ74Gp0d6vsDjWrdTuUg6LyrTo/leczMkVVrxIAOOLmGELW09
	 E0kb4jXtkaWcELMsZnVxenK22dTuTt/A69Fg8ugT2tRl8D14Eo/Y+kuQzjQQTZkF78
	 ytW1M7xl906tw==
From: Mark Brown <broonie@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Gabor Juhos <j4g8y7@gmail.com>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250702-qpic-snand-8bit-ecc-v2-0-ae2c17a30bb7@gmail.com>
References: <20250702-qpic-snand-8bit-ecc-v2-0-ae2c17a30bb7@gmail.com>
Subject: Re: [PATCH v2 0/2] spi: spi-qpic-snand: enable 8 bits ECC strength
 support
Message-Id: <175163431628.70446.712797583195740189.b4-ty@kernel.org>
Date: Fri, 04 Jul 2025 14:05:16 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_060519_498511_9B3CA0C0 
X-CRM114-Status: GOOD (  15.26  )
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

On Wed, 02 Jul 2025 14:35:22 +0200, Gabor Juhos wrote:
> This small patch set adds support for 8 bits ECC strength, which widens
> the range of the usable SPI NAND chips with the driver.
> 
> The first one is a preparatory patch which adds some defines which
> allows to avoid using magic values, and the second patch implements
> the actual support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] mtd: nand: qpic-common: add defines for ECC_MODE values
      commit: 0dc7e656ddd54c3267b7cc18c1ac8ec1297ed02f
[2/2] spi: spi-qpic-snand: add support for 8 bits ECC strength
      commit: 913bf8d50cbd144c87e9660b591781179182ff59

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
