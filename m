Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD85C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 19:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHAo3Hx2vFbHDSBnfGV8qfPNp/DCrja5+BUbGCuRevs=; b=hYRvNKCBDoIIPsTaWkJ3ZtIAdm
	CozDepfJVIQ15/RXpxsQJd23RJ4sDxPSbSuPQw3XDQ8nY5kUwpWwIMnVInz7/Tw6BEDgvTiqNZ/Qc
	bPKothz1YhxrfY2wX4e7CLvzU7Fp+d9QU08BH9W6Nutq2dJjhp5XUfQ500w2onbYcromxGakZ2KbP
	t+/zhTbvmupfTcQKcbCPc0SoAd0VMcXeekURc6HMP4Pa424yWTuT22Is8yRptOzMc49CWMR9dfI9w
	xWEfg5a21VLjC1E5M27mtV91AhgHkX0CEsKw5iV5Ej7tr/1QBNb3aX7ulbJEP9WXC6BLIJmqpXDvp
	HE8ZNY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDAt9-00GzTh-A9; Thu, 27 Jan 2022 19:56:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDAt7-00GzTB-3z
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 19:56:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A412D6027A;
 Thu, 27 Jan 2022 19:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95000C340EA;
 Thu, 27 Jan 2022 19:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643313416;
 bh=fQvPrDPY3P7I2OY/crq01C16Uf3nbOd3geYbps0hn84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cLm16VNvPFiWZIIoLf1FQDiiHOveToQmehB+BhVemDz1yS1kQ7IPSmszcNptPiH5z
 NpjliAWaonia93XXetSQRsqz4mLOcUCjvWQM6OHDNeQ4yt1JYymALLHb9Z2ojNAcVd
 US+TqURO+o6akXygcjN+RxVaMS5rcfuKNge/E/ovmRVB4VEyxMe92Vq54YAxJ/wwIO
 dmX1dEXg0vSUPsherI3zMxFtTryd9akkUPDO/Z7vQB8ERGW3YgkrUJwqSyJAoIff96
 h1WSuuKj7geSMMr/89CDihkTJNl6sstVUMKibEHTVBr4yqLC6UU5e+MUPnCqz0ChBs
 lI63QNC61eXsA==
Date: Thu, 27 Jan 2022 19:56:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-spi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v10 00/13] External ECC engines & Macronix support
Message-ID: <YfL5ApsG7c619+R0@sirena.org.uk>
References: <20220127091808.1043392-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20220127091808.1043392-1-miquel.raynal@bootlin.com>
X-Cookie: Stay on the trail.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_115657_230183_5B475AAE 
X-CRM114-Status: GOOD (  14.85  )
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
Content-Type: multipart/mixed; boundary="===============1605877214779303371=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1605877214779303371==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nk9jfp1SD/P4u818"
Content-Disposition: inline


--Nk9jfp1SD/P4u818
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2022 at 10:17:55AM +0100, Miquel Raynal wrote:
> Hello all,
>=20
> I've applied the beginning of the series (bindings + ECC part) in a
> branch named spi-mem-ecc on the MTD korg repository. I already applied
> this second halve on top of the spi-mem-ecc branch but there was a
> misunderstanding and they ended up not being fully reviewed. Hence here
> there are once again, there are no changes since v9 beside the rebase.

This looks good, please send a pull request.

In general for future reference if there's patches for one of my
subsystems that I've not explicitly commented on I'm probably expecting
to apply them.

--Nk9jfp1SD/P4u818
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHy+QEACgkQJNaLcl1U
h9DEHQf/cWLgMk58qMhl3lNstMR2aWtfBWg68fuAosZWOfkMdKjQjcHst/p0dmB8
8WrJ0Iuou6xjLyLLAn6n5TyMxUddrlezcjSX6FE7nXqEHruqDfFQ+XYL33uGBO6B
gtfozdsxwUX1oHIo8EFCQOMkH8755bHuQNA8xDUDzkwSX2icjHM1cwfZqZTZVFuT
27TnqvoEIYPJBoBuFYOeltr/S4r1adZaHjpyn/573khI5gx9R4f/QxrlxLVNShvs
ZNWiSNn5r9Q8xNyEoQyyUa5AosUEQupoI/dYIjWB8N6a26H34fw0pJol8ZLs7m73
muR6cqfrBirPiVtGZsZkWdJmwPUUWw==
=J4gM
-----END PGP SIGNATURE-----

--Nk9jfp1SD/P4u818--


--===============1605877214779303371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1605877214779303371==--

