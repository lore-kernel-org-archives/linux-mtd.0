Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB10CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=By4COnDuK6Z5NzWqhIpsjjQQkAXwdyP9Sajq/jvZ4B8=; b=MIztHwgCx3yXfb
	8+kqKLFljdz5LpHeAY/+SF09BLcsb/XbIv06AQLeVoxkruIImaNit41+NfV5gU5zSnLC7+14zAZj9
	Y0UVoD0c/1vNC2+XlwUVB/O26HYBpBAugoURuvwa6jsLJMEW8+cmsvmSjrAGQmbhZg0t+Az/71aSp
	s9LGgem2T/e72jxTKdRPOak6QDZ2t5c7XraPkufNgjo3SUbZypkEAK/XBuEatBd7CxQUWMUlJBHaf
	5c0vuznQE2FlBgCPHoy5EaOOfJWnYFFf7QymxAp6D40WQVwF1KwHPEVhF0cGctMFfqmIMdI0Qu0jZ
	aYPCgRBrRzVTOEGtkRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwLL-0000000FDrd-2YCZ;
	Wed, 14 Oct 2026 10:36:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwLK-0000000FDrC-2JZi
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 10:36:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A4CC4367D;
	Wed, 14 Oct 2026 10:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A2E1F000FF;
	Wed, 14 Oct 2026 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791974178;
	bh=TXXuj797oe2SL7aI8xCKis3dp6zlE0u01lBVd5p3BeY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nLLfULh5HXfWA+zpIhC5YkMeZDoSYN3TPLKZJy2Y+OXzEuIpry0v9Sgr5BD1lNwtD
	 X815c/oPNgwaG0Wrrg3xWOGZ064NgNO/s6E+nrV4k4PduHqM60eOFYVgXhk4n8Zwih
	 ZdzLhe6FjW4I/3INDZ4mtHV/YIovE4lwTAEKGzrafhkArWnCuWH3YILXjtxU3/JsPd
	 qEcnjP3TFzGBUMbVdnEfTKAUPGqhrzQj+6nPfmnrgvze3C+AwptnTjJZUOKbu2Xme1
	 leq+MxRs2ONyq8XxiJA1aQe53s8US3r3NGQQqdCM+T0P82An3FCpNe/FzSlOOEXH9H
	 TH4FP4TvtRoIQ==
From: Mark Brown <broonie@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261005-qpic-snand-skip-bbm-copy-v1-1-04f6aeda4044@gmail.com>
References: <20261005-qpic-snand-skip-bbm-copy-v1-1-04f6aeda4044@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: skip BBM copy on regular raw
 reads
Message-Id: <179191209569.42298.16799303691069144788.b4-ty@b4>
Date: Tue, 13 Oct 2026 18:21:35 +0100
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
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

On Mon, 05 Oct 2026 19:18:50 +0200, Gabor Juhos wrote:
> spi: spi-qpic-snand: skip BBM copy on regular raw reads

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: spi-qpic-snand: skip BBM copy on regular raw reads
      https://git.kernel.org/broonie/misc/c/2da46f1e9b98

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
