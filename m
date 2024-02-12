Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B809C48297
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 18:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/f68KEp94Ug7nksJ0Rkz+n00Jl+80cvP5ndEUXorJgc=; b=ox+8/fFlXj211CJXPEPD+MgblX
	z67YuXzk4yJkmkhPyT0oPHc89pmyYM07DhJeEcRru/eHi8qqaVOep//W4sffgNVB8wx69k4Rg5VvV
	FxrpF4ZrV7+cVbKHo5x47YJK3qt0//rKQBUNQwiAn3KdveILEXUCh/W80xufHOgiptw9lEJUZs51K
	Ld06RMSqG3Puj7Wsy18GJZb3cn8qOc0c3zHeR5+OxYTBLC8nF06fPWtgfWLgB1+HdaNRvr+X9YTrk
	WMmFmcBO8wCrxFLYUXMP42gJZqEC4zLKzg3Lgpwo4FCrdpQUXjiZK0nYcQm4gIpqXXSKXbODzbCoe
	V+3qrpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZb7N-00000006cpW-2Tnd;
	Mon, 12 Feb 2024 18:33:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZb7F-00000006clV-1jR0
	for linux-mtd@lists.infradead.org;
	Mon, 12 Feb 2024 18:33:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5972CCE13B7;
	Mon, 12 Feb 2024 18:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052C8C433C7;
	Mon, 12 Feb 2024 18:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707762794;
	bh=DTRybV3KMIhH9nFsPr7JEPKWMu1YNivRlPVO0kxFIiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWcM4sGbpiBnCAUBh2PddGbGin4HS+JBNofityp2fupukmpyHsOs7EiAa+B8FaxoX
	 umxolyJDbeqDhf0mToD38sZ/Pof6zsgMByK1YBv5MxdJznwH8T5wGKTbb5ln5TMjgo
	 D0octNIsY6GRkNtS7TFkPdY6NZhiV+nwR+WAtBPmVwOZgm8J5XaNnqE9sxh4JLWgUS
	 m+gNn47PiYAgVwl/gYwF5CIq4OrjuYrgmgtdeqed3+Rm/9aDDrzgNj9tIDj9alXKIJ
	 o35hE/mqajrE7UxjmxYgZ7dPgskafzSutk1vYx7F+sM1QaLRuAp0irh2bA2bSYnH/0
	 StDyTiQv8O6OA==
Date: Mon, 12 Feb 2024 18:33:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [PATCH 02/12] dt-bindings: memory-controller: st,stm32: add
 'power-domains' property
Message-ID: <20240212-chemicals-skinny-18eda1cfe781@spud>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-3-christophe.kerello@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240212174822.77734-3-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_103318_045617_29686CC2 
X-CRM114-Status: GOOD (  13.86  )
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
Content-Type: multipart/mixed; boundary="===============0576894720942724592=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0576894720942724592==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j0T5UxTZF6zrutiv"
Content-Disposition: inline


--j0T5UxTZF6zrutiv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 06:48:12PM +0100, Christophe Kerello wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>=20
> On STM32MP25 SOC, STM32 FMC2 memory controller is in a power domain.
> Allow a single 'power-domains' entry for STM32 FMC2.

This should be squashed with patch 1, since they both modify the same
file and this power-domain is part of the addition of mp25 support.

If the mp1 doesn't have power domains, shouldn't you constrain the
property to mp25 only?

Cheers,
Conor.

>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm3=
2-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,s=
tm32-fmc2-ebi.yaml
> index 12e6afeceffd..84ac6f50a6fc 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-=
ebi.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-=
ebi.yaml
> @@ -36,6 +36,9 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  power-domains:
> +    maxItems: 1
> +
>    "#address-cells":
>      const: 2
> =20
> --=20
> 2.25.1
>=20

--j0T5UxTZF6zrutiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcpkZQAKCRB4tDGHoIJi
0tdKAQDHXMMk62WtYxljI4EYVK5zcDC6VAMJ9PBRjLb5XKG6fAD9FkStE7CE4iEM
IAf7Cd+5U9DpPVQ7o7X7sfH21yTKLAk=
=tk2s
-----END PGP SIGNATURE-----

--j0T5UxTZF6zrutiv--


--===============0576894720942724592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0576894720942724592==--

