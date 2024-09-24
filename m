Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3288ECF9C6B
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 14:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0zJBUnxxTIKn3epVwU1pnul3dbHtLJ564Yu3Hi2Ktg=; b=gRVDk1RRyqkjUEiv0w4DsD4AP0
	JAu0Klp+COupkClaW42YNRAlXxkjs+SV65d/lMQGSlqK0GLvqWmizjXROPcW8DDZZ3NR28QFeuorN
	8ydIKfmnepZHKPG/tHbsba8ecwOCriQMEAtyt1VBZmb95oTBaeIp4XPLfG0fRhnAN9qbTu+qTxduG
	BQ6u3Mmm42IaeNKT3LBihKrLBBvF66VzFVsD0pxEHjtGA3KFHXfJMDEIFP7tgVJIA+ST9dNalGzKF
	VHI6fbTxP68Uwvfq1Zet94pAkqvDDwkWi/uOWHwb35tyxwber2+tOf/K2lX9nrLqgw149xvRDuJZr
	6cka/UoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st6u6-00000002aoa-2yUm;
	Tue, 24 Sep 2024 14:52:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st6u3-00000002aoE-2Ynx
	for linux-mtd@lists.infradead.org;
	Tue, 24 Sep 2024 14:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F1615C473A;
	Tue, 24 Sep 2024 14:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CB8C4CEC4;
	Tue, 24 Sep 2024 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727189554;
	bh=keRaJN5JmeP4cnnXSTQ7GucBOsaTPwdcyRxc4LBX160=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCCiGp55YCoqto6GQhdXR/7ya2p+SYO5Z2YwXnD22jI2LPyil/seZusg5f0GSqLOW
	 8bl8gTNnE16Zkxgz/ZzIpJXlhFnbgooDOYUjyKgQJgyQJhLInIIT1AOWHJPqzdKSTU
	 KnNyV5ViGbkQ4SDrGb+hT2GlOBZ9AA8PEIFC5Jq3FnhVxozXJwh57H0NViZowMKDxW
	 KQcxnwH8i/aHt194FHhmmpbigpqSCnoRzdVuFzrfT7ZPSlSFX0T3+eAVSeZHZqVv6O
	 zr2T1fFQwgImTo7nPGnsUKGSfFi/Q9vXot2OirPhQWLv3oePZVBKcwH612/qTH/yfl
	 fZFY+UoNSLWwg==
Date: Tue, 24 Sep 2024 16:52:30 +0200
From: Mark Brown <broonie@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: AlvinZhou <alvinzhou.tw@gmail.com>, linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw, AlvinZhou <alvinzhou@mxic.com.tw>,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v9 5/6] spi: mxic: Add support for swapping byte
Message-ID: <ZvLSLt95Hrd7JYj3@finisterre.sirena.org.uk>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
 <20240718034614.484018-6-alvinzhou.tw@gmail.com>
 <ZvKktPc0luV9hItN@finisterre.sirena.org.uk>
 <a87a159e-eff1-45c3-bf26-115d4ca5a9be@linaro.org>
MIME-Version: 1.0
In-Reply-To: <a87a159e-eff1-45c3-bf26-115d4ca5a9be@linaro.org>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_075235_715345_8279C3E4 
X-CRM114-Status: GOOD (  11.82  )
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
Content-Type: multipart/mixed; boundary="===============3346212173478278997=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3346212173478278997==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RdxPtqe1G7U3rehe"
Content-Disposition: inline


--RdxPtqe1G7U3rehe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2024 at 03:29:37PM +0100, Tudor Ambarus wrote:
> On 9/24/24 12:38 PM, Mark Brown wrote:

> > Acked-by: Mark Brown <broonie@kernel.org>

> I'm fine with the SPI bits as well. Shall I take the SPI/SPIMEM patches
> through mtd and provide you an immutable tag? I can do that after -rc1
> is out.

> Or you can take them directly through spi/, but I'll need an immutable tag.

If you apply and send me a pull request with the tag that should be
good.

--RdxPtqe1G7U3rehe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmby0ioACgkQJNaLcl1U
h9AqJQf/WnsU8mtfyhIc1dUx0L/KK1z+R/rUY8OIQJxsLZg7e/OKyep//NQjPV0C
6L6xsnHFR5+IvJMbsTyJAQuOxL/G+M4xkUOOYpYgjlMkNPOgrk18ePdUFcWa60q5
dzMkkvH5y2DsBkC/vvedANvFzLjCPgkSUa4TEEe3Qt4yrgKPNeR4ctyVregZr8eK
B/nO7Xhcs/epbXlNc5h8xLwzbVAjPROAIz0hyX0y12z0qYgWbP30ykLsR+D2cycG
R6iv19NkP8wpHBwx/1P4nFfFFFkujgJuHWDVC1anREgfjsnhy2VBK1SsSb1bNidX
pJvlkoC6XYed7tqABVCGiqBn3NJHYQ==
=mo0n
-----END PGP SIGNATURE-----

--RdxPtqe1G7U3rehe--


--===============3346212173478278997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3346212173478278997==--

