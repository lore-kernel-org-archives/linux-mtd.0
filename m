Return-Path: <SRS0=Tm4b=6O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D38AC8300A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 12:19:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 017E92076D
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 12:19:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NAdIDk02";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUAkY5yp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 017E92076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zcT0mazq6OZOlxSAxPpujKFWGHDALEK98uqFVSKgrVQ=; b=NAdIDk02QB88Dzwq55ejMj8fG
	AMd5PlqHNTOM0oivkJXK6jS/0wVAaymu1pxk4sgK/5RHu96BlRLUxYMSLfmoSVMczTtiBv+6HIVub
	84cHuvLT8qAlygfmqwxVRB/5eyQdyqogMjNXvmqP7Pjz4CSKtFV6m9XeKIrubvUmor7gb9zX4IeIZ
	8zS4YlWVmnWoQNc7+JUQWXhYa4QuVH4yvciGtIZi3Gf8l5IAy6MXGSlZTuBfKGzwK9WX7CBKME1wk
	/ZQJweP5AQ4Hy1jQuglYNuHQeEJXN58p4NhiEaylaMvX7Mki7EZhTCEO80yAvw35wwdd2oU70O67v
	RKk4hf+hQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU8AE-0005hk-Ou; Thu, 30 Apr 2020 12:19:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU8A6-0005YH-BK; Thu, 30 Apr 2020 12:19:31 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDAE92076D;
 Thu, 30 Apr 2020 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588249169;
 bh=N9rKaTsZFrUvyvsuP9lOc4Wzmprx5voNQJlTVM2rGf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kUAkY5ypXbCmOb1J6dz7spcNrSx8SjCBuT8ha4oxfvY5gTGWEPVdtk14Hpg+O4PBl
 Qj/56KbHndZm/zVKyt3Sn42jlYyvBevEtJJdc2RAZYMcLcdX91zOnVrswvPKexje0u
 4TPMM4s4MnfBnUOCPqX9zSl5uoEUM+0WfU7etRYE=
Date: Thu, 30 Apr 2020 13:19:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v4 02/16] spi: atmel-quadspi: reject DTR ops
Message-ID: <20200430121926.GC4633@sirena.org.uk>
References: <20200424184410.8578-1-p.yadav@ti.com>
 <20200424184410.8578-3-p.yadav@ti.com>
 <20200430113243.GB4633@sirena.org.uk>
 <20200430121737.37dghomlluzqcxxi@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200430121737.37dghomlluzqcxxi@ti.com>
X-Cookie: Sign here without admitting guilt.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_051930_407114_1650FB1F 
X-CRM114-Status: GOOD (  11.26  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4007137107247366827=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4007137107247366827==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Content-Disposition: inline


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 05:47:39PM +0530, Pratyush Yadav wrote:

> Most other controllers either don't specify a supports_op function at=20
> all, in which case spi_mem_default_supports_op() is called, or do their=
=20
> custom logic and then call spi_mem_default_supports_op(). In both those=
=20
> cases, DTR ops would get rejected because of the call to=20
> spi_mem_default_supports_op(). So they do not need to add the check=20
> explicitly there.

> The two exceptions are atmel-quadspi and spi-mtk-nor (which I missed=20
> updating). They don't call the default supports_op, so they need to be=20
> updated to explicitly to reject DTR ops.

OK.

> Earlier versions of this series discovered the DTR capability from=20
> devicetree. In that case, no change would be required at all, but review=
=20
> comments suggested I drop those changes. Instead, the controllers should=
=20
> accept/reject DTR ops in their supports_op hooks.

It definitely shouldn't be in device tree, this is something that the
silicon supports so we should already be able to figure out if we can
use it with just the compatible.

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6qwk0ACgkQJNaLcl1U
h9CGPQf/RnFFO+2GEO20wzuUOjiIgXpgOfBnSKgMTXOWAmba2YafGkKYwsymVpGY
zt5Q9vkcx9dsgudhY892WkRo/l9+xJOkSYbp38ld0QR+YNfXbPUPeuvhK2F39YTJ
YjMbZw8hbYyMqF+yXbJXJrj7PGbu9ISesfBgC73i3ywZC8S9epUKQZp7HssURy/M
GJEMzoM40Vam/V48VAPrMHa0Dut9Bum74W9jzW5Fpnxz00AkY47aeMzGSOD+IyHD
zP97bFTE4NUym4FES9c9efA61FuUJxOK8YRN5Hmfn22BwxxQ6ZT1B+7jRv+Fj32J
GfvAqmI+mYhLpW/bHI7PCh/eP/eO0g==
=dS3u
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--


--===============4007137107247366827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4007137107247366827==--

