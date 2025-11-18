Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B581CED24E
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCZ7Zo64yITo0ZfCaZ6ZRpc+hYk/fGmN4kZxjF2roCs=; b=amPtd0/SIfbBraK1STc54ciHm+
	aZvHHImZQyo49Qt33+IiHk5hUbrkyXVjbbz0bcdRjtNaZsH0XmF3DC5c1GiN89nokDGemnum/uqBw
	IMO+RQ/3Ii8hNk/XZmzOVy85M4+XbeZjhcoNvUmNxGxQxnbUtwPjEOLRnQw3IJUQHfximfF0PO6iZ
	5Hiap3GzE20mHCcoJG97q6XwzCacH1MpWHV++r4WMV9TSWqjOMNCMhy+32SvhzDvV7FomUskqHnzm
	tjtesEoOJx3J+jMOAnUHx1MBrS8UvmovOcEQS3Mx/8Y2OsupmwZGAsWzaoo84BDAMwdHyKnH8XPXL
	mbKKClXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHvy-000000009XD-1S0z;
	Tue, 18 Nov 2025 09:23:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHvx-000000009X7-27k5
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 09:23:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60F3F60192;
	Tue, 18 Nov 2025 09:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9A1C116B1;
	Tue, 18 Nov 2025 09:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763457811;
	bh=Ur7GqI/JGoJRmJTT+SHEbWofQ7DFK7vjTLSNIa5LdQg=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=V8pNQcEsCtHtZAN8yPxDx65hENqMKKu6mV7JJpMaZekZgYg0hgk2rSFyZ5wIzRVQ+
	 9e+Q9c70IZbWqQ0CmgXlR62KztFlTuEvIMhPqPTqHUN4k7U8lHXKoypxku+hTJnJj3
	 XWWivQxHMy8gr1jxjAQ1P2cMoJg5SGeEQzxDutZvtKrFAp15WsREPLm25sZ5tBbmam
	 2fOg9vE/FgbGJ99eK3ucJEJEwgHVWlwkTdimKEnRTDQYzu5V35/Xw5pE/YffFE5k15
	 k+tegbYsS3DX8/Kw4vKbeTu9X2oppclgHRbwmuTzHpx4DmRX5yMv75o4IqEvVLjJJE
	 uFA1INPEb88IQ==
Mime-Version: 1.0
Date: Tue, 18 Nov 2025 10:23:26 +0100
Message-Id: <DEBPMCJ6KJ31.PW1MCZGO961Y@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
Subject: Re: [PATCH 04/19] mtd: spi-nor: debugfs: Align variable access with
 the rest of the file
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-4-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-4-487bc7129931@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============6014675036002080537=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6014675036002080537==
Content-Type: multipart/signed;
 boundary=1b1e7d949062ba2cb68a4d076cd4c99b47beb362e5dd8532b6b19d963810;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--1b1e7d949062ba2cb68a4d076cd4c99b47beb362e5dd8532b6b19d963810
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> The "params" variable is used everywhere else, align this particular
> line of the file to use "params" directly rather than the "nor" pointer.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--1b1e7d949062ba2cb68a4d076cd4c99b47beb362e5dd8532b6b19d963810
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRw7DxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ilSgF/WV/ElgLnOhJm+jclfoXenNI9cj7EiFJl
elNdXG9O3e+LFe0TtVuDWmCxa7evqZqTAYDJPZtdSQ6HUSnk5PKUsVC/wyfJt/Sl
65g45tGBX+h6oE22Ec8wKbakqwmnBYbpQpM=
=GtYk
-----END PGP SIGNATURE-----

--1b1e7d949062ba2cb68a4d076cd4c99b47beb362e5dd8532b6b19d963810--


--===============6014675036002080537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6014675036002080537==--

