Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6C7C44500
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XYmqGTHeK2GamD8hc4gZNB1r+r+DYH4pdZcXBJ8d5U=; b=0obcGvHcpgpfpJRfq1vx1dbxdd
	Jm9b8P1TDBWpvuvkl+Tf8+4ii1ZnJCBGzKYfR5l39TIUBqeCeaBki4wmDEVEikfwJid9ikN7dNFbB
	6T8skT0im/CjHeFPeEiMF1clsPcoRJ2t2TqXuptjsIIzz0MpoDMbx3akyUOaLeYMXpei+lbGWTxYy
	0/z7QED3EDe5Tfq3wQwl6Aaee3hfVsg1XxhHFa+QzC8JYavYMX6wC+OgtGoKOlY29FwM4U5dLUteS
	2LOetSLkNVNjhglTqiT2WB9P+GDhTqbxUI9WkXF4HDqItvDDfOhRSK85Yc7zmAFjUb+5+qvEUjuHD
	zrSlmCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkIN-0000000CkWw-022x;
	Mon, 06 Jul 2026 14:27:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkIL-0000000CkWZ-0uuH
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 14:27:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E5760436E1;
	Mon,  6 Jul 2026 14:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 50CD81F000E9;
	Mon,  6 Jul 2026 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783348056;
	bh=NttK9ZzHdYlv9SqL/WI5i9mHFRr8Mo/ogLNc/4DVFt4=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=V1b9OZVp0Tzg6flkee5G4e/F4ppXVJfmItYgEy7nzKRZF7OzP/SlJzB7WqZ+UH4cv
	 eLao/7ZVfV4+NUthe1wBmNO6wf10UJ5NZtkLNwz5AqIiqDgYot0ef3FggZ6S92qfuX
	 VBQCEslh8LAeatKti+MPVRF27lj2xaI2gYcu4RruHEJ05KbfKdFY7KL262uiYPN7qf
	 01Lu1aN+r0xFvRp4b5myxPZPK3nAy3RpL81RzPZ4j745pGWAX/DjgOoq4KPwAp4TO2
	 sNYsaG/c2INs7wkJkB1zWsAjQyT7KflD+h5R94MVRMsyEU7edcoqIcgHvEdKsVN26e
	 MNomXHTwqUx0w==
Mime-Version: 1.0
Date: Mon, 06 Jul 2026 16:27:33 +0200
Message-Id: <DJRK4HNYJ2LP.KDV5AMR7FCE4@kernel.org>
Subject: Re: [PATCH 00/30] mtd: spi-nor: Clean Winbond W25QxxJV family
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============8482214695099052316=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8482214695099052316==
Content-Type: multipart/signed;
 boundary=897cfef71d9ed790e54b1bea0c56aac9f8b791818ea4d4ae46b0a36e96fc;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--897cfef71d9ed790e54b1bea0c56aac9f8b791818ea4d4ae46b0a36e96fc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 29, 2026 at 5:22 PM CEST, Miquel Raynal wrote:
> Thanks to Winbond collaboration, I was able to test almost the entire JV
> SPI NOR family. A few chips could not be sourced, I decided to apply the
> very same logic than the other chips, all of them behave identically as
> shown in all the logs that I am sharing in each and every commit.
>
> This series is pretty straightforward, it is here to cleanup the JV
> entries by:
> - Removing the useless part names (which are going to become a problem)
> - Aligning the comments and "fixing" the chip names in them
> - Reordering the chips by density and family
> - Testing and showing all the SFDP content and passing all the SPI NOR
>   tests to ensure a good level of support.
> - Describing only what needs to be described, parsing the SFDP tables
>   otherwise.
> - Adding all the locking information when it is missing.
>
> This work is necessary because I am about to propose the addition of the
> W25QxxRV family, whose IDs actually collide with the JV chips. The chips
> are similar, they have been "improved" (especially the silicon/engraving
> smoothness) and we have a way to differentiate them based on their SFDP
> content, but that will be for a following series.

Why do you need to remove the no_sfdp_flags? I have only looked at
some of the patches, but overall it seems we'd be dropping support
for older chips - which we don't know if they are in use or not.

