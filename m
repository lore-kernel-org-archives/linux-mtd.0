Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00969C54ED1
	for <linux-mtd@archiver.kernel.org>; Thu, 22 May 2025 09:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDLIQ4Ks72i+nycUDkYssJBR1U3/aJ0/Vs/4PklOD1Q=; b=rPUO6luUqvS3EI
	BIbjvLwXZL7ze3l97/283rDF8tjPufqFRzKOTv6PqSgAIHX0xOx/FfTwf9M4yHyYTezyGcySUbW+G
	VZ5PcC8IDSPLsEgyUDz+TJvfmDtn60WCj0ZhOgV/Syg9kNaOmJsWHwYh7aqP17OHOAxXg8rC+s1m0
	icjsQv3Qo9T4RJ1PHj5I01phHH3ntdO7FkM96ar13dwE8nvwLFCkwhHR/9IoZyok3HGxrbUi+FIFL
	LCWWsYemK+SMWpHm2WX6C+pPehsrnc+1Qmr8FyO5J7zR7EfUzA6SE3iFP+Sxh99IOqqXVBRlyelcZ
	aw0jhpbsCq3URsGE+Haw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2DR-00000000Uur-3FiQ;
	Thu, 22 May 2025 09:27:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2DE-00000000UqL-0Hdq
	for linux-mtd@lists.infradead.org;
	Thu, 22 May 2025 09:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD37962A38;
	Thu, 22 May 2025 09:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED8CC4CEED;
	Thu, 22 May 2025 09:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747906058;
	bh=CakTWiRTuc1kwxhluKVp8AMxsPKiZuuQKUFMa9udh6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WBBPFL3V+XOLjxC8hQGucC04A2kD6Kd63bj7dTwhvUsvlh+lI9bpYNiOH4qUdQrCZ
	 9Tl1NrptEO+2ekEMfcO9Fc/8L4ZMgCxooC91YbjImqKGb/dChknJXAukPRoLmkB6lv
	 MWvSLnkxN+x25EsrnTcwloEG/N/o6PNsPY4wQbHItrtZP6tCdV/hl3Sr3D7gjeE6fx
	 Ot7gul2PK8eru4TKTsF48l6uYNGe0bFPX+YFoQJm+x8dpjYNjKeFKmy1tnGDsO0WgJ
	 16fvstYqwuFJyMc0thiU/DgHw1CmR+WNTmmucrCYPeU3TIguWiT09SwMvIwNsw8375
	 lG/yYna/ei1Ow==
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250520-qpic-snand-superfluous-params-v1-1-86dd4963e90f@gmail.com>
References: <20250520-qpic-snand-superfluous-params-v1-1-86dd4963e90f@gmail.com>
Subject: Re: [PATCH next] spi: spi-qpic-snand: remove superfluous
 parameters of qcom_spi_check_error()
Message-Id: <174790605671.30110.1298547023446316402.b4-ty@kernel.org>
Date: Thu, 22 May 2025 10:27:36 +0100
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

On Tue, 20 May 2025 21:08:56 +0200, Gabor Juhos wrote:
> The qcom_spi_check_error() function determines the errors of a previous
> page read operation solely by using the cached register values in the
> register read buffer. The data pointed by the 'data_buf' and the 'oob_buf'
> parameters are not used for that at all.
> 
> Remove the superfluous parameters of the function along with the related
> local variables to simplify the code. Also, remove the variables from the
> caller functions which became unused due to the change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: remove superfluous parameters of qcom_spi_check_error()
      commit: 0f529570ecaf99244dc86b8af13618f0d07b0e44

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
