Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92B6C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R99Sj4+uHU7z9TPLB/2c9Tp7VS7w1+fPFjQ2Jl+8BJQ=; b=hLMmLfi1tN3Fc/1oTYbvsaNwh6
	cMb6B34M6s7kfDYMnO/tVtVP1FKoQBi8KWODnqQK2DFQy3Quj/fBx+K37Mvky08GDGM3VJE1G7jxy
	RILWWqYgHd6+uHJgu7vzooUR526B0ukCK7LjwC9q0ifH1O8PsKbfpGW3Ib+y1qqVjLBK37+P6hQNy
	CCG+lLdIXr8lhrmHkHcXzBJcpVnMK5PSkjzkuW4v/2oaUQTDAdFxIFG4exN4RE5V3SE6cDgF747ZE
	g3bdCvk5wa7yi3bAuD5sH7eWI1uVN05PoyUL3aybMDON2m7xDRpLI2YgcM+xurEw9zS018F0OEpw0
	jiGRhPKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myAHY-009RWZ-RI; Fri, 17 Dec 2021 10:16:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myAHU-009RUN-Gs
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 10:16:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1DEB4B82783;
 Fri, 17 Dec 2021 10:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42923C36AE5;
 Fri, 17 Dec 2021 10:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639736161;
 bh=snv7D0bg9ZIaZv6KA4SVmu+ko2D49RQlrJ1DNDxan/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nKTv7WDyL0ctU78mqzrYXbzfKT1xMCCYbhm9mlFfJohpw5r8aM+EM10JCPaJSNemf
 Baxsp5GxbZ+Y33sMVdtpMNcXu321ddyw5x9+2T+XhSSngGQw9AyrmeiRvcECA2nDmG
 KtSd7QUvNJAMtIgb20Qq42gsVBkKJJxw4HktbLMzvXGaiEXU/4xqd+pmKtKMCM2rVy
 0tu1QZ/L39KhdDGmAM2fta8hGjSDVCmBYSJhlm23NWQW5QRi+J482SohgvgqhmODng
 0Kp1iPcCeHK4l1ywWUE5m5lWa1JaVD4CdTboOxIO5hBXURztc1IVC+Lk+w0p1kPfCk
 vtu1HQcbT+jbg==
Date: Fri, 17 Dec 2021 11:15:58 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: Re: [PATCH v5 2/4] mtd: rawnand: rzn1: Add new NAND controller driver
Message-ID: <YbxjXgIIj6yma+Ch@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-renesas-soc@vger.kernel.org,
 Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Ralph Siemsen <ralph.siemsen@linaro.org>
References: <20211217090248.259122-1-miquel.raynal@bootlin.com>
 <20211217090248.259122-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20211217090248.259122-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_021604_881384_90ECC60D 
X-CRM114-Status: GOOD (  20.78  )
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
Content-Type: multipart/mixed; boundary="===============5742364750425217308=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5742364750425217308==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JEHMTQpb7VDnBZsA"
Content-Disposition: inline


--JEHMTQpb7VDnBZsA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Miquel,

thanks for this driver. I just discovered it, better late than never!

On Fri, Dec 17, 2021 at 10:02:46AM +0100, Miquel Raynal wrote:
> Introduce Renesas RZ/N1x NAND controller driver which supports:
> - All ONFI timing modes
> - Different configurations of its internal ECC controller
> - On-die (not tested) and software ECC support
> - Several chips (not tested)
> - Subpage accesses
> - DMA and PIO
>=20
> This controller was originally provided by Evatronix before being bought
> by Cadence.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Ralph Siemsen <ralph.siemsen@linaro.org>

This IP core is also available on some Renesas R-Car Gen3 SoCs. I don't
have a board with NAND equipped, so I sadly cannot test your patch and
can only say that the code looks like it is in a really good shape and
can only suggest some renaming.

> ---
>  drivers/mtd/nand/raw/Kconfig                |    6 +
>  drivers/mtd/nand/raw/Makefile               |    1 +
>  drivers/mtd/nand/raw/rzn1-nand-controller.c | 1422 +++++++++++++++++++

Because the IP core is present elsewhere as well, how about
drivers/mtd/nand/raw/r-nandc.c ? This is the name mentioned in the R-Car
Gen3 docs.

> +config MTD_NAND_RZN1

MTD_NAND_RNANDC?

> +	tristate "Renesas RZ/N1D, RZ/N1S, RZ/N1L NAND controller"

"Renesas R-NANDC controller"?

> +	help
> +	  Enables support for Renesas RZ/N1x SoC family NAND controller.

"support for the Renesas R-NANDC found on ... SoCs."?

>  obj-$(CONFIG_MTD_NAND_PL35X)		+=3D pl35x-nand-controller.o
> +obj-$(CONFIG_MTD_NAND_RZN1)		+=3D rzn1-nand-controller.o

Might need updated sorting then maybe.

> + * Evatronix/Renesas RZ/N1D, RZ/N1S, RZ/N1L NAND flash controller driver

R-NANDC?

> +struct rzn1_nand_chip_sel {
> +	unsigned int cs;
> +};

Replace all 'rzn1_nand_' with 'rnandc_' in the file? I know this can be
an annoying change.

=2E..

> +		ret =3D devm_request_irq(&pdev->dev, irq, rzn1_nandc_irq_handler, 0,
> +				       "rzn1-nand-controller", nandc);

"rnandc"?

> +static const struct of_device_id rzn1_nandc_id_table[] =3D {
> +	{ .compatible =3D "renesas,rzn1-nand-controller" },

"rnandc"?

> +MODULE_LICENSE("GPL");

"GPL v2" according to the SPDX header.

All the best,

   Wolfram


--JEHMTQpb7VDnBZsA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG8Y1sACgkQFA3kzBSg
KbaZMQ//T1w3ffnlVtf8txLcPIb5VcN8yeaQO8F9ZA7aFz0WL0XNiuOwTRfduqe4
frqbeNLvsXBi9fxAJIUjyDfdo3zrnUG3ENyRZq7aE/IAwd+dHeVj4EHA5J2xasU6
qyVZHqrv76C6CbWQvDeW5gmQjrpvl4N3A4yoRni7ONuWIEOxF67b3HCAlzvUxdoJ
qslRugqWId+I7AK+swt/OH0sjYrvUvT68dttkE6WdvvJUm2F2ea0C5EFJcuF2Ixe
R5NXN2M49NFZRUr4FJHaToCV7VrgJkAWpF7iwvp3+BjnOLALzywAN0ofLs3C0RM+
F1PA7JyDBTQ9MWsNlUJVCAB/miTKKc1rYQc4AwvrpRjCQ/qJkeSUa1uC883SrrpA
hAHTxKReXEgyzaMCmqvPPfTEC1BDpCQZfJyMAarUS2as43ijqyNyCfB/03DaKh40
bKaUOZ3tBBNjc2x9MMeHs7/JnNy4z+2cwZM5+W1mVrJNZIO98P77ubpCG36Vg1Cp
zcEXyhPB0jXw7JAOac3C0rDOm9LyNUQUxfk7Vb7yRlAVETqlbhw/0gmIpE9IEgiF
qp+LLzFdfPEzGCfvI+G2qNk0qFw6LJsz7J2BOyIh62c+PIMfw9Rj2Y9Yr0g2DJDU
cDYzE80kpm90PaceG0TPj5v0emVMJbyeCOIDHKtjHTG+uB8KxxY=
=A8Ks
-----END PGP SIGNATURE-----

--JEHMTQpb7VDnBZsA--


--===============5742364750425217308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5742364750425217308==--

