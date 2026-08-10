Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7331FC5AC82
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 06:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PEY41/vGV2zuRvSDIbqtP/4BfO2LeMieWW1Lgjlj60=; b=sLleLPXZjMIzNlMwCCPbHxzyHi
	rlxK//nrnUI+rOGfOvHAswgQaQmUvzB19DIuap0fWD5uWD8pBbKYFTSEz7zmMS27/oGYV0H623oNf
	k12HtpP/9t4AXPpU1RGvlm+3HmYtWb8fBFtwDQPwmqIJImIOLyNZALgfmt+9iEM1/MoDq19gIOmdZ
	ya8dHdQHCVXAWb1EiJVdcnCF+Mjd5PHc+vpB226Z7tSWcaq65ZEf7o3A9b7+f3lg0xLV+6Szg/MyL
	zgK2nbgPwHoSD+izmFkFKoRlKbh4+BGed4pbC28Nlp0ekXnVz61H1YyImept4hF8HwzdGd3HRMlTX
	0Kr+E39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJpy-0000000B9Fl-3H51;
	Mon, 10 Aug 2026 06:50:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJpx-0000000B9FJ-16fO;
	Mon, 10 Aug 2026 06:50:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E3E1140189;
	Mon, 10 Aug 2026 06:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4EDC01F000E9;
	Mon, 10 Aug 2026 06:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786344616;
	bh=iRILn+38sugb9sCfGv8f3KOltP+880VMJ26oWc9BZrc=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=VRITQWpechHsALqUipsD1uqh/BAm+QiROkr+s2kGqoaGx+fJJhmj1bVfWUKOzyF1I
	 243OUZsGNXX04mH8fn7bdPYV9S9yWZcHocjLO9uuiaqcn5bC9OrmtrPz8RwfmDLJO5
	 NP2TCf9kqNEdQRxskvS3uU92IsQGmkwJkKv7QGOaJzLpThb/Wzajj/eDsgnhVnUdum
	 DWmx1L5Oq6N9bmVAE16V5aah6pkjqOAPhCMzdRdB/UUtbqnU+Fk494+/fvFB/xbz3m
	 FgjjnNr9bfav/5STasx4ebeR246CLSwSkZcPYn8z1Pk8I/0rsErH3Aa80FWhv//aGh
	 4nQYwjMe+vmMg==
Mime-Version: 1.0
Date: Mon, 10 Aug 2026 08:50:13 +0200
Message-Id: <DKL2BE8MZUQJ.7GKQF4IIQEJN@kernel.org>
Subject: Re: [PATCH 1/5] mtd: spi-nor: Refactor Read Status/Write Status
 support
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi
 Wang" <hsinyi@chromium.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com> <20260529-winbond-v7-1-spi-nor-rv-addition-v1-1-f3ae18502d5a@bootlin.com> <DJS8PQ5HZZG5.2YT956NCDX8MG@kernel.org> <87mrv2exwp.fsf@bootlin.com> <87y0ekek8r.fsf@bootlin.com>
In-Reply-To: <87y0ekek8r.fsf@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============7960762591264583113=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7960762591264583113==
Content-Type: multipart/signed;
 boundary=108a668caa49fd7b7a3d2fdd1bfe3040e65f1c770867e6e200a50a6fd323;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--108a668caa49fd7b7a3d2fdd1bfe3040e65f1c770867e6e200a50a6fd323
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Aug 5, 2026 at 4:04 PM CEST, Miquel Raynal wrote:
> Hello Michael,
>
>>>> +int spi_nor_read_srs(struct spi_nor *nor, u8 *sr1, u8 *sr2)
>>>
>>> nitpick, i think this is a weird name. But maybe it's just me.
>>>
>>> What if we'd just make the one status register as u32? I mean in the
>>> winbond datasheet it's called S7-S0 and S15-S8. That way we also
>>> don't need a two byte qe_mask. To optimize the standard usecase to
>>> poll the WIP bit, we could add a byte mask.
>
> I experimented a bit the u32 status register, I don't think it is a good
> idea.
>
> My target of improving the readability is completely defeated by the
> fact that:
> - all the callers need to add extra maths to explain what SR
>   they want

Actually, what I had i mind is that there is no more SR2 and so on.
But just one SR (and the BIT macros will change of course). Some
datasheets are already naming the bits B0 to B15.

> - endianness shall be handled, people always get it wrong (including
>   me), so why bother if an array just makes the whole thing simpler?

Where would you need endianess? If at all, just in the core, which
will split the u32 into two u8.

 sr1 =3D sr & 0xff;
 sr2 =3D (sr >> 8) & 0xff;

> - 16-bit accesses get more convoluted, we need extra
>   get_/put_unaligned_le32() calls and pack/unpack bytes in the hot path

There is not really a hot path, is it. Not in a sense that it
matters for performance though.

> - 8-bit accesses imply an extensive use of FIELD_GET(GENMASK(),) macros,
>   which make the whole fonction totally non obvious anymore.
>
> Whereas, a simple:
>
>         if (sr2)
>                 *sr2 =3D foo;
>
> is self explanatory. I also do not really get the wish for a QE mask
> instead of a two bytes array.

Because IMHO an array of two u8 (which your qe mask is) is never
self explanatory. While with

#define SR1_QUAD_EN_BIT6 BIT(6)
#define SR2_QUAD_EN_BIT1 BIT(9)
#define SR2_QUAD_EN_BIT7 BIT(15)

you can just use the macros as before.

-michael

> So I will rename the "srs" naming that you dislike, I will group the
> opcodes in a big structure, change the baseline default to match your
> suggestion and follow-up with the other minor comments, but I believe
> I'm going to avoid the u32 switch.
>
> Thanks,
> Miqu=C3=A8l


--108a668caa49fd7b7a3d2fdd1bfe3040e65f1c770867e6e200a50a6fd323
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCanl0pRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iogAGA89cQMSlurX4IOjh5UXHyYxiP6nKXuPpu
GnLfLbqgUNErNzI1KqDl8UBKymaldsIHAYDEvVfxfvBM80pcqQs5Jm3vLbPoN3Hc
ukFhmMhuJQ1VYm5lbAnrW1Fa2FiGM15m5CU=
=OrPb
-----END PGP SIGNATURE-----

--108a668caa49fd7b7a3d2fdd1bfe3040e65f1c770867e6e200a50a6fd323--


--===============7960762591264583113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7960762591264583113==--

