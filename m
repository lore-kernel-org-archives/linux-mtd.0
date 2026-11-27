Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACAA606A324
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 15:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iCDKFmln;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AfXQ5I/n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dxhetuWC1TC7AagkK/LkHSjXgaG6tftoZCmqcvWKJu0=; b=iCDKFmln+0HL2OcEt4MVmIS0b3
	mChA59yH9ECBpwGUtAOyK9dzA+8RQVBuC7IRL+wd75I7tfP3EReJQlr/IOxoF4GhcU/4yfc1uHeRE
	wrhsVpdqYmmijcaO272pCsboZAi5MI65mW9SOhEZz2ECKos4uULEI5/MIlIWcgunvO6flbHOWtJTN
	tzhepxMG37us5sN7LKnWdx5nNAvh+3XvxAGYW/GvkP7mAz//TIcPE1z/nDQ2wyQSfAZPPv4Z4OtFV
	s8PN3/GvIHfBKz/fIU+QfGxSiCO9OJGm7p80j96oDuItMd0dUvsB/1hISE4jRja0fdb7Me5WLCkTn
	4jR/OYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxUR-0000000Ggme-0xa8;
	Fri, 27 Nov 2026 15:03:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxUP-0000000Ggli-16tL;
	Fri, 27 Nov 2026 15:03:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8071E60234;
	Fri, 27 Nov 2026 15:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283F41F000C1;
	Fri, 27 Nov 2026 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791830;
	bh=HTsNEFdag3FLow13gNwrWPqr9RuSS6VGPBj7nBJXbBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AfXQ5I/ncWiUS+XG5a6ulZQQLbXKF9UOyn/8RazJyU2fzEiQ4HydxY3JSQhY4TJff
	 FbN11xcrwu7edOw7Htf9HdJTaQgpNqszcygI0dh65AT485sjpGcQy+e85Ms3ps+/3b
	 DqyrkFPIbE3pB6hVtk4kue5cNJTfWm8tIYqxhe6hXMJ/xVRnegq/bkpUqM9Tn6AMjG
	 UFtgoAopN9wh6AfTxC4paoeTrxA2T9sLBPXQTpRAd9LBKcFvH6Sn3Vf3Qz6KxusdpA
	 ehn8sp2OjFMK0kNQaL/Xfiw7reDTExIgn7VzpizK5aD3olmzW4CrQNWgyjU9bgO+e+
	 SO+pQ4xd/deyA==
Date: Fri, 27 Nov 2026 15:03:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Liang Yang <liang.yang@amlogic.com>, Feng Chen <feng.chen@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Michal Simek <michal.simek@amd.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH RFC v2 00/35] spi: spi-mem: Express the dummy phase using
 cycles when relevant
Message-ID: <d95e931f-0521-42db-85ac-a4d1fc4018fd@sirena.org.uk>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
X-Cookie: Sank heaven for leetle curls.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0298873275340521049=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============0298873275340521049==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EKfE0NJTn63pxWNZ"
Content-Disposition: inline


--EKfE0NJTn63pxWNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 27, 2026 at 03:22:22PM +0100, Miquel Raynal wrote:

> ---
> base-commit: 19d1b4de6d37bccecc3ad9144d279f1baa405eb1
> change-id: 20261125-macronix-upstreaming-spi-mem-cycles-103274708fec
> prerequisite-message-id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-0-ca8e924cca1b@bootlin.com>
> prerequisite-patch-id: 2f68de4139876dfa8e57afb65b429a69628214ab
> prerequisite-patch-id: 7182a6b4808193323664f79c226ae2a57104b473
> prerequisite-patch-id: 34a99e8e6644d1db0978b5aa6ca90342a42561f8
> prerequisite-patch-id: cc060f58179f09af4593df6909b958a29bf11cb2
> prerequisite-patch-id: c5a7a78ef01696c25c10b6d2968c0b65ab0f4ec6
> prerequisite-patch-id: 340ee3d69095259d6141c017ea59c0c137d353b5
> prerequisite-patch-id: 1629dd27a1f0b1d6622199cc7603dad4b17d29b6
> prerequisite-patch-id: 29bc9e59b1d732a00cd65ba1d73270e051898fd7
> prerequisite-patch-id: 7a028831f1df214099241bfac0dc290e2f799276
> prerequisite-patch-id: c28c78ff316ce2ac8c1b6151367662ca8039acd3
> prerequisite-patch-id: eea3b5adeb19b753a14bf03c5114eb407566c248
> prerequisite-patch-id: 87bd95813776fe216ac157f9fad23586c71db87b

Please do not stack serieses on top of of each other like this,
especially not enormous ones like this.  It makes it far too difficult
to track what is going on.

--EKfE0NJTn63pxWNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJm8oACgkQJNaLcl1U
h9Dqkgf9E0bJ2UXkjbckVvjHc+7mjSLOnT6yLtoLsCIaplWfF3H7hanJ7Crja+w9
0NL1DSaqeHjHuahV3QcpGdIcxsNNFpHiqU/S/hCxVjPLmFGFaoBD79xppeSPeP0J
laUs2W3a2Z/DHt4/whYH6QyMKF3UbJe9uH1VjXixiGQ4ZEuXX1mzwUnQq9Oa650k
wu6xRgXl0C/Ts8LRbg4vwtf/AelEaDGshnkWfcszi/b0hgwIgcvYWo7XNdNcknb/
EU4JBHGO5mbrmR4P6t5ABa+wD4LeaUCFP2Trov9vSRC14lL0hh9X8TpKLt4/B6wF
OdsSR/Ry9PuwuhvrMT5bEtcLFpv27A==
=8Hf0
-----END PGP SIGNATURE-----

--EKfE0NJTn63pxWNZ--


--===============0298873275340521049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0298873275340521049==--

