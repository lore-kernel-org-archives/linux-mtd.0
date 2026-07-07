Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41714C43458
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2026 06:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yt21KWbVBYErn/6S1K4w9HdSlyd8/D2tRuiyu0Vh0c=; b=Urp67Isty1saZffhlUj+IOlgi7
	WXDuxelDOYJ3Q/uYBGyrM13WMU69V3sGTbtO+K++yOrWGT3hrOlkN1C7mwUi4Ho0QQpwlC0WsJDjD
	2vhC1MCmsWOf+BpGhaAxXBKNlp5U/GL97+4OsyCzoiyBHse4r0ex6yIPOiuFJUZuQUHCZCMkoKOjL
	YIEyABl2hVWLKI2fQvK+RwaFegM6tnA3ma+HwAKMTWI6l5sj9rJ4wfoQNISGy1JjggoHThdDeV8Qk
	LCP8+6tBeLMKWY6dyKR+AQVJmGOohzRJTYNIp57q1jgDuWX4Tg0ayWZic53a/uDtRFcvglz7/lACD
	CozXiwjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzOv-0000000EDw6-1CVX;
	Tue, 07 Jul 2026 06:35:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzOu-0000000EDvt-0Qfh
	for linux-mtd@lists.infradead.org;
	Tue, 07 Jul 2026 06:35:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 897BF618A8;
	Tue,  7 Jul 2026 06:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BAB2B1F000E9;
	Tue,  7 Jul 2026 06:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783406123;
	bh=RAXSwzSB9eRG1sfPqSo0M2+rBXFjmDHCi241Oeb0hWk=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=OC64oMj2U7IQlbMyLXfUChlXKdkLU5iRD0jUo42JzJVpL1dlDfaXLWC/nlLkN3vlC
	 tQOWbRRGRTTqd1gg9qNwHcDsjcktdVMemXFOrgkJhRw/6qSvAP2vX9A5f45J4lSOQ1
	 BbbjALczkgKEXW3MqLLP6iVlrAdcLdDb1pJ8wV6ezwCd6Utsf0nJzgMmt6QZXd132j
	 MeS9xAXeWg1oFFukPNVqXFFDmfZaJI8pnjXgXkRol8DpTVaiGBhtHxl3HdSnnX3+DB
	 5wtJ+yrIrtLW64jGhdUhWIPEbY8AFP9td6KUg2YHxhCHT19HM4iVUJXHz/yXtgfUZ5
	 yiUHuKq5J4Rdw==
Mime-Version: 1.0
Date: Tue, 07 Jul 2026 08:35:19 +0200
Message-Id: <DJS4PGQ91S2U.POYA8XDPMOP@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter
 initialization
X-Mailer: aerc 0.20.0
References: <20260601125438.3481722-1-mwalle@kernel.org>
 <87jyrdpgik.fsf@bootlin.com>
In-Reply-To: <87jyrdpgik.fsf@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============7456672067258603292=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7456672067258603292==
Content-Type: multipart/signed;
 boundary=b1ba74683c959698e915d6006ebbfe00accbe6b9f8b9f5e96bd42d544a41;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--b1ba74683c959698e915d6006ebbfe00accbe6b9f8b9f5e96bd42d544a41
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jul 2, 2026 at 5:17 PM CEST, Miquel Raynal wrote:
> If you can also give a try to my QER rework I would be interested to
> gather feedback on it and ideally also try to merge this kind of rework
> early in the cycle. ;)

Unfortunately, I don't have boards with 4 I/O lanes, because we are
mostly using it for the bootloader thus they are pretty small and on
top of that, we use hardware write protection. The pin for the
latter being shared with on of the I/O lines.

-michael

--b1ba74683c959698e915d6006ebbfe00accbe6b9f8b9f5e96bd42d544a41
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakyeJxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ifdAGA2FfVS1j58JmIgtCaFpXbU63iGCJsrtBr
X/sneuNSrfOSm052Me4f/Tn4upPepphAAXwMnOXa+2rkeC1h9sLPnSow0sJHQIwN
9vTjr3aDoJewtCslVOReE+9Qh+6bOKhXVAc=
=XcJa
-----END PGP SIGNATURE-----

--b1ba74683c959698e915d6006ebbfe00accbe6b9f8b9f5e96bd42d544a41--


--===============7456672067258603292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7456672067258603292==--

