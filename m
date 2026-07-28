Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9FFC54F51
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2026 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xi/PuLiAZHdC8yR11V7FcEInFDIybHGG3/VwsstIb+8=; b=u9A5RjOft6XuAr
	eHwdXiad2nTypJ4Wn2MbLF9Ryt9NWu6G6C3oNH95EsSdbzKdFzuIrMWxerJ0c+lZSHe2rKcTx6Y/l
	NhCLFHXtFkL9YrgUV1y9LZC041Vf5rxxaygVQE9LCwHjD2Amjdb5lxuNqFzEUGiyaZXVSL5lpZ01h
	KPfqUgyIYkFUoA/Dq5Mt/eKlWJCyM9DxYIahHsGcz0FAN2jqJR1da++kUOx7fc2GI58y4LQA+4on8
	B3QHtzayPqwclBPlX+ws5D8eaBLecOev+HgI7a9lYs+v5BAP62I7zkMbZ+AlvfyNzDmPpWsgSjLj2
	xH/PhiYK/SVcykEXzRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Op-000000087In-0Ycq;
	Wed, 29 Jul 2026 13:32:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Oo-000000087Ib-1KKw
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jul 2026 13:32:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E70F643EA3;
	Wed, 29 Jul 2026 13:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42001F00A3A;
	Wed, 29 Jul 2026 13:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331961;
	bh=1tuI+G5BFSmI/oRU4Bmp/aoTRX2jKDAu3PO54XRfDT8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B3gsXH4QVqoxk8djQAZgL0JB+YYetRHPWbnRUhQpsKA5oL+9GZNXc/wELtdXb1FHo
	 bG82vNKIIuo0iwen8Q1jU4AcCmXhhM8jKki4ASlufDU+DRskw1wVOoo6YOVLY0w5XT
	 lE0gl3xqwRxdB3lOwMxR0/FPH+vCG8Gex0H09W7nW7+3KY8OsOsWetuzhiasKI1/mN
	 3kymMckojlwhXdbndpp1Iy/Um162DbBvFYEJkVigzCYMOnfjs/hHcpUIgY9We3HJBo
	 vaq8ZukoCPmWUIQvzNoeNIegUviERGzlyTDPdeE4NtFA1BTqBnz+AhdvdJQP/erTKU
	 1z2vYULMtudIA==
From: Mark Brown <broonie@kernel.org>
To: Stanislaw Pal <kuncy7@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, Md Sadre Alam <quic_mdalam@quicinc.com>, 
 stable@vger.kernel.org
In-Reply-To: <20260727163216.109938-1-kuncy7@gmail.com>
References: <20260727163216.109938-1-kuncy7@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: write the feature value before
 executing SET_FEATURE
Message-Id: <178525861341.13644.15757073965586666687.b4-ty@b4>
Date: Tue, 28 Jul 2026 18:10:13 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3eUi/Sk8zvSzEGlGTxbnKs2x/CFPNq4nDFv8w3V3al8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqagD3BMMv9KlpqnWJd8Pcy9TisKk74FEBFly8F
 NA988tTetaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamoA9wAKCRAk1otyXVSH
 0HQaB/wK0B3tafgA4sBW8kWrJ0xYpMyeRUA8U21O1WZN3ZdmgOA2Htpe8ZnzQy+GplH0DNgFQFJ
 WNT/tKrrYar1W3KJruQNgxR5xZPuWXeJ1IvxtMKSFlPybrVGsfb5pxzSHAppuDHEIbWYq8Leh03
 +vaZmCswXYi33LS2DH+Rg4EVu4gXAlJrU4QMo41/0mjtMMeVU4ADaWuhuOvygglhq9Nj9CtljEZ
 r/157isR3rYQdDzjW2UdVwwNfn7QmpZAuLFtWqyupqKuf3UkwUUtDWbaCnhrG+EAomT+V2kZW4g
 +853Wsat37YxOnsfq6jIKuM5chfDhhQemBziJAkdkGa5//IV
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

On Mon, 27 Jul 2026 18:32:16 +0200, Stanislaw Pal wrote:
> spi: spi-qpic-snand: write the feature value before executing SET_FEATURE

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: spi-qpic-snand: write the feature value before executing SET_FEATURE
      https://git.kernel.org/broonie/spi/c/8fd62901d6bf

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
