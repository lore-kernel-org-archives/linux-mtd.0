Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78739C88E4C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 10:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgrDvSigXxzfR8vYuIf/R6ctBws3zeZtFZpZfZAv7kQ=; b=wDVYIc7aeFdeyblYEYFwL14QjA
	5NXneKFtcLti6UbDumujXMNjjO5Owhm2r/BQIH76ZocHYYWyGd5N1TSPpR9c7Vbdbx1+EDi2ZqTwD
	qj/PKQ3TJ2KpCIdTstyRKPxV1WocBxabzswHSwJCY0rv2l2JcUbxJWTzncYy5E3VizP6otqGrYFZT
	7p3gmx5NohwvAIw8tOAj2XIISiiz9mWdh/9UyUItvDbPrd1AyPy7vcdqeU4XidOd0Gaot0V32ogPN
	mXXzqDrJ9oWWoV89faqP9f5P2sAvjqkapleD9oEF+RVMuW8DlkYmXZMsRHaIvhHY3smvagcH0xB0V
	zdJAO0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4y3Q-0000000GJi9-3emg;
	Fri, 11 Sep 2026 10:00:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4y3O-0000000GJhx-41h5
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 10:00:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 27CC560231;
	Fri, 11 Sep 2026 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 500A71F000FF;
	Fri, 11 Sep 2026 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789120817;
	bh=yvZ8dPhqGtyqFlpdNYVTdyZOJ9BDsEyogEtTmfqIXWc=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=gRuUZf5CAAkJtUt3NQVwF2rXGWEnMFFUob1UpAyPa4ij1oOsU1XZg9TYMM5ZUckYR
	 u8IPVHVXMMdDIyrEYCPgifgqoZX3azdcfzByB8Ozi/ORgvA8+m59kKEMb9XQOd84n4
	 BToJE5aGlY7VAUkoxF4vrVXkCXNb4kFMmhF4LFaIZCroBnEPdGEhju8NQYY/lrD0TR
	 KBtiSfGcXPRUBg6/cAnHZVtoFBpUwNqAAYutJkNi0AQFYvQesACZcmrmB9SFubTtnk
	 GZgPKuL65YpUF2pFkrGVX9JcI4hF02Yo3IA1ul8bUghmca2JGF5jP4iPmKoT9ZBHav
	 Vxt4kGyKI7zAg==
Mime-Version: 1.0
Date: Fri, 11 Sep 2026 12:00:08 +0200
Message-Id: <DLCEE908FEIF.380PG73T1SQXV@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Jon Hunter" <jonathanh@nvidia.com>, "Steam
 Lin" <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com> <DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org> <87o6e4qh5g.fsf@bootlin.com> <87ik4cqgha.fsf@bootlin.com>
In-Reply-To: <87ik4cqgha.fsf@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============7772454851727203209=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7772454851727203209==
Content-Type: multipart/signed;
 boundary=39481b63a0729147b8301f18eb1d5038e0f8869c5a211f854b1d65c8f357;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--39481b63a0729147b8301f18eb1d5038e0f8869c5a211f854b1d65c8f357
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 11:34 AM CEST, Miquel Raynal wrote:
> On 11/09/2026 at 11:19:39 +02, Miquel Raynal <miquel.raynal@bootlin.com> =
wrote:
>
>>>> -	ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>>> +	if (qe_mask[0])
>>>> +		ret =3D spi_nor_read_sr1(nor, sr);
>>>> +	else
>>>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>>
>>> Shouldn't that be the other way around?
>>>
>>> +	if (qe_mask[1])
>>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>> +	else
>>> +		ret =3D spi_nor_read_sr1(nor, sr);
>>>
>>> I know qe_mask won't be spread across two SRs. Just to be
>>> correct and make it easier to grok.
>>
>> Why is the second version easier to parse? First version is maybe more
>> future proof since we are treating a specific case. Because either it is
>> a specific chip (Mxic) or we end up in the more common case. There is
>> only one QER entry for qe_mask[0], many for qe_mask[1], and chances are
>> that in the future we will mostly see new chips only using a qe_mask[1]
>> mask. So having this in the else doesn't sound so strange to me? I also
>> don't think we will ever see masks spanning the two registers.
>
> The problem still persists because there is the check which also fails
> reading SR2.

I don't get it. Why would you read SR2 if bit6 is set in qe_mask[0]?
Or do you mean in the spi_nor_write_sr1_and_sr2_and_check(). Yeah
that should also probably only write SR1 if qe_mask[1] =3D=3D 0, no?

> Michael, we moved to swp.c that handling, introducing a "careful"
> revision, was this actually relevant?

Yes, because I eventually want to get rid of that sr2 QE bit
guessing. I really can't imagine that this is necessary.

> the lack of SR2 read back into the main core like before?
>
> Possible steps forward:
> 1- Add extra logic in the "and_check" helper, kind of duplicating what
>    is in the swp.c file (not my favourite)
> 2- Move the "careful" handling (which does not return errors when a
>    register read is absent) back from swp.c into core.c.
>
> What do you prefer?

3- make the generic_quad_enable differentiate between "qe bit is in
SR1" or "qe bit is in SR2". If it's in SR1, just use
spi_nor_{read,write}_sr1. if it's in SR2, keep the current handling.

Do I miss something?

-michael

--39481b63a0729147b8301f18eb1d5038e0f8869c5a211f854b1d65c8f357
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqPRKRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hM2wGA8L5BzBBDrm4P0kYjQ9rJiyR0ih4hK7e7
z6rp9lniW5kHwuNp6AN+Po3XiV9FtJi4AX4vrAdvX9IwSvnJ4IyLJ1nIB1X5g0hi
C0OeK2aLyL3u4i3GmlW2pMd9xuHJhEmRbow=
=rTO+
-----END PGP SIGNATURE-----

--39481b63a0729147b8301f18eb1d5038e0f8869c5a211f854b1d65c8f357--


--===============7772454851727203209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7772454851727203209==--

