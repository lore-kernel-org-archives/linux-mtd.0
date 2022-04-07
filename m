Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82170C433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JT7w9g0Wa+Upfi/pIHstJk4RRirav6Uf/qQ5N6BjBNo=; b=n4FgG0jCLRRrN5dFeLhzNGghkh
	rx4kp4t0C2x15m/vYywZ2/YP7fYFpkm1SrCMVKlFPTjQNpzisFP3P77E2vYVUEj4OEFdiwPk7aHxi
	wqbJUpRXQv4wbu5ovTtfK0cbqa+k3Ro3c7jAm0NBuMDeYxOanB/scVR9eNwUREzbAYJ2/Xm8kRiEm
	5A+E3Uwa96hSsYz3rUZymBJINZV9/Z8zZ/+oR09WeyZbWzn9hCw+1P+vd8aa/1naMmdsu6sZK9wzJ
	p3g/MgYiaH2o432SRkaf101/hnb9yUv5Li9xT/l3HCLk3L3MeWDwuO7Az6OQSCP63x4I5FMRNEyqh
	9Q1BDP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncTss-00CcyM-FJ; Thu, 07 Apr 2022 15:17:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTrf-00CcWm-FU; Thu, 07 Apr 2022 15:16:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 863DAB80945;
 Thu,  7 Apr 2022 15:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB02C385A4;
 Thu,  7 Apr 2022 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649344556;
 bh=fkUDGcZMuwhIXlCoSk+tbUQ1xUG4zQs/G/1OVgPCREE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bd48Y7UHPAbBiKO0ZxHoZekW8iqfOCfz5umBb4NzHj0BSf65Aifrapao09r4GlVPZ
 hCJr38My9FpRDgkGzKj1Ddc8MNR9wVGlRZfsw6qAmjw4Vgkmg/x24oqWEey3Vm5wzm
 I1RLmhB5M40vf127g8Ih7qrwGrTiftLBTBwLkLb0ysl1u26kvMeplIAVSZzvBWyyPs
 phsAKZjzJGyKFWCG8wwfrjZpPOqPH6p0qgPNJPFUQ2WdddpSy7HDXBebN2P6bV+o/x
 axmpkWPxhsjh6Skc2+CVFPM7r8C53dwjSVZJcSpz5DgSrBijJXjcx5nx14NIAf7bgC
 60oAg8lqcWY4A==
Date: Thu, 7 Apr 2022 16:15:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: align SPI NOR node name with dtschema
Message-ID: <Yk8AJcFRmYEryqra@sirena.org.uk>
References: <20220407143405.295907-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220407143405.295907-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Look ere ye leap.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_081603_726209_DACBDE6B 
X-CRM114-Status: GOOD (  13.06  )
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
Content-Type: multipart/mixed; boundary="===============3423394582036352229=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3423394582036352229==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="exxHKs3vl5yFGvsK"
Content-Disposition: inline


--exxHKs3vl5yFGvsK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2022 at 04:34:05PM +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt | 2 +-
>  Documentation/devicetree/bindings/spi/spi-davinci.txt           | 2 +-
>  Documentation/devicetree/bindings/spi/spi-pl022.yaml            | 2 +-

Acked-by: Mark Brown <broonie@kernel.org>

but it would be easier to split this into per subsystem stuff.

--exxHKs3vl5yFGvsK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJPACUACgkQJNaLcl1U
h9DhFgf/f0zclEq8qn8Edqu+LBr0uPAux3FUc79aJUiaw52UFqSsyCwAVD1XqJfB
6AWYVRrGg8ag/JiZSjxzzCQT8tCaZYgUv5FgBL0krLTu+UX9AFJtySLzv9Eh75P/
BxXn0lVp+eIfEuOKMgzoDbgfLDPANIdb2L6GlSecg1+SV5cfd1eS3xii/zo5woLo
5W9Z9rV5qACqdxC/7W1MTDk2qpHwM5onJgpslswaJ1j3kT72otXnKBTJNmk3jNO7
6bXycpaaSp2FfaVQD+L4JrVXJVHVtejlxAe1zRTYgPoLAY4Ga4N9u5dYw59AgY83
zC9tmaFzlEqB5ozAx2YSOPhf+IIkhA==
=8MWW
-----END PGP SIGNATURE-----

--exxHKs3vl5yFGvsK--


--===============3423394582036352229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3423394582036352229==--

