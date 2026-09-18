Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59130C982CC
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2026 09:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ahcCK8mUJjZBE2SroaKrdWB79rL+naWvjzdwazOsKE=; b=yhp1jeBvUGmTLR
	/cCq0Rf7ZCqnrJqpDTz3vjSniKfzXEMorDWJD8pacYlp34WJYHMFmeDHnFzDV9H2IVm5RZxKzSdiL
	zpGT8shLggFJ/tny/5/AUXQzT6zMetHNrHwEeElP9HA9vGnfInAjmDu0Xb35I1bMPZv84DqcLn0L1
	SIJqDhEw9yMkQty/1r+Pxjjv3PgPqi4VVo9UDOtZrk0DSk/nRPbwzCwJ0Lc8SxYoi3FYne9CNFNsA
	CB0+Bhn9mjgktNYEdg2Tp1Ijap+3JZ9BgASf/Ob0rSmzcYC5pVn8E7JymxS7JeDji6wwRJAzoN5EQ
	Qw2HIbwd7coXdAWD3kRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7qzU-0000000G7FT-257O;
	Sat, 19 Sep 2026 09:04:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7qzR-0000000G7FM-4B28
	for linux-mtd@lists.infradead.org;
	Sat, 19 Sep 2026 09:04:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D6376020C;
	Sat, 19 Sep 2026 09:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EA21F000FF;
	Sat, 19 Sep 2026 09:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789808648;
	bh=BBnavKyXduBDgDup2hJbOMSKrWBCyILhm4SU8REE7oQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gtY9+36QQDLOAjld+dnCg2da7Sh9sWyFs4r67/H0RiQLIeaozrHAoxUgjK4bNHK/b
	 WHUY279yatJ16otcvxSYTH3X9vF7qie7F1Jz4ooSeCRggZjL620zpTWftDGIJ9vLY0
	 Z4a9mQfh9XjTtzwOG8xjbYjamL6yHzuS1wq/fwE1+qZfWpbYm7ZrcSCm/XBNN4I0gx
	 7iGzdI8Cgee7Yx9zVGoMiok/dqno+gP/API9OwzaBctQAlJj//BYgEGpA/52W7iT6D
	 IusCUOcKAhks32oGIV7CwmgEkyo/hj2ICPUdx3EV707q8UzIa2RCpiGbma05VZKETk
	 FAKcq0x9hhtYw==
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-spi@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260918-qpic-snand-config_page_read-v1-1-a686c4657857@gmail.com>
References: <20260918-qpic-snand-config_page_read-v1-1-a686c4657857@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: add qcom_spi_config_page_read()
 helper
Message-Id: <178976719898.1863384.8556438564232843245.b4-ty@b4>
Date: Fri, 18 Sep 2026 23:33:18 +0200
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=broonie@kernel.org;
 h=from:subject:message-id; bh=07mMyxMsaP6e9rVOkNiufgr3Dwg5HIHOcIaZCo5Ccuo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrlAECYDY8bpS7oTqenf0plXibSOVh5r1YS6tJ
 sdPOdx2ek6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaq5QBAAKCRAk1otyXVSH
 0MXOCACGtIGO3qeCu0E8ocf6s0p8J5odLs/IVePHyKBnpef5RXVxGqvDE/HFGV92BLthlnT36JZ
 tQGvsD3bzMl+T81bEinbr8pU3e4PxStdW+odHzGfM0C0u3kh41OTQ9t7EPHp7/gnurNN1SlaoIi
 0kGNTCBAC1Q9D+memFbzOq60THq72YkABcg4z15Zin26WGc/BiPaN3QnukH9jQtEJduN4dsOM+A
 5YEMNCuYkONxc3JjXt25ZOvrS/FKzBbMFgpMrRWB0sBIzu3lEqie3JrMYijDMRUHegzduPihmyX
 baJ/XEZsTRbCNzE+5XUBGEsdY9t4lilkVkizdasm3qrn409u
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

On Fri, 18 Sep 2026 21:53:08 +0200, Gabor Juhos wrote:
> spi: spi-qpic-snand: add qcom_spi_config_page_read() helper

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: spi-qpic-snand: add qcom_spi_config_page_read() helper
      https://git.kernel.org/broonie/spi/c/001cdc434aa8

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
