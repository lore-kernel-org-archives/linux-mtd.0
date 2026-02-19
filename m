Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BD0E9A03B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Feb 2026 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15wex4fvOwWy2defTCUYY0dwuhxHF0wT4PNmqP0rDX4=; b=pKxZypI9fj1EcfC4kLXwi2TnD/
	OzYEt92Thzli/O9DUlUp9wistNxNOEbPfMqJQZIewbC6ZJvu4WIoynazI2M8FfE7EcpsWAcuEDhOa
	A801uHZ/WABp52RGiiqL02Nb+65KhtQNtsRt5IZepipljq8fXoKFB21jlvuMNLqdhN2PIiifj+//k
	41ZsNJdYBRMBQT487dXNdJ8aMKc+PrQ5h81Pcorok6x+ZXd6LyqIzIoV1nu2gN2GPAUgXa2E2WGQG
	L/tUm0l+zTHWtRICYUlv1wzI9p+KwjNcML+OF31Nh9uTfGbV4mWEX6xi6ws1JWVIxC0cmtlRZ6uaU
	gnh6bezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vszyC-0000000B9SE-0aVV;
	Thu, 19 Feb 2026 09:05:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vszyA-0000000B9S3-1V6A
	for linux-mtd@lists.infradead.org;
	Thu, 19 Feb 2026 09:05:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 733E660145;
	Thu, 19 Feb 2026 09:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE71C4CEF7;
	Thu, 19 Feb 2026 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771491909;
	bh=4zSXJpa4ij+aQ3+SJCP87JyxaostURPj4HSRRIAa9g0=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=X40pep2qk90J5K0PNPrEMtu9pxNiK6a3SXTBGH8zj1xVOzgvO9M9GdmwCACZ3XWhd
	 UbXOmbX5XaOg8wjzrbHazVtQjiMlRSonvLy759bUeVLjxeCeA6OCxqWzEP79vEEiuQ
	 0oZg8atDVPHLtKOAyUwXNmY3U87pUON512dnZBtu/hFspcFFVMMNsLubg1GMJcE3hK
	 Cwx/MJAVAm2fdEL1SnTBXtECHbaVkOp54SQ2hVgRtUkXdySh39ycmUXB1MsNKP0EhL
	 MLfvasw3VVkiURQMXuJFa6F7dXlkQY1xvA88RcJ9xBe1KlF86GrZlWQUUVKH5EvFMX
	 6ZBWXZYTATtzQ==
Mime-Version: 1.0
Date: Thu, 19 Feb 2026 10:05:04 +0100
Message-Id: <DGITGY9SX5TV.1NG4LVPTNNZQF@kernel.org>
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: winbond: Fix protection handling
From: "Michael Walle" <mwalle@kernel.org>
To: "Farber, Eliav" <farbere@amazon.com>, "tudor.ambarus@linaro.org"
 <tudor.ambarus@linaro.org>, "pratyush@kernel.org" <pratyush@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260218143523.17467-1-farbere@amazon.com>
 <DGIRWWVSU5XE.2DMCL0H8D53MI@kernel.org>
 <CH0PR18MB543393010019CA8FB36025DAC66BA@CH0PR18MB5433.namprd18.prod.outlook.com>
In-Reply-To: <CH0PR18MB543393010019CA8FB36025DAC66BA@CH0PR18MB5433.namprd18.prod.outlook.com>
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
Content-Type: multipart/mixed; boundary="===============8740989699903531807=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8740989699903531807==
Content-Type: multipart/signed;
 boundary=f15003772716e1bef0abc179c9c2be322ab306de78f95943dc6d5b3dc645;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--f15003772716e1bef0abc179c9c2be322ab306de78f95943dc6d5b3dc645
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 19, 2026 at 9:59 AM CET, Eliav Farber wrote:
>> > Changes in v2:
>> > - Remove last patch in series that added dual/quad read for w25q64jvm
>>
>> Why? Unfortunately, you didn't answer my questions.
>
> The SFDP dump I added indicates that both dual-read and quad-read modes
> are supported.

That was already the case for your initial submission. So what has
changed?

If you're a bit more verbose in the changelog, that would make
things much easier for us reviewers.=20

>> > - Added Minimum testing requirements for w25q256jwm and w25q64jvm
>>
>> Thanks, but why was the w25q256jw left out?
>
> I still haven=E2=80=99t been able to get a card with w25q256jw.
> Is it needed in order to add the lock flags?

Not from my side, other maintainers may disagree. I'm more
interested in the SFDP dump. In any case, you already have my
Reviewed-by.

-michael

--f15003772716e1bef0abc179c9c2be322ab306de78f95943dc6d5b3dc645
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaZbSQRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jRWAF/awje/mFHjmUvcuG0CbFXLOxZETbWTRGW
n5FVOjAKbQlHWsgFZCCahI9PUWenIOWeAYDD68QFq8QpRnZOx6aYobGftPaPm84H
46oRSMWUMhp5vesLmaUEgQr1MycW3yV1wMU=
=n0fI
-----END PGP SIGNATURE-----

--f15003772716e1bef0abc179c9c2be322ab306de78f95943dc6d5b3dc645--


--===============8740989699903531807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8740989699903531807==--

