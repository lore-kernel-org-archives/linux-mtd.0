Return-Path: <SRS0=Ic5j=4I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07A9C11D1B
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2020 19:52:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75DC4206F4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2020 19:52:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VfM82+oG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75DC4206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nmgSQBh+jvFi72aRI9NzdhsAVCzMXoE+p7AviY7Q+q4=; b=VfM82+oGCvu+Y1oihI28szx81
	3F69g+SqaIkA2r6igImu/Gw5RrFJoyEOSz+/r6aCn7JnwpQo27NkCrsyU+SoCz7GwCxVJMwhN7yrw
	Ku/FO9QAIbbmhtawtaA+XiYn9LPh4kyNSNvYYWV0HkCZuO2GpeQxmtUCzR482SBEoMX10JtcMoan2
	Bjo+5WFXtfKvuGhttGY1shsHMzfOnkQ3tvMtFj6z13Wsh4V1i++Pf7PLdbbjx5YzfeEW+Lc+dagOE
	vU1xcthEnKfway0/55Si8p8nzCVc/pERa54I4QE9+3CCyH43dTqfbKe78NQ6fbXKM/LGgQ4hdn+I4
	hvRCg2yLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4rrM-0007CA-Nj; Thu, 20 Feb 2020 19:51:44 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4rr6-000705-HR; Thu, 20 Feb 2020 19:51:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D90DF30E;
 Thu, 20 Feb 2020 11:51:24 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EF083F68F;
 Thu, 20 Feb 2020 11:51:24 -0800 (PST)
Date: Thu, 20 Feb 2020 19:51:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH 0/2] rewrite mtk-quadspi spi-nor driver with spi-mem
Message-ID: <20200220195122.GL3926@sirena.org.uk>
References: <20200215065826.739102-1-gch981213@gmail.com>
 <20200218125557.GD4232@sirena.org.uk>
 <CAJsYDVL03KJv7eewGekBPCfpbOuTX0tJ6qZaydvJnBDzZ5vEwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJsYDVL03KJv7eewGekBPCfpbOuTX0tJ6qZaydvJnBDzZ5vEwg@mail.gmail.com>
X-Cookie: You are number 6!  Who is number one?
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_115128_644900_C06B4E4C 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2387073767933911277=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2387073767933911277==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kaF1vgn83Aa7CiXN"
Content-Disposition: inline


--kaF1vgn83Aa7CiXN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2020 at 07:58:06AM +0800, Chuanhong Guo wrote:
> On Tue, Feb 18, 2020 at 8:55 PM Mark Brown <broonie@kernel.org> wrote:

> > This is an ABI break so you shouldn't be doing this, if the existing
> > binding works it should continue to work.

> The missing spi-max-frequency is the only part preventing old
> device tree to work with this driver.
> If the goal is to make existing dt binding work, I could patch dt using
> of_add_property in v2. I saw similar device tree patching for legacy
> bindings in pinctrl-single driver.

That's fine I think, so long as old DTs continue to work.

--kaF1vgn83Aa7CiXN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5O4zkACgkQJNaLcl1U
h9CnhQf/csTFVBvPtYuq5Xz1OdgQcpPuRzKFr7JAXvgpfAUv5qPV/34M4juJxze6
ei2b2s9UlxK2Naa8GFKqAEKOK79jnk5HrI7QkELb2UpQPSJQKubjc8iHzDsQ8rgC
V7Qf/2Lv2J/NW4R2XzC0ZXMeSnEMBQepx/pUCQnwXOqReWiy/l2X7pLEJsI4J4pR
ba9BzEWWAXYoP4SYj/cVlqhWrBh807h6owmwTlV86VrwRRh2cxosTUZVMx6nRNq6
MBFLZ/vayfFd9LF7BQ5r2isKv+BUrZZ8bd06Gt8vZrrLBoH4YiGhXDLL3CGWvFhk
6M/bBGLDrkTKwSBb6zMaLOsygszigQ==
=rZ8a
-----END PGP SIGNATURE-----

--kaF1vgn83Aa7CiXN--


--===============2387073767933911277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2387073767933911277==--

