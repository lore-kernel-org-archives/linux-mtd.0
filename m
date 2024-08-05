Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75851C3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2024 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83zbUL06uIXPI+zpZm4xUOmb3gqv77mPphhV2O+l5UQ=; b=RYC5S0YV28rGHy4/lNvIKZXRQZ
	RABBSdWCj7YPEfNpCdh+peH3v5VURZ4prK+Hfkq9+xbmGbMGXuw0kwt8qNwive9qgwsEDHy7tz7EH
	xG/eIi76GHTlAHzlXdcKZQ2glHWt1MI2UBsj39y2zKdMZe3Ojs61gs1hvyBzCItPMsupl53FrOLnt
	3etHkZonTSBIQNfgJUpoqbkspPUI1y8CFBm7Rgk13a3LvIQVaDeFOUTgfaWV7WCt0klXKQ3J5XVZG
	L7E90bkxQCwYxLzmy5BlGAR2rfDzjBPgoBYamXl/ig9dFeyhe9i8pxbiiw2gAJKHCRUtTLGLGt+ua
	1APK/gNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satrj-0000000FFu8-2ZxZ;
	Mon, 05 Aug 2024 09:18:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satrg-0000000FFsu-3kIT
	for linux-mtd@lists.infradead.org;
	Mon, 05 Aug 2024 09:18:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09E1A60BC2;
	Mon,  5 Aug 2024 09:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617B4C4AF0D;
	Mon,  5 Aug 2024 09:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722849531;
	bh=olTzeeELT3svBY3+B4w293FIAcU7jIz5+119Yrz92fA=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=ILG1+VnOsPIei8KUPF2+KQPdcLGdnZfajTnnz2+ZkOMjloAHGEuqVu6EacyGELdPH
	 w1rpTuUMIOcoGVEOiRIv/jkfkjyUN/AklI3g8ZmUHqGvqPDnYsB2/B0e/4OYMOhce4
	 QoBXaNaJaTpMbBR7STvE/xYbvLc5pkisNCyn1NGzVPT6/Anc9HmNYDKEJdbl/0qRLJ
	 eCAFtAGpAQx+zR0ksyEmYJmG8tsEI6UzEXQqtMhAw9Nw7LtXPwIePRDpfzd2i2fhRX
	 1pZkYOH/RNN46zm0Zy/Fz75ax8Gv/FTTAzjptipx14MBOsFNLffLk5a7UTc1kiF6Hq
	 vgGetTADOHmRw==
Date: Mon, 05 Aug 2024 11:18:47 +0200
Message-Id: <D37V6QTQZM50.2I613FUEQIWXG@kernel.org>
Subject: Re: [PATCH 1/3] mtd: spi-nor: handle JEDEC manufacturer bank
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "A. Zini" <alessandro.zini@siemens.com>, <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20240729102016.8527-1-alessandro.zini@siemens.com>
 <20240729102016.8527-2-alessandro.zini@siemens.com>
In-Reply-To: <20240729102016.8527-2-alessandro.zini@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_021853_023119_5B4B1D14 
X-CRM114-Status: GOOD (  17.67  )
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
Content-Type: multipart/mixed; boundary="===============7525197470730426848=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7525197470730426848==
Content-Type: multipart/signed;
 boundary=7407663a4ca55d9825de2ab38bfc33c3bc1ef4f3a5aac6ff4bd0c5982949;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--7407663a4ca55d9825de2ab38bfc33c3bc1ef4f3a5aac6ff4bd0c5982949
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> JEDEC JEP106 maintains a list of manufacturers IDs, consisting in 7
> bit of information plus 1 parity bit, for a total of 1 Byte. Since the
> number of manufacturers is way larger than this, JEDEC additionally
> defines the continuation code 0x7f to be used as a prefix to the
> actual ID, subdividing IDs in different banks.
>
> This commit handles such manufacturer bank code by introducing a new
> mfr_bank field in flash_info struct. This field is intended to be
> populated when specifying a manufacturer part, and for retro
> compatibility it is assumed to be 1 if omitted.
> Note that this assumption was already implicitly taken, as only a
> couple of the already supported manufacturer parts have the
> continuation code prefixed to the actual ID.
>
> Given the fast expanding pace of JEP106, the read ID operation has
> been expanded to 128 Bytes plus the pre-existing 6 Bytes for the ID
> code, thus supporting up to 128 banks.

Quick remarks without having looked deeper into this patch.

I really don't like issuing a 128byte command for older flashes.  So
maybe we can just stick to the 6 bytes and if that's not enough we
can use the extended format.

I'd like to keep the .id as the primary index. This will now
introduce a mfr_bank, so the unique key will be (mfr_bank,id). Can
we somehow encode the continuation codes into the id itself? E.g.
we know the manufacturer ID is always < 127. Honestly, I'm not sure
this is the way to go as we know flash manufacturers sometimes don't
care. So right now, we just compare the .id with whats returned by
the RDID command without interpreting it.

-michael

--7407663a4ca55d9825de2ab38bfc33c3bc1ef4f3a5aac6ff4bd0c5982949
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZrCY+BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hZBgGA2sELz1hfTvX9rlsl761WWVNM0svdimW8
HMMnPzpiyr/gyq+7/KceToNEF5Ltu+OWAX4uBmRkEBjIXYz9vyvFVNZsuZJQwc2h
g92tJ5C9YeMom9kWf+rK9axTY8bolWuPt9s=
=AC69
-----END PGP SIGNATURE-----

--7407663a4ca55d9825de2ab38bfc33c3bc1ef4f3a5aac6ff4bd0c5982949--


--===============7525197470730426848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7525197470730426848==--

