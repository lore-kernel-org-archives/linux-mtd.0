Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B87DC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 19:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUiBEoSFquE4usFIk5ZCgP6Wmp/VA6A03jrYNWUgHXY=; b=J446SLOfy4LDZW1fU4+fCTktoN
	Mgk4+xMCXn1MYdIzYzk4cboUdmFwW+pIBWVbBVX6+8yTcmkdkcMoCRLk2kWZYPV4OWOfjL/dBfLqe
	1FHK9syvS5DIJirwUQTeXWrMrDcLDB0DCWXvDl23E35PYRbs03O0wewzG/UbVzjzamls/3lb2mwQk
	w8GLXKD9kONcnLL34KYBHx6piC7Ww3PKaVmMQiFY1zC47t/xKaqGeHiArOVp7X6uZggc0Wfko1Bze
	yxJvfP6wiNYnGXmRfW+4AMP3ryuLqUXxlcxspAicVYdQm14zo2WvZ7kZsLjO8eACvjRRJr8z8K6fg
	aOLfGCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCQx-008beY-2Z;
	Wed, 19 Jul 2023 19:01:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCQu-008bdV-37
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 19:01:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 688F6617D8;
	Wed, 19 Jul 2023 19:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC097C433C8;
	Wed, 19 Jul 2023 19:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689793315;
	bh=QCYE/Wf313d9BJewOaUale9wKUCaSWfR+2ebvrk+Vqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/6P30FVxHhcPraeIAO/Lc14DZpZiIFRHLyFmnuXTfj3lmyI/Ac60DY1kL0X+qiPO
	 F0Bs5fFDUrRl4LAXBsaiCdyvGAfiHweDfQsaV5c+BIOkEC4EiSptOCIpiiH6ypdmT/
	 e49NQKZTGOLoUEBB70cLzR+6hEvdBd/CLUZ12emKtprwvkyJ9Rzw6hwJcPL0Lt7ox2
	 Y/NR0O1ziMcek/dJu8Fi+YTMH59dhYs9vSPtC0ov4AuS0pi+4wim4gLO1oth82c8Dd
	 oxiWAH0cdedVdSgQ1k47/TZSuR+RmiBLNIl89q/l7eUoagJpvzdzTffPxrUCGzIVZg
	 RS9msUN9+MDfQ==
Date: Wed, 19 Jul 2023 20:01:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>, Peter Foley <pefoley2@pefoley.com>,
	Pedro Falcato <pedro.falcato@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Dhruva Gole <d-gole@ti.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: avoid holes in struct spi_mem_op
Message-ID: <4b43fc7b-f76e-4155-ba8d-f95656b19563@sirena.org.uk>
References: <20230719190045.4007391-1-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230719190045.4007391-1-arnd@kernel.org>
X-Cookie: They just buzzed and buzzed...buzzed.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_120157_046518_C4FE525A 
X-CRM114-Status: GOOD (  11.91  )
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
Content-Type: multipart/mixed; boundary="===============1303785220308359675=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1303785220308359675==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GRW3G7GoVTbacsvG"
Content-Disposition: inline


--GRW3G7GoVTbacsvG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 09:00:25PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> gcc gets confused when -ftrivial-auto-var-init=3Dpattern is used on sparse
> bit fields such as 'struct spi_mem_op', which caused the previous false
> positive warning about an uninitialized variable:

Acked-by: Mark Brown <broonie@kernel.org>

--GRW3G7GoVTbacsvG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS4MxwACgkQJNaLcl1U
h9BnBQf+OfiP9IntksoAyNnBV4tHqOWod5rm1KLN0Mh6WbbbJ0fl84t+Dh2EKKXR
LH5yFWEkuTlBiWWbCMdishynP3zoKIMXO5ax26ipa4v+BWxmLJAK03u642w2BBDM
gcSmcFlbV44joYETgNQTkbsTM+3nC+/8IR5xnSmetyfwZb/4Rkg8hd2GjKn+ZNn9
1mcif0/95BqLGtt77M1V5Kaa3/n5BDTFZpo1vzNjO5UQlWf6JngzKUL/Z0cYqkfx
FwdqYrc7xnyKRO1II76XJ5RnkL+HsVKNizhhdOYvYDYp7ofccXP3G+GcwXWO89HA
fcVitg7824QSVEmWpZGe7hbWYmrj6g==
=XS2m
-----END PGP SIGNATURE-----

--GRW3G7GoVTbacsvG--


--===============1303785220308359675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1303785220308359675==--

