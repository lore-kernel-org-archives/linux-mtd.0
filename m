Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A63C87FCF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Aug 2025 14:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2yOQkqJAnh8biZlkh76exssibWfmK+UO8HuQJ/l2Ik=; b=mcZgQinwdXIp1e
	/Lq/h1l4L16hcGF1nWumJiNOGpbBOz953uoR6P0BklACmepAbfRZ9Qjx6t4VE4oVqZ2PpU8Oce0kS
	2NLn8SeazRgvMu4Kx/tgoTsh72iYRtGvT18HBSGhdrwkh80PFIdquOvDx3vHohIUtkIAWy02XUsSO
	CxRgDrXM2fObihsDQEsSANi3bmlthX7IAbDwGdXSkO2VNO3ALHRqF6f8XQCV9aTP/11dgsV01Kf1+
	ao5icDV9XN3I+VN7wkRKJbBeVESDM3uKx9p8ApyANtW830SES9fmX7MvGAW6EvyC2Dph8Lx8ZYvpx
	33KOOwKYBduIl/A9TCaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCqh-0000000E1UJ-1Dzz;
	Wed, 13 Aug 2025 14:53:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCfO-0000000DweK-3F6B
	for linux-mtd@lists.infradead.org;
	Wed, 13 Aug 2025 14:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF1085C6517;
	Wed, 13 Aug 2025 14:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23010C4CEEB;
	Wed, 13 Aug 2025 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755096085;
	bh=HKyIijaXh1w5Jroesi5b2BdQwMPe++PeS/K2cJkbz34=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fvvYmTkceWapnldHCjNmp31jGhrmafhA5kz4KJpasZ/draEa3npUieeDNyij73UZh
	 TuNSEsYfw7xDcU1WinAH9oPyN1VTxChGbb9vVPY0jg4FBPVluRSP+5+/QHtRUi0e5d
	 ftQ3J8j5wHu06bAoS9ZCbd41TeUd9rmE/uhWgruMH8TNOESoGppDdSrJNiFx8kKUgH
	 RVQM/17LR5mHrvc3B8ha0wyhzF5jED+l5mcK4s/dT0xOn6rrHH0Dl+VZrapQ3YDVN5
	 GNFLmU2PNMW4KaeLWQoF7IDvkwJX2VUuVGFyqD+9eMFYoTVANyWxIaMNaKM5fLfy62
	 C3r9VU+xzwugQ==
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250808-qpic-snand-handle-use_ecc-v1-1-67289fbb5e2f@gmail.com>
References: <20250808-qpic-snand-handle-use_ecc-v1-1-67289fbb5e2f@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: handle 'use_ecc' parameter of
 qcom_spi_config_cw_read()
Message-Id: <175509608387.67167.5532108779894723750.b4-ty@kernel.org>
Date: Wed, 13 Aug 2025 15:41:23 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_074126_862029_7DB7625B 
X-CRM114-Status: GOOD (  11.56  )
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

On Fri, 08 Aug 2025 19:15:01 +0200, Gabor Juhos wrote:
> During raw read, neither the status of the ECC correction nor the erased
> state of the codeword gets checked by the qcom_spi_read_cw_raw() function,
> so in case of raw access reading the corresponding registers via DMA is
> superfluous.
> 
> Extend the qcom_spi_config_cw_read() function to evaluate the existing
> (but actually unused) 'use_ecc' parameter, and configure reading only
> the flash status register when ECC is not used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: handle 'use_ecc' parameter of qcom_spi_config_cw_read()
      commit: 9c45f95222beecd6a284fd1284d54dd7a772cf59

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
