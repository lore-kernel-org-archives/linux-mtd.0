Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0BAC369C2
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Apr 2025 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAn6WuZUkhlFhH6ULf+R5+cU3Z2AADLB/AdxHA/qweI=; b=p05kpsnY3KGlkQ
	A4t+e2s/ha0OJXIHPTx1P+zw/hC+Q/ciMMXuCho1ZqSHBAx1U+psSRu9wkwW7cKha9NM+iLqA/IBz
	WqM4VAzHkSAh2O1Tdp2f5gi3B9EvTYtFNaMes1gbuCPl8j6m5UPOdYIkS5fpwz41dgjTnmXm2cg4f
	i/NcPVQamO7C3cRbD95U+33pJNsHaKTP5eWCye4Du0Elx2hh1+bYK0z6GanEc0bUA2r5SO84VYiDm
	7hcKTPTkZnsyNvYi0s/DGZZ0WXpZf4GaZqWhpuy2nKe3DioLDMY2y0S9ODda0QKRBxIlOs3LV/tX3
	ROf9XYVKgfVAq1Crf7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Iue-0000000HFAf-04o6;
	Fri, 25 Apr 2025 13:16:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Hzw-0000000H6Dm-2AGT
	for linux-mtd@lists.infradead.org;
	Fri, 25 Apr 2025 12:17:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C9A56845F;
	Fri, 25 Apr 2025 12:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C66CC4CEE4;
	Fri, 25 Apr 2025 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745583459;
	bh=4MYw+OiWjZy5NvznOlobaVbCe5rT9u35DDQsuwAxFjU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d1Vz4erUhPGFhzsnAAeuZ5NElwklcHXMRTNQM7LTtlMIzmi1z62RWza4rm/4RoKRc
	 ztnKRz8avF+zp0K5+ZuNHbcPUEQBLgdtkRlxwTm4/jthwS/pEvl3j3bR4tm8HI9q1g
	 v5au4njtwe/A+SkRvMjT9xGb2eWREoB5fcyRyS5IzvcxoxKOYBnF1+2MCXTko5/8cz
	 uFQT1vRHR/2XI13bXtTP9xx/F70b01jk2LhSCm9PeA5JL+GwuXmbJn8BRSucyiT0xb
	 bU0lhpmhlKICUj/venIce/kMYbKYg92xjUbrS7BaW2baonQsVWd5y2QRTlBRcM7+GX
	 jwdEuSp0jnPrg==
From: Mark Brown <broonie@kernel.org>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250423-qpic-snand-propagate-error-v1-1-4b26ed45fdb5@gmail.com>
References: <20250423-qpic-snand-propagate-error-v1-1-4b26ed45fdb5@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: propagate errors from
 qcom_spi_block_erase()
Message-Id: <174558345792.35738.16221002646787907698.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 13:17:37 +0100
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

On Wed, 23 Apr 2025 21:31:57 +0200, Gabor Juhos wrote:
> The qcom_spi_block_erase() function returns with error in case of
> failure. Change the qcom_spi_send_cmdaddr() function to propagate
> these errors to the callers instead of returning with success.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: propagate errors from qcom_spi_block_erase()
      commit: 722a6ad4867ce8c4cb131a3371d0b5389a75dee0

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
