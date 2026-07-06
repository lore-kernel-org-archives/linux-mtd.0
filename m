Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8FEC43602
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItFcLiWaW5DuRgQdlmTuEfywbI7WFjckdk5TK2klMVw=; b=YU3llYodTWaCiYTq3iCZVatE38
	tJ7xfjw6Stz+OZvg+8cA1kBodj6mrO1wOwj4ptdxvU6XADjZMuIKoRbFw8shShZ2vXoU0F52dbRqD
	PRoMyM3XmIo+tLZiQ5/ofGumTkJxTgQv+OmTLDJaXJJTImuTQENng7/03v5npACOYPzbd4+45tRFS
	XeuGeoXj5h+QaexOzhHt/P0MjeP4IvzX5yN3ELhxbkhWLo8B/SxLL1nD+ICS+ZgSg9zIPainziV3z
	pwOI+akdVtD4iKDok5vtoSkV5D9xKW/YwM6Ewrg9CBtMH5Tlm9yfPRSfkD6wWsda8rgwNpi8CK31M
	dI5n9THA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk58-0000000ChXL-1RvA;
	Mon, 06 Jul 2026 14:13:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk57-0000000ChX0-050Y
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 14:13:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 77171600AE;
	Mon,  6 Jul 2026 14:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A66FE1F000E9;
	Mon,  6 Jul 2026 14:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783347236;
	bh=4f04M73ELC37jUjMqWKLqIjCV8byPVSBP4/ZrDSl15k=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=DKc7S9H2Oj0F1+3qipq/8c7HT0/A1TG6eYDjJqXZ8LySfqHuU7bDWJYaQ45M6faPX
	 lr6mcMODgDy9SQuAULqeR4itKsyf/ByYMgjOkx2bQuri3tvSapnyYj9zsoLS4QDgYg
	 cbNSE0AC/efQBw692RFjVBy0lRtAigW5YQVWyXygyTy2RsxcR4ssUDaBtaGYXGyFht
	 EL+YvFn6WQnsIYnaptO4FkJdNJFgOTMmP311xAW1Fqj9l0qQbDrEYhfC5t3cfqc1CT
	 zXvNdqnJuDmEmsE1MNbgvgsRpsow3PK0UvSmCmcMffAgcVLUv3rhKi0TQ3/j25Blyw
	 N2f8OA9l5J62Q==
Mime-Version: 1.0
Date: Mon, 06 Jul 2026 16:13:52 +0200
Message-Id: <DJRJU0NR8VX6.KP54519F454X@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
Subject: Re: [PATCH 05/30] mtd: spi-nor: winbond: W25Q32JV-Q/N: Drop
 redundant data
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com> <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-5-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-5-87e5d3122244@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============3020662091816175317=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3020662091816175317==
Content-Type: multipart/signed;
 boundary=a7b1d8d7731e7167a5610595ddb1ecaec69916d77703693ba82dfafb6312;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--a7b1d8d7731e7167a5610595ddb1ecaec69916d77703693ba82dfafb6312
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 29, 2026 at 5:22 PM CEST, Miquel Raynal wrote:
> This chip has correct SFDP support, all fields are correctly filled so
> we can drop them from the table:

You're forgetting that "this chip" is not only the one mentioned in
the comment. See the original W25Q32, which does not have any SFDP
tables and is using the same id. Effectively, we'd drop 4k support
for that.

-michael

--a7b1d8d7731e7167a5610595ddb1ecaec69916d77703693ba82dfafb6312
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaku4IBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/imPgGA2FKKNvJMVwDRh1rMIlSdKiGCNdnMK7GH
lyATF5Ko5QDEkFk1ys2rzGph7GOdyrA7AX4ooi/LSVgCCuehZR6U1iy6nhzR5AMy
fRp4fGk3tb+UPY9vpi6ncMrFb4ZaeczYGSo=
=D9zL
-----END PGP SIGNATURE-----

--a7b1d8d7731e7167a5610595ddb1ecaec69916d77703693ba82dfafb6312--


--===============3020662091816175317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3020662091816175317==--

