Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A817AC25B75
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2024 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWsWDeI/hSP6iljVBSOWIgVCLGz9alR9Ob7SWbBM1ew=; b=1qm1LEm6tfzUfPmFoldvIxkbUz
	yw+bwcDgptIwJWXdnO5IYbWJ/5JaoFu5e7JiHp1HOtUiPy+MHuGyEG/6hmI7oOy5xxazANVWfOX+O
	4QCseuGulEuFA0JjiTyVgYBSNj68XmpY4Gxs+QfHNjl9ouZQAnG522uID9WFB3NTKrwTfHmY095EE
	PJduhVEy9oIcunOi9AjJYTQ8Qd0nc0lRMS49v6ILE7mWROi90NaUxUH56uHpgwVHiLyrZoS2v4qZA
	ZVNloxZvML3qUbG+o5jH8KnMMv/q5MUW+8mUHwqLM/9CPewt68a03ULPtYlvYqJ2z/Waem1duueVx
	Lwk7NnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE30r-0000000G2Jv-10LE;
	Mon, 03 Jun 2024 08:25:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE30o-0000000G2JQ-0Dby
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jun 2024 08:25:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07CB460AE8;
	Mon,  3 Jun 2024 08:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78666C2BD10;
	Mon,  3 Jun 2024 08:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717403148;
	bh=aE1fh3+CXtMRxNu0TYmWUzvdn7c0d7qbCuoHrxexG4I=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=AXe2n9NtXRQn9XVB5NIKk6nnUYAlRbvhXwlh8/To0Jrs9hyGfmlCFYftFr8TeP4be
	 8iqtNcBeiE0zdk/iL06mr1qTVy9gPpknLSukMmzkU8PN4Q6q+DOVRtNdj0usVt32vy
	 XO9kVWohKwtbPPQ4JaJJ6CWCSEZUT2HkhHPzwr2fKF5Dmh0qxxzPT6nTKrRgm+I3gy
	 +IU1n21gf7IKcfniySh6Ov9fuYSpyqf1BPx6PumlZA6U4/SR2r+60AmoMFIrUTg2kH
	 POn/O+PbfbeEBdH4bh6nUvFx9iVeHH9jUNIy3gJYjKJb7A+6OWC0RSDxZIZ1DfdheX
	 d8lMpCZqO8qZQ==
Date: Mon, 03 Jun 2024 10:25:44 +0200
Message-Id: <D1Q8LSUGXEIH.1N6HH5514YIJV@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: macronix: workaround for device id re-use
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Rasmus Villemoes"
 <rasmus.villemoes@prevas.dk>
From: "Michael Walle" <mwalle@kernel.org>
To: "Esben Haabendal" <esben@geanix.com>
X-Mailer: aerc 0.16.0
References: <20240524-macronix-mx25l3205d-fixups-v1-1-ee152e56afb3@geanix.com> <D1Q7BU6PJ356.1CTXPUZE8U6XX@kernel.org> <87frtuigo3.fsf@geanix.com>
In-Reply-To: <87frtuigo3.fsf@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_012550_259156_F978A3C7 
X-CRM114-Status: GOOD (  10.21  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8063109359743557344=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8063109359743557344==
Content-Type: multipart/signed;
 boundary=d46e1a1054ac3317006112254d36d8e54f39007c7af5372dd6e3ff89531b;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--d46e1a1054ac3317006112254d36d8e54f39007c7af5372dd6e3ff89531b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > In that case, I'd rather see a new flag in .no_sfdp_flags
> > to explicitly trigger the SFDP read. Then your new flash would only
> > need this flag and doesn't require the shenanigans with the fixup,
> > right?
>
> I fixup would still be required in order to enable 1-2-2 for MX25L3205D,
> as it will fail the SFDP read, but actually does support 1-2-2.

But you (probably) don't care and we also don't care for the
additional speed. So, I'd rather drop that code that is just there
for that ancient EoL flash.

-michael

--d46e1a1054ac3317006112254d36d8e54f39007c7af5372dd6e3ff89531b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZl1+CRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jdKQF8DveA1osmeLfihnlbROPQphfmdPnklv7X
NaNjhbgJEmKxtS2zk+jZVwssNfPFUUnxAYDHBEZh9zqy67jhffWnmu8w9KS9vEI9
8kUa3IDDladbn6eU15rcwQXCHadZvM6CGQg=
=JZ4L
-----END PGP SIGNATURE-----

--d46e1a1054ac3317006112254d36d8e54f39007c7af5372dd6e3ff89531b--


--===============8063109359743557344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8063109359743557344==--

