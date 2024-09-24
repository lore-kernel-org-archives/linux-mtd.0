Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9279DCF9C6F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCi3f0dK7LHjY6GMfbcTqC6BK638i1ZsJonXK590YEI=; b=fA++v8zPXl5d+ZtM93kC3jB30k
	euC717HNNmZe/VVf3JnWDvk5tJhiuT4LvjWfz1mhRNLhfOlTKXjxzbFLWI99FDqyIlHQ5C8Rp6miU
	u0xiadrOW1DUHURwjKjdoTv6oSDoE2ooArJdmj9y67QJgQZHAOv1sHXp+iTdrwjECcibifdJwIBrS
	rbv0JfZ0cWY9DwCr3/7te4zYAwUlU0KLwq2T9ZFMpAEsxLOVVHHKq20TypeY92H2ADT9T2eO2rWiv
	9ApEufgGsA8iltxEekBIjNlDTcJ1JtYs6MwN/Hi8nitNMUI/7NM1TyacFMPR3XHAsz157VomO1WP/
	LVZepXZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st3u7-00000002CHp-46Rm;
	Tue, 24 Sep 2024 11:40:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st3sI-00000002Bvm-0SBo
	for linux-mtd@lists.infradead.org;
	Tue, 24 Sep 2024 11:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54B65A417FE;
	Tue, 24 Sep 2024 11:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC72C4CEC4;
	Tue, 24 Sep 2024 11:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727177913;
	bh=pwjY/eZTWh6CeK5bpC+kwKIQMjLLPjgM+/gsjoFCzd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMNpKgkhk2x9qZxP0mgOivqgqATTti7gN+IDfiHkBl+XwvZD/QgpbJXW/GjTSnF1N
	 kgBJDDq/MKxCMDisFaOB+IafrPksaKAOfV9/R9myrG8CH0CsWCcfcabfBw1x5Yi6l8
	 inWBKQ2e4qKITksH+keHl+uC2SrC5ZiOydIflpiirL/h8J8RBMGe3P+0/RzsJaliKv
	 3pwJng4CcblZHhLRbLcsml8l8mNHrqSOcdHH0E6SZoZCmt8ci2QDeN7JWMKZGw4X+p
	 1efe9ioj9snoHV1t+88tN5xmfWgEa1JoSQCvVlz8zQPiS/X0H4VyqbfVJl46xX81a0
	 vpWwv7kSG0d4Q==
Date: Tue, 24 Sep 2024 13:38:28 +0200
From: Mark Brown <broonie@kernel.org>
To: AlvinZhou <alvinzhou.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org,
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw, AlvinZhou <alvinzhou@mxic.com.tw>,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v9 5/6] spi: mxic: Add support for swapping byte
Message-ID: <ZvKktPc0luV9hItN@finisterre.sirena.org.uk>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
 <20240718034614.484018-6-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240718034614.484018-6-alvinzhou.tw@gmail.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_043834_232874_42BA5670 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1596584882412679655=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1596584882412679655==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vYKY00WwtUX26EWD"
Content-Disposition: inline


--vYKY00WwtUX26EWD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 11:46:13AM +0800, AlvinZhou wrote:
> From: AlvinZhou <alvinzhou@mxic.com.tw>
>=20
> Some SPI-NOR flash swap the bytes on a 16-bit boundary when
> configured in Octal DTR mode. It means data format D0 D1 D2 D3
> would be swapped to D1 D0 D3 D2. So that whether controller
> support swapping bytes should be checked before enable Octal
> DTR mode. Add swap byte support on a 16-bit boundary when
> configured in Octal DTR mode for Macronix xSPI host controller
> dirver.

driver

Acked-by: Mark Brown <broonie@kernel.org>

--vYKY00WwtUX26EWD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbypLQACgkQJNaLcl1U
h9DRKgf+OHoohZqsHPzLDF42cwORcgQYodF9PTs81h3wsuMrB+BUBQJ01Tfq5PGx
hvNfl4LSYkkplYPWS7GtNHRIw3DgdSV4QlK3EuDhUQltWDfTEN5mS+V6CEKzPrGG
v1e83CdyiLgvzP//w15ALc0+VnrXASSgg69XdFhoWTsto3wqOAtcBG1bztJi5Vh0
BALEDmmZkJgp5WUnLfw7errgd2ve73ZsW2Rjdoqt/RSvbHJccPxyPCih55KV9R33
ljEvZhxXKO/xfDO1JNmgNR3TNC0V4/jx5w21ZP5mF4Z5h+HWvC19wquCq/4fjqHP
vDyfTjKJ37XOD2ZYcDui3ELEJYy//A==
=tP3I
-----END PGP SIGNATURE-----

--vYKY00WwtUX26EWD--


--===============1596584882412679655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1596584882412679655==--

