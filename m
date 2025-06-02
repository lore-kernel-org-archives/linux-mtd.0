Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F47C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0OZ/4GASwormrwwuy+54tpz8SWv43H3gPbda0lCP9Y=; b=utEsiQR8GVq8bB
	Y+xBfYhqbDsr41amxb88wxCkYWaSoYNoA0OWA+rFuhsDxhvuQJFw87uIkpQ8aPBq/6oONakXf3D63
	8q1PYEEHKlrrdoNobqRKiu11HdgiAA8JBSBhDJ4/t512z+u893QTdmwXzRflJShaejpNuO7p434NW
	ZWgCPWfuG7WZagZymWsJSSifayJ2nst120Uh5a0nM/WsJBunwl/U6/xmDR9Ew8zJg5/Sr6UcUljrT
	6YVY2JkzdcsjoXbo8z4gTx8Qpxk27QY3bCwB0z8XNSBroFo0U1LNPSTRiKKQ+uNBGTKW0L4CivgZV
	5WGQwtQL4gWQP/p457pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7VN-00000007pcw-2hJA;
	Mon, 02 Jun 2025 15:55:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7RC-00000007ozU-2ZoS
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 15:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 694BD40C2A;
	Mon,  2 Jun 2025 15:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95282C4CEEB;
	Mon,  2 Jun 2025 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748879456;
	bh=YEPHIKlGLClOFLF3x9dL/ailZKjYUZH2cpkfYEmXJxw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fm+Hxg67Svs9O77QDuWaZdE5wzZ3qE+sSAUBwYIt9isqkYP2Ly312pLBdPmcZnx/o
	 DRTKLg+mE+dknYQXr8Glkl/Q1tWhlqOtMS6OiheU3LyV2D1i9UvxfGODNYlt0rec8k
	 98o461YMkXtyMac0hoDd/YemsneaNt9c38NwzPHtS1nKSk66+0hCZ7Tt2WezasTB2L
	 LYxiYUWQhcko+9qEKPLEApdNp8RljEbwEZmwEO/Pvp4uveYRZtxhJIh7QRM9nPOzaR
	 6MATg6ZO8yuU4zAVVe5s3lfjNmtZvbVpV9tSLxTcycozDovJ9oAF+8sFt6pIL+VABl
	 F1lCCQyRs7JXg==
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Gabor Juhos <j4g8y7@gmail.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250527-qpic-snand-limited-biterr-caps-v1-1-61f7cf87be1e@gmail.com>
References: <20250527-qpic-snand-limited-biterr-caps-v1-1-61f7cf87be1e@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: document the limited bit error
 reporting capability
Message-Id: <174887945434.88179.3123674776894271663.b4-ty@kernel.org>
Date: Mon, 02 Jun 2025 16:50:54 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_085058_699646_49706D29 
X-CRM114-Status: GOOD (  10.77  )
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

On Tue, 27 May 2025 13:08:16 +0200, Gabor Juhos wrote:
> The QPIC hardware is not capable of reporting the exact number of the
> corrected bit errors, it only reports the number of the corrected bytes.
> 
> Document this behaviour in the code, and also issue a warning message
> to inform the user about it.
> 
> No functional changes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: document the limited bit error reporting capability
      commit: 57cf46cd1fe351846e1b065ca9546eef66675ecd

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
