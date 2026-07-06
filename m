Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F26C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKGEx3Ol1H+N1c/codHj/a6qmaNYiwiuD6kHiugvvpI=; b=xw/5F+45BagtnpwML47t2nmTEE
	3Nj/j1mseEV0pQ+siAWcg/W/jp48OvQ2xtLAxF/vdGPn03v6FVQHBYJejA4GgWOnyx0gergliRLx0
	mWAYVt2jYHncnAJXrOeDlH0/WPt+kS4DeX0h0QmiIMYNo1JIb66VlnTAbdAe8TVyWraTZFVZRhjzl
	/bsr/OUcNf97TKApm/3HtrFVuaMIF7zfX35KV+uwCF7UtLIjsuO6sFg22ixKNnCPZqKPvZq+0rFXx
	V5C+RwDCnoycI9IHyUCfJHg8Ih93c+aCZVW2Rt5SEZ1yBJ8mO6TjnrejXXuNsKeIo5gZPncuKqHE6
	RjXs+v+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkEI-0000000CkF7-2Hqw;
	Mon, 06 Jul 2026 14:23:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkEH-0000000CkEu-1T5N
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 14:23:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 08BB24336D;
	Mon,  6 Jul 2026 14:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 66D2D1F000E9;
	Mon,  6 Jul 2026 14:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783347804;
	bh=ijYLZek/BaPu9MO0Vb+mwhVDyX5JAuLWY7obNEzELYg=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=PD/b/StlHv/EsoP+s8tfUBF/p120goN5WhTa7aaJNLHHUFA2EB/M27VJyxLZ8c4ez
	 RTKEGrS3mliG4Dgkh0WgveU0puSGUesrv7xpiZHggjz3gq5Jm4YvZNJKsUK5AtXF9a
	 D66Rn1LltXXIDTpwWgosblvTZkOr+NE5JBuvX3Ab2UoT3K3v7EhqSaXFLqKXsik4pV
	 6Q/JZQUm1P+OSfk3wj22NJt6a7FwJFOxSV7Reuq/ZWXn6rjCLj2wmA203p9/MEW0oE
	 ur96/mjYwJX25h+ezLXDOx3NZObwrbXROrXeAHAjE8lY9IjDRM6dxe/vfd6gSTe5ea
	 8cKpAhy9GA05g==
Mime-Version: 1.0
Date: Mon, 06 Jul 2026 16:23:21 +0200
Message-Id: <DJRK19XOKGDQ.2PTH6LFRAOWZF@kernel.org>
Subject: Re: [PATCH 16/30] mtd: spi-nor: winbond: W25Q32JV-M: Drop redundant
 data
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com> <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-16-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-16-87e5d3122244@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============8038424599447164713=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8038424599447164713==
Content-Type: multipart/signed;
 boundary=f02cc2a119316f68cd97bf7bfaa67ba0a8c20db2d7e68e773364c8ab49b5;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--f02cc2a119316f68cd97bf7bfaa67ba0a8c20db2d7e68e773364c8ab49b5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 29, 2026 at 5:22 PM CEST, Miquel Raynal wrote:
> This chip has correct SFDP support, all fields are correctly filled so
> we can drop them from the table.

I haven't checked, but there is probably an older chip with this id
and without SFDP.

-michael

--f02cc2a119316f68cd97bf7bfaa67ba0a8c20db2d7e68e773364c8ab49b5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaku6WRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gU0AF/YQyMg5gedWsUg+dC3HWnvUsP7QlaJYyO
eSye0+7e8MCMB5dKbKR0RFQJlYyl9er6AX4rfHY1lBrcff95MqOyuZsBlwQ7/7B8
SA1suGx0+8XCt89/HyMwfzMrGBtJeSy9Sd0=
=gslG
-----END PGP SIGNATURE-----

--f02cc2a119316f68cd97bf7bfaa67ba0a8c20db2d7e68e773364c8ab49b5--


--===============8038424599447164713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8038424599447164713==--

