Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF952606A31E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 15:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YlAg+0xU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQm7XMoj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n26DmAqqU1lTqWY11bxVhQRkzS9WQyFoE188qZePCuo=; b=YlAg+0xUTpj4D+Tadx3QECNDfO
	U6GIezecYoyGGOizvdOsOg/mC2dCAU+aeu7A+3rKW6HDRBTMOsCnsEW6dEFPwMCN8OZUVez1Cl3EH
	kxZD8E98vliK4vg2tJNqm/bj2b5EFKNf5CJCwyCkv8d/l2qFJY9qNHi7mCjX0vioXIdVExQsSRZMr
	aKjilpyv4kUkvNnkJj3EFY+jRythMESE1/LsmMbQjQS6wMp14e2s2QQxRiSK0dO/QfvT4xFkPBXsi
	lQPrcAVOk6VJ7VOCzkksHJGMNXFqmKwQ4JYFkPdDT2I6LfgTrSxGR3jHr0ND3pN0CyySk49/oedm6
	VcKT8+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEro-0000000ALBz-28h3;
	Wed, 25 Nov 2026 15:25:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWErh-0000000AL7u-1m2Y
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 15:24:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D9854325B;
	Wed, 25 Nov 2026 15:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF131F000D0;
	Wed, 25 Nov 2026 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620296;
	bh=khCQZr+lZ5ps02/NBTrpcyjkpLu9gA2+Gk1GsRmHCXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mQm7XMojXDRKOjTVodJNFQw5rj41uOgx2Mnln3HRo0PzjmMed2JfzKJ4FSUkvsVXt
	 bBbPcQULhAUyAqs1aDbNPwhYKrDNl4sDrwjT46YKkJTUwxXKHUO8qYHc3qAWBwIu4T
	 j7Mq8hB6jzxwbHseQbdKWyEJ3+6TGzHPhxmGD+4xuTo3Y6L1ReOZMV0yMp/hL7wNOa
	 30pwxz6cQIqbfRO4vQA14NsZOYRAV4Dv4wZJXVkw5B8kBbR+PtOHb6FGjXA5lmGDuI
	 Ql6bd44lZXfV9SttRxiD/OvxMbZzVHwp11N5Ftssz6QLaFAvnZHoqxDK8We/qXLwZ8
	 hE2iY0G2Q3ggg==
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
References: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
Subject: Re: [PATCH v5 0/6] mtd/spi-mem: Enable DQS control
Message-Id: <179554764437.947306.7383226666322227871.b4-ty@b4>
Date: Tue, 24 Nov 2026 19:14:04 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hiFMYrNelLS4EF+eSytAriGzVrBmGJlkNeuhF2BICI0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZ/h7W4P6zcq1usKFgc8PuvLOp75/Ofv7cfm22YoHnX
 XWLl6xXO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRPCtGhk+ilrcqyliK9VSu
 nj3Pn5zY8uH3uSePaq33zhZm+bCXdxMjwxT9jPZHookW34u2rPTiUGTfvehhur5Tnclq2c2zHVS
 E2AE=
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

On Tue, 24 Nov 2026 15:43:01 +0100, Miquel Raynal wrote:
> mtd/spi-mem: Enable DQS control
> 
> For his PHY tuning series on the Cadence QSPI controller embedded in TI
> SoCs, Santhosh initially needed to access the availability of the DQS
> (data strobe) signal. This is a chip dependent capability, which may
> sometimes be enabled.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/6] spi: spi-mem: Rename the DQS setter and pin field
      https://git.kernel.org/broonie/spi/c/fab01b136dfe
[2/6] spi: spi-mem: Clarify the conditions upon which DQS is usable
      https://git.kernel.org/broonie/spi/c/5520745c6e30
[3/6] dt-bindings: spi: Document the spi-dqs-not-wired property
      https://git.kernel.org/broonie/spi/c/2bc362dc8074
[4/6] spi: spi-mem: Take the DQS wiring into account
      https://git.kernel.org/broonie/spi/c/4c9572bc7052
[5/6] spi: spi-mem: Take the controller DQS support into account
      https://git.kernel.org/broonie/spi/c/828d25f820a5
[6/6] spi: cadence-quadspi: Advertise DQS support
      https://git.kernel.org/broonie/spi/c/dd1f49bd2c44

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
