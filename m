Return-Path: <SRS0=5hwZ=PV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5166C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 11:49:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B27660F56
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 11:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B27660F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzn4HFdNJ6+Vhd6yKRgbY+qbl5gwzOexnnm6YdcJLFg=; b=tXiRR6upkRETArYeXMOtmM6hMW
	OgamTcl3sU/qYYguFdSw5kPn+Wu0UM3nwqwzM092FNLDz8kxtZBjw1q9xCkezkspzng6VkL6zyDWm
	LUlF0wkji2Ya7FhdJil0DaOazD3bzh+04Equ7Z+XyUGF2Q8FJefYAdkOaipt8TLhhToheJNWePERN
	24kgpGMVKguObLmWEVyXT4LVoeZRbxSdjrMOW8gDPwhdVe5gONyFWufHmyvZ09QIxIDm7KBw8yE7F
	BEpYsBU8Xmo6JEbvFH73tyE2WJAf5rhE/BcrcGazGDD+T3uYS/yDzm2C7KoDpBPuHo9VTyVGLoXvo
	JSJIy4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhsH9-001YHH-Qv; Tue, 02 Nov 2021 11:48:23 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhsH6-001YGK-82
 for linux-mtd@lists.infradead.org; Tue, 02 Nov 2021 11:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=dN9MYJ4hkMa2VeKQrok5+AhQyNq+
 WxeIgQN6Qx6FS+Y=; b=V6tP6HsdN3Xj6iLwUvhxiY4tcwSh5biRiwe4NwNydSem
 OSUAKddVbsfz9ExrsubzphmbNQ4SuIbUDhG3GWyVCxcfCUPoGqZoFd8pTEqtgAZN
 eO+o7DQebaG8rWHzEe+5zfLTtVGzQ/rjIuIMp0B/KJD1YdwS4p8YJmZlA/Gy23s=
Received: (qmail 3432356 invoked from network); 2 Nov 2021 12:48:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 2 Nov 2021 12:48:09 +0100
X-UD-Smtp-Session: l3s3148p1@6ngQ3szPvrEgAQnoAGZOAQNlyaw0xFC0
Date: Tue, 2 Nov 2021 12:48:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 7/7] memory: renesas-rpc-if: Add support for RZ/G2L
Message-ID: <YYElefbpP4pwfmUl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211025205631.21151-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20211025205631.21151-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_044820_617282_2638543F 
X-CRM114-Status: GOOD (  10.26  )
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
Content-Type: multipart/mixed; boundary="===============7530846753464205909=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7530846753464205909==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xw48OLVEQGVpdzaE"
Content-Disposition: inline


--Xw48OLVEQGVpdzaE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

> +#define RPCIF_PHYADD		0x0070	/* R/W available on R-Car E3/D3/V3M and RZ/G2{E,L} */
> +#define RPCIF_PHYWR		0x0074	/* R/W available on R-Car E3/D3/V3M and RZ/G2{E,L} */

Nice detailed research, thanks! Minor nit: Keep the sorting
alphabetical: D3, E3, V3M.

> +static void rpcif_rzg2l_timing_adjust_sdr(struct rpcif *rpc)
> +{
> +	u32 data;
> +
> +	regmap_write(rpc->regmap, RPCIF_PHYWR, 0xa5390000);
> +	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000000);
> +	regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00008080);
> +	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000022);
> +	regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00008080);
> +	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000024);
> +
> +	regmap_read(rpc->regmap, RPCIF_PHYCNT, &data);
> +	regmap_write(rpc->regmap, RPCIF_PHYCNT, data | RPCIF_PHYCNT_CKSEL(3));
> +	regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00000030);
> +	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000032);
> +}

Still magic values here. Don't you have them explained in your Gen3
documentation? It is tables 62.16 and 62.17 in my versions.

Other than these, looks good.

Thanks,

   Wolfram

--Xw48OLVEQGVpdzaE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGBJXkACgkQFA3kzBSg
Kbai5w//U9777KhbnAVOH5ipoN2F3nwqrx58di9AO1NxfqlO2pTx9hlFix1jbQ3m
BMbw0km4viA9iT8XWRI1GsI3EkxIP2HKQJKIww4vxziDvwmT5KtUWzFcvqc6/SE0
Z8i1j9swoSfgJo0ZFeAhPjNl4YYtsf2ESUl1Wx1xFQc3oGDzsRHUULw5SugbX79H
qgER7VTWeZhL4eQ1rBUCVVY3G2JPtsLhYZ2jf72jUDBIRS39/BlyaCrSETwzYVcH
HRGodyfWogpB7t36UdbxesdWM+OMnKM0JCKZEf30sQeFp5YaTqcLYBoVvwg+tePC
y25zwria2RbGl5FplptuDnj7cg1Khpz/n7uXCmeaOejk8yYF8DR6g1NET4Neo1Rz
lXlukauT07VLU47RuuQqlg/4z39ai3DphF4ew2qMTSh4Sz11sAn9F3+OEPUuMUiG
JIvu9CVrie13frUtSd7Xc2M897hyJMP7lKiUP2jrw5klHFPZH7yryCMvKeXEOALX
rv0Jp10phC2oBtO6HjPlXIQUCcVnHe2BUXAISMDN6l1McnR16SoDi0F00d6Z9YB2
G3Svf/sfaN+As5bNqkywaalSVfvt8IfqxqXtYRfLyKzwJCUY+f8JhF75sgX4HbGr
eDYheRfVDVZHewRUDRkdYXtyBlczYwo3q6pgYOCW3gOJ9k12g2E=
=45MZ
-----END PGP SIGNATURE-----

--Xw48OLVEQGVpdzaE--


--===============7530846753464205909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7530846753464205909==--