So although the comment might only point to one chip, there can be
many more with that very same id. And now.. with the RV family even
more. Ugh.

-michael

> NB: There is one collision with a Spansion chip as well (S25FL064K). On
> my side I commented out the Spansion entry to make sure the core was
> taking the Winbond entry (by alphabetical order) but it is due to an old
> joint agreement and is a legitimate ID duplication. We haven't found a
> good way to differentiate them so far, so I am keeping this aside for
> the moment and just assume we will have a solution later. In all cases,
> the colliding Winbond ID exist and is already fulfilled, so let's make
> sure the definition is accurate.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> Miquel Raynal (30):
>       mtd: spi-nor: winbond: Move W25Q01NW to its right place
>       mtd: spi-nor: winbond: Normalize names
>       mtd: spi-nor: winbond: Stop filling the .name entry
>       mtd: spi-nor: winbond: Make the RDCR fixup Winbond wide
>       mtd: spi-nor: winbond: W25Q32JV-Q/N: Drop redundant data
>       mtd: spi-nor: winbond: W25Q64JV-Q/N: Drop redundant data
>       mtd: spi-nor: winbond: W25Q512JV-Q/N: Drop redundant data
>       mtd: spi-nor: winbond: W25Q32JV-Q/N: Add quad page program capabili=
ty
>       mtd: spi-nor: winbond: W25Q64JV-Q/N: Add quad page program capabili=
ty
>       mtd: spi-nor: winbond: W25Q128JV-Q/N: Add quad page program capabil=
ity
>       mtd: spi-nor: winbond: W25Q32JV-Q/N: Fill locking information
>       mtd: spi-nor: winbond: W25Q64JV-Q/N: Fill locking information
>       mtd: spi-nor: winbond: W25Q128JV-Q/N: Fill locking information
>       mtd: spi-nor: winbond: W25Q512JV-Q/N: Fill locking information
>       mtd: spi-nor: winbond: W25Q01JV-Q/N: Fill locking information
>       mtd: spi-nor: winbond: W25Q32JV-M: Drop redundant data
>       mtd: spi-nor: winbond: W25Q64JV-M: Drop redundant data
>       mtd: spi-nor: winbond: W25Q128JV-M: Drop redundant data
>       mtd: spi-nor: winbond: W25Q32JV-M: Add quad page program capability
>       mtd: spi-nor: winbond: W25Q64JV-M: Add quad page program capability
>       mtd: spi-nor: winbond: W25Q128JV-M: Add quad page program capabilit=
y
>       mtd: spi-nor: winbond: W25Q32JV-M: Fill locking information
>       mtd: spi-nor: winbond: W25Q64JV-M: Fill locking information
>       mtd: spi-nor: winbond: W25Q128JV-M: Fill locking information
>       mtd: spi-nor: winbond: W25Q02JV-M: Fill locking information
>       mtd: spi-nor: winbond: W25Q512JV-M: New chip
>       mtd: spi-nor: winbond: W25Q01JV-M: New chip
>       mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Drop redundant data
>       mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Add quad page program capabi=
lity
>       mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Fill locking information
>
>  drivers/mtd/spi-nor/winbond.c | 147 +++++++++++++++++++++---------------=
------
>  1 file changed, 73 insertions(+), 74 deletions(-)
> ---
> base-commit: 361a4eb81d0bb23dd27919f969e14a4a372af6e2
> change-id: 20260529-winbond-v7-1-spi-nor-jv-cleanup-817889edd1f7
>
> Best regards,


--897cfef71d9ed790e54b1bea0c56aac9f8b791818ea4d4ae46b0a36e96fc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaku7VRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/heYgF/QwpRPL/l9UinII/Ypje8P/i42l4AwZIR
hWjbuWQXjF2iiyvwnf7g4EFgTVA4MWamAX9gXaoyIRfxfkYeNwafqyNUhwsl46Kz
w4LlcUg7olboMcBDLETiPMIcaR6/AWrQIK8=
=UoxH
-----END PGP SIGNATURE-----

--897cfef71d9ed790e54b1bea0c56aac9f8b791818ea4d4ae46b0a36e96fc--


--===============8482214695099052316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8482214695099052316==--

