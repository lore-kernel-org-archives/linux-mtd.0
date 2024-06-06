Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF45C25B75
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 15:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOPOOVIrOXk/DLPgYOqBZiV2fJYGtUXPU7MuzSluPnA=; b=j6uzx29Oof9pnq4VhWdlpWo+Y1
	kdsM5sFJ8k2vl9pcXONy3zY4Ek1zaiD7OcmMeRAfIxvFUA1kmPWhrqkr6XHL8vxBVd7QEL5Sdn8A3
	5lL2LTQvC2cEQy25yiP2pCrD5yMmjro8V7/o3HZmUzC2s25dlcXdK8oU6lmnduipoe0O7hs9TzmAJ
	8Uk2rCVOMzoOUeJheREdN7mTpij42J1LUOYBvmB/KwuECY8cbYMR5TVqqqajanA66SotPzW5Y/znJ
	Ct5FLpLe/efe+23a40Xb5wQ6lt5KALcgGfykvl8VqDioqOTo9GWBr2MgBeas+v/Bf/o8VxQSqFivC
	pJp4Z74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFEhP-0000000ACtH-02e5;
	Thu, 06 Jun 2024 15:06:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFEhL-0000000ACr4-0SBJ
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 15:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56DF3CE1312;
	Thu,  6 Jun 2024 15:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0488DC2BD10;
	Thu,  6 Jun 2024 15:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717686395;
	bh=t5xQJkmzKQzOdNcS+FJKDDzMs96fqnEU6mLD06I3cxM=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=Yud4c4G8n2reoXZ4gev4eOF90XOJMKiea9vZJVbueAADAVoWBb+nvL5rJOrR7Ezkd
	 U6GrOrIg2rov/yXVuYmEz22ysYgzj5XppVKU8J4dowaZw7bynyWm97aP2nzqbn1s6s
	 VMIiKqwqIM05C6sB9sASYpOJqpslWF9mif24mDx9r1oLlUNt8Irz8cO05+w830pIBQ
	 XIplwXTNtyg1bPb8O0eZ1WCPLFpke0oEuhYNa/l3J8ISkrMtYlvoFIQhRMuVqQydGz
	 /VmWdAbSFp0PHpmvL5EahTCHDIqF6EZI9LawuGJ2cAHnuT7vOdq2MpVGRAwQ3jVyjM
	 iQks4fxpuciNw==
Date: Thu, 06 Jun 2024 17:06:31 +0200
Message-Id: <D1T10API5U80.1OKB56YTFGMTN@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rasmus
 Villemoes" <rasmus.villemoes@prevas.dk>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Esben Haabendal"
 <esben@geanix.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: core: add flag for doing optional
 SFDP
X-Mailer: aerc 0.16.0
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com> <20240603-macronix-mx25l3205d-fixups-v2-1-ff98da26835c@geanix.com> <a379a411-2c9e-4d9d-aa8f-4c4f3463cc27@linaro.org> <D1SZKLZBDDBA.1Z7ZD4UEOX05F@kernel.org> <48719b0f-1a7f-47f9-948a-c981a0a29b41@linaro.org>
In-Reply-To: <48719b0f-1a7f-47f9-948a-c981a0a29b41@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_080639_539278_C3EEA3ED 
X-CRM114-Status: GOOD (  33.91  )
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
Content-Type: multipart/mixed; boundary="===============8741911232820985299=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8741911232820985299==
Content-Type: multipart/signed;
 boundary=48bbdfa44b4d289b745038c01d8a032d6d7c501116f3081de0c010ed1031;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--48bbdfa44b4d289b745038c01d8a032d6d7c501116f3081de0c010ed1031
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jun 6, 2024 at 4:52 PM CEST, Tudor Ambarus wrote:
> On 6/6/24 14:59, Michael Walle wrote:
> > On Thu Jun 6, 2024 at 3:31 PM CEST, Tudor Ambarus wrote:
> >> On 6/3/24 14:09, Esben Haabendal wrote:
> >>> A dedicated flag for triggering call to
> >>> spi_nor_sfdp_init_params_deprecated() allows enabling optional SFDP r=
ead
> >>> and parse, with fallback to legacy flash parameters, without having d=
ual,
> >>> quad or octal parameters set in the legacy flash parameters.
> >>>
> >>> With this, spi-nor flash parts without SFDP that is replaced with a
> >>> different flash NOR flash part that does have SFDP, but shares the sa=
me
> >>> manufacturer and device ID is easily handled.
> >>>
> >>> Signed-off-by: Esben Haabendal <esben@geanix.com>
> >>> ---
> >>>  drivers/mtd/spi-nor/core.c | 3 ++-
> >>>  drivers/mtd/spi-nor/core.h | 1 +
> >>>  2 files changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >>> index 3e1f1913536b..1c4d66fc993b 100644
> >>> --- a/drivers/mtd/spi-nor/core.c
> >>> +++ b/drivers/mtd/spi-nor/core.c
> >>> @@ -2933,7 +2933,8 @@ static void spi_nor_init_params_deprecated(stru=
ct spi_nor *nor)
> >>> =20
> >>>  	spi_nor_manufacturer_init_params(nor);
> >>> =20
> >>> -	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
> >>> +	if (nor->info->no_sfdp_flags & (SPI_NOR_TRY_SFDP |
> >>
> >> I don't like that we update deprecated methods. The solution though is
> >> elegant.
> >=20
> > I actually had the same concern. But currently there is no
> > non-deprecated way to handle this case, right?
> >=20
> > Right now we have the following cases:
> >  (1) pure SFDP parsing
> >  (2) non-SFDP flashes with static configuration only
> >  (3) legacy implementation, where the magic flags decide whether we
> >      use SFDP
> >=20
> > Which case is eventually used depends on the ID of the flash -
> > assuming there will only be IDs which either fall into (1) *or* (2).
> > That assumption is clearly wrong :)
> >=20
> > I'd propose a new case in spi_nor_init_params()
> >  (4) try SFDP with a fallback to the static flags from the
> >      flash_info db.
> >=20
>
> that's not that bad, but I would avoid doing it if it's not common. You
> also have to update the core a bit, you can't use no_sfdp_flags &
> TRY_SFDP, it's misleading. Does it worth it?

IMHO no_sfdp_flags is the correct place (maybe TRY_SFDP is wrong,
maybe SFDP_FALLBACK?) because the flash is first treated like in
case (2). Then SFDP is tried based on that flag. Is it worth it? I
don't know, Esben is doing the development here ;) So up to him.

> I won't oppose too much, but to me it feels that we're trying to keep
> alive a dead man.

Maybe, but we'd have a readily solution if we face a similar
problem in the future. I'm really not sure, how many flashes there
are, but I think these magic bits (which tells the legacy
implementation to try SFDP) will mask quite a few of these.
I.e. in an ideal world where we could finally drop case (3) and
you'd need to split the flashes between case (1) or (2), I think
there will be quite some in (4).

-michael

--48bbdfa44b4d289b745038c01d8a032d6d7c501116f3081de0c010ed1031
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZmHQeBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hHwgGAywOWh3khxUUBqo9KpBYthNWyTwg5r+JC
QA2h6D760/WVfmcw3eos2/NR2VaD7UbnAYClrniZd4iKs+P3e7UCcwIUApI2SWvo
BQnsunTQYn1An7jxuUEtvWHBVYB5Mj4rGXM=
=2+Ya
-----END PGP SIGNATURE-----

--48bbdfa44b4d289b745038c01d8a032d6d7c501116f3081de0c010ed1031--


--===============8741911232820985299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8741911232820985299==--

