Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A34C3DA47
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6jctTqCYWFo2XynFzCoD0yAKOpoBVaX2+DSxlj160E=; b=otyXGC/eSwrQnFFVJ5+zbxzAEG
	KVadxAmIOjYnwxjMYbyk2HjXiFhWvL7YwHpTK9cnmvNpKtZ04qH3Q5cUI8KA9Dmuq/IzCdU71yzNy
	+fRYl4bVx7iE5IVw+/WjnzrKem414UrUTvHrfFE/XwVcmOgCg6JoYkZPaBr19NBleJwH7shGsvFCW
	kZlh+laexIdGKBB7JMdP0Qka2Ekv3hSKo+cZwr74AjWhyISLKT5NLKCMUqsWHOqo2YbPbB6jVV7mt
	SW6C1Ght1+2edBBTGlv0UrL67q+onZjTeiuxOFWbMypQgeW1As1ygvVbw/RxrQh5JnQVT2KFtf0ZM
	as/YMPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRphV-0000000DHai-3aD0;
	Thu, 11 Jul 2024 09:02:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRphS-0000000DHZs-3X8v
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jul 2024 09:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E1C161C22;
	Thu, 11 Jul 2024 09:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB79FC116B1;
	Thu, 11 Jul 2024 09:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720688569;
	bh=i9vhBcgM+kslb9tjmXIu2Ni6MbJN5bXv00H5799sU0s=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=UTAh+PNIC8oY2FsfTnf13lwV6IGg52xwu2XhBlvpDWKHAELQ6uOEUflhyzwxLBdQb
	 QAeB6ERxKJ6MpgeHvvylrW2/5F6Y/r6FBDCcIK14tVFHvtBNkhByO/jZT2uY1u99a7
	 Rvy0FHkqKlf46XNLdvGjQRkpQO+P0gNiLw8DYFNXpGNEQqKXMVKxdEuKgkUg3Xyg6p
	 4v4CJBszwfZhi2+pgyCjJmoAdAcmE+576rhm9OwSmXkn35aTeqpb1IY/ul30vspeAa
	 YaIIwy9SAiXDT0GscOQ4Sj+wp5ngtfOYSVO7RNOWGKxDzkq/lLpBslF5SNArK9J5r6
	 tBEjb9064M+jw==
Date: Thu, 11 Jul 2024 11:02:39 +0200
Message-Id: <D2ML6RG09T38.RZU3CCH0XD9I@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Esben Haabendal" <esben@geanix.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: core: add flag for doing optional
 SFDP
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Rasmus Villemoes"
 <rasmus.villemoes@prevas.dk>
X-Mailer: aerc 0.16.0
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com> <20240603-macronix-mx25l3205d-fixups-v2-1-ff98da26835c@geanix.com> <a379a411-2c9e-4d9d-aa8f-4c4f3463cc27@linaro.org> <D1SZKLZBDDBA.1Z7ZD4UEOX05F@kernel.org> <871q413x72.fsf@geanix.com>
In-Reply-To: <871q413x72.fsf@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_020250_968643_B8BAB3F1 
X-CRM114-Status: GOOD (  17.40  )
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
Content-Type: multipart/mixed; boundary="===============1805023888060099999=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1805023888060099999==
Content-Type: multipart/signed;
 boundary=fe1ae7df5776f1f2d791dc960f71a027ee6121d702749e13e956e1272f1d;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--fe1ae7df5776f1f2d791dc960f71a027ee6121d702749e13e956e1272f1d
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Esben,

> > I actually had the same concern. But currently there is no
> > non-deprecated way to handle this case, right?
> >
> > Right now we have the following cases:
> >  (1) pure SFDP parsing
> >  (2) non-SFDP flashes with static configuration only
> >  (3) legacy implementation, where the magic flags decide whether we
> >      use SFDP
>
> Actually, in the code we have two variants of 2.
>
> (2a) non-SFDP flashes with SPI_NOR_SKIP_SFDP set
> (2b) non-SFDP flashes without SPI_NOR_SKIP_SFDP and with none of the
>      DUAL/QUAD/OCTAL read bits set

Isn't (2b) my case (3)? The SPI_NOR_SKIP_SFDP flag was intended to
be for flashes we know for a fact, there are no SFDP tables.

I'm looking at spi_nor_init_params(). Maybe I'm missing something?

-michael

> These almost handled the same way. But
> spi_nor_manufacturer_init_params() is only called for 2b, and not for
> 2a.
>
> Is this desired behavior, or something that we want to align?
>
> > Which case is eventually used depends on the ID of the flash -
> > assuming there will only be IDs which either fall into (1) *or* (2).
> > That assumption is clearly wrong :)
> >
> > I'd propose a new case in spi_nor_init_params()
> >  (4) try SFDP with a fallback to the static flags from the
> >      flash_info db.
>
> /Esben


--fe1ae7df5776f1f2d791dc960f71a027ee6121d702749e13e956e1272f1d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZo+fsRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/h1MAF7BL/jDkLdqERlyUh+I/4t+kL1NUWGFmhu
bS97ljXW9gaw1lviFreW1tMzWHMxWysVAX9f66V0w0fvkut5oECvJRvE51x/yrW1
Zib+7kOeztZN5UtkOvyZwIM33p0xpxdO4SA=
=G+o7
-----END PGP SIGNATURE-----

--fe1ae7df5776f1f2d791dc960f71a027ee6121d702749e13e956e1272f1d--


--===============1805023888060099999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1805023888060099999==--

