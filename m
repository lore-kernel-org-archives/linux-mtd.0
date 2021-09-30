Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD51C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 14:47:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C361619E2
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 14:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C361619E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57f6Y18tSjWx6lStooq5lY6RitZ5ur9E2qubhqWkBxA=; b=GWD14Y42leB9ktn3S6A4b7mrva
	D1mAenSBntT5fbYW7SMi+he/Nqr3Z5VRsYjRml6oZDsp9jqJR6fDkgVoyfeq0D2AL0XIjBA10mCco
	nGzFW/aDpEJqS8SkxAENqoI5yMbCu3Sy5C0PzsXpGFCr2yJrMYLpEESpNZVEXaKd4vTjR9nKIDAaw
	HIDGs79NWW8i2rNx+hoP0prqkXJG9KkwdvZ91pFGTKGqEl4U6/S0dt7wbie6lCtxF5s3uYv9homuf
	xQpyCxFUNWbxKCp3gIxEj+HO1O4+1FHogf4f8K4P8t8j1kJ8HD0Bd0OC8xRm8yRvLHizU4VGoo5SY
	pZ8Awk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVxK9-00Eo1J-PI; Thu, 30 Sep 2021 14:46:14 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVxF6-00Elr8-02
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 14:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=ZvuuUAw5AdmQ+JTYkJ6m1x8aRVdo
 Y2ZDvcWvQg7OFPw=; b=uy0cT/9XbZgr0mYdfwfFkaC9jCiiEzQsvUhaHfevC06L
 JpB2Ce5HRlksLwL8oLsDeYjWXKlLUfpyDj5f2u/tolIJtB+TIfO0lozqlyb8V3DE
 Ce8xg/YNqvUPDS47XRfLRmATWnphnARtcPWaqPAjl3WSEB2WtU97rUrU9Ek/QQw=
Received: (qmail 2113065 invoked from network); 30 Sep 2021 16:40:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Sep 2021 16:40:51 +0200
X-UD-Smtp-Session: l3s3148p1@v/frbjfNNoYgARa4RV6LAWawlO8I9jL3
Date: Thu, 30 Sep 2021 16:40:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 6/6] memory: renesas-rpc-if: Add support for RZ/G2L
Message-ID: <YVXMc1A4D/y4kjim@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20210928140721.8805-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_074100_374442_F60EF41F 
X-CRM114-Status: GOOD (  14.04  )
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
Content-Type: multipart/mixed; boundary="===============5280614133297181081=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5280614133297181081==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="myXSi1SOqxroiqCO"
Content-Disposition: inline


--myXSi1SOqxroiqCO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

>  #define RPCIF_CMNCR_IO3FV(val)	(((val) & 0x3) << 14) /* undocumented */
>  #define RPCIF_CMNCR_IO2FV(val)	(((val) & 0x3) << 12) /* undocumented */
>  #define RPCIF_CMNCR_IO0FV(val)	(((val) & 0x3) << 8)
> -#define RPCIF_CMNCR_IOFV_HIZ	(RPCIF_CMNCR_IO0FV(3) | RPCIF_CMNCR_IO2FV(3) | \
> -				 RPCIF_CMNCR_IO3FV(3))
> +#define RPCIF_CMNCR_IOFV_HIZ(val) (RPCIF_CMNCR_IO0FV(val) | RPCIF_CMNCR_IO2FV(val) | \
> +				 RPCIF_CMNCR_IO3FV(val))

Is RPCIF_CMNCR_IO3FV and RPCIF_CMNCR_IO2FV actually documented in your
datasheets? I am asking because I have a patch pending to remove writing
to undocumented locations. So, I was aboout to remove the IO3FV and
IO2FV macros.

> +#define RPCIF_PHYADJ1		0x0070	/* R/W */
> +#define RPCIF_PHYADJ2		0x0074	/* R/W */

Those are named 'PHYADD' and 'PHYWR' in the Gen3 documentation. They are
only available on a few of the Gen3 SoCs. I think the Gen3 namings make
more sense because then it becomes easily understandable that the
registers are used to write something to the PHY.

