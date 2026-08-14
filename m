Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EC6C5CFC1
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJHYEGUF/luzlb5RnXqAGR4BcEv9LPSP+N0h82DdBVc=; b=hT5KqMuXTU1zk55Gy9zU1Ur7Z+
	YrcYEXXlOianYTBEEpSPU75210gv1Nmquj9qV9eGlAxFOY17c0tnDIxJxYuuL5N6wItTt09vUgmWL
	ICkxF0u2fgohiuC0eJpVO3YSYc1nkm9s2lzelHHWqG41go7fbpO5JAbb/4+KwSJjdr1mgCghD/VoZ
	MWKLse/NmVitZ4fro6R36WTQTyhpbX9QJwpGptZjsjKHj3Yh3pwOqej9aWV6lfsBkpaM1L48yYUe8
	y6hCF+QgtyEyWRwXuaG4nrStHd5J5Sn+SAcDJJbOXhKHaMWRyMVeUF5eYovmEkeITJdrPYYtI08sS
	sOoMP0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuobB-00000002Syq-1gkP;
	Fri, 14 Aug 2026 09:53:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuob9-00000002Sy0-3Fpr;
	Fri, 14 Aug 2026 09:53:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 3CB81600C3;
	Fri, 14 Aug 2026 09:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6183C1F000E9;
	Fri, 14 Aug 2026 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701190;
	bh=bAXGcyr62NKtmgcYXABYv7zy7fLE4WFMwMzbW7IRjrs=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=AN1gpVVakaagM/Z3Jzlba6UgmkWSCBDYKD4gAov8q2QiEMV8xFOMwyvluWCaPZw99
	 CWa0QGXAqNAK6HfGDiHVb6TlhtvdyMrUnBywzfclJ6+RP0+VEURKQyKYwjbIIVrzSV
	 AnGaRM0Dr6/ouEVOnq5EqaZv/+pVDVdRH1KbhaioIm2KLb1qNRZllZtgSKNsHUoVDS
	 Y5WG6Wi9gZfjOPHoPleR/82hkyGObaOsjs7uGZJpJN/K3HMWs/Os6DGEGUgX7wUxa1
	 fjjOhG672ZH5YtilASJu+Nx9DRd+D6Fqv/RI5j/x6n+76moZrDitNAS42H5qJm5b3l
	 JyMK9jWUSRTBQ==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 11:53:07 +0200
Message-Id: <DKOKPM4GS867.1EU3SKAU14NLG@kernel.org>
Subject: Re: [PATCH v3 22/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-Q/N/M
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-22-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-22-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============1784310636310495872=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1784310636310495872==
Content-Type: multipart/signed;
 boundary=98cf7b1d1e452ec1706c2a26c20583123b5d65d3478fd36a5214653605af;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--98cf7b1d1e452ec1706c2a26c20583123b5d65d3478fd36a5214653605af
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> I currently do not have access to any chips from the W25Q25RV
> density. Yet, I successfully tested the entire JV family and all other
> chips from the RV family. They all behaved strictly identically, so I
> propose to nevertheless add the missing comments for the sake of clarity
> and completeness.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--98cf7b1d1e452ec1706c2a26c20583123b5d65d3478fd36a5214653605af
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lgxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j4JQF/YHpRbiRbgPvXL2wC3ddX1BhUDUPTmRge
K9EROeaUmG7Xrxd44kHGLMA7Ow9UPZz6AX9f1X7fLl40ZAyVk7oGsiZdO4cQaX9R
acapbzyzCQFACvUxdZpTPKjKvqlRozpQGrQ=
=A5R1
-----END PGP SIGNATURE-----

--98cf7b1d1e452ec1706c2a26c20583123b5d65d3478fd36a5214653605af--


--===============1784310636310495872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1784310636310495872==--

