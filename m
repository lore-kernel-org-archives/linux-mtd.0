Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3015B606A31C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 11:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gan1LjAC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lKmilFD7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tOwKpLccU8keUwh942AQjI+BCwlI7JH6TrSTljdImnc=; b=Gan1LjAC1yf2USVXV60GfG20FW
	/booeSFcEAlBDvX4ztV4xntGWMiY/bURQwcpJEkmihPc8O3lDnFcpIzFixpJC8s4J0e98iDrmUYoj
	uF/SdrMl3mEjCD57l58zFXl01fW4RX7X/yNSG3dXSt0xNVkoJdJbJUuhjax4p452Jz+oGfC2eXgAH
	ibFB5JkSOcjju/j+gRFTG2sviYQmxSwYT587g5OGHGcC7GDtmXhvSZCzWTYIgnRRwRnmpkTI3cQo1
	QKJ6Z8DCNgMhOiJaPSQ2SG3A/YwJ7IpH/RGjjvtEUvgDGuu/AUE/2Q28+OaYblVaYZ71wZ0YqPIrj
	RcDbfnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0gy-0000000G1No-0sqx;
	Sun, 08 Nov 2026 11:04:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0gv-0000000G1Nb-167A
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 11:04:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A14C61472;
	Sun,  8 Nov 2026 11:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6481F0089F;
	Sun,  8 Nov 2026 11:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794135844;
	bh=p3NBFyErUdwmXe138graI7qm0I68SUXT5LMRQPFSpE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lKmilFD72w61IjGyuxsnVCVhiW7IGGnsCGPV79JKH2bZKX1wuzb6aZJbggikpHGhz
	 sZCY2UGogBNkuFNZZKBth2PWVzo2/srp4GSC2Tzcw80QpBHwTArb+niK9malrXNez1
	 Pz1ez98Wnb2f5Q4lVzLLtsGCXW/m92sb0FGpaGHrHUfcmp/IgjSBS7On6xORUnBmUv
	 kKPO1T7uaVSitbps+/dNFYJPTcNhrbg2dkiTCtIiT+EwXmuqREIFHZqeXDYZ0kp2vv
	 oGIrnmo22lyJoJ9ei0yJszOVBod35DFmdNYjltaaRyxuF75Fp//+SFI7GsKob3AMXs
	 /IKNmKbE6lzWg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 0A0D22BF8D23;
	Sun, 08 Nov 2026 11:04:02 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
In-Reply-To: <20261028121100.79667-1-changhuang.liang@starfivetech.com>
References: <20261028121100.79667-1-changhuang.liang@starfivetech.com>
Subject: Re: (subset) [PATCH v2 0/5] Add DDR (Dual Data-Rate) support for
 DW SPI controller
Message-Id: <179406387904.3424803.10093750511448298483.b4-ty@b4>
Date: Sat, 07 Nov 2026 15:04:39 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ES1TNf6PGsu5Apnp6Fa+gsDqHgK9eit/kgDlsilNUiI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+hMtxm7KvMNFY/VNX+LbpbeaHq2eF957/P23j1bub0
 862KVzN6ihlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBNvsPwh0t0x93wTZuPMp+W
 arkltOPCrVlblph5fnymUrZYVcc+JZbhf5pF4AxJvZXuBbHPFJn+8tn0ti71KmPOPjbLsuVSTn0
 ZCwA=
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

On Wed, 28 Oct 2026 05:10:55 -0700, Changhuang Liang wrote:
> Add DDR (Dual Data-Rate) support for DW SPI controller
> 
> This series implements DDR support for the DW SPI controller and also
> implements 1-4-4-DTR read support for the MX66L1G45G.
> This series has been tested on the JHB100 SoC.
> 
> Changes since v1:
> - Add a new patch 1
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/5] spi: dw: Detect DDR support in enhanced SPI mode
      https://git.kernel.org/broonie/spi/c/c74069df13b0
[2/5] spi: dw: Add DDR (Dual Data-Rate) support for enhanced SPI mode
      https://git.kernel.org/broonie/spi/c/ed1e4b288e57

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
