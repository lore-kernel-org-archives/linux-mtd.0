Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BA2C5AD49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7MpchM0Ma9/brPZFiFrewmOqMAPK8lGAq3KxuX1DQY=; b=w2WBpG3BAUMy9ALGlOFClsGQqK
	3CpbQr3AXyJxUG9EH5Y8dcNVHF1RfKwgUTud84wGCgbOcu7QPu7PXrGNEgDJe1kCOylqQBESuN7Hf
	IN3+eND12JNQg5qYnAhJs1O72xIc9NJ11kiX8D0ZYa1PMQpbCZKBRL3nY9yfPUJINEBvl+2oqCT4x
	+2T8k+S0uIwy0RiVvg9iYdvmaizi9jD75pplvMIkr/C+Bn3yxrOYAlHrllAP60l2hQrh1aTZDJPHu
	f6qKyjqXKG1zPOseRrOABEoH0dldV1cBHN3p66cA58nwTsv5AI60z/MNOoOXmqZRW3Y0Z2+4z1t5f
	22nTfJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZtr-000000098kl-1Ziy;
	Mon, 26 May 2025 15:38:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZto-000000098kR-36yD
	for linux-mtd@lists.infradead.org;
	Mon, 26 May 2025 15:38:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EBDFCA4F3B6;
	Mon, 26 May 2025 15:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6DAC4CEE7;
	Mon, 26 May 2025 15:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748273879;
	bh=gZEdcFi4AWB0mQGqJiR9Una+jbLgbOAii8cHYJwyyCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eVeCCn9+rEbLc+qkCLUyuKo8t7aaVRIHh8jR9LpDHzzYDoqaBW3s9r2BswWH9GnMd
	 3gg7sgvdnF6/qZLxmzHgW3Uja/7UvtdMu5u5FluGEamqmzXavPG23XcjlMcDKEvXfu
	 TTHg+YrIGqvY99JX+v12NT3qFpKX9FCegRjhdleaFfUbCJ8NqFUboqRAyoN5RKCPE9
	 IcCUu2l79NzYNq3ZYXg/1Yo42Cb3zaVVHWhAh2pjDG1M2xP/36hMvAheFksko9zrdi
	 21KNzoHJhQ8CUrzQiK6N9wiCrYWEuL8gHrCo6PA/R/7a6cFbJpPRaVBcvf5awtAOks
	 cIrwKfgrhDvLg==
Date: Mon, 26 May 2025 16:37:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mtd: jedec,spi-nor: Add atmel,at26*
 compatible string
Message-ID: <20250526-custodian-extruding-3b1889adc7f3@spud>
References: <20250523155258.546003-1-Frank.Li@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20250523155258.546003-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_083800_849218_D3470658 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============8463447587098036455=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8463447587098036455==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UXH9PATu1F7hJsVg"
Content-Disposition: inline


--UXH9PATu1F7hJsVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 11:52:58AM -0400, Frank Li wrote:
> Add atmel,at26* compatible string to fix below CHECK_DTB warning:
>=20
> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/spi@4002c000/at=
26df081a@0:
>     failed to match any schema with compatible: ['atmel,at26df081a']
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--UXH9PATu1F7hJsVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSK0gAKCRB4tDGHoIJi
0rMbAP46/aPf2cqfy3ZoD9HgTAgaGU7QaE0uUCfsNN9liR6RWgEAzie7LzEH2tOs
Accn0UQQ+IRbSANsvdQYP2eIHvaBegw=
=lH/v
-----END PGP SIGNATURE-----

--UXH9PATu1F7hJsVg--


--===============8463447587098036455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8463447587098036455==--

