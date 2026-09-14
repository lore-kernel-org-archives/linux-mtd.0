Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DE2C88E7B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 14:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CD3ATjX5qorHODBzn24SJrNTHaUDTHTZvjQJNaXHxCQ=; b=WhBrTArDmggEnz
	3BEo0PhoLNaJhuOLneTbzMA1e+klywhG1PvwA/154exGkDl67hsWSTKCiPey1rCL73F4eKbeZF4Vb
	5I2lHS+GEgTX56zsdgIyn5VlXykKJ86P6PYrno0MLcCxpt2/8zs7viMq5DHmG52uKeJiMD85vxxlv
	eUKUujDunuQaaXG6D4H3tIysvDaCszfhrYlP41T38gs5+ztfb+aaAhhB814o5c0WjlcNoQe+qG3iv
	MQzzH4nI2AwZi5Mw832cVv/wr28E4Q21fM4vB7q1EJbR+Cf7zue6NvUzIGPVxhA/103T99zgvb+nt
	iNzst4Y8E1NBXigy3Chw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67WU-00000003xdi-2T3E;
	Mon, 14 Sep 2026 14:19:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67WT-00000003xct-1rWu
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 14:19:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5D8343D8A;
	Mon, 14 Sep 2026 14:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C061F00893;
	Mon, 14 Sep 2026 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789395544;
	bh=OFE6uBPFy4Kt8NhVjhn0jBJdyEdXEQesNbkMWPSNUKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LgPmyk7izrcUpjeKGhUiZcgQlMrVMfYeKHLBjt6KodimObvxWPd9D5bL1hGSm/jX5
	 2Jratysr/vUFRNXQBfC04P9HuF+mtQiIqCMGZVArj6hmwPWxIQRafTv0XN9MY+MFRm
	 6wMbaeWOLjT3FpLLU96V63xMZiLzJ+NG8b4Bj28cIBQHNvNgo/9Pzzm4O14rxo7YFa
	 CkA7CoJmYiewokAsjLUMYV3Ldlzjv8fX5IS7UviZ0g3uZEU4gbnN6prxdZo1HmwM1D
	 DAHLpdUc2g9OIyML+QIxq6bmKwI7ZU8IEcH+pXuNChPWiwIpCpoDCsA4HwXnm7ykPR
	 S2mQIE7H/4Ezg==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alexander Sverdlin <alex@sverdlin.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: spansion: Cleanup S25FS256S
Message-Id: <178939554286.2550426.10506559169174764251.b4-ty@b4>
Date: Mon, 14 Sep 2026 16:19:02 +0200
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


On Mon, 14 Sep 2026 13:50:35 +0900, Takahiro Kuwano wrote:
> This series cleans up the S25FS256S entries in the Spansion ID table.
> Remove the invalid s25fs256s0 entry and assign the existing S25FS-S
> fixups to s25fs256s1.

Applied, thanks!

[1/2] mtd: spi-nor: spansion: Remove s25fs256s0
      commit: f917d9edf54c3dd578efc231b8fbcd35744f99cd
[2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
      commit: a96edc3f0b4f036a5b6ebc9b1eca4273ef5ce2d0

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