> +#define RPCIF_PHYCNT_CKSEL(v)	(((v) & 0x3) << 16)

We should add a comment here that these bits are only valid for G2L...

>  #define RPCIF_PHYCNT_STRTIM(v)	(((v) & 0x7) << 15)

and these only for Gen3.


> +static void rpcif_timing_adjust_sdr(struct rpcif *rpc)
> +{
> +	u32 data;
> +
> +	regmap_write(rpc->regmap, RPCIF_PHYADJ2, 0xA5390000);
> +	regmap_write(rpc->regmap, RPCIF_PHYADJ1, 0x80000000);
> +	regmap_write(rpc->regmap, RPCIF_PHYADJ2, 0x00008080);
> +	regmap_write(rpc->regmap, RPCIF_PHYADJ1, 0x80000022);
> +	regmap_write(rpc->regmap, RPCIF_PHYADJ2, 0x00008080);
> +	regmap_write(rpc->regmap, RPCIF_PHYADJ1, 0x80000024);

Can't we have defines for these magic values? At least in my latest Gen3
documentation, these values are explained.

> +
> +	regmap_read(rpc->regmap, RPCIF_PHYCNT, &data);
> +	regmap_write(rpc->regmap, RPCIF_PHYCNT, data | RPCIF_PHYCNT_CKSEL(3));

regmap_update_bits?

> +	if (rpc->type == RPCIF_RCAR_GEN3) {
> +		regmap_write(rpc->regmap, RPCIF_PHYCNT, RPCIF_PHYCNT_STRTIM(7) |
> +			     RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260);
> +	} else {
> +		regmap_read(rpc->regmap, RPCIF_PHYCNT, &dummy);
> +		dummy &= ~RPCIF_PHYCNT_PHYMEM_MASK;
> +		dummy |= RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260;
> +		regmap_write(rpc->regmap, RPCIF_PHYCNT, dummy);

regmap_update_bits?

Rest looks good.

Thanks and happy hacking!

   Wolfram


--myXSi1SOqxroiqCO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFVzG8ACgkQFA3kzBSg
KbbQRRAAsUhxjWffPi0zOAX/Kwx59slKArNPjW/bbcIaFpQJZHOaAtZN5f7ShJj9
heQOq0GZ59dy5mC9n8jWKRfLmIiy+kT7wyGIGHNZGjhIfGD/w6cJdATO13s62J91
76lxaruXnCIViD8oIqfJ9zayEVPesKwZ/wxaTuHZDQMzs6iOz0nW39a82pnvhXIr
aTiWOY3HuAbS59JNaY94+mbo+wSqZzosEI1hhinQCMPjITE8L1oe0rluhSQTV38P
5P9WQv8fd03duVvr5ERN7j/Dvhos6/nP/er99//xAcLe2cf2D2VruI6CduNN7Ilb
CBiPBubGkpRrNOTMFJOSpeaCrxZ+swulBjd59ZX6C/aIc6NK1kDjfON2unzC1iTd
eS25kDiUM2dgM5hALSh8yRyivVnSERjsg7wFVUmACJv8rf71pO257zOjA7Cktfa/
V9RByghEW+2beoOdDU1nu05jHraSQDBL7BsrDZSh/YS9LTbMBxo3EDDVfk1/vrWI
EKcTpDXqGCJdSf00OnDfXOB3cLQJJ1hhbA8u6/OvPtjnxG7+8mdLf7JXbEqwQoQ0
KfkKoIGxNCPH/Fb0s3YllskM0pG/gOqTs/ANfZBOR6GRwl9YETpxVqTEkKMXQJVu
LXP83RWNa2fCA6Bcb88B9EkqmXimkuaHuHPUX4z+O6hWg9yzQiU=
=FvhF
-----END PGP SIGNATURE-----

--myXSi1SOqxroiqCO--


--===============5280614133297181081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5280614133297181081==--

