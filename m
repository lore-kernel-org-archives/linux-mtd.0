Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC20CCFA13
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2026 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/Klm9dAe9gaaDdn4W0lDouko/FWKdqBMLTs7UbWMT8=; b=ghwO1guTKF5lfl8rnx3VIgzjiB
	27+V4KoGcZa80KQ7CT7Bds+e/p1VWbcG2wPa9p6vMhW2GyPHDLs26DiTSuhgN4c+oDKfN38+qsu2J
	9W3TjPBEOdrR5miYm+B7sc3lGsZHIjiuwe1iEMMyULtUjYa01+inTBrWgGmckLyU/fdPfDZ8DyTOD
	bU9Gi2JnHfPMG9e8DvObiiZONI+2N1XYPyg7x+i1fxdZlrWQf6MnM6iWfJWSgjMzm/TmaJXhuBeNw
	eaoGos7rcU99kGt9H8TxGdpqooFqKFHiQfElu0b+xTh+SH4JnZvB0zCaHlb9AWKtsO67+AmOrZM1E
	F1WiWHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5gf-00000003jtB-0TXz;
	Wed, 29 Apr 2026 14:14:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5gZ-00000003jqz-3rhS
	for linux-mtd@lists.infradead.org;
	Wed, 29 Apr 2026 14:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD48943E44;
	Wed, 29 Apr 2026 14:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E20C2BCC4;
	Wed, 29 Apr 2026 14:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777472082;
	bh=mG2lL5KFXP/f8D+DMkXa6LKJ2r3WSigjDZ34JEhzNno=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=cBDYVwlG2QBJsxw3Fu55k91vmuaP/SfhP4mK2pt3qVWjP7uiTrX90X9E4ysENSLfH
	 KD3fuUNKz6gM9VrCM/HdLmIfgCjKqy3Ie/XIoNx7/q0pgmG2rzcqdKcjCOK7+lv2/x
	 +Shdg6RHJom8ukTbGzaK8Y5LfPfQGY8Vf0TSneBDlWU77SrIKvKJogSPO/ht34B3kg
	 NxGljZh+1lfyTZe1QOMBYRrDAUJUZWdHKFBu3wFAHtNrU1gNNnrsSQZFi69iZj1EJd
	 pZxDKX56sAMibLa0NpeOg9vv+S1JsssQSe1RIFiKvAejBW8fTlgLJSe2V56296/QW2
	 4+kaB6uuUf2+w==
Mime-Version: 1.0
Date: Wed, 29 Apr 2026 16:14:38 +0200
Message-Id: <DI5P9K6GBY4Q.KEZVG17SA8EV@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: cypress: Add support for CY15V104QSN
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <kernel@pengutronix.de>
From: "Michael Walle" <mwalle@kernel.org>
To: "Fabian Pflug" <f.pflug@pengutronix.de>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260429-v6-18-topic-infineon_fram-v1-1-504d241942a4@pengutronix.de>
In-Reply-To: <20260429-v6-18-topic-infineon_fram-v1-1-504d241942a4@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_071443_975792_16DE646E 
X-CRM114-Status: GOOD (  11.26  )
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
Content-Type: multipart/mixed; boundary="===============5616564645022836231=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5616564645022836231==
Content-Type: multipart/signed;
 boundary=97daefd9bf502ba505fcec55561df000596f4d060eb59e541cf82a0242e8;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--97daefd9bf502ba505fcec55561df000596f4d060eb59e541cf82a0242e8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Fabian,

On Wed Apr 29, 2026 at 3:58 PM CEST, Fabian Pflug wrote:
> Infineon CY15V104QSN is an FRAM Chip with Quad-SPI interface, a size of
> 4Mb and a nominal Voltage of 1.8V
> It should be the same as CY15B104QSN, just with a different Voltage
> range. (3.0V)

Please have a look at the at25 driver. This isn't a flash as it
doesn't have (not even an emulated) erase command and there are no
erase blocks. (And I really like to get rid of the NO_ERASE flag.)

Btw, you seem to have an old linux kernel with an outdated
MAINTAINERS.

-michael

--97daefd9bf502ba505fcec55561df000596f4d060eb59e541cf82a0242e8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCafISThIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jeqwF9GEUxJywqJNXipZcc6dnvnjaX9R9MGMpH
QYxEVMmLlonj5zY19R9A3cHJ7PpZtIGSAX9FY8h088TuIIcDJV0nyuDI5TJSWuZd
NnP1Gh1Cdi8cr2P+H9CzXe1T/HKAnTrBCiI=
=RSx4
-----END PGP SIGNATURE-----

--97daefd9bf502ba505fcec55561df000596f4d060eb59e541cf82a0242e8--


--===============5616564645022836231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5616564645022836231==--

