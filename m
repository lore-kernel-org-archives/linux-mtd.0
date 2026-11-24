Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A394606A338
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fq1VzTYK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VxJnB7pn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PJLsl9P+txQ+wfpkFXLcClRn1rl4D2dVCSS9zApcrTw=; b=Fq1VzTYKEvX1kT/x0oZZ41C/1m
	VejZ1UqlVBGNeJr8tiGmkO5s0loZ9vqXTQDr33fmXKimP0bFfatcXr5rWTgfZ+im85IlyMIOL2zr0
	cgPDfIzXIUcpVUM1zSbW6axhac1pXZY/yRn4WmQI+x+4tnC3N5kKk1tgzZMheYwbP8/YSNan+fiA8
	gHMOkeTJ/0CiTOXDT8/1+UdYrUJdAhcVLvV4iz9kATZDpldEQwajhDiPdEt7koJU42dc+e47EHKil
	9+gRUPx053Yx1rFWLaISdaqcNxjLFqOwvk7HIO2w40Hmpwp8SvAIcJ0GtOsjrICwccG6UE6y7X7BY
	yYneQX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuzE-00000007Sr4-089e;
	Tue, 24 Nov 2026 18:11:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuzB-00000007Sqi-3CBB
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 18:11:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2934743E2F;
	Tue, 24 Nov 2026 18:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457F71F000C6;
	Tue, 24 Nov 2026 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795543880;
	bh=jDF6SVwXBWVs6LXBLUGTk3dw8465AnPR8YTWvsMv24s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VxJnB7pn2uJDPmIRq5CXEOYjHLjoU8r0rd7m5nbJuHedoyyz3zu/Vwj+4T0uXX5CS
	 830gIU3m8Hw8lkL5ZkpydRIMBLZrnEwLQlj9TiVCQmixnWiQrvNYDzTNk20T/sHLCd
	 eCYerWIDLO0WgDVrGxbPxLmMemI2Ys9I17BjOq8SqNBO0+rr6BF5kdIQzDkZAri/uy
	 4UXvpbDZEIKGP1uz5OSqetn1cbIB2U0QJiKnMRiPee4RpfQ24Nu8Hw+BAeG8dyvgw1
	 EFynP8ePISDIST+f6J5UEstkmCgPD8I0EZBXlexLTePYAJYT7RfAUKA+vBi6mPvdYt
	 XVCAcYUhwKkBw==
Date: Tue, 24 Nov 2026 18:11:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com,
	u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] dt-bindings: spi: Document the spi-dqs-not-wired
 property
Message-ID: <20261124-salami-munchkin-c0fc3f6cb6f7@spud>
References: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
 <20261124-winbond-nand-next-phy-tuning-v5-3-261e0e712857@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261124-winbond-nand-next-phy-tuning-v5-3-261e0e712857@bootlin.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1057188502396595429=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1057188502396595429==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E8ZOmwWvrmxJayb7"
Content-Disposition: inline

--E8ZOmwWvrmxJayb7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--E8ZOmwWvrmxJayb7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawXTQgAKCRB4tDGHoIJi
0mBvAP9SUkEgzdz54o5S/UJV2eJ2dfAMeTowAiaSEkcnGCJQoQEAxWGylqJs3azd
gXKj602bGw17GjZ37Swr/cNcw5a1SQA=
=hYiG
-----END PGP SIGNATURE-----

--E8ZOmwWvrmxJayb7--


--===============1057188502396595429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1057188502396595429==--

