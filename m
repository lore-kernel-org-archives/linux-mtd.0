Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196E4C3DA64
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2024 09:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrD4iXZK3Dn+yekAfr1healqM0ZKe8bAvwlyAy+NZuA=; b=CofbzslbXW8Pq3uYnxDgpHQicx
	jNGugPQsmn4F/78GvOhsgRkdRrKan86anNjj6aITyxQsBMz3tTZeA4uuYeTfUYUSxCFPzn5k2J5a3
	vK97zUcVJFtsqBJDYVjNbWpNqtqW4K02qQo3BzEaXCZ3Rfhxjw+1iWHKic/wpSQrLNqtTe87SJjv5
	Or9uW8vTtgFVBOEZXTcqcid+WBkWZGUJVsELeAtmUPArAPv7zQuToh0jXwcMIMm6uT2/ZdiY9Svbd
	qQ/ToHp2D9I6IL6ysSzTEInJ2ps4wEnCMRo9zC7HaMBedXcPV50d0S2QqtKSxW85RjMyFzAAcTBso
	JvJt/UlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5HA-00000000QM0-2JiQ;
	Wed, 31 Jul 2024 09:05:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5H5-00000000QKc-2vdT
	for linux-mtd@lists.infradead.org;
	Wed, 31 Jul 2024 09:05:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 580F3CE12B9;
	Wed, 31 Jul 2024 09:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48621C116B1;
	Wed, 31 Jul 2024 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722416732;
	bh=Ro4CC/zSYrlt8z3sidPNEcI48aXkedqmjE5LzRyUuc8=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=lNnil4Frb6ubY61aIf2jrWlCfiW4+FZl8q0jReeFJ7CeE4otqLrMOVibeAycl2c2B
	 qnvaYdh4ElzYcf39Xo1dMNlfLwa6FnRHkAlsb1N36PFPHKWVkBy2UXkTT3v+dw2iSn
	 kyf79udDQrXEzHuYh5/KOtPeVY/5Ae0MblgAWC427B44r8YQyORcKiDC3Jk2OzUV/B
	 E2kp6nC8jTG1IrwzIuQsK0xL5eUh44nNxJzUdeGJZsmlF+DLrZNhAqnIfl+TwFykSD
	 FD+CclK0cgZw6ruECELkV0VAqWcae2RPqiHwKVxDHQ4BaBeKKhvTjoNZmepC76upaY
	 PuDdL6uLOhZTw==
Date: Wed, 31 Jul 2024 11:05:28 +0200
Message-Id: <D33LRTJ8BE0T.2EQJ1MGLG2NUS@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Brian Norris"
 <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add n25q064a WP support
Cc: <linux-mtd@lists.infradead.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240726185825.142733-1-computersforpeace@gmail.com>
 <D32OADQF733D.3CVS3ZRPEBL2O@kernel.org>
 <454deacb-88cc-4ab0-80b4-006d863a56d2@linaro.org>
 <CAN8TOE8-9=P7p8Tkc+5kG5Sqan+RAWAc7k2VH-p5W9hR-bb_Xg@mail.gmail.com>
 <0685ef1b-b0e1-4c53-94dc-4d5de5be8e94@linaro.org>
In-Reply-To: <0685ef1b-b0e1-4c53-94dc-4d5de5be8e94@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_020536_142523_1A23915D 
X-CRM114-Status: GOOD (  20.49  )
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
Content-Type: multipart/mixed; boundary="===============5716322485489815661=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5716322485489815661==
Content-Type: multipart/signed;
 boundary=8eb6641bb0e6348999b81d72124475a06d92e862735b04c092571de7dbda;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--8eb6641bb0e6348999b81d72124475a06d92e862735b04c092571de7dbda
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> >> Also, if you care, would be good to extend the SPI NOR documentation o=
n
> >> how one shall test the Block Protection.
> >=20
> > That sounds tougher. I don't know that there's really a standard
> > toolset for handling protection -- I guess the 'flash_{un,}lock'
> > utilities in mtd-utils qualify, but they aren't even packaged by
> > relevant distros (e.g., OpenWrt; but I guess they're in Debian). I
> > typically use flashrom, since that's what ChromiumOS uses, and it's
> > available in OpenWrt -- would that be an OK basis for docs?
>
> yes, why not. At least for people using OpenWrt.

We really need some kind of dump the relevant registers here. I have
some very old patch, which dumps the status register, but is has
it's own quirks. But IMHO we should (maybe additional to the
functional tests) look at the locking bits in the corresponding
registers. I.e.
 flash_lock foobar
 <verify the status register>
 flash_unlock foobar
 <verify the status register>
 flash_lock barfoo
 <verify the status register>
 etc.

Just inferring the correctness from behavior (exercised by writing
to the flash and verifying it) will lead to errors as it is hard to
catch all the corner cases.

From what I remember, flashrom has it's own drivers in userspace,
no?

-michael

> >=20
> > It's also highly conditional on what sort of range(s) the flash
> > supports. So it's almost like we might want a programmatic
> > write-protection test suite as part of mtd-utils/tests/, rather than a
> > bespoke narrative document. Which ... is getting a little larger than
> > I signed up for.
> >=20
>
> Some test in mtd-utils would be good indeed, but narrative shall be also
> ok for now. What I fear is that people just use just a flash lock/unlock
> all sectors test, which is not ideal. We shall also test locking on some
> sectors from the top and bottom, to verify the correctness of the TB
> bit, check if BP3 is working by locking some sectors in that area.
> Haven't looked at the BP area in a while, but you get my point, I feel
> testing is not ideal and a guideline would help.
>
> If you ever feel that you can spend some time on this, help is appreciate=
d.
>
> Thanks,
> ta


--8eb6641bb0e6348999b81d72124475a06d92e862735b04c092571de7dbda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZqn+WRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hbjgF/azqKN63u2DSxmAd/moICUxZu0hxP/IMk
NK9Pg9o7rQzcRs9Tzlbg/vM2L1jMHH3EAYDeLMwp2vCdyHy+eDz4n6aHbXccFpZg
yRnA4yWXxSi9l5WC4r+Zs/e4qxPHF6bIUDU=
=u2j1
-----END PGP SIGNATURE-----

--8eb6641bb0e6348999b81d72124475a06d92e862735b04c092571de7dbda--


--===============5716322485489815661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5716322485489815661==--

