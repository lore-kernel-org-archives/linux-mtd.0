Return-Path: <SRS0=PjdO=EW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E280C4742C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2020 19:08:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D7002225B
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2020 19:08:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WkZzbuhn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqKf9Old"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D7002225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+t1JCUc7AWUaDcRNj1J5SBTFv0kBq1IcxRtAhU/gUJo=; b=WkZzbuhnamXxn6K/vN8LUvTN/
	CpUWZqLbp1kNo00mYLUaGnB9SLvIW7RlCjIq4dZMNGTI8vNJTXRbI4g8b6L3/mLEWtoK69hauhgwQ
	u0LfK5DcJQV/HcBybHv9ZTE/tG0k+gTPhp83t+5Hc23pdTQpZyESSEf+dDLjZxPAA7QR+k2Zv7W9I
	w5nT2RUV2AtBcEFAtHsPqhX0pf2dn55GeJV5Dg0+mTcjZddKtGnI4RO3LAAIgVO3shQXUR+jPDc0l
	NqEJYk8eVlNWuq4bUXSZmCNIlPmFzvs7Ls1kj6JFufojQEkuuls7am/5oy9UIb1baQ65Yr8c65VZr
	IEOmdA7aQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kejr1-0004Nk-PR; Mon, 16 Nov 2020 19:07:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kejqz-0004NC-R8
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2020 19:07:54 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 394732225B;
 Mon, 16 Nov 2020 19:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605553672;
 bh=yosXMLmSKHZhkAgd5D8vJ5A8qZi+NPfl8uhqpTpOj6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nqKf9OldNsSdey8/QJeb1luOcd4HwBPSIVYjTLj4rB/CEnWdloMS9AvJgcRqaIgM2
 mgirUWUsENniK2QwP3AomrpBweLg3Y6wSN+dQ54U4OIrdm5kUuW0WVBaLQs4D8sLIU
 13UQXjlpCrGXInaBO3eJFoqP6K57yNj+VU9/tw68=
Date: Mon, 16 Nov 2020 19:07:33 +0000
From: Mark Brown <broonie@kernel.org>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v7 5/6] dt-bindings: spi: Convert cadence-quadspi.txt to
 cadence-quadspi.yaml
Message-ID: <20201116190733.GF4739@sirena.org.uk>
References: <20201116031003.19062-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201116031003.19062-6-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20201116031003.19062-6-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Cookie: Immanuel doesn't pun, he Kant.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_140753_988968_C8479339 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, qi-ming.wu@intel.com, p.yadav@ti.com
Content-Type: multipart/mixed; boundary="===============2622902282627950371=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2622902282627950371==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eDB11BtaWSyaBkpc"
Content-Disposition: inline


--eDB11BtaWSyaBkpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 11:10:02AM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel=
=2Ecom>
>=20
> Convert the cadence-quadspi.txt documentation to cadence-quadspi.yaml
> remove the cadence-quadspi.txt from Documentation/devicetree/bindings/spi/

As previously and repeatedly requested please make any conversions to
YAML the *final* thing in serieses so that issues with the conversion do
not hold up other development.

--eDB11BtaWSyaBkpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+yzfUACgkQJNaLcl1U
h9Db5Af7BSeCmDzgNuAKNa2DAq6jwsMGG9DCDDfsoV8mVxxj88/2ctalltiwpuki
WiVDc6AuNbqSQhFOWzh5kI1zqNra9A9s1YP8Z69Uld1B/ZrqL5LDr9a9xgWBvsE7
Co768+PNi5fp1x2hoiFF1MgAUOMsGmKkALVxborYTqB4f3/CC9SJYh94yxYd2dRD
wdtvJQr4gmGKdwhuhjwKcl+m5dyQ9uI9zWZZFmwkCXRzaW27ndw83utGRPd4Z6ht
ExGxovoAX/V+HX/sI4133h+F3emUKGJi0c3jT5GLZPRgFDXVSx/B04FBzfn2qlE+
uleRMfluu5LB/PQJzQrNCFNzeZSYHQ==
=Hmhj
-----END PGP SIGNATURE-----

--eDB11BtaWSyaBkpc--


--===============2622902282627950371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2622902282627950371==--

