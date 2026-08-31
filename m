Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2667EC624A4
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnGBuUfuPDrofZSQZwZlQoCzGTA+nZM4VA8o63JMSbM=; b=aBEQ5ZcfYh5mTBFpkHqYPfWoZ5
	eCKD/kn3EibPCsBkJn2+cFUtqsBwK1CdSdiaeDdv9xAUpsGqGCoBcJ1mdRiodwPIj/JNiLz1cmIBW
	39XffvXEbw5eo++mpqO8pSJzdveVRRxjRF2XHBruwL6WpDTsRYD1kAcCt57N4Di2kF0P3Uk8UKUL2
	d3iigGiva5fcf3K/iXjWP+A7kVjerwfElMu67l8rTivCb0MEwRQK3fW/OKd69eUfFLoiRPp63Eion
	j8k4mbzNKaKFK9frAmSXyyNnC/NzM3yvrJhYGQ7CeZojBRfpDNuTIAjX0+YaW6am+ivwV/5vC2YTv
	p5ZTEz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11H2-00000009JUG-3sKp;
	Mon, 31 Aug 2026 12:38:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11H1-00000009JTk-4Ag3
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 12:38:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 6DA3E6022A;
	Mon, 31 Aug 2026 12:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8DDA01F000E9;
	Mon, 31 Aug 2026 12:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788179883;
	bh=44HEUT+C3W+ilUb7UcbYs5fMKrnmF+7s17BG/zpNRJo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=Nx3YiC3XxAdlbDnvXZDynYQDcp1UodNmioZi5CJPtXDDmWP0ibyvXNbWigJwoXKV4
	 t0sYC6s+f3yY3zznMfuPmo7Z+VgvorRyi6FDGolAt8z8K5RU6t+RzK6s8iqXIu+5+w
	 zhMHbJe5aObbMVNv0yLe3BzVvDgG4IOhhQmFLqljS0bQezl//MfhDOduZeATOqCvm/
	 hHUPbVR31ZcacaQ35TI0R60oWlJFGRG8jsKw2u0U6HuamEjx//mRCbXDTPGmmdzpwf
	 2jPq6gnMaMQWwhj+LcwfCsLnprc2sdmGu7wPUVZS+WsWjCOAEYvzEKQYKTVXqd5lT9
	 AwUThfyvRANvA==
Mime-Version: 1.0
Date: Mon, 31 Aug 2026 14:37:59 +0200
Message-Id: <DL34V3WU5UY1.3FYYB7UPWYY83@kernel.org>
Subject: Re: [PATCH v2 0/2] Report platform enforced SPI flash write
 protection
Cc: "Mika Westerberg" <mika.westerberg@linux.intel.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <tjakobsen84@protonmail.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260831-spi-nor-platform-lock-v2-0-6cc75b909241@protonmail.com>
In-Reply-To: <20260831-spi-nor-platform-lock-v2-0-6cc75b909241@protonmail.com>
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
Content-Type: multipart/mixed; boundary="===============1121879574915907639=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1121879574915907639==
Content-Type: multipart/signed;
 boundary=2961015be12d425803f6c4a8d0b54a27036011ba812b444aab554b003a36;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--2961015be12d425803f6c4a8d0b54a27036011ba812b444aab554b003a36
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Aug 31, 2026 at 2:05 PM CEST, Tobias Jakobsen via B4 Relay wrote:
> Patch 2 adds the only user, spi-intel, which already computes protected
> range state at probe but has had no way to expose it since the SPI MEM
> conversion removed its visibility of the MTD device.

Where was it removed, though?

-michael

--2961015be12d425803f6c4a8d0b54a27036011ba812b444aab554b003a36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCapV1pxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i5xgGA7ArXnBusxj07GfQmaHEW6Rz4IqPDGCQ+
H0i5OHS3K16b8dJ3/4a9hBy8rxzU2uCVAYDnV9AGj9cHlXRPwAaK2DSeWfCxOkET
lEdVoA5hL/sz4UcH/lY3Zl72vxXx3RM6efo=
=znIg
-----END PGP SIGNATURE-----

--2961015be12d425803f6c4a8d0b54a27036011ba812b444aab554b003a36--


--===============1121879574915907639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1121879574915907639==--

