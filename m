Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA92CA0EC4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Aug 2025 17:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=posWeWOF5+W3/7NBrKSQNGABzcLW+nKAsILIdtL+1r8=; b=tlcUEU1iVybK/M
	ZsqSgDRG/TZ2P0hFVpUgegp78Z/X1pcwK33Vvrf8Y4WLW3wKUoX/o++zgMNunx7+RjB51QbK5tTcO
	VDjkCIC8j5dLjhLl5m4UJsI0SrQATBHkGiZNsdR+UDG7wg92gXh52EHMv5zsSC0M/eJWpq+ptXicS
	LHyL7yvWN26PvQSwCUr35t9gQyTH85dW5SLSEehY8GUzHnvnsXWvTY1KwACqy3GQ9WGgRzbDrPqoZ
	PWN1GhD/bi2XtNmVj0xXv5OPXOG8H66j9dRgug/JqhhGesexD9tdE/VixDFTc3VhaBDea9U/zf5ho
	pOJksSQgJQB1itwLFS/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultDK-0000000Beav-3I0J;
	Tue, 12 Aug 2025 17:55:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpyI-0000000B3ai-0gwk
	for linux-mtd@lists.infradead.org;
	Tue, 12 Aug 2025 14:27:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EC62A57453;
	Tue, 12 Aug 2025 14:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC82C4CEF0;
	Tue, 12 Aug 2025 14:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755008845;
	bh=gGOsuk0HqUZbPceh/FWXdNxVmPI/yvGvzEJu131frTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eJzPEmUrzBGHVSCIlbMboucTSpN5nLL7GEONgzk+6njRLg+nzdgohDQvV1TzOwGHr
	 FfoKn59lZKsUS3prmSbuKxMsQvnRu3JYthTrsK7nF/TbiY0O5kz4DgX9f0OANXDAiu
	 00Rs9GOBaaRS/Crf0goWbzYhCyOJ8BBAmOWLUuLFjjftYRdP8HlvMoJ0SC8HkeND0g
	 ChYgZ913s/z+UBOwnFA2e4XLaugXSI2r7mkNQnQ83/2So/2phJ3Oi3+NYNzANAoFQ1
	 z6UT8/YPSUjvPAxWETe0QhNQVfFDD3AyZULyFSoum6X8VaYrcVi7s1IwxiugSDKlkK
	 c7+hn9rFh9Mww==
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250810-qpic-snand-qpic_ecc-cleanup-v1-0-33a6b2bcbc67@gmail.com>
References: <20250810-qpic-snand-qpic_ecc-cleanup-v1-0-33a6b2bcbc67@gmail.com>
Subject: Re: [PATCH 0/2] spi: spi-qpic-snand: cleanup 'qpic_ecc' structure
Message-Id: <175500884282.87496.16520963986341546507.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 15:27:22 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_072726_271084_648257F1 
X-CRM114-Status: GOOD (  13.21  )
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

On Sun, 10 Aug 2025 16:38:49 +0200, Gabor Juhos wrote:
> The series consist of two small patches to clean up the qpic_ecc structure
> in the spi-qpic-snand driver. The first one removes an unused member from
> the structure, whereas the second reduces code duplication and removes
> another two members from the same.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: spi-qpic-snand: remove unused 'dev' member of struct 'qpic_ecc'
      commit: fbec18dc9940a89e094bae890b8dc0af00ddc4ff
[2/2] spi: spi-qpic-snand: remove 'clr*status' members of struct 'qpic_ecc'
      commit: 6b7e2aa50bdaf88cd4c2a5e2059a7bf32d85a8b1

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
