Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EA6EB64D7
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieTexX2pkSZ4XsNJQcJzPl/iqlIP6hhxIGBTa3viwrM=; b=QMbeFs18+WWiQ/UQGhVKOQYnXD
	U2MzI/nxPEPOtCBvf3NOQMHhoz1/ABToydfv42gJO/kcp16+2XJ01CNTyRftay59HtYQsk+xbi9EK
	eU39jP0KmIm6T2fm66TOhvsFf3r44VkBcRgQ0zW9iBwjH01523us6RO3zvHUotbBkM0Cg/B3/UEyC
	ype066vP+tZYbl6sMj6AAXa1Hs4pz2UWQhsy7cgJbw7Lq7Ew/5hluOAe09FbISCSrcs6IkdsYu1TV
	tz96KGSL4RY0ZvcXpjKB601WUwCUiJc61BTUbeEcilY+K0m8PQuurTrFtzvOuZKCHwZ+2I2HwGR1A
	dble9tPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDprK-00Ajjm-1t;
	Mon, 26 Jun 2023 17:18:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDprH-00AjiC-0S;
	Mon, 26 Jun 2023 17:18:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4411B60ED6;
	Mon, 26 Jun 2023 17:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59938C433C0;
	Mon, 26 Jun 2023 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687799913;
	bh=1aVA419Kc2rCasX63ROtSOVQwV4i2RV7ZXpObtGF3dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FxUujNhgccvZMZWccetFHuXeo/D0zbw55BOtACrmFsYVHx7YMat0MmSj4UtuVsh87
	 sgdbL4QtyrpcwNfa6zUyYHQxoTygVXBBb2XBkP8RYTXAV6736s1OW0ASO6ejY5P2J7
	 /X7Ll/dAWy37SwGIaboKHtGt3hJhMQfNmnsgjNdMrONigzMyXMGuXWW/ksupoFgLCb
	 reFk7QZQgV6HONToyqBl4O/0PokwAEpFTtBHnyP2Z7NowlKFLTVJgOj/z2i0jdpjgM
	 vmuk8sz+ftzQkMhx6I5rvV0MF/x8PtINWE1Nro89AFRQnFJduCv77lYh5Zwq8EZypK
	 VJm7QMz1ThexA==
Date: Mon, 26 Jun 2023 18:18:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, gregory.clement@bootlin.com,
	pierre.gondois@arm.com, arnd@arndb.de, f.fainelli@gmail.com,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: Add AC5 specific binding
Message-ID: <20230626-immunity-lagged-eaae0182ad0c@spud>
References: <20230626031217.870938-1-chris.packham@alliedtelesis.co.nz>
 <20230626031217.870938-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
In-Reply-To: <20230626031217.870938-2-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_101835_221625_18A0A3FB 
X-CRM114-Status: GOOD (  15.55  )
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
Content-Type: multipart/mixed; boundary="===============2335122504743381742=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2335122504743381742==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mLtStHEbV2AzfZjM"
Content-Disposition: inline


--mLtStHEbV2AzfZjM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 03:12:15PM +1200, Chris Packham wrote:
> Add binding for AC5 SoC. This SoC only supports NAND SDR timings up to
> mode 3 so a specific compatible value is needed.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>=20
> Notes:
>     Changes in v2:
>     - Keep compatibles in alphabetical order
>     - Explain AC5 limitations in commit message
>=20
>  .../devicetree/bindings/mtd/marvell,nand-controller.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controlle=
r.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> index a10729bb1840..1ecea848e8b9 100644
> --- a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> @@ -16,6 +16,7 @@ properties:
>            - const: marvell,armada-8k-nand-controller
>            - const: marvell,armada370-nand-controller
>        - enum:
> +          - marvell,ac5-nand-controller
>            - marvell,armada370-nand-controller
>            - marvell,pxa3xx-nand-controller
>        - description: legacy bindings
> --=20
> 2.41.0
>=20

--mLtStHEbV2AzfZjM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJnIYwAKCRB4tDGHoIJi
0vp2APoC4meY0myxHCxXUVoBUzE6hpFknz/7nb15OFZQ1HwLqgD/Rky+73wm6Dho
QHLhMpJPdRSVdSpYAUROy/uJUSklOAU=
=CTKY
-----END PGP SIGNATURE-----

--mLtStHEbV2AzfZjM--


--===============2335122504743381742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2335122504743381742==--

