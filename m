Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB58EC54E90
	for <linux-mtd@archiver.kernel.org>; Thu, 22 May 2025 09:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywH+yqeyxK56TCKjG3XNDLpCsP5hAzzNg2peRkAndK4=; b=1gXRtBDpzb2K+z
	8H8+6xMrEY6DkgykMfyoMeIx716fHgeF/AaHsStNcIURKnde2U1c8YQMXnXNquWtnI1ZNh27g3J8T
	yRrqmeuc8omCxdsJ2D2lmYopenhCi2pkf6Fh2A+1yBIb40ck8MP2v+SRSPAw/CLDp4laRgw9BDuuC
	OcYn+eHuf/jebjTQBiLWbfeFTyDw2N+RZv3KGmAK9LUDX+ya2spAok9qDWginf9B8LgfypDfRh7Dn
	bmT6kbYjuoyDvquciU/Vw1MvcriLGmFkF1+Iimcfsun7m3olAhGjZtN7uIpTXthNYdi3eVgH+/b4k
	mojroAZON58p6MqvGgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2DS-00000000Uv1-159x;
	Thu, 22 May 2025 09:27:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2DF-00000000Uqd-2TFS
	for linux-mtd@lists.infradead.org;
	Thu, 22 May 2025 09:27:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB46AA4E92E;
	Thu, 22 May 2025 09:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E29C4CEEF;
	Thu, 22 May 2025 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747906060;
	bh=8zYFm2/+iwmpkOGr5JNANwTIY7S1T/GRs1rvV4bxXfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KJlxGnYDHsrrJJ7Q69yDauuRz6o9ebRYVFgSnPSy+ebfpVhSFcMMLuBM8O9H755qs
	 YA1B7c8dewFsFnuLE8hkZ06+1iTRMEUl0yVqMyIH87X8mcw+vKbHuqFYJLoJF9UNhX
	 pJ+KBxXS63nSf44Jjr8c08yznZsMYzbYfzFpqES4JjrD050JyR8MGf0ZSXOxdkw8HS
	 WiZTo7zgIJtf3gU9kB17C8j64hdG0VrPa+X1mJezVp4EyemGXO8iNHLr3j5M2s9/LB
	 KOc8LJElLUCh5yVraqU+F4GmpWnqzi0Yla9yFyHzEWUiJkx/vc60yNwZPNloIrMIXP
	 WRZsmR+GDYIxg==
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250514-qpic-snand-error-check-v1-1-c0ebd3aae72a@gmail.com>
References: <20250514-qpic-snand-error-check-v1-1-c0ebd3aae72a@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: reuse
 qcom_spi_check_raw_flash_errors()
Message-Id: <174790605877.30110.13985629144771079611.b4-ty@kernel.org>
Date: Thu, 22 May 2025 10:27:38 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_022741_705799_532C3737 
X-CRM114-Status: GOOD (  13.14  )
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

On Wed, 14 May 2025 12:16:38 +0200, Gabor Juhos wrote:
> The qcom_spi_check_raw_flash_errors() function can be used to
> verify the flash status after raw operations.
> 
> Move the function slightly up in the code and change the
> qcom_spi_read_last_cw() function to call it instead of using
> an open coded implementation of the same check.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: reuse qcom_spi_check_raw_flash_errors()
      commit: 4026c6b51cb9ffd1eea2206191552f8aa3cb55ea

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
