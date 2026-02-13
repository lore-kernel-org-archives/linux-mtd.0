Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845FBEF48DC
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 07:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnSjWMdQXHZ07Ta59W0oloGuTRzAKUD3NqlC3toP5Ms=; b=Dq6hHUkBxCZhh1DdIovItkK1pI
	7WvqlaqKr+fv9KQPRe9uMi7BdFNRCdiyjoYZZdkYWxhwyEh0pVwtbpaG6Dlw72RGWqLc9KR/1RbCF
	ET//hN98WTI5svJIKHxuFJ50i05AXWiQNsJIBLcE8mW305gCZWt2oLfmNBhSOaRHF7r9Qa1wC04c1
	yg/Dmr9ivfhHTKQ3OtQt8ih87cu8tJsluRZP+XklaviJMUoCEZoZCty1S9oongQGC5AO+uYvhZ19w
	jivMtTflePi0jZBsAsNH1YuAd8r1eMuXrZ1umgqQlvXzhZgqlXp78sX7276gIIADTuRnjynv6yX0Y
	0lmQSICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqna5-000000036II-3hwZ;
	Fri, 13 Feb 2026 07:27:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqna1-000000036Gp-22CJ
	for linux-mtd@lists.infradead.org;
	Fri, 13 Feb 2026 07:27:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-483703e4b08so4219455e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 12 Feb 2026 23:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770967627; x=1771572427; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8T5o+WgGfW/lBoBXgg51mLpZKPQ9oP0YY1GV2iyeVDY=;
        b=KjfMZgh/fyMjNirGLUCpzhNIzQXNWtMUGsUM3ywZON6P6CJ/8H+PFFpXaVdXHNjdcs
         t06O+IvWA81tkNsyxSO54PaOAaSvOou9GvRx3Ehz59Gex3U+sNpFiYdw5see6lCnfZbl
         tFhKUmtpJt8wJhP0CLqlPiyDyNusNASHqeclgf7Ly3J+KDO7TOCthPhO5whm+LktX1eJ
         DIQEJvbHvJILrKGOVxz6Bwa9Vt2p9JS9js/Nip+Oz0EneX5cKDSxkK17EE8xOfru+v80
         5TdZi2yYvQAF+9Of7LT3vOGDDuEhWmHBL3pI1vmFTf8tESYxGC6/Kbw0BNES6pAEvIao
         UmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770967627; x=1771572427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T5o+WgGfW/lBoBXgg51mLpZKPQ9oP0YY1GV2iyeVDY=;
        b=PuylMuY5a1BXGSEsXu5/t46BVKwYEGyHkpPkT/p5t9V9tkQVp+XwHc+8DfuR4FyMUP
         tX8Wp2BfmrNzdkLsQrnE28H/ZYQOGxbu3Ep9R6vblZ+2EvXs/UOQSE+VQWBXXuJIUMib
         ReZkZEXnJhyxlulY+l/XgMn/3z/RzHbNnHaWTEloF0eXe336rkWumXPxt9BqPHM28+gf
         rROi8C5Jn3Z4Ok3MGRK++g5Br5A0WuZJihX8zo5T91KYTIxjdp7bPqrINrs19yVqdDKL
         QLBkH4+z8rhb0XCcz0F6rhBrre5vOYDhSscTEaVm+bO4qzI6ij16WObL+C9UrPA0IEhU
         pguQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuWyC5wahZoB2P5GeZ+YbW906XMWJglgYhAb9Px/yrkElXlv2TwiHeyz7D4juuz9KAJdbThoXViBI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoYXR0KSpdwsIM1aEUdvxWfRaQuRi3tXJx24QNgHg5Vzy7BoeX
	nvOvTv30Ff5Rzpn0CdjFSMCxcb1Mz5gUgPcPWS6id5axGxwzquhv9V0EmLiQ5wl/Cc8=
