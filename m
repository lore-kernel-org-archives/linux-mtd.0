Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351FEC5478C
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Feb 2024 19:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBIOO3dQht0xVV3C1dBuz10eHc/WBacs0ZvJp655M5M=; b=vb10k1BvDuOZpjuqaJcH6VxDPd
	2ZLICYICQYn9yMOCsNMhyQpz24X1Z9mhmucKM1jNzqPbkvLLibyNeviL2Cp9x0FIEVDFuRjMTFcyO
	0pY7rWytnCp8QMGtv53GBzSRqj37hcRMsgskmaKPeUkt8ed5B/I70QPP23yst6AWPk+v0qfPwHitW
	NGQdQ7oiMvSds/I9miN/vkbx0YZqAP/akcKDblMTkqrfDK19qEVLJWq/KkwerqQXiWl3YmIWeV9xt
	ufR9mUlw9NPjUom6nWCZCR/x8vkA9xY46TNFtQHtnZ7sK4zSUNMYpcVcqJ9ElIwvT7LcjAZBB9aAa
	uaRqSksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdy3B-0000000DXAl-12Kl;
	Sat, 24 Feb 2024 19:51:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdy34-0000000DX8X-3vLD;
	Sat, 24 Feb 2024 19:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D6235CE0E38;
	Sat, 24 Feb 2024 19:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E698C433C7;
	Sat, 24 Feb 2024 19:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708804260;
	bh=c+R74h3fQSp0t22NPjb+YRPWdwV9TUzr8d5YF9e/LyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F0PyI7E+BZwWRHrs8HzkPrS5kX0T/qb8zclPbkIBSFygX+9LqS/LYqC4h61aIXk6V
	 cyhEgYplgpmzxbS5n4RCB1e/3xc4JMuO11zbWqzLaSHCZhb8jPrlxYrdpI80tZgPul
	 78v4Maq0qwhvdayXO6C3D3/NLANskFY3uEQBu9CWWQnApiccLM7RVy+h76wW//iHyA
	 OvTh/r2UUc7cAJbS0C/sWV151JiGkRIgSu3mL3cB9F2gguGThBSkmoUamcaz+cNkze
	 r5vxTFxUqCDaabbtQBN/HJv/VurT+oXt2Ue9nsyrf/xpAxK54+Cm86MHzHchE4IhsU
	 jEbuUeg3q0QyQ==
Date: Sat, 24 Feb 2024 19:50:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/39] dt-bindings: atmel-nand: add
 microchip,sam9x7-pmecc
Message-ID: <20240224-doorknob-shrubs-ca14a595fc21@spud>
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
 <20240223172520.671940-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240223172520.671940-1-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240224_115103_186660_0A7E8A5D 
X-CRM114-Status: GOOD (  12.90  )
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
Content-Type: multipart/mixed; boundary="===============2764074271224195646=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2764074271224195646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UgdQRHjwd+VMErNW"
Content-Disposition: inline


--UgdQRHjwd+VMErNW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 10:55:20PM +0530, Varshini Rajendran wrote:
> Add microchip,sam9x7-pmecc to DT bindings documentation.
>=20
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/mtd/atmel-nand.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Docum=
entation/devicetree/bindings/mtd/atmel-nand.txt
> index 50645828ac20..4598930851d9 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -56,6 +56,7 @@ Required properties:
>  	"atmel,sama5d4-pmecc"
>  	"atmel,sama5d2-pmecc"
>  	"microchip,sam9x60-pmecc"
> +	"microchip,sam9x7-pmecc", "atmel,at91sam9g45-pmecc"
>  - reg: should contain 2 register ranges. The first one is pointing to th=
e PMECC
>         block, and the second one to the PMECC_ERRLOC block.
> =20
> --=20
> 2.25.1
>=20

--UgdQRHjwd+VMErNW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdpIngAKCRB4tDGHoIJi
0gAXAPjsa4IFqKMWYB3KmESjebgH/eC1spT80i6dCT/5gk4GAP4rMhPt5KVhUaB9
lngbJHwvw7BKAvJ9BQj4y5TQgwr0Aw==
=XyGE
-----END PGP SIGNATURE-----

--UgdQRHjwd+VMErNW--


--===============2764074271224195646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2764074271224195646==--

