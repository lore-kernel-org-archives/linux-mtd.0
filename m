Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6758C83F1A
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jul 2025 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5tNHwQZPWoIFxJd1sPGKj31sRIDaKEV4bxQJamuZos=; b=EvN8uFlHShpVNrG7zz4oN8+fWh
	NHepJuceG7vARtHYXKpIwUsjO3ttU3uDnFuNn0xCDULYB2MYDYBdYY2j4oJe9TfKCcOl3251/Rffu
	CFx9Hf4dDczRdh/JnjioQZuEhrbJFVotNLpQrcbzkOcU4PRk1iMQsRB/fGcoccJLO4haReTT2rSiE
	AL9PRjhddpV74G5Z2BCtsZMRWApuQIYavLKbqFNVkqTXrnctmYmHo17gO6EzW/N3Oqy5RZbqvZtq5
	nISntJ7ifj8rURNQiRW7Ug+N3kaaqV8IQ9Bs7+m/su3G9SdM6UNTeMNK70QI/2vV8r8nAgV8mAViQ
	6YaRNHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDtQ-00000002gfG-2LB9;
	Tue, 22 Jul 2025 14:22:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDPJ-00000002bKf-2IvP
	for linux-mtd@lists.infradead.org;
	Tue, 22 Jul 2025 13:51:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC9AB601FB;
	Tue, 22 Jul 2025 13:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD205C4CEEB;
	Tue, 22 Jul 2025 13:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753192308;
	bh=VakZKKnUbpQ2tyJo/9Ti6S/BvWQx1CCmjdif3cutG1k=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=IEdeGY+idZh/JlTGJu8q6FLSKR0gOHCv784m9e3X6/GVU/3SQp9pitmRRal9jZBdr
	 fVuJUe+LzZX6WF695Df7YB1OCgPYOxScmN+MGhSZ2MPmnBnOR/K+UakP5x+fzCJdgG
	 krxjKGwQYQp5XbriXYl/jSxVKX+HnQlf3UmV96IyiOitwtw/icoNtxPukzvxqzlTHI
	 dYJscgEPsa9Jm5UgWOSFyJfNjLj8ZOo4b57dlrpbpKodsoQwEPU6c4TYFrkF7ixvlh
	 uOjUSeIh9xGQaTQhK8FrI0YhOepk284kuC7I/AcAdXBsUm6pIljl/UgqoGBZLBMiYH
	 Y2Ss+3RrNzETw==
Date: Tue, 22 Jul 2025 15:51:44 +0200
Message-Id: <DBIMSXRWMT9X.1030Q3NLFE83Y@kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: Add support for W77Q51NW
Cc: <linux-mtd@lists.infradead.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Marek Vasut"
 <marek.vasut+renesas@mailbox.org>
X-Mailer: aerc 0.16.0
References: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
 <9eabfe619554cbdd493086dcffef8f44@kernel.org>
 <c13f39b5-020d-4553-a79f-e22a0cbd1dfa@linaro.org>
In-Reply-To: <c13f39b5-020d-4553-a79f-e22a0cbd1dfa@linaro.org>
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
Content-Type: multipart/mixed; boundary="===============5078729081544239007=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5078729081544239007==
Content-Type: multipart/signed;
 boundary=f39008052706824fb663390bc6caa983138aaa342a0ed11310985f88e26e;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--f39008052706824fb663390bc6caa983138aaa342a0ed11310985f88e26e
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Jul 22, 2025 at 11:37 AM CEST, Tudor Ambarus wrote:
>
>
> On 7/22/25 9:43 AM, Michael Walle wrote:
> > Hi Marek,
> >=20
> >> --- a/drivers/mtd/spi-nor/winbond.c
> >> +++ b/drivers/mtd/spi-nor/winbond.c
> >> @@ -343,6 +343,10 @@ static const struct flash_info winbond_nor_parts[=
] =3D {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .id =3D SNOR_ID(0xef,=
 0x80, 0x20),
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "w25q512nwm=
",
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .otp =3D SNOR_OTP(256=
, 3, 0x1000, 0x1000),
> >> +=C2=A0=C2=A0=C2=A0 }, {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* W77Q51NW */
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .id =3D SNOR_ID(0xef, 0x8a=
, 0x1a),
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .otp =3D SNOR_OTP(256, 3, =
0x1000, 0x1000),
> >=20
> > Did you also test the OTP read and write? I'd guess so, because otherwi=
se
>
> Any of you interested in adding testing requirements and examples for otp=
?

Let's add this to my pile of "things to do when I'm having time
again" :)

>
> > you wouldn't need that entry at all, right? Or is it because of the
> > winbond_nor_late_init() which will be called as a manufacturer fixup?
>
> M,
>
> the overwrite of set_4byte_addr_mode in winbond_nor_late_init() seems a
> little trashy, we assume that winbond will always use
> spi_nor_set_4byte_addr_mode_en4b_ex4b(), apart of the extra ops that we'r=
e
> doing there. Aren't we better without this generalization?

Not sure where that comes from originally. But we are overwriting
what SFDP is figuring out, correct? Maybe we should do the same as
in macronix.c; just set it when it is not set. If the SFDP doesn't
specify the method, I'd say it is a fair assumption that any (older)
winbond flash use that stateful method to enter 4 byte addressing
mode. Newer flashes probably features SFDP.

For the extra ops.. I'm not sure if that is/was just a quirk for
that particular flash or if any winbond flash has that problem.

-michael

>
> > In that case we could do the same as in commit afe1ea1344bb ("mtd: spi-=
nor:
> > add support for Macronix Octal flash").
> >=20
> > -michael


--f39008052706824fb663390bc6caa983138aaa342a0ed11310985f88e26e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaH+XcBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jWEAGApIIE/MDSnt49pTFVFfBPqz+IVUUv0NFs
R9B/CUoXpRWElmRovIj3JjSnrWZ4pCmGAX46gfSJ4fAieQXaP+fczayZQzhnwM2k
Kpzz9aPnEHLQJUsvcHvNUv59l9ampSC/L6M=
=GoqN
-----END PGP SIGNATURE-----

--f39008052706824fb663390bc6caa983138aaa342a0ed11310985f88e26e--


--===============5078729081544239007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5078729081544239007==--

