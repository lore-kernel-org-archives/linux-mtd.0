Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D60EC87FCB
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Aug 2025 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esLegLP+dUZUk3J+8tkEsRBCcKLKVd6YqCRWbxraC40=; b=hgCbvZ5KBcz67Y
	OKUiMKTa63GaQ1SHSf6ZIeMztkEukhZkBghUubEXtq37F1viyeUt9UitDiVep7zNO4sZ9lm/RsucE
	SYqAVZAHatSMGuo8W0UVwoEdk8uAwz2C2qhqlzDDRimZIsjvymmQ5vhuQV5YCMdv4UBWqmxSz1Cab
	avaKaR5uzpQ6mPFt7h3Scb1FA0AxizyNDFh6VZO8HP26humVbaGzSpRH0kn/gdQ4r/Ae2NpsLx+sp
	cGelvjHnUIR+/fgUflqWb/erFWK8ScEgBMGXAgkOCgDYxccFx9iS2NZEWJt0MF/52P0ZmcK/xRbW8
	5plUGuLCujVBLfojEsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdIr-0000000F9EB-2hFR;
	Wed, 06 Aug 2025 12:31:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdIp-0000000F9Dm-2rgP
	for linux-mtd@lists.infradead.org;
	Wed, 06 Aug 2025 12:31:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97196601F9;
	Wed,  6 Aug 2025 12:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4665C4CEF7;
	Wed,  6 Aug 2025 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754483490;
	bh=pddWyPwjs2fOn7Jr05/MG2ACl0zA9Y4SSHMKsBzkDy8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WFJ/g13iFNkaHr2ywCr9SJjhaz+5pikuyhff1olloeRcHEszoBfd6GjeLMNBN3IDL
	 HIyBIZp77EEgz4E/RcZ9pU/AnOmxutrgAWP4XYGQsABk7My9W7279xSBw4vSyZcrL1
	 ZYEjplmCBrxt9r4DylI4d8nh1eyDZYq/VfdZ586lgDaOQEkbvWPpbMazpSjecLHxqo
	 7iEqIRBgoR2DV3S8/DatxIY4SE/kWMtLr2tbTBgBSxRI9/THGBP005p9XK85JMCw1r
	 MYL3xADx07My/pFHLIZ5cDqt18z6cXqt4WUTu0oKird956Dpdh1IBQYbBivvLp11Ve
	 bl1cf5xgiEuJQ==
From: Mark Brown <broonie@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250801-qpic-snand-oob-cwpp-fix-v1-1-f5a41b86af2e@gmail.com>
References: <20250801-qpic-snand-oob-cwpp-fix-v1-1-f5a41b86af2e@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: use correct CW_PER_PAGE value for
 OOB write
Message-Id: <175448348842.51843.4908652099889522195.b4-ty@kernel.org>
Date: Wed, 06 Aug 2025 13:31:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
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

On Fri, 01 Aug 2025 09:58:35 +0200, Gabor Juhos wrote:
> The qcom_spi_program_oob() function uses only the last codeword to write
> the OOB data into the flash, but it sets the CW_PER_PAGE field in the
> CFG0 register as it would use all codewords.
> 
> It seems that this confuses the hardware somehow, and any access to the
> flash fails with a timeout error after the function is called. The problem
> can be easily reproduced with the following commands:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: use correct CW_PER_PAGE value for OOB write
      commit: 6bc829220b33da8522572cc50fdf5067c51d3bf3

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
