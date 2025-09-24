Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97480CAC5B0
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Sep 2025 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4qExZx3ELZOtRAlz1kSmZWjxhMQFQq/Vp8Sk3TaBxc=; b=K/poPoHjgwYJ+LEG9tIwJKYpwq
	w9plgdYvMElB4ks2gp2MtSV+P41c4/oklG39qju+WWqJslr8XxuZG9HSQUb53PgHJO27pC3qqwLHt
	P6sBXNa0rADqxR50Cu1O6wkYcxRV8TFoOHGLJaONl5Q5yGAMYdZcDPONGy8Bpcfw6aWszF0Rrt3Vf
	l0AnDjvfZ/bm9tXVRN/R6Xpfzx0qGmlGV0VCuhHbCDQGQExNbQ6/M7iuB9BY37d1/WxXLO4Esw2vL
	Kw5xbEv9Fzf1sqXgQnrJVeQr/hTroKvhX+rrZ3PPaLwbdeGYMIiLHveXDVfAT6u2cYmKwe6a8c9wc
	i9boHFMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ODF-0000000HCek-2AHy;
	Wed, 24 Sep 2025 12:03:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ODC-0000000HCcF-1V5l
	for linux-mtd@lists.infradead.org;
	Wed, 24 Sep 2025 12:03:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD910445FF;
	Wed, 24 Sep 2025 12:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F62C4CEE7;
	Wed, 24 Sep 2025 12:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758715385;
	bh=+B+OUhZLRp5+DRENRW7wYa36d4OKd15N5WpwYCavEfY=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=GIl/oEgjiQWlSVEcLI/9NArayrrZAoMUU3Z+tIkjUX/s4WYgLvYf0D4iE4xhIdp2b
	 kA5I0Xw+i8UyJPgVwnsakxFoDYtC68D0VxqenNPz4YwZL1RWHjpH4zCR/QkaFiCJdQ
	 SWY7jKRQMHeIDDjxyMkhuuN39oa9sWFC+UYBLXK2PfSVBLJcEqQaOr6Tke6Tq/ySFf
	 5+ELWbvm06BPolc29fw1B+qC2Gm9Muha8egxrA5YYn0nhX3GUXRJb8viL+MYJ5PS7G
	 kFR4aNOj6mIWKK/4cIE1xicxOS9VffzOlZ9tmp+7c3Q95uQ5Q+AcySpJq34AHB6z4A
	 niknm7OEMYSzA==
Date: Wed, 24 Sep 2025 13:57:34 +0200
Message-Id: <DD10GE4EOCD7.CPTN7198QFUV@kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: use RDCR opcode 0x15
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Boris Brezillon" <bbrezillon@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengminglin@mxic.com.tw>
From: "Michael Walle" <mwalle@kernel.org>
To: "Maarten Zanders" <maarten@zanders.be>
X-Mailer: aerc 0.16.0
References: <20250922155635.749975-1-maarten@zanders.be>
 <20250922155635.749975-3-maarten@zanders.be>
 <DD08QRGQSU2G.1GB9CNQJV82CW@kernel.org>
 <CAPB_pELazUPccKa72_m7vb80Z7wLRO+PpgfeY-afDHSgg4eVNg@mail.gmail.com>
In-Reply-To: <CAPB_pELazUPccKa72_m7vb80Z7wLRO+PpgfeY-afDHSgg4eVNg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_050306_437872_B407BB04 
X-CRM114-Status: GOOD (  42.20  )
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
Content-Type: multipart/mixed; boundary="===============0902433575809864489=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0902433575809864489==
Content-Type: multipart/signed;
 boundary=ffb5be01501268f325e693a8443cb813f8a298cbd0b29ab9e4f70b750bdd;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--ffb5be01501268f325e693a8443cb813f8a298cbd0b29ab9e4f70b750bdd
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Maarten, Hi Cheng,

On Wed Sep 24, 2025 at 11:00 AM CEST, Maarten Zanders wrote:
> > Why isn't that also true for this device? It supports SFDP. Does it
> > have a wrong value there?
>
> You're right. I started working on this issue in an older kernel and
> didn't check the full error path again on the most recent version. I
> noted that the CR opcode was still wrong and went ahead forward
> porting my patches without checking the erroneous behavior in the
> latest kernel. My bad!
>
> My particular part (MX25L12833F) has been working (by doing 8 bit SR
> writes) since 947c86e481a0 ("mtd: spi-nor: macronix: Drop the
> redundant flash info fields", 2025-04-07). This ensures that SFDP data
> is read and behavior after that is OK. Before that commit, the SFDP
> data wouldn't be read because the .size was filled in (and before that
> because of .no_sfdp_flags). That in turn triggered the 16 bit writes.

