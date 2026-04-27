Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440B3FF8864
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 23:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3zQxn5TuC2ArCJp5e2fLccWur/nNf60k0oHY5t9ySo=; b=4Y9WIEUYTUHJ5sWqhtGq+zbCyV
	gY84B/k6TFaXJP/C+BT/UhPX3wicDF++KnQL6TU6Z93EeJ2jEPfDFNUMp9AM5Jrm7VKOGOiaCBo0f
	tosM2+PbHmaKZhDOpxulZwbzp0TBWEgNMFyq4/7Rc+Yvo+jITif/36Rjr8aJI0bTAXlJNrC0xLAkh
	ZcW7lNe5mWw5VVsQAWMbA+2JyXvw5r6yRst59iW8FK+Yw1auwKHQI8DoXe+7zcTJrUGtBxFdbIdBH
	vAmJm3Fi3imDOMOY3ulnde/RBWIRaeGS0lSdWCf3TJW+y3Hy0DPVT/Xleng2EtGz/x1CcooQsIcQ0
	HV42GXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHVdu-00000000Ipm-0u2z;
	Mon, 27 Apr 2026 23:45:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHVds-00000000IpR-1Irx
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 23:45:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8AD44384D;
	Mon, 27 Apr 2026 23:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAEAC19425;
	Mon, 27 Apr 2026 23:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777333530;
	bh=iNUVz32+ZmRXhhmJskRiUJf6GS14RqQQlQPBx1DWsKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J+IJFxAfLuZ846RGVISa3U7kuN5V1+FpjxU3GkRmXZSD3H3MGrbV6Tm7MfNxtK0Dn
	 wALy27ziHiAfInsEO+ReGT65yrLEoSHPgUDE2r/z6PLQaCwV51tFuQxIEyB95U+VlH
	 asp6crTuydstvTk69W3ZvcsmII/KGOlsicfCJSiCpNCC76DpgdmoFXeo5K1kjV2npP
	 n8D1etefFPz0CtEp0DvLEhnT3MksTBHrUowzwwjNjAXqg+qwUpDH0UWqHRhP/wWXBJ
	 fEGcvCE3vl5TxXlrt9YY6qHjBClLtV6ymGDxPPTcVe/mUWN+AWOEg594UkuCIDDPFB
	 epCC/Z1B37I6g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CBA451AC583E; Tue, 28 Apr 2026 00:45:27 +0100 (BST)
Date: Tue, 28 Apr 2026 08:45:27 +0900
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>
Subject: Re: [PATCH 0/4] spi: spi-mem/mtd: spinand: Prevent SPI NAND
 continuous reads on am65/am62
Message-ID: <ae_1FyLxEwWqNFzX@sirena.co.uk>
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
 <87mryoh6s9.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <87mryoh6s9.fsf@bootlin.com>
X-Cookie: Victory uber allies!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_164532_374830_9DC6B1C3 
X-CRM114-Status: GOOD (  11.95  )
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
Content-Type: multipart/mixed; boundary="===============4447601767311136994=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4447601767311136994==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Joz10+QGWXmFyC4"
Content-Disposition: inline


--8Joz10+QGWXmFyC4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 03:28:06PM +0200, Miquel Raynal wrote:

> This series is related but I wanted to double check with you: can I take
> the spi-mem patch and include it in that immutable branch which I will
> share with you for inclusion in the spi tree?

Yes.

--8Joz10+QGWXmFyC4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnv9RcACgkQJNaLcl1U
h9BFagf/YjtP5kDc3k98IW+Rkwo9nxiTLI8aFESXl57np0JJhmJkJVyzpgO7oK0N
plECehs4WQSfZYZ6wtwQwZKadh0+L7ZEn3xv6pg4MT5MumZDKhO2979Hpowpev0T
pwgm+jLz8IQQhFd8MMfe9c5mpquctPZu/8D6Y3FC3+6f/5utfV5yhY/sEwVXY6G6
0/fQM2h/zCKrPLFdbFIYWKAzIrCOK/0BAniwl3D3OZt+RBGYSM1DRi8zP8ILVb7w
hW+B+lBUEp2KkbVUBLmgbsdnHNrgSLEyBzYdbvQfO2ZDB1xDkpkJG0hfq6O2pph2
2BetnLGK+TzAuBpeFktpFLmqDPTbOg==
=Lrto
-----END PGP SIGNATURE-----

--8Joz10+QGWXmFyC4--


--===============4447601767311136994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4447601767311136994==--

