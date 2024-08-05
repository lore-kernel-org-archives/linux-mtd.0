Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0ECC3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2024 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHzgNlZixLWEXWr8b/YVW40L+p2qsco43wg9CCdBLk0=; b=x8+pQTQLcJ3WNP119O2EQQuFyv
	tXJvMJyNB+a7DjHF7zwgQLGZNOQBHPaHqg9bZy76JldDt+PciTfC5L8H1jQXzFdHNqwuarnblbYMO
	3CSNtG+NVqvN/U6bF7aDpbd/e/NgOV/5Yis3K7WkVzEiY0FR++bvsrFT5dQ+zIlldIhgRv5JH9Lw1
	WPf9URbdS+j6uDo6YAQ1gf8F/NLPUoYNO8O6V9JIsJj+fZgl9Pa+PKtVJW28Z8+E/qMpkYiAz2Ac1
	QBHb+hJAuBH1mcGMvFAyg5H3RkHydmzwy6rf6iUniTS2m2PSBhljmj/mPUsSqY0PbiqSGBW1soUaO
	SKPs8+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satag-0000000FCiK-3BTT;
	Mon, 05 Aug 2024 09:01:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satac-0000000FCfV-3rFD
	for linux-mtd@lists.infradead.org;
	Mon, 05 Aug 2024 09:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0127360BC1;
	Mon,  5 Aug 2024 09:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E86BC4AF0D;
	Mon,  5 Aug 2024 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722848473;
	bh=/9hl84gQd3/SwOJQ4KQR8ASh8B9epxHOoZ459l4GyK0=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=G9JtxPbFHX62rM/hMHDwnJyIw6FOP3T6QQo4PD3F1XqzOMUMSaKthamJPzon6p3Me
	 r+l0doJUgsQ8l14BlrGrAbgxlB9qcrLOlFcbwJm9PL5+LcKqlkVP6PVl8pg55ZXaTm
	 PrndtZSnrdx+TunNJ7RNMJ4/ZZT9y4FPnXeP+0FRuosbEDvNahEVhKatRySeDYMaol
	 8FNQN4PJWXQVdaGVUonh+V6HQi9UWktwmL3SAUnInr6O9WL6RnuMqq92+98DLrEcHK
	 4fDJew4tUhDBFCCZdJCZioHbCr5NdZbFOn/ooaoJ7sE0Eniq71ZkokHUm+p3OtxwRy
	 jZux3C1LTCKoA==
Date: Mon, 05 Aug 2024 11:01:09 +0200
Message-Id: <D37UT8JYBDX1.2OURSPGD336B1@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add n25q064a WP support
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 <linux-mtd@lists.infradead.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Brian Norris" <computersforpeace@gmail.com>
X-Mailer: aerc 0.16.0
References: <20240726185825.142733-1-computersforpeace@gmail.com>
 <D32OADQF733D.3CVS3ZRPEBL2O@kernel.org>
 <454deacb-88cc-4ab0-80b4-006d863a56d2@linaro.org>
 <CAN8TOE8-9=P7p8Tkc+5kG5Sqan+RAWAc7k2VH-p5W9hR-bb_Xg@mail.gmail.com>
 <0685ef1b-b0e1-4c53-94dc-4d5de5be8e94@linaro.org>
 <D33LRTJ8BE0T.2EQJ1MGLG2NUS@kernel.org>
 <CAN8TOE--TYg8r8qCd_HAZ_w2+wRSPF6RUAuK3g-Po5QPVXdRLQ@mail.gmail.com>
