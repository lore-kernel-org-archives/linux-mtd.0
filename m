Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C48CCA473
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 19:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdHLnfgONY88mJwLniKN8WCL+uQhnr+LShhbWMlvjeg=; b=rYH6S+gIWMWZprMtBOlNcebd36
	CodZCbK826cMDRBcfiZy8ZcZyO0nIKgabkx76H+sT1p44K1e2pDTUD337bBVWREGBQ5Hqd8+DKl2i
	ehGKsqg2C33pJ/JOwHAPcJP9NUK43F8jS0QEykSKspJbkJ6gLGeJGACrYw3BStIZx6+FlLX40eeHJ
	vs2q3VZy/yW1xJmj4VS7NtUVtV3BSoSFwP4IVlLQY0ihAXZ+xsiboHBguMpvY9omcU7dsCNrtEPTF
	zz8Z1jX8BlQHfNUTgvlsyexZlfU74Hocl10gOvwLLHpw3RDeDRiYrE7Tn67xPtGxxXwy+5VL2j+Yg
	CMFtjVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1YeJ-00G4UV-KZ; Wed, 15 Jun 2022 19:25:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1YeH-00G4TW-2S
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 19:25:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CCD260DF0;
	Wed, 15 Jun 2022 19:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7D3C34115;
	Wed, 15 Jun 2022 19:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655321149;
	bh=mjycc28titw6b3oBQHfrm902kDC3ORDO+qAz3zRHORo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5mpo9Oq2B7L9BefUEXvKAxz7oDNd3WuQ52foZSGBOLylVRsnviPlu8IQ0tbcsDEI
	 XQrTSo/+rXm/ayE33b7vLdirqWV/UeDv9XdQrx1z4RPgksJCJ3avwSkV2vqGU3FMEG
	 XmiekWH92Sp0t1AV3PU20x/iQmOisOmaAF7NDUAWIml+SLo7Jhlc3XqTT4xvRorN1+
	 haS5yI/jKW6Sh0h2v/UZ8oAwiRMUCz4h3ZSDFe3VblTB1hJcIpTTCNQvB8QQ+BbXFP
	 7xJ2W61KR00XxJGhIm2lNzCyXhpkOL6nBgZE2v8YGAms7dNuCMflJfZUeNeYsPzwVq
	 c5mwWneRLD50Q==
Date: Wed, 15 Jun 2022 20:25:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Oleksandr Ocheretnyi <oocheret@cisco.com>
Cc: mika.westerberg@linux.intel.com, tudor.ambarus@microchip.com,
	miquel.raynal@bootlin.com, p.yadav@ti.com, michael@walle.cc,
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org, mauro.lima@eclypsium.com,
	lee.jones@linaro.org, linux-kernel@vger.kernel.org,
	xe-linux-external@cisco.com
Subject: Re: [PATCH v2] mtd: spi-nor: handle unsupported FSR opcodes properly
Message-ID: <YqoyN2BplOCSOIa6@sirena.org.uk>
References: <6A852B9E-D84C-4F80-9C17-62BFBB98CC8A@walle.cc>
 <20220615191153.3017939-1-oocheret@cisco.com>
MIME-Version: 1.0
In-Reply-To: <20220615191153.3017939-1-oocheret@cisco.com>
X-Cookie: byob, v:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_122553_193068_5B4ADC2E 
X-CRM114-Status: GOOD (  11.54  )
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
Content-Type: multipart/mixed; boundary="===============5867222646942932617=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5867222646942932617==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h31YcxwvFtDq3oCQ"
Content-Disposition: inline


--h31YcxwvFtDq3oCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 15, 2022 at 12:11:53PM -0700, Oleksandr Ocheretnyi wrote:
> Originally commit 094d3b9 ("mtd: spi-nor: Add USE_FSR flag for n25q*
> entries") and following one 8f93826 ("mtd: spi-nor: micron-st: convert
> USE_FSR to a manufacturer flag") enabled SPINOR_OP_RDFSR opcode handling
> ability, however some controller drivers still cannot handle it properly
> in the micron_st_nor_ready() call what breaks some mtd callbacks with
> next error logs:

Acked-by: Mark Brown <broonie@kernel.org>

--h31YcxwvFtDq3oCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKqMjYACgkQJNaLcl1U
h9BXAgf+PejyCaMSeNp44aV3Jxkp2oUooVeKCeh7KO0RIFkhx53PKA9IT4E4gBQ0
2+bZxWUS+GVU5CHYqtn3rmaoiWLf9bR5+0JIPfWCGfUdkk7+/RR66ewMIc13LIHQ
9qxAPK/UtYGPbdTL94xkHpRGY8frBpWKIYDcQqGHyjR/b0aYXUedc/ixOLvz88Xs
Shd7bECwsmrnpzRdKUS7hWI9iPYqNHgKNYHeV4ETupt3Krpka2A97JkXtpHEzIZ8
e0l3sfmhm3ligaCYcoavd4IIwnnRSWLkb2rdBbj4Rw3QkJ3ckUk8SNrR/csuHArF
9irMzdcw4uM9CpHtRqvr2KqmFMW/QA==
=jVgm
-----END PGP SIGNATURE-----

--h31YcxwvFtDq3oCQ--


--===============5867222646942932617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5867222646942932617==--

