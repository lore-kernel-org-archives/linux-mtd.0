Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CFCC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 08:55:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A606261A56
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 08:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A606261A56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDLsOS328suQDj6j8Qvq4vETWjE9MbqC0rTvmVT3Nt8=; b=GcX9DzRO6U3vQ8U/rx8HvLj3Fe
	7vnNI/3RW6rNG3P9bUkwC0UHGzIkIts6wdfnob5ulYP1mmIx4fEbTfd7kZKxJZI7MDgqTlDbo1x3p
	spzxHchZh4I09TLYD5Nw5V4Yu6qvtpTNk9a/LQ6NJjNNU2iXHGhtoDxSrx+52fufudj2TSIwkdFu0
	mlq+O6mBkxs/CMbjTAmTnNGUKE+bXn15XkqDzcZ9mXj3SJOmuIrjeRtEd7z4eWMQIb22e7rGy6wrS
	QKANZSjG9li5UYKqouBnt91h41PHMWQj+CeFAojl6UR43Hknd1gpQnrHUNxffZycpRy28oKykh9CK
	cgysPtMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWEJy-00H8Z7-E6; Fri, 01 Oct 2021 08:55:10 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWEJs-00H8Xb-Ip
 for linux-mtd@lists.infradead.org; Fri, 01 Oct 2021 08:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=U0XYrY7BfpzXUDaE53ryLcZq8bbX
 xEwB4ugx+HOYEAM=; b=Y0dkP3YbmXab6WI/QAVhlO/cRwgLvXfKY5aQuEWMP9zi
 PIKv+vSUuxsBC3jPZ9vP1yWk6m7nO06Hk5J8S6+fL3tY0CUAD2Og/YocuD1ApjAG
 gc1vSVyFKORA8TwoVMkl+4ia5KluFN/Sj1ix4syqNvBJyUa8qby/WFR1+qPUX/8=
Received: (qmail 2400745 invoked from network); 1 Oct 2021 10:54:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 1 Oct 2021 10:54:58 +0200
X-UD-Smtp-Session: l3s3148p1@mSSZt0bNQtAgAwDPXwmDAJN1R91E6vGQ
Date: Fri, 1 Oct 2021 10:54:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-spi <linux-spi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 6/6] memory: renesas-rpc-if: Add support for RZ/G2L
Message-ID: <YVbM3z7x+D0MCkTF@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-spi <linux-spi@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YVXMc1A4D/y4kjim@shikoro>
 <CA+V-a8sDSsyTGfTeQfG_ZhfrJHCm+2kBTEDWaoFMTgsMOmxEgQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8sDSsyTGfTeQfG_ZhfrJHCm+2kBTEDWaoFMTgsMOmxEgQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_015504_935274_753F5133 
X-CRM114-Status: GOOD (  18.43  )
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
Content-Type: multipart/mixed; boundary="===============6891118961334952945=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6891118961334952945==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="POeIfeKI2d2tOV4O"
Content-Disposition: inline


--POeIfeKI2d2tOV4O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

> > Is RPCIF_CMNCR_IO3FV and RPCIF_CMNCR_IO2FV actually documented in your
> > datasheets? I am asking because I have a patch pending to remove writing
> > to undocumented locations. So, I was aboout to remove the IO3FV and
> > IO2FV macros.
> >
> Yes they are documented, you should be able to download the HW manual from [1]

Great, then I will keep them!

> > > +     regmap_write(rpc->regmap, RPCIF_PHYADJ2, 0x00008080);
> > > +     regmap_write(rpc->regmap, RPCIF_PHYADJ1, 0x80000024);
> >
> > Can't we have defines for these magic values? At least in my latest Gen3
> > documentation, these values are explained.
> >
> RZ/G2L manual doesn't explain these bits. Let me refer to R-Car Gen3
> and define them as macros.

Seems like we have the best of both worlds then with the documentation
;)

> > > +     if (rpc->type == RPCIF_RCAR_GEN3) {
> > > +             regmap_write(rpc->regmap, RPCIF_PHYCNT, RPCIF_PHYCNT_STRTIM(7) |
> > > +                          RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260);
> > > +     } else {
> > > +             regmap_read(rpc->regmap, RPCIF_PHYCNT, &dummy);
> > > +             dummy &= ~RPCIF_PHYCNT_PHYMEM_MASK;
> > > +             dummy |= RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260;
> > > +             regmap_write(rpc->regmap, RPCIF_PHYCNT, dummy);
> >
> > regmap_update_bits?
> >
> Im a bit hesitant to use regmap_update_bits() here as some of the bits
> are not documented.

Hmm, maybe I should then update the patch avoiding undocumented register
access beforehand? I will download your docs and see what remains and
send that out for you to check. Somewhen later today.

Sounds good?

Happy hacking,

   Wolfram


--POeIfeKI2d2tOV4O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFWzNsACgkQFA3kzBSg
KbYpCw/+IFCm4M9GxL7MN1VHz4q6kfkDKhe8TfEXrR2uOdjopf1//OvCjtch/I2F
VmI7EvVLoXUb8fadtW5pYbJtaASC4PBTyhyOJR05YfH6DT3czamx0S95CFoi2b6c
ZAeZ4V6uCyN97jBuAia2rFxuu+yIoavlrp/+VFGmP7O2dyw2MOTinezfIJMZnvhm
RGEW79XjZ9zEvecBuyBNRnnkK+XwUsRFgod5dnxmoXb6VMsGlAEtiX607VqvfLI9
xrtIdtx6HLf/LqLLjzSBfmtF8V3rnaXJ2o3xNQLmVxMPtLs5JsQ0U1Ra7kYc9kaJ
wN60H5LJ1jV5fn79oMp4HsxAAYuAhWjcTtnXwet3LnnMhB2dwcycjF+sqOt4oODH
diVh9X3CV8OO821jouKtIOKw4aC998J4qgVsklyrP6fXQf+BUBVF0S6l3am9Zazw
QBkSGc6wdzJjB3hLg66KZP8OuP/vim9KM2diuYvXptIGDzeD3AXTsvgKvtlfaW1v
Xby3E0kQoNkg0WLfYfH5N5pt60Qtj32Y6ewXRntWqZ8HeSaDyLM00n6GMfyRV50I
4fdvwejos4Ub3j37pNeK8f14Ltd4jEQO/dsVX6IAOiMcxaZMLe4a1DN/45l+s3sk
bz7FDrS7YldjhJMYv8TcI3MQJ0B+TW8pagl3j27ma19x/xtDKvo=
=KZfF
-----END PGP SIGNATURE-----

--POeIfeKI2d2tOV4O--


--===============6891118961334952945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6891118961334952945==--

