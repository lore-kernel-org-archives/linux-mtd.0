Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AC4606A339
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2026 11:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qOnMqD2P;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQlq67op
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nN31V6VILZ//UIng9LOV1JP8uqXnsDP1noual2Dfbrs=; b=qOnMqD2PIDVhLusrnZY2WXfUPm
	MUQisEnMIkwywWdP48ARIFKqyLwLl9XacfHAvNndE96fMf1axANMsaAg1hCdPzdIFGU8ECwWtApC8
	VedVBSEYn0KzvSsPVBDeDbLH58c7m+E2akG+5etW5mRUjYyjaRKSwmXdjU5TipnwaomaVsRdhHkwN
	CZCH0nWffWATDHoA+WN++AFR8zdK6FLHPsyivfH5NhMaAwn/b5HPHEW6GckxnOZxixfs3r0LQJ/xL
	qN42bZX6VnlXqU71g77+v6CpvS2epNMrb/RjgaF5HQtYPcoxzBa4XGrTibTM3B2DMRPDqUnDrPBIp
	i0XAbx9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHpG-0000000C5yO-3PoL;
	Fri, 06 Nov 2026 11:09:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHpF-0000000C5yH-1wel
	for linux-mtd@lists.infradead.org;
	Fri, 06 Nov 2026 11:09:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 17CA043A7E;
	Fri,  6 Nov 2026 11:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BF21F008A1;
	Fri,  6 Nov 2026 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793963381;
	bh=BbgI/fg5Vv6TpV5LNbbTNKOCgVgDnfLxy/DdQCF/Nt0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WQlq67opXPqkif8MNGGSCwjy7SciDVJagjdlSWNRZuM4ylEbyBBDwxBGGk5POOxKy
	 7Dokl1dRtARuYheK7fwSEMyZQCiA+98Pe2iefyJzGPg9zppFx9InTAJM1oGD4eZIr0
	 UHdLUOkGChewbSEkTTQgJMjYuJPItVOh0Fdgsz8qNU2cUq6W4NpmvkdLzVCle80dMS
	 IouHDFBpdM8agJaqF0pN8ZLfwbq7mz6d+DYTqiJDmDeZLpGAgu5G6a5DIf+wzFLiGY
	 DBlGNho33XG9rwxxHiNrqwJV2K3bi2ocljTdzs4ZrNl5yFQnN3RLdHYha3goru9yVH
	 6oVk7S6LbgJ0w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 985D627E8440;
	Fri, 06 Nov 2026 11:09:29 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Bharat Bhushan <bbhushan2@marvell.com>, 
 Sunil Kovvuri Goutham <sgoutham@marvell.com>, 
 Tanmay Jagdale <tanmay@marvell.com>
In-Reply-To: <20261016102917.171095-1-paul.cercueil@bootlin.com>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
Subject: Re: (subset) [PATCH v4 0/7] spi: Add support for panic mem writes
Message-Id: <179389951044.3073895.8929573229341803829.b4-ty@b4>
Date: Thu, 05 Nov 2026 17:25:10 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=broonie@kernel.org;
 h=from:subject:message-id; bh=z5DoyuXWSXWF8C2OUkElOyX4o16/3/SLC3dohqCg9mA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLebs0s2xu6SUPRbnGxcpn6s9fnv9bzWjtz9SyOeum4z
 CRqxq4jHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZiIGifD/yzWTRUmRe5CPJt2
 a8T9kItRmHjXrmzuoeL1iq1HL24yz2VkOG9osDjdZ93Z+n5j6R1Fmo+6WznX6lXNWXPo6cYZSQ8
 9mQE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 12:29:10 +0200, Paul Cercueil wrote:
> spi: Add support for panic mem writes
> 
> Hi,
> 
> Here is the v4 of my patchset that updates the MTD spi-nor code as well
> as the spi-mem code, to add support for panic mem writes to a memory
> partition configured as pstore.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/7] spi: spi-mem: Add support for panic mem writes
      https://git.kernel.org/broonie/sound/c/20f1752b9241

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
