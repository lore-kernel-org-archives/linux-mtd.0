Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB37C88E75
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4i2ReVPNJEvWDG9JxjHl0xbiMr3hIiwX5puEEnkdp2M=; b=bWpGo0Dc2YAtT6Z9OyTvUtYlsb
	hxf133viXSZCb7nUZvWz6ozOoRou9AVSZylYWJQd7VTxac0XM76t1eEDlVIv157hVsj40mTJZZjVY
	Z2k5DDwpPrTlnzwJ/4GblSt8xs00FxQcAGViE6XnJFQkGip/RCRd5+ZAVzyvrjkFIj3uGRMe0JSMJ
	HfWd2wC2qAwV0+Ud0dTqZK1LBWrKzqMW4Wrk57nCP93eMxKGY/cixw7fyuIJysTw9GQkHQOdbgbR4
	pH3A0Z3aQLMn74SrTnE03tauQnZV7jqK+WM7IFJJkTOKCqsxOfK8lLnS7ZQDRE1CA6p7PgAzeAMTo
	KvPXB9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WSS-00000007Vg7-1Dn7;
	Tue, 15 Sep 2026 16:56:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WSR-00000007Vfa-1vuh;
	Tue, 15 Sep 2026 16:56:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CC4A41235;
	Tue, 15 Sep 2026 16:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4606A1F000FF;
	Tue, 15 Sep 2026 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491394;
	bh=GAkhn+z0ub07VOWpNCsE7w2z9r4RYr+sixMhLdWU9Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J9zUbT48m5ll+mJL0w+ov+3vrPSlN0DDARGf4MhWYeNi7bq0xyAkSdfrjW2OFY3/v
	 d2l8xlN4QakZFH6LrGPbzv3Z0V8E/uao/DP+WlI76utAllCHFKc6iRnZeu3NEwi4J9
	 T4Qh5NxuQ9Faw106glSxeqLB136eDw+Nxis7Ec9s+83sB/SowBOFcPNjp/l0xtZ3tS
	 HyK4hoa9Ffs4EIWePSYX25BsVWAU6RH48HabEAV7P1zygNkNyIlPKxahzQUFiZjX2z
	 3NfpEy+ShS/6Wmh8o2aO2Khr0H9vHDDheTki89tIzkhlFCPaKjtlxjW5uex2GvOM4a
	 CmzFoj+ZwZeKQ==
Date: Tue, 15 Sep 2026 17:56:29 +0100
From: Conor Dooley <conor@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 12/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
Message-ID: <20260915-snowman-expand-7a4e8902db8a@spud>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-12-2fb084fe0751@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-12-2fb084fe0751@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0346270763163915815=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0346270763163915815==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yAn0LXcnisqLx379"
Content-Disposition: inline

--yAn0LXcnisqLx379
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--yAn0LXcnisqLx379
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql4vQAKCRB4tDGHoIJi
0v4eAP4xAjGW5J0P3AHtQQ0aRuus9MvCIKAELyuXj0IREJ38TQEA59g04SqdOcT6
qqqWzA06o5NnvFcNfdX8ZCaXPGR7QA0=
=R965
-----END PGP SIGNATURE-----

--yAn0LXcnisqLx379--


--===============0346270763163915815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0346270763163915815==--

