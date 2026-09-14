Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C036C88E75
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nqfKBf0Z1hcLI7YQBMyk24O5ZrzQrK3C7GqZFFcFGk=; b=Jw2/7gfSCjS0FU
	e0hOfqqWxIFZ9CxB9a11xPTXyRKzAjvckai5MR2JdeFr4Ah5P8WLyEHW6dar9i4fxJV/JudFyMiW+
	yOVhI3DeFoji5o77EZhDCfTUyGGgV7vjIVs+dSEVb0Rl3ldWL4zugp+Q4/kEtSw7Y3KDgV3zGpaXZ
	8PPNHp840uhSe55w9X8jHCTp3kb8UdFWSKI9ZAWWp/aCvJOUuKDBlkCVdG+MmFjXPLyz6tT99RjmE
	stMkGgsYoYIvJ0e90tLTMgjOVfJNk8h4rVN9SGAEB9fLnau+VnG+BCYcGuRmvwwGkm2H39/Or4xit
	NjYopMiNYJ8FyHA80+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67WS-00000003xci-26he;
	Mon, 14 Sep 2026 14:19:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67WR-00000003xcB-26as
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 14:19:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA09560211;
	Mon, 14 Sep 2026 14:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C801F000FF;
	Mon, 14 Sep 2026 14:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789395542;
	bh=URkLQJTkU1OWudFW9XfG3Vve/Z8qVfcVe+gmepQKDZ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZZK34jAF+w4QNreVLwQNOzb6QmwS849PujNsfJVlBwa0dVbaDlaXNpQ9RjEeqGWSj
	 cIsp46z356pgiTnu5Iiw8IBU7DhTEE7M8mGA/RvnrxryfGo5i0Hmj8w+CtXA2TAMrz
	 eAsXIeWJpycpq9VU8Wtg7/fNuf9T7BdNHui4C6csfSCKMj/bgrOwW7Q9viM3ISZb1P
	 HEXTdtGaJ23b4dbSlV1otNVbRXVYJoW5RjcELM/4Pl6SCdoIXwCV4h7Gs827nR62n7
	 jTG6DgF8JDl1KoOPTrLYPPdP4vJs0Wd2bo8PKfwJ9gllH2zynhlBt/vqG7lLGpW57V
	 rgkBymFg1tEuQ==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Steam Lin <STLin2@winbond.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911-perso-fix-spi-nor-qe-mxic-v4-1-5da8a25b9579@bootlin.com>
References: <20260911-perso-fix-spi-nor-qe-mxic-v4-1-5da8a25b9579@bootlin.com>
Subject: Re: [PATCH v4] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
Message-Id: <178939554051.2550426.10852177724656571043.b4-ty@b4>
Date: Mon, 14 Sep 2026 16:19:00 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Fri, 11 Sep 2026 19:22:45 +0200, Miquel Raynal wrote:
> Some flashes (eg. from Macronix) do set BFPT_DWORD15_QER_SR1_BIT6, which
> means they do not have an SR2 to read from/write to. The new generic QE
> helper was supposed to accommodate this situation but in the last version
> that got merged, parts of that specific handling has been moved to a
> more contained location, swp.c (which needed most of the extra code),
> yet the Macronix case has been forgotten about in that generic QE
> handling helper. Booting with such flashes will always fail probing.
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: Fix quad-enable for flashes with QER bit in SR1
      commit: 90f242c92d3ab241f0d22e2368b57750b8755667

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