A missing size only *mandates* a configuration by SFDP. But that's
not true the other way around. If there is a size, SFDP might still
be evaluated and will overwrite any static configuration. But for
your flash, that's not the case, because of legacy behavior this is
only done for flashes which are multi i/o, see
spi_nor_init_params_deprecated(). Sigh. What a mess.

But in any case, commit 947c86e481a0 ("mtd: spi-nor: macronix: Drop the
redundant flash info fields") is clearly wrong as it will drop
support for older flashes which doesn't feature SFDP. Cheng can you
look into that please?

> > But I'm also not convinced that we should fix it that way. I just
> > had a look at a random macronix flash MX25L12805D and it doesn't
> > have that opcode. Thus, just adding that to all the macronix flashes
> > doesn't make much sense. But it also doesn't seem to have a WRSR
> > command that takes 16bits.. and the core unconditonally set
> > SNOR_F_HAS_16BIT_SR. Hum.
>
> Yes. That part (MX25L12805D) has the same ID code whilst it is not
> supporting SFDP, RDCR or 16 bit SR writes (according to the
> datasheet).
> With the current flash info & logic in core.c, it will no longer work
> at all as spi_nor_parse_sfdp() fails.

Yes! I fully agree.

> Consider a different example: 8M devices MX25L6433F, MX25L6436F and
> MX25L6473F. The ID for these is 0xC22017. Flash info for this contains
> a .size field (probably because of the legacy MX25L6405D) so SFDP will
> not be parsed and we're falling back on the defaults - so it will do
> 16 bit SR writes. CR will get corrupted due to wrong CR read opcode.

Yes, but again not because of the populated .size but because it
doesn't have any multi i/o flags set.

> So I believe this first problem boils down to the same ID representing
> both flashes with and without SFDP. If we want to keep supporting the
> old non-SFDP devices, the .size should be filled in for those ID's. Or
> we drop support for them altogether and make SFDP a hard requirement
> (solving the other issues in one go). But it should be consistent
> across the different sizes.

Honestly, Macronix is know for duplicating flash id with flashes
incompatible with each other. I have mixed feelings about reverting
the commit mentioned above. On one hand, it takes the very easy way
to just brush off support for older flashes without even mentioning
it. On the other hand, it seems that only Guenter Roeck noticed.

> > So maybe just clear the SNOR_F_HAS_16BIT_SR or add SNOR_F_NO_READ_CR
> > for the macronix flashes by default as a fix. Not sure what's better
> > here.
>
> SNOR_F_NO_READ_CR doesn't help: this will write all 0's to the CR in a
> 16 bit SR write, which is not the default state of some parts
> mentioned earlier.

Mh? You've said:

  Other Macronix parts avoid this issue because their SFDP data
  specifies that CR is not read (BFPT_DWORD15_QER_SR2_BIT1_NO_RD),
  and the driver assumes CR defaults to all zeroes which matches the
  hardware register.

Also isn't that the same behavior as with the SFDP? But I agree,
that if the clearing the SNOR_F_HAS_16BIT_SR is probably better.

> Clearing SNOR_F_HAS_16BIT_SR could indeed be a solution for letting
> these parts work properly in this non-sfdp mode. But we probably
> shouldn't do it for *all* Macronix flashes?

Well as I said it's a mess right now. Moving forward we should
probably have a static configuration and try to parse via SFDP even
on non-SFDP flashes. Pratyush, any opinions?

>
> > Then on top of that you might add the RDCR opcode, although
> > I'm not sure for what it is used then.
>
> There wouldn't be a real use until someone starts actually
> implementing the features in the Macronix CR (like top/bottom SWP). Or
> untill someone else is changing SNOR_F_HAS_16BIT_SR logic due to
> additional SFDP/BFPT parsing. Which I still consider a risk due to the
> weak link.
>
> > > Fixes: 10526d85e4c6 ("mtd: spi-nor: Move Macronix bits out of core.c"=
)
> >
> > I doubt that this is the correct Fixes tag as this only moves code
> > around.
>
> Essentially, I meant 'since the beginning of macronix introduction'.
> In such a case, should we dig further through file renames & stale
> LTS's?

Probably, the patches won't be backported automatically anyway
because of the conflicts. But it might be a good argument to have a
(manual) backported fix.

-michael

--ffb5be01501268f325e693a8443cb813f8a298cbd0b29ab9e4f70b750bdd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaNPcrhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jxPgGAyj2fme+/9AWLihM5hMd39RF55aKY78Xs
JiQeGZNLHUqO6L7ok3y4ItkGMcXvPe3GAYDTFH6pCXSrAFcmDtjIdP0NAfYKfQUB
g3kxNYwgwIm9jK0jDYBNOt0Ip6SxHfkOwRg=
=Bv9D
-----END PGP SIGNATURE-----

--ffb5be01501268f325e693a8443cb813f8a298cbd0b29ab9e4f70b750bdd--


--===============0902433575809864489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0902433575809864489==--