In-Reply-To: <CAN8TOE--TYg8r8qCd_HAZ_w2+wRSPF6RUAuK3g-Po5QPVXdRLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_020115_115386_021D02FF 
X-CRM114-Status: GOOD (  35.50  )
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
Content-Type: multipart/mixed; boundary="===============7688296778970880665=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7688296778970880665==
Content-Type: multipart/signed;
 boundary=39b3f79ce120f1030ba7edc1580bb2b21bb064927d8a128b2d0f6eb0e883;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--39b3f79ce120f1030ba7edc1580bb2b21bb064927d8a128b2d0f6eb0e883
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > We really need some kind of dump the relevant registers here. I have
> > some very old patch, which dumps the status register, but is has
> > it's own quirks. But IMHO we should (maybe additional to the
> > functional tests) look at the locking bits in the corresponding
> > registers. I.e.
> >  flash_lock foobar
> >  <verify the status register>
> >  flash_unlock foobar
> >  <verify the status register>
> >  flash_lock barfoo
> >  <verify the status register>
> >  etc.
>
> I don't actually think that would be a very good test. It would be
> testing the implementation more than the functionality. What do you
> "verify" in the status register? Would the test just re-implement the
> swp.c protection-range logic? And notably, this omits *all* checks
> that the protection register actually protects from anything (write,
> erase).
>
> Or maybe I'm misinterpreting what you mean.

No that's what I've meant. Maybe I'm having another perspective and
I'm biased because of that, but I'm really not trusting the software
layer, esp. not when it comes to flash locking. Because most of the
time this involves the "very last resort recovery" on our products.
So we really have to ensure the flash is locked and therefore, one
*must* look at the corresponding bits in the hardware (using the
simplest method possible). The beauty of the lock bits is that if
you know they are set, there is nothing software can do to write or
erase these sectors. Once you know all the bits are set correctly,
you can just skip the write/erase/read test.

> > Just inferring the correctness from behavior (exercised by writing
> > to the flash and verifying it) will lead to errors as it is hard to
> > catch all the corner cases.
>
> Why would that lead to errors?

Ever tried to lock two different ranges after another? Or unlock a
smaller range than the one that is currently locked? IIRC, that
should work. But I've never tried it myself. Or just locking (parts)
of a smaller partition (i.e. an mtd device which doesn't cover the
whole spi flash).

> It should be relatively easy to:
>
> 1. enumerate the supported protection ranges (MEMLOCK / MEMUNLOCK
> ioctls on known-likely ranges, looking for EINVAL return codes)
> 2. iterate through all such ranges; for a given range:
> 2(a). erase the whole flash
> 2(b). write the whole flash with a known pattern
> 2(c). read the whole flash
> 2(d). ensure that the expected-protected range remains 0xff
> 2(e). ensure that the expected-unprotected range contains the known patte=
rn

Not sure 2(a) will work or if some flashes will reject the chip
erase command if some sectors are locked. To sidestep this I guess
you should use the smallest possible erase (i.e. ususally the 4k
erase opcode).

But yeah, once this is all in place you can probably do that with a
tool, otherwise it's really tedious work and doing it by hand is
error prone.

> I suppose step #1 can be tough, because the full slate of possible
> protection ranges is technically ... enormous. But "likely" ranges are
> much fewer, with a few power-of-2 patterns, top/bottom, and maybe some
> "both top and bottom" ranges on some flashes? Anyway, like I said in
> my other reply, this should take on the order of 60 minutes on some
> flashes, which is expensive but not prohibitive.

Well we support 4 block protection bits and one TB bit. So there are
2^5 different configurations?

-michael

> > From what I remember, flashrom has it's own drivers in userspace,
> > no?
>
> Yes, and that's all rather ugly. But it also has a linux_mtd backend
> since a few years back:
>
> https://review.coreboot.org/plugins/gitiles/flashrom/+/HEAD/linux_mtd.c
>
> Brian


--39b3f79ce120f1030ba7edc1580bb2b21bb064927d8a128b2d0f6eb0e883
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZrCU1RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hSxgGAt69h5Yor03kSvbs95kOS0BWCwy6nCBJK
AZ6IQ3p/fdUD2daoju7HC/4Pf7yIFP0iAXoC2DgCm8PICAbscuEgVW42burOLSZ7
1XzurCNGAkDkCSHRuDx5kpQYGSuHMUybqBk=
=oDFf
-----END PGP SIGNATURE-----

--39b3f79ce120f1030ba7edc1580bb2b21bb064927d8a128b2d0f6eb0e883--


--===============7688296778970880665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7688296778970880665==--

