Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12508C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 09:15:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4BFA613B5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 09:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4BFA613B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RElNGrasAjmVBJ8mZiMZ35r806alsofiDtojF4H8E3s=; b=L4VRfznNGVIwG33jvO5blfwphA
	sBgXQyUgE3v1BycJf2hn5ZbircVJSVz2husmXwpZ807ZUTzxpY5UKINvFqRwTzsaXWDg9aZQlG9MD
	KA0U1mHNIwa0SNCDS1cf2mJIfBhoX4M87t1afgkr9Eq5EOKvvkKbGvdZi7JRRWK4HVuPWiomlu6do
	f9ZK5ce97uRWmYjAJ5L22ZyPOoikRtKBvErJs0X7eHOfoy0qFPoPLWd6IwKBBunap1x5PPdeIPWgX
	co+XH4XHigUuvFJ0r/Iue5Zl9LF6jDjuaoKv1cuxQ+xwqtZOQOj6BJn73BcfQMYk+x8HM6fJPRb/R
	0kBX4GKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXgXM-009idX-78; Tue, 05 Oct 2021 09:15:00 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXgXH-009iaL-TG
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 09:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=Ko//vJyuyzkPLobdWRfp+yv7tyBc
 7iVoX1/SJmxO3TA=; b=VtlR4bgMqXIBd5DWuugHtGk9yyyDygAneVjffLA5ldjl
 pAWSNhrqUERs8oyt4OKXq1q/a9QpTPiC7Rt2L+RJz5NqL/LSj5dPB5jCzcm3z6I6
 xfvrh+wqR/siH9eEiLFS2V4S5GVnbUGickqtE8JS6mabXe0R/olbq6f5D5LA/4I=
Received: (qmail 3740740 invoked from network); 5 Oct 2021 11:14:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 5 Oct 2021 11:14:44 +0200
X-UD-Smtp-Session: l3s3148p1@JUPbdZfNBoogAwDPXw1kABtQsg8UzxVo
Date: Tue, 5 Oct 2021 11:14:44 +0200
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
Message-ID: <YVwXhFalcYr72CZT@kunai>
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
X-CRM114-CacheID: sfid-20211005_021456_271426_9EC14E60 
X-CRM114-Status: GOOD (  12.04  )
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
Content-Type: multipart/mixed; boundary="===============5671888044645468393=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5671888044645468393==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1E6oOfbK851bS2lO"
Content-Disposition: inline


--1E6oOfbK851bS2lO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

some updates after internal discussions I had.

> +#define RPCIF_CMNCR_MOIIO_HIZ(val) (RPCIF_CMNCR_MOIIO0(val) | \
> +				 RPCIF_CMNCR_MOIIO1(val) | \
> +				 RPCIF_CMNCR_MOIIO2(val) | RPCIF_CMNCR_MOIIO3(val))

Shimoda-san rightfully said that '_HIZ' should be removed from the macro
name because HIZ implies the value 3.


>  #define RPCIF_CMNCR_IO3FV(val)	(((val) & 0x3) << 14) /* undocumented */
>  #define RPCIF_CMNCR_IO2FV(val)	(((val) & 0x3) << 12) /* undocumented */

As discussed before, mention here that they are documented for G2L.
Sadly, we can't use them with Gen3...

> -#define RPCIF_CMNCR_IOFV_HIZ	(RPCIF_CMNCR_IO0FV(3) | RPCIF_CMNCR_IO2FV(3) | \
> -				 RPCIF_CMNCR_IO3FV(3))
> +#define RPCIF_CMNCR_IOFV_HIZ(val) (RPCIF_CMNCR_IO0FV(val) | RPCIF_CMNCR_IO2FV(val) | \
> +				 RPCIF_CMNCR_IO3FV(val))

... which means we should remove this macro entirely because it is
forbidden for Gen3. I think it is best to use the RPCIF_CMNCR_IO<n>FV
macros directly where we need them.

Do you agree?

Kind regards,

   Wolfram


--1E6oOfbK851bS2lO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFcF4QACgkQFA3kzBSg
KbbnLRAAl70bTAB+aCkvy4wf5a037bvW472u2V73Husi70cFbyNZccWvjYNENHbA
w15RefXBgSpefwx3hNndCw9hvXBW5TyLVHaKjGyN23G9y+d7clBKGUUzXI/8Wkko
cfYmv+T9Sx+EhH+ZX2fuYId22CcR4DY7q++BDytTmgeQ9iXqvgch1fNhol/XAoVo
8ADih0NYeq2qBD23OGejJxEQVzLSc3RX8p7oi4rNrr78nqVD+bPtKlqH7mX1s/5m
UtjXlgc3jqRWKfCq3anpE/ketF+F/D2reqsAE29dQP8Pnwhy64XmEvsJbwy+n0xl
GeQ7ZRS4maXgVPMcH157aPL77OgiUczqTNGYnpXGGQtUaxMNx7GOir+xtsHv9NaO
FTczDB4l0tx7E155wgKl3+bImYvnrFPTblJpQhBkzkzzu0fF2l4HNlLkUQ2Wusb0
MTlPa4efYMzK0Yo+BNeOf6962cjlA/Fmu+MZ1udD/Ko9NVvSfSgZH17LAX31cOGo
pI5eDH2LHZCkP7zhH7hIKYVAn8jKqJYX6aUk5/6yt1Rj/FLSRZzSiIb2UcRwC6Hs
gB2Ang+Rou0Dpu2rnhYxVG25tho+SeEx7I+RFXUZTQSrMCKpFIh67Oid5HY7RmaJ
v6EsYsI4+qDVRfamnyNTjS+Hwt5/fs+uRYyHMOAj2UXeSgZiOBk=
=3XAi
-----END PGP SIGNATURE-----

--1E6oOfbK851bS2lO--


--===============5671888044645468393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5671888044645468393==--

