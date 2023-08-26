Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571C7C83F11
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Aug 2023 09:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/O/TrumVaYnxadYAQPcVYlKtI3d5hOuyr5Hgpn+gTiA=; b=n5q/3Hv4jQXagXOZ6K/Ji0XbDl
	DB1CUPRHevoblLyxm18N2DhLWq5nALWNT4KP8BNg4s/4B0SOWEVRusRcNvOta1WBkSAbocS2Kme3m
	khaAXLThHhLPbYrvA+B21yVZPJ3JtUMaWmSIfIMGuL8OcdVPFCpnsINTXV4O99D4PTjcbhHLXKgxx
	a81x61qxFG0ltJjLihPDMTUChTDbhSCKu2t5GHXeOaKQv0sLQtJUuExxG4UuEtSzPePSJnPYkU7pJ
	tuiRzLJS29gGAWoCsFLkkNGTQVLuEdjCEwpiDSRoZtb1St/NaQRPBgcwc5CpufWNl2AVA3l9icdGs
	jyyBvPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZpp5-006dXE-1N;
	Sat, 26 Aug 2023 09:43:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZpp2-006dWE-11;
	Sat, 26 Aug 2023 09:43:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9974760FFB;
	Sat, 26 Aug 2023 09:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA834C433C7;
	Sat, 26 Aug 2023 09:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693042991;
	bh=w4am/4JAWICl0+CM2N3F7pWomtDuzhla+/3J5rQhiMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ugs14BCGUAJYiqi35vosJIaFDHIaOTqD34R3p705yf5BbqxkZjr7MczjUlnsknhJe
	 JA8S5lys6EJh8H4AFrH7cj/LSSmuyeKfLMCr10HlnPyMIVrL/OjukYC+dvr5J0NChR
	 eeEYu16i0DP+H7cEMSZiBkMM8JIokjkY5h/vgtAZZyfURhKzuVQrT5BXYNgBCDiofP
	 AYX3C5S8NrEv3JGUmLsC9VBC0yJSJyYL20HVcSmN8BKWpua7pAbZgsIWOMud0VGLF2
	 7tpvU9/jThTvjGDP/l6+Fb4CFWNkHcNroMonL/TdgVQSEEDk6wy+sltiB6dFRSX31u
	 WD26DX7li0EfA==
Date: Sat, 26 Aug 2023 10:43:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: amlogic,meson-nand: drop unneeded
 quotes
Message-ID: <20230826-undercoat-unworldly-7f2dc4c29cce@spud>
References: <20230826093852.9334-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230826093852.9334-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_024312_420390_AB6EC23C 
X-CRM114-Status: GOOD (  15.08  )
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
Content-Type: multipart/mixed; boundary="===============7589849020228695744=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7589849020228695744==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3Pe3eE9k3gd9AmCP"
Content-Disposition: inline


--3Pe3eE9k3gd9AmCP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2023 at 11:38:52AM +0200, Krzysztof Kozlowski wrote:
> Drop unneeded quotes over simple string values to fix recently enabled
> yamllint warning:
>=20
>   [error] string value is redundantly quoted with any quotes (quoted-stri=
ngs)
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yam=
l b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> index 1c79815e1f7f..57b6957c8415 100644
> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> @@ -67,8 +67,8 @@ patternProperties:
>      unevaluatedProperties: false
> =20
>      dependencies:
> -      nand-ecc-strength: ['nand-ecc-step-size']
> -      nand-ecc-step-size: ['nand-ecc-strength']
> +      nand-ecc-strength: [nand-ecc-step-size]
> +      nand-ecc-step-size: [nand-ecc-strength]

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--3Pe3eE9k3gd9AmCP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOnJKQAKCRB4tDGHoIJi
0tmIAQCqkCDtBMSX2SeEUQNybarIOacjn8MxbYP0QEVx3FwFYwEA/pe8aKWZFXpT
/0efo5eoP4xpSQJyVaXB3RvpgiPHmAc=
=pOjg
-----END PGP SIGNATURE-----

--3Pe3eE9k3gd9AmCP--


--===============7589849020228695744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7589849020228695744==--

