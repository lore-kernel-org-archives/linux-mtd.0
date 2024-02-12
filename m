Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E44C48BC1
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 18:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fy+YGJ7XeekxvC4lgTYRvHs/TbE1gUbCYAVtdK01wfI=; b=bdEpzZPx4OIg7dq38C6AZVj0fm
	c8FfjRPaqkGU/hq969QZrlAARdso10IC4HA5rbQxtXqYiLxDNe5G4LpYZ+vZw3OZZVZhIRbuPRdU5
	jwaJqDzMRbcChtwODG/mI5XyMK8fxGOQddwTuotk1oF/Pbec1VxWWgVSDfOp360VL13i+aDsS5CRO
	GC9LEpi6z+Yn6Wm3GtcHXQK9QPycl8yG2ggdH25sH8J4yv1MwInb4jrte0P6i/ZG9G7rjwrr2zPZ0
	vUdG9j9I9M8VJkCyyDQX5CAcSZRA5//CM8SNKmsYjZzc9ku++kZ6s5rxnZCLpD2aexwss1AnOsijZ
	36TeUbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZb4e-00000006bvK-4Bmz;
	Mon, 12 Feb 2024 18:30:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZb4c-00000006buG-2AxR
	for linux-mtd@lists.infradead.org;
	Mon, 12 Feb 2024 18:30:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EB1E60FFD;
	Mon, 12 Feb 2024 18:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368B8C433C7;
	Mon, 12 Feb 2024 18:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707762633;
	bh=6WiiTc2GDFm9N1l5HMkfYx0/LzGK7veAUDVvhiMnnQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dNk7OdK5j2JejmjY9K8x1whAEoB5vmQrby/sMV5spd00ZhEXp7xVF0m2KWdQNIxR7
	 l2lXc1+Z0nR8cKLHDq4xzDm3UqMCMjKJUF+YDCGMtAs5smjS11kutL4/fYZrB/MFK+
	 bgNJiHV2J/hgl92rZhVaX72PXhSh/EgrDnMzSREznDqgVo34Zy4QT15p5zRqhrYQCD
	 ZGm0fk4+iNwUY48q+rAHyXhwF9S6lgavloXRGpAZDpJ/eDTviPmXHR5AbyRvy3VWk/
	 otKMRaSHE4y/cRuOz3UNZOH6NcbdBObq0hmGPrgQW69qRNTnkpHsVqhDCc/xC+OXiu
	 TDnxKbNBufdUg==
Date: Mon, 12 Feb 2024 18:30:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: memory-controller: st,stm32: add MP25
 support
Message-ID: <20240212-dial-strangle-0b6861b35ec9@spud>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-2-christophe.kerello@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240212174822.77734-2-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_103034_618444_19A33AB2 
X-CRM114-Status: GOOD (  13.57  )
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
Content-Type: multipart/mixed; boundary="===============0651036041360249642=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0651036041360249642==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YkxopxwhiToMlaYp"
Content-Disposition: inline


--YkxopxwhiToMlaYp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 06:48:11PM +0100, Christophe Kerello wrote:
> Add a new compatible string to support MP25 SOC.

You're missing an explanation here as to why this mp25 is not compatible
with the mp1.

Cheers,
Conor.

>=20
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm3=
2-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,s=
tm32-fmc2-ebi.yaml
> index 14f1833d37c9..12e6afeceffd 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-=
ebi.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-=
ebi.yaml
> @@ -23,7 +23,9 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    const: st,stm32mp1-fmc2-ebi
> +    enum:
> +      - st,stm32mp1-fmc2-ebi
> +      - st,stm32mp25-fmc2-ebi
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.25.1
>=20

--YkxopxwhiToMlaYp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcpjxAAKCRB4tDGHoIJi
0jlEAP40gxiapecNCdq4bMYSWey8hRA2SHHEVuZiljTNDaCr1gD+PirbU2q0jSAQ
dUblhSmGOo/z/tonrLaHyqgGbMx3ng0=
=i0Rq
-----END PGP SIGNATURE-----

--YkxopxwhiToMlaYp--


--===============0651036041360249642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0651036041360249642==--

