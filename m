Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3DCFF886F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2026 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RrUYeQKybWE0wA4jxHQ7UF83RhTVAe7aXw51lMym/4=; b=jzt4yUY54VtoXGfyxm79cN0wgH
	QOTM/KYvi5vKtKwzpF5QqQw1BHHlcHV702mUVrSX7L25Yx31+h/4NfFN+4gIhiTbLOvwwClwyB1dd
	QyGjQ1Zz66J7awC/JPNFea4yDAP1dDh6/tghc4xnX8uDP70Ok6RQ7cm2vmp+pujsYjkh1pcIYfAvc
	oa1PEiSkv3CwaJl94+gGakOjp5U0wjqJDiRBAJSAXNt82ZQLQts6HgptJv1WnOBbZOO3P1/iCTKhd
	35N5Q1EByGZu/LS6XltYyX0sg7K7FnrfTI4cDFZDRNsZIp+VINL2+3ealGLT4bTvpClhtarDUe3X3
	qG80WxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJs3z-0000000D7CE-0dhP;
	Mon, 04 May 2026 12:06:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJs3w-0000000D7BI-220N
	for linux-mtd@lists.infradead.org;
	Mon, 04 May 2026 12:06:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1wJs3m-0006Wf-5Y; Mon, 04 May 2026 14:06:02 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1wJs3k-000PCX-2E;
	Mon, 04 May 2026 14:06:01 +0200
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id CBE0D52D747;
	Mon, 04 May 2026 08:53:06 +0000 (UTC)
Date: Mon, 4 May 2026 10:53:06 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Michael Walle <mwalle@kernel.org>
Cc: Fabian Pflug <f.pflug@pengutronix.de>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de
Subject: Re: [PATCH] mtd: spi-nor: cypress: Add support for CY15V104QSN
Message-ID: <20260504-funky-whispering-toucanet-327f25-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260429-v6-18-topic-infineon_fram-v1-1-504d241942a4@pengutronix.de>
 <DI5P9K6GBY4Q.KEZVG17SA8EV@kernel.org>
MIME-Version: 1.0
In-Reply-To: <DI5P9K6GBY4Q.KEZVG17SA8EV@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_050612_523821_3E7AAB10 
X-CRM114-Status: GOOD (  18.47  )
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
Content-Type: multipart/mixed; boundary="===============3495526595230532318=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3495526595230532318==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bzrlohxhdxhvhppa"
Content-Disposition: inline


--bzrlohxhdxhvhppa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mtd: spi-nor: cypress: Add support for CY15V104QSN
MIME-Version: 1.0

On 29.04.2026 16:14:38, Michael Walle wrote:
> Hi Fabian,
>
> On Wed Apr 29, 2026 at 3:58 PM CEST, Fabian Pflug wrote:
> > Infineon CY15V104QSN is an FRAM Chip with Quad-SPI interface, a size of
> > 4Mb and a nominal Voltage of 1.8V
> > It should be the same as CY15B104QSN, just with a different Voltage
> > range. (3.0V)
>
> Please have a look at the at25 driver. This isn't a flash as it
> doesn't have (not even an emulated) erase command and there are no
> erase blocks. (And I really like to get rid of the NO_ERASE flag.)

Thanks for the tip. It Works.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--bzrlohxhdxhvhppa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCafhecAAKCRDMOmT6rpmt
0q+HAQDDiAlXwuqrETg1u+kG0WYDjwOI0tH3fBmSD7CSEQuV1QEAj/OeWvRYm9Cb
/hr0ZeZru6TU7wPWaqGPH4GnOw61PA8=
=KZOV
-----END PGP SIGNATURE-----

--bzrlohxhdxhvhppa--


--===============3495526595230532318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3495526595230532318==--