X-Gm-Gg: AZuq6aJrF6k6uxxDKEBLMiUzIaFV4h/4sJZvGLH7/fRPShLlr1FOyL8u7MWCP+pFF/O
	tTsx+S6qFwxouP64Y1CDaBk66OKnfQvxc0qNFNnwurrzdRGnKu7lXxghU/wvrCIj0uuOi13NmKL
	jGEBD9bXwRxaKIi9Sgw74YDPM6/DrLq9vCyZnkcse7HL5SPc/6MRs7ko/RqgedDTlDIrveQD2lP
	W+GQ8jIURKLx+LOjM1hJxsnGZNx/0t2cMDfwWDiQ0ipGXLDvjCgjTFZMDQ8LGUZtarXIJHCcVmc
	jHdQiJ/vfnIErTDTOlg6eB8LEyYWamlJFGHPe67uA8L8Z8IKDhH4DULRydGFk8d75TfUt8ytFH6
	BxnwkQFJTD74lXHIMbO9MtASpH4l6z1rmKnyJ9FZlm6cp7OD1rP6dvoXCJHRCAeRAcckvXTcUbL
	wPKQ2EGQMfT3ZU36KirYuDx093TfcKT6uOJuHitPQAspAJfkzQTjwqmc0PhilisEz/adAn1Z+C2
	0OLRyxKhdbk428=
X-Received: by 2002:a05:600c:34c1:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-48372fd3c43mr11757265e9.13.1770967626654;
        Thu, 12 Feb 2026 23:27:06 -0800 (PST)
Received: from localhost (p200300f65f20eb04101188b09ed9186a.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:1011:88b0:9ed9:186a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48371a10cacsm17260195e9.4.2026.02.12.23.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 23:27:06 -0800 (PST)
Date: Fri, 13 Feb 2026 08:27:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] RM: dts: imx: set #size-cells to 0 to align with
 nand-controller.yaml
Message-ID: <aY7SFS3LUC6rFwSB@monoceros>
References: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
 <20260211-imx25_nand_dtb_warnings-v1-2-2f06aaa1e3b9@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260211-imx25_nand_dtb_warnings-v1-2-2f06aaa1e3b9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_232709_677499_E3720FED 
X-CRM114-Status: GOOD (  10.28  )
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
Content-Type: multipart/mixed; boundary="===============6620297311108995690=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6620297311108995690==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="suzgqi3scqpas5au"
Content-Disposition: inline


--suzgqi3scqpas5au
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] RM: dts: imx: set #size-cells to 0 to align with
 nand-controller.yaml
MIME-Version: 1.0

On Wed, Feb 11, 2026 at 04:19:40PM -0500, Frank Li wrote:
> Set #size-cells to 0 to align with nand-controller.yaml. Remove the
> redundant empty clock-names property from the NFC node.
>=20
> Fix below CHECK_DTBS warning:
> arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: nand-controller@bb000000 (=
fsl,imx25-nand): #size-cells: 0 was expected
>         from schema $id: http://devicetree.org/schemas/mtd/nand-controlle=
r.yam
                                                                           =
     ^
Missing 'l' I guess -------------------------------------------------------=
-----'

Best regards
Uwe

--suzgqi3scqpas5au
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmO0kYACgkQj4D7WH0S
/k5AVgf/QsQPSAIdM1RxlXudv1+osYGz6GEEo592KE57oRkdUvtyYxJXlqICexVq
CcrktfuQdhxHkTa+TGp6zt0D5ud0nzXjBYtGZVIhE6iKYiav5EiFArQ3wPcvnDQP
3x1upQR/8SgvfyApCIlLo47oipzbM/RDXrq7oKBgQQlvfjTdDJWeEn/+DAMULR//
7/32JHfGYcuRTzcn5CRi8QotO47K9uUcx3Hp96n78OcP2CgahlMpdlQTU3k4YDMZ
Yn1AJ+Ip34Pnhwi6RKW3AtyTLTsSmsgtogie1n20MHuTG7FGGLFze6oP6AWaxmDl
Ed8LGzeR90IPomEYk2RYoB/o4eurFg==
=y1p4
-----END PGP SIGNATURE-----

--suzgqi3scqpas5au--


--===============6620297311108995690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6620297311108995690==--

