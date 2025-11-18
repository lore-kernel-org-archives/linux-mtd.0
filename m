Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2ABCED24E
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 09:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/aSbH0Ji0gb6IiuDAS5ZTeYR8iMgru+9PgarB9GhAz8=; b=0EHwW3WSP9HU1+OT/H7nmfNVSh
	P6XeTYPOcRpuyncdZQ3jIJqUCOGKUgXsq3uxqQs1Zyt2igUAI2FRygBA4ckPPP/4dQXB3VAgP6Fp+
	KbGNNXPFK6OCu7smApgUA6GkT8I/LSqoTeMs+hn173Ka9xnPpE3z6uJByyVRdAzUW2oY7wDeQeD7R
	9HBaewa1rZMn9HuQArTbTBV7Nf+Jx9IzGeVVC+2gIUkNLud0pAe/HRYEZIT8VuIsuUBvsFuP5wR+R
	WNNEXk4xg1ARqaidvHJh9+YyTrtDKeLZ4Fl9zTcsSVQkTgVcMYkygoDVi/qdS8xI2HIjr3QnVsMkZ
	Tl8loqcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIPH-00000000Bwu-0cDW;
	Tue, 18 Nov 2025 09:53:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIPG-00000000Bwi-2qVt
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 09:53:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9B7D60192;
	Tue, 18 Nov 2025 09:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE495C16AAE;
	Tue, 18 Nov 2025 09:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763459629;
	bh=ZXif0z0AwJu8pUbUj9Y78tmAWvSNRn87Ln3peA/vm8g=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=Kauk/82mCzEKVNxGCToy1fQYjLA5UcSeBUlso0k8v99MoDaVaeGUw7FJhQgpvPt8c
	 lmO7lYsyrox8rRUSCr/OwGc1pQcWTOjDRU2X6zteh7Q1HFDhbHK7dv7KMtFXcQBFAe
	 aUw0oJj4W/AQgBM3QCXSGe9ybXY3L5lMVSS1bOIpBCka6LrcWjOFy8qpK6/ggKgjOW
	 9cnbXJDdTz3EOOGgDuSOXrVRqq6jnQEMHDLyOlNh2eoD8+RPFnie2HGfMb7CYxMA/g
	 pu2NRQ72Ej7RKpn7qZTGqJ3s7WJBdVLbRPdu+FSSAC1RB0R1vdTOgK3QIjyPuPUIQd
	 Fe9cNMq0ShvDA==
Mime-Version: 1.0
Date: Tue, 18 Nov 2025 10:53:42 +0100
Message-Id: <DEBQ9IUDZJ7T.33VMFGMNKPEUY@kernel.org>
Subject: Re: [PATCH 06/19] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-6-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-6-487bc7129931@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============0884749536615893369=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0884749536615893369==
Content-Type: multipart/signed;
 boundary=531a76bd078cc9f453d1f904558cd3aa131a48eab52083aded5b7a3a6b10;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--531a76bd078cc9f453d1f904558cd3aa131a48eab52083aded5b7a3a6b10
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> Add comments about how these requests are actually handled in the SPI
> NOR core. Their behaviour was not entirely clear to me at first, and
> explaining them in plain English sounds the way to go.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/swp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 9bc5a356444665ad8824e9e12d679fd551b3e67d..ede03f26de3c65ff53c1cb888=
c2c43aea268b85a 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -341,6 +341,14 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor,=
 loff_t ofs, u64 len)
>  	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf[0]);
>  }
> =20
> +/*
> + * These ioctls behave according to the following rules:
> + * ->lock(): Never locks more than what is requested, ie. may lock less

That behavior sounds so wrong... The user requests a region to be
locked, and it isn't actually locked.

> + * ->unlock(): Never unlocks more than what is requested, ie. may unlock=
 less

That seems somewhat sane.

Maybe we should return -EINVAL if ofs or ofs+len aren't at sector
boundaries. Yeah it's a change in the UAPI, but I'm not sure the
current behavior is not harmful and misleading.

> + * -is_locked(): Checks if the region is *fully* locked, returns false o=
therwise.
> + *               This feeback may be misleading because users may get an=
 "unlocked"
> + *               status even though a subpart of the region is effective=
ly locked.
> + */
>  static const struct spi_nor_locking_ops spi_nor_sr_locking_ops =3D {
>  	.lock =3D spi_nor_sr_lock,
>  	.unlock =3D spi_nor_sr_unlock,

Anyway, as it is how it's currently behaving:

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--531a76bd078cc9f453d1f904558cd3aa131a48eab52083aded5b7a3a6b10
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRxCJxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/h+XAF+LvYQh8HZrLfHPPAb0cMQbaY/UsOTI9hz
7rbuUUV5f8iSpIWry/kZtDMGL0Y+UyOiAYDFTvGFNRS0ts/YJlM8SBv8yvwvvUj/
nR1cFcSZujjF3WNxtmfF7fc2jTKmk9dbZqE=
=Og9s
-----END PGP SIGNATURE-----

--531a76bd078cc9f453d1f904558cd3aa131a48eab52083aded5b7a3a6b10--


--===============0884749536615893369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0884749536615893369==--

