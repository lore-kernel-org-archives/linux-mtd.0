Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80583CED25D
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 09:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7rLBl2TgiqnkmT7wUGxOc8qd0vDtneUT5OYIlmbOTg=; b=4On6PrLoMD1GxdREe8+DdIo5+E
	3ayxl0FkR20c1nveZ+O09jK3YApibNfyE2gwfHPpYyTeRNUHNaaTfh7+HQovdme+iC06s5Z7hlv/V
	4Z5/EqNsZSHYZ7xMLABiAUj3tkK7inmYdUv5Qx3sq5dQk/Sm+nLZdurZCpMUzPvmF1hm1RPq/HZBp
	gKvtUPnqAkJ5KUj2bBmT7jYVjRKSs2PLGLSWc+If4KvcOuvKRrSI9RNQoVxvpyJypDsx15y1+lv+1
	vyi0+H17wzzf+lGMKeGgMGixpSqjBMiYQfeYIVANG1WsAQgFuodW1+fzJG4LEWWjmXEHB+RILeoZl
	33fcCajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIRU-00000000CAi-3nb2;
	Tue, 18 Nov 2025 09:56:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIRR-00000000CAB-0Rce
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 09:56:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FC7943DE0;
	Tue, 18 Nov 2025 09:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A90C2BCAF;
	Tue, 18 Nov 2025 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763459764;
	bh=InKlqc0W8tXF5R9A3SsxqXbprdKb3GlL1HN1svWGNz8=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=pTd3FGFniNK6MLhZ0bJT2ucz0lCJ/DUQMRgKkTd7UdGshX9jcf7+9mEkMDT7dsSyd
	 HA51iz62cXr62dE35v0bXcblfqULup3tQtJ6tXTm7T/OLXdnE8BcWJvKCF3QL1btli
	 KtC7mD35mTA97zMi3Lax0yCeOExSihXC6SYrv5/a1hRN6WelzzwrsylOwEnX118qfQ
	 KskM3sDi20HQMg+VR5fdVS6k44jyaqfbbvgETiLcmkWuSUZ7B7whLjg2mWNh2KGgme
	 pfxwLhieRREl1gBtnUr4YIBsPOOcRV2KOwm8bY+VrpGIOR5smuSRpVcsTrpvSaXbNB
	 t3rl9JR1DtCow==
Mime-Version: 1.0
Date: Tue, 18 Nov 2025 10:55:58 +0100
Message-Id: <DEBQB9D7POZD.2S729874RIZH6@kernel.org>
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
Subject: Re: [PATCH 07/19] mtd: spi-nor: swp: Clarify a comment
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-7-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-7-487bc7129931@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_015605_185864_048394CF 
X-CRM114-Status: GOOD (  16.28  )
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
Content-Type: multipart/mixed; boundary="===============5197962455332571648=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5197962455332571648==
Content-Type: multipart/signed;
 boundary=e8ea989f2eb4e3b5df39076908a83a4f02f12c51b6f783b05b0fdafd2915;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--e8ea989f2eb4e3b5df39076908a83a4f02f12c51b6f783b05b0fdafd2915
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> The comment states that all power of two sizes are not supported. This

No it says "some power-of-two". That's clearly not all :)

I'm fine with either:
Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

> is very device dependent (based on the size), so modulate a bit the
> sentence to make it more accurate.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/swp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index ede03f26de3c65ff53c1cb888c2c43aea268b85a..350fb8cd67dbafa3c62201c8c=
06bff7131143c04 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -298,7 +298,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, lof=
f_t ofs, u64 len)
>  		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
>  			val =3D (val & ~SR_BP3) | SR_BP3_BIT6;
> =20
> -		/* Some power-of-two sizes are not supported */
> +		/* Some power-of-two sizes may not be supported */
>  		if (val & ~mask)
>  			return -EINVAL;
>  	}


--e8ea989f2eb4e3b5df39076908a83a4f02f12c51b6f783b05b0fdafd2915
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRxCrxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iNfgGA2ECoEU7mxQRsw83tLKCZBT8ecBxd8m1+
RE/n0w1TK3trhWirXvTPG7k+kyM2etu3AYC2wk7M3+JQTGKrjMmqbuX9afvPVZJg
spcTnmfWbOgOiWeB6BKsNPlhblNnVRCW+Zo=
=jVpa
-----END PGP SIGNATURE-----

--e8ea989f2eb4e3b5df39076908a83a4f02f12c51b6f783b05b0fdafd2915--


--===============5197962455332571648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5197962455332571648==--

