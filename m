Return-Path: <SRS0=a+Ch=4O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B10C4BA0B
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 11:36:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B820206E6
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 11:36:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d8fyXe0E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B820206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5+pxktcCkEf26w1KgXhx3o8qeWDEmZq3NPAxOAZRjbk=; b=d8fyXe0EcuM7DUc4BdHN2wdWw
	aaJdIqrW9GvsI/VCYGlzjI4jVGcW1O/ntmOaNs42PhCCFdmXP1NIW81oHBTBIaRs4JvJe5EjBsFW7
	mdIrewATlrVZocklpRrfKd8gLJVyFPkEkLzg2mGev2/D7mmnYGazt2RyKR6FKRlwgkgPrjKmzOIXi
	ZMtBWBK84swq0Qj65AhO85vQiHP14h6aG9DUwrUJLdCu+AxiA7EC9DUSx2XYNK4VIfNaexbiwAEP6
	tq3Qri7pDLetQCGBAnvPPW+DgzSeFt0TAWcOW+PQboCUBjpwy6GYbYHrCEzCWUzzIvOXH6Rv3qmf4
	reQ02Iweg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6uzN-0003ea-T6; Wed, 26 Feb 2020 11:36:29 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6uz6-0003TC-RS; Wed, 26 Feb 2020 11:36:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2680D1FB;
 Wed, 26 Feb 2020 03:36:12 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DDD73FA00;
 Wed, 26 Feb 2020 03:36:11 -0800 (PST)
Date: Wed, 26 Feb 2020 11:36:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH 0/2] rewrite mtk-quadspi spi-nor driver with spi-mem
Message-ID: <20200226113610.GD4136@sirena.org.uk>
References: <20200215065826.739102-1-gch981213@gmail.com>
 <20200218125557.GD4232@sirena.org.uk>
 <CAJsYDVL03KJv7eewGekBPCfpbOuTX0tJ6qZaydvJnBDzZ5vEwg@mail.gmail.com>
 <20200225173137.GA31830@bogus>
 <CAJsYDVKqcd-ytLLf5zKqs8DfjPAa5ELCX53OiPDAi-tDnLd=Eg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJsYDVKqcd-ytLLf5zKqs8DfjPAa5ELCX53OiPDAi-tDnLd=Eg@mail.gmail.com>
X-Cookie: May all your PUSHes be POPped.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_033612_933456_1AA42F75 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 open list <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8560601229834476499=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8560601229834476499==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ylS2wUBXLOxYXZFQ"
Content-Disposition: inline


--ylS2wUBXLOxYXZFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 26, 2020 at 09:31:33AM +0800, Chuanhong Guo wrote:
> On Wed, Feb 26, 2020 at 1:31 AM Rob Herring <robh@kernel.org> wrote:

> > You should should really only need 'spi-max-frequency' if the max freq
> > is less than the minimum of the host and device max freq.

> But current spi framework forces that a "spi-max-frequency" property
> is present. [0]
> Should we patch spi framework then?

That's one option, yes.  As far as I can tell the bindings have always
required an explicit frequency specified in the bindings but I've no
idea why.

--ylS2wUBXLOxYXZFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5WWCkACgkQJNaLcl1U
h9CC6gf+JGnksoKyOcf+87xz30r83FSXTXHP5TSv0S1iEPWe7PYG3vPRv0NdFdq2
95nsCYkfFdyrl8ayy/LjsXvZMbZPUv2oDhJGdq11H7EX3/DrKCTcChXdkzpD64NG
dlKWpB6xvJ6Ka/g9VowGe+WcTwrhQBQByb45Z0EkTZxQ+YScJHQkJy8HZXQKf85E
IAW7t7mcHtmmIXmJB7yHHE3exT6cOcDurwuz6QOJ+w3YwNYNO2HcR5ZS0T1IjPe4
WgWVxid2OxLorFCxu8dUxxsq29uDD49lP/kfbyVYkND761fTbk2idLN94r6vvCyx
6PNQ3DIDylR48WUdePXdGADNjXBUog==
=d0oJ
-----END PGP SIGNATURE-----

--ylS2wUBXLOxYXZFQ--


--===============8560601229834476499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8560601229834476499==--

