Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68561CD3436
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2026 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmafEgj2MFUjam0x/X6WlGNzcUkxliOt3X3WlkQfQ1w=; b=o3yzD951uRWugmdQTfApHsGb0H
	SQEOep8yScrSX20pbFFQLLqWdPqTZkx2wAe6jWNEFHyBQ+bmf7AeS36xTAG3Dm1Ux4SToipU7clt0
	kaO9q1VLDYW0Qf/LCe4g4jg5ecJ2kNZDfle1lKwNj90H6VI2haegTXUhYyhI5tPSTHOuJ5lHru2j+
	AfmaUxUbLdAT6j5lPQi5URT0qpDxECpA1mHr+rE5OGsdUp+trcBVrb+JxjpHZ6c1UTpabK1B/EF17
	Bny05hGrmq5XS18v3uOz9PHbZlwL9JhuRUtwSgvrEX9EpkJJQeS+uAOv8aR1ZSRg3BiSTLm1u/Xs+
	Aanp5tOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYD7-00000000HzL-0hb2;
	Wed, 06 May 2026 09:06:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYD5-00000000Hxx-2anD
	for linux-mtd@lists.infradead.org;
	Wed, 06 May 2026 09:06:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB4E460139;
	Wed,  6 May 2026 09:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB2DC2BCB8;
	Wed,  6 May 2026 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778058386;
	bh=GABRbbhseVY5fpbfzplMTfXP9iVgDdxkQNIw1WYNLg4=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=ijUKn+El6I8DxFegJFWo0dJ7BX3zOT2jrEkofueVLsn99m3kjQ1Of/iYRiX3ybsPv
	 QEhbf+6uMkMDHHP5Lh+d5eFCY13uy5e+NxHuKPnoS6sBF9Wj6A26oXLOWcBUzjG2YH
	 wmN1Mbn15J+/eiDfbOXoPbASiGUpMRv26jDfYhbBuDFx3Qz2aWxRLuz++Y2WHmiYsi
	 RJ1sxVzMVsCWdb+s+EjsWSLkZS0WmUYS/IZqW6YiZp9FL9/dgLKfo+S22q5YctDOCX
	 a4GpLGgUjCWw0vVaA4MqAftdpz9QMiijCz2Uyb8S2+OkgBV2IejW+44P3v0fsTetEo
	 cIzpSXZF7pqUg==
Mime-Version: 1.0
Date: Wed, 06 May 2026 11:06:22 +0200
Message-Id: <DIBH3CCTRHPW.1J4LOJQAJ50XE@kernel.org>
Subject: Re: [PATCH v4 10/27] mtd: spi-nor: swp: Create a helper that writes
 SR, CR and checks
Cc: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Sean Anderson" <sean.anderson@linux.dev>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com> <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-10-833dab5e7288@bootlin.com> <2vxzbjet266g.fsf@kernel.org>
In-Reply-To: <2vxzbjet266g.fsf@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============7200420017917442814=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7200420017917442814==
Content-Type: multipart/signed;
 boundary=5359a88f7b0e3cf7b312e398a756181c345f5414e9c6c899c3e9b2ac54fb;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--5359a88f7b0e3cf7b312e398a756181c345f5414e9c6c899c3e9b2ac54fb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue May 5, 2026 at 6:05 PM CEST, Pratyush Yadav wrote:
> On Fri, Apr 03 2026, Miquel Raynal wrote:
>
>> There are many helpers already to either read and/or write SR and/or CR,
>> as well as sometimes check the returned values. In order to be able to
>> switch from a 1 byte status register to a 2 bytes status register while
>> keeping the same level of verification, let's introduce a new helper
>> that writes them both (atomically) and then reads them back (separated)
>> to compare the values.
>>
>> In case 2 bytes registers are not supported, we still have the usual
>> fallback available in the helper being exported to the rest of the core.
>>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> I'm confused. Doesn't spi_nor_write_16bit_sr_and_check() do the same
> thing? How are these two different?

So I've never come around to finish reviewing this series due to
personal reasons, but here are my remarks. Personally, I really
don't like all these multiple helpers doing almost the same thing.
But it is what is is for now.

Back when reviewing this series, I've digged into this and it mostly
evolve around how to enable the QE bit, that is defined in the 15th
SFDP DWORD. One could see how we could consolidate all the status
register handling in one function which are then called by the
different (specified) quad_enable helpers.

-michael

--5359a88f7b0e3cf7b312e398a756181c345f5414e9c6c899c3e9b2ac54fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCafsEjhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gGcAGA9DjU2OC+e/wedETHFWLEb9ldJfZuKhUQ
YO0OhCeqFre2dgwc7kLHRq2IN/tb9OxYAX9tmp9VRC/y+pPwnXutmYko/YemfEvF
4NJl8IKVWKaRNZbzYW5Fyunt1/wkK3IP7TA=
=s1/V
-----END PGP SIGNATURE-----

--5359a88f7b0e3cf7b312e398a756181c345f5414e9c6c899c3e9b2ac54fb--


--===============7200420017917442814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7200420017917442814==--

