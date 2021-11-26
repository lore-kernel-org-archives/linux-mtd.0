Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D325EC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJ1BozZvICGjnvFOIH0Klk9P3bJP0ffweEa6D9rnAkA=; b=bBUZukp+xX1XBzZbD4Vv2/s32V
	7ZBQPA8anixZ6L0ozkCa4ZmnvYqvRfIeANHXW/jetOX5qcXW7dhp06CC7mMteGhAdnxcNZP/60ulG
	7TLho/2mn3bZA+tpLqXRxF7nkz3hD1KwLzJCBZWFomg9CGYbBhGDrEuSEzjOH2uQP1SFdV3iyERoK
	ilimfVLvm3LssliLBV9J6CQH4Acz6PpUIG1WWZv+1yJNnrjKC7YifL0l90N0Nx39ZZ7nps/EOevcW
	b8YIySfKc9sBeAER0JAtf2rEW+cipbnCe8DJIPiASPespEELxhSgEJwI6fQH4vlZv2RedmoYEfdXL
	EqSpPkFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqbz6-00Aix9-Vc; Fri, 26 Nov 2021 14:13:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqbyw-00Aisb-EC
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 14:13:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8FEDB62126;
 Fri, 26 Nov 2021 14:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1C5C93056;
 Fri, 26 Nov 2021 14:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637936021;
 bh=DkN9LUQB10lRmYffxcuhdD1rPsxQocXanrCARKMrHqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Br5cILNPWxkaryyIlI7WJ1n38qvJ80mvPUt1pi3ladxEz4bQHJLEOZyGNVTV4HeO2
 lcV/lDTRVN+NM7IXDK46l25lIANFV+lbfRy+NRp1nSBNNam2HcF0Mj0eJuv/a5wJiO
 HtdmrcAZgcoIl5KqQgyDRw+sMkWId9mIrq4jB+XUJwh8XhSkLkAdY1n8m89NJkCkrk
 ItariRi6sscbV25GguYXeTihDyerSfunaqIGkz7HFAGq0JvF9a6mW/oRdCunouJFcP
 +7bDQcrcWt9RUYh3UZCJ5YWWh0zM+qf6xzMTGdIFvVkYyuRKVEy1Dy8/j5Xnvoo4t1
 +Rc95lN34PJHQ==
Date: Fri, 26 Nov 2021 14:13:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 00/20] External ECC engines & Macronix support
Message-ID: <YaDrjkjfK/y/n+BO@sirena.org.uk>
References: <20211126113924.310459-1-miquel.raynal@bootlin.com>
 <YaDjDhOhpHMdxiqA@sirena.org.uk> <20211126151059.10c19ec7@xps13>
MIME-Version: 1.0
In-Reply-To: <20211126151059.10c19ec7@xps13>
X-Cookie: You fill a much-needed gap.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_061342_588511_811D7A65 
X-CRM114-Status: GOOD (  12.68  )
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
Content-Type: multipart/mixed; boundary="===============6500395214714118885=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6500395214714118885==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g+gorfJwnR4/9QA4"
Content-Disposition: inline


--g+gorfJwnR4/9QA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 26, 2021 at 03:10:59PM +0100, Miquel Raynal wrote:

> If you acknowledge the SPI bits I believe I can carry the entire series
> through the MTD tree. If you fear conflicts and need an immutable tag I
> can also do that.

It'd be good to have the tag just in case, there's generally a lot of
work in this area.

Reviewed-by: Mark Brown <broonie@kernel.org>

--g+gorfJwnR4/9QA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGg644ACgkQJNaLcl1U
h9BIrQf/avs8oHB8MeypsEpJO2gSyoTvspKH1wvFzuT2pKwVXXS3u0m2kHHxssDs
+oICXDdOyIyfNmJZvL9hl7TcIkoJFqVL/xMNrfV/5wcaJULDq8GAx1lS/wxeWgHs
00ECYEa043dyYg5KX0TQzuXgc2CT/q/p/RiCH3Eal7EGgcnC0/T5UEJorNHcyYIT
ld9UAUoT6mZs8+wtYFUAGrbgAGeudaJ5ovpF8o2E625AaujjATvz5SvYQNuk1YP9
VtdiJfVEye+rSJpGecR2891W3rkHLR1Opvlrx6shd5P0pbZ5xnZXDsn6GCSUi3NU
V5Cdhwg+4Wzo1s7hdPIo5XY4OGNopA==
=oNr3
-----END PGP SIGNATURE-----

--g+gorfJwnR4/9QA4--


--===============6500395214714118885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6500395214714118885==--

