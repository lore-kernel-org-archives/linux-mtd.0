Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2F7C4828F
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Feb 2024 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3xyaEXYTdy1TsrKjvap2SorEGMzguNCu6RI/ZsICRw=; b=LkUrDaf/JheHd7L1M3wvRLLiLu
	S2kDCrK0E7iPZYhmCXdAVi8SNRf+WROG0SCKFtJg9kOd9rqM4QPXJ03PWM34rtuLwTVFj98jKkCHj
	Og6gy1zwPe79+CemE06Gw84WPTnOk6B/QjMWfeaFgXNzNRmlxJ7q8Okb3oMmpXhglwmCKQzQhPdRS
	PsjogfC2ofB9WI9mVvO90b1ulOZD9zFnAhzaXuUBaSSaojVyt9rwkSkveDiJyygtKkFWab/ltWYDv
	N1T1Zwi7+Cr6hsbo9aYpurjYBM0MJAdnLb89gynUYPWtsX0b/oaZkMr1o+0N1x4uhgdEBSrQQBAq/
	rozBACBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWHLI-0000000GeQB-13Z9;
	Sat, 03 Feb 2024 14:50:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWHLD-0000000GeOh-0U5O;
	Sat, 03 Feb 2024 14:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98FCB602E1;
	Sat,  3 Feb 2024 14:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D780C433F1;
	Sat,  3 Feb 2024 14:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706971797;
	bh=5ctG5h8mEiQAu9NdNXA4+XFyWIp25c6pytmgpTEtD2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uSh5vQ8usObzfCmqjYrQoE5B1ZtZ3tDCGsR4EBCuLPWMoozl4vy84blzVU9AJA4XT
	 puueVthAvgqm5TXxSI5NPwIxq4W6cgJg7duKCBUpDO/9cwHe+hKSRcjaNi73dZ2ZzQ
	 tQeMHvHKBfkVKea7kVSeA42jRL4P5ocf4d1Mh5DhoZ/Oa1FV8YdXsdRqcJLCefdL0w
	 QtLYEnmrF0XjgrXbwsc8543J0UY3duyIrQLjAj22Iu20KE0cArltNnSjnHgUpra/ri
	 KFmQk1qcxDQb4xNzOjkDGE2NGnef7J4tHp81ui6URq920Ghs5Hs5BTgNUH4ELNAnf2
	 rCb8buZ0u6CYg==
Date: Sat, 3 Feb 2024 14:49:50 +0000
From: Conor Dooley <conor@kernel.org>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	f.fainelli@gmail.com, kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com, anand.gore@broadcom.com, dregan@mail.com,
	kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com, devicetree@vger.kernel.org,
	Brian Norris <computersforpeace@gmail.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 03/12] dt-bindings: mtd: brcmnand: Add ecc strap
 property
Message-ID: <20240203-expenses-tarmac-c564bc7ae34f@spud>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
 <20240203002834.171462-4-william.zhang@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <20240203002834.171462-4-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_064959_266454_6F5613B1 
X-CRM114-Status: GOOD (  20.76  )
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
Content-Type: multipart/mixed; boundary="===============7704082108658524536=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7704082108658524536==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z/AOuDAE/L8fKLSt"
Content-Disposition: inline


--z/AOuDAE/L8fKLSt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 02, 2024 at 04:28:24PM -0800, William Zhang wrote:
> Add brcm,nand-ecc-use-strap to get ecc and spare area size settings from
> board boot strap for broadband board designs because they do not specify
> ecc setting in dts but rather using the strap setting.
>=20
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>=20
> ---
>=20
> Changes in v4:
> - Move ecc strap property to this separate patch and remove some
> non-binding related text from the description
>=20
> Changes in v3: None
> Changes in v2: None
>=20
>  Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/D=
ocumentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> index d0168d55c73e..2599d902ec3a 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> @@ -147,6 +147,14 @@ patternProperties:
>            layout.
>          $ref: /schemas/types.yaml#/definitions/uint32
> =20
> +      brcm,nand-ecc-use-strap:
> +        description:
> +          This flag indicates the ecc strength and spare area size should
> +          be retrieved from the SoC NAND boot strap setting instead of
> +          nand-ecc-strength and brcm,nand-oob-sector-size or auto detect=
ion.

I'm still on the fence about this being overly prescriptive about the
operating systems behaviour. I think it would be good to say why the
strap values are better than those explicitly provided in DT rather than
just saying "these strap values should be used".

> +          This is commonly used by the BCMBCA SoC board design.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
>      unevaluatedProperties: false
> =20
>  allOf:
> --=20
> 2.37.3
>=20

--z/AOuDAE/L8fKLSt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZb5SjgAKCRB4tDGHoIJi
0tWnAP9mesDP/aST3xwWYHD8YvKXyojpcT4bQMcvlk7eIb6bLQEA++HFzMX/8fDp
xvzyDoEeIOF7mwJLYnJs2aHZBWDl3Qc=
=qcHg
-----END PGP SIGNATURE-----

--z/AOuDAE/L8fKLSt--


--===============7704082108658524536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7704082108658524536==--

