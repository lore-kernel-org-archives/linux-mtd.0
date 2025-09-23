Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D704CAC5AC
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Sep 2025 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3sH+GLUSIjRZiR/Mno07rBTbAGwxnlu2UD0g8jfxLQ=; b=2zx9zJv2RpSwr3NlWMjp9Tjszl
	PI3W7XCvNALh8Krb6mtnz5zT/FfdYAtZOolia1Qu2qCAwqz4ql2yTl4AZXon6v1UoZ9iOTXCvaMqt
	1UNPUs3Wy7YVkDwuf2YkuwKwDVNSsDgC3hmDSzYG1NBQXWG1KvFHc8L+avSkDBoGr6Mav628k7Oyj
	wA6xalrnWg91oZTXjBErlb4Dd732qsZ3QX97oi6+eDIh+MQJe/OGwSK0uSA+fh5mbXXl9yWgDFPgL
	NdrOWMCG/ahFr/WvKcQ1ea4yqMenXmzQBZxEzB5Qj+zlO92YzrruwktZUD2p3i5jQpLjvlN1Y70Dl
	3zEToR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13n3-0000000DfmL-198D;
	Tue, 23 Sep 2025 14:14:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13mz-0000000Dfli-0Vll
	for linux-mtd@lists.infradead.org;
	Tue, 23 Sep 2025 14:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51AA640246;
	Tue, 23 Sep 2025 14:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FCEC4CEF5;
	Tue, 23 Sep 2025 14:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758636880;
	bh=GsId992jcWwfjjUIb8bjkrYleLQcoqX35v2gB95uPmY=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=f8HgEnvbgOCGTsOHquGZwL75SpBiNNuC/7tA9nL1gbOJPo+L9aYWwE4UQOQqRjMYx
	 /P3Hbl00Up5WvqM+amlSjqTG2NrvyUMVNKjwI/b14TcWRfhsxd6S3lu0MihTcz8C2H
	 E8Fi2ajqgDTs2dULIdoDcMS6cbIjcsypJcSHX3OdsFhahUKwRkRFbADtk+SbAjDxV2
	 vpdhFhDilVKiHMmYeG+szA7TtjxUO0Ww/00FAoFXBLIc1XaXVzva0qZitL2WgFiMy7
	 sK65V1upOR4xzlfZuakuVzvej/da9ixOrf8AjZrLSGMiZL4oQc+Z3KFnFtVwA03Mtt
	 6wxw2/owYW/Og==
Date: Tue, 23 Sep 2025 16:14:35 +0200
Message-Id: <DD08QRGQSU2G.1GB9CNQJV82CW@kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: use RDCR opcode 0x15
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Maarten Zanders" <maarten@zanders.be>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Boris Brezillon"
 <bbrezillon@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250922155635.749975-1-maarten@zanders.be>
 <20250922155635.749975-3-maarten@zanders.be>
In-Reply-To: <20250922155635.749975-3-maarten@zanders.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_071441_204987_4ACF8584 
X-CRM114-Status: GOOD (  28.68  )
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
Content-Type: multipart/mixed; boundary="===============6389734480940954222=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6389734480940954222==
Content-Type: multipart/signed;
 boundary=aabb0dfe20b3a499392939201ba7efacaa56da55352f09fddd9109a83a93;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--aabb0dfe20b3a499392939201ba7efacaa56da55352f09fddd9109a83a93
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Maarten,

On Mon Sep 22, 2025 at 5:56 PM CEST, Maarten Zanders wrote:
> Macronix devices use opcode 0x15 to read the configuration register (CR)
> instead of the default 0x35. On parts such as the MX25L12833F, reading
> the CR with 0x35 returns garbage values, which are then written back
> when updating the status register (SR). This may unintentionally program
> OTP bits (e.g. top/bottom block protection) and change other default
> values.
>
> Other Macronix parts avoid this issue because their SFDP data specifies
> that CR is not read (BFPT_DWORD15_QER_SR2_BIT1_NO_RD), and the driver
> assumes CR defaults to all zeroes which matches the hardware register.

Why isn't that also true for this device? It supports SFDP. Does it
have a wrong value there?

Could you dump please the SFDP and post it here, see [1].

> Set the RDCR opcode to 0x15 for Macronix flashes to avoid corrupt CR
> writes in cases where it is used.
>
> Note that for affected parts, the block protection mechanism might
> remain broken through the OTP bit: locking an upper block (which is the
> only one supported by the driver) is now locking the lower block in HW.
>
> Fixes: 10526d85e4c6 ("mtd: spi-nor: Move Macronix bits out of core.c")

I doubt that this is the correct Fixes tag as this only moves code
around.

But I'm also not convinced that we should fix it that way. I just
had a look at a random macronix flash MX25L12805D and it doesn't
have that opcode. Thus, just adding that to all the macronix flashes
doesn't make much sense. But it also doesn't seem to have a WRSR
command that takes 16bits.. and the core unconditonally set
SNOR_F_HAS_16BIT_SR. Hum.

So maybe just clear the SNOR_F_HAS_16BIT_SR or add SNOR_F_NO_READ_CR
for the macronix flashes by default as a fix. Not sure what's better
here. Then on top of that you might add the RDCR opcode, although
I'm not sure for what it is used then.

In any case, there seems to be another issue with your flash and the
SFDP tables.

-michael

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

> Signed-off-by: Maarten Zanders <maarten@zanders.be>
> ---
>  drivers/mtd/spi-nor/macronix.c | 1 +
>  include/linux/mtd/spi-nor.h    | 3 +++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macroni=
x.c
> index e97f5cbd9aad..de3f3d963f86 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -322,6 +322,7 @@ static int macronix_nor_late_init(struct spi_nor *nor=
)
>  	if (!nor->params->set_4byte_addr_mode)
>  		nor->params->set_4byte_addr_mode =3D spi_nor_set_4byte_addr_mode_en4b_=
ex4b;
>  	nor->params->set_octal_dtr =3D macronix_nor_set_octal_dtr;
> +	nor->params->rdcr_opcode =3D SPINOR_OP_RDCR_MX;
> =20
>  	return 0;
>  }
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index cdcfe0fd2e7d..e35405b126c2 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -92,6 +92,9 @@
>  #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
>  #define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
> =20
> +/* Used for Macronix flashes only. */
> +#define SPINOR_OP_RDCR_MX	0x15	/* Read configuration register */
> +
>  /* Used for GigaDevices and Winbond flashes. */
>  #define SPINOR_OP_ESECR		0x44	/* Erase Security registers */
>  #define SPINOR_OP_PSECR		0x42	/* Program Security registers */


--aabb0dfe20b3a499392939201ba7efacaa56da55352f09fddd9109a83a93
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaNKrTBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gjbgGAqQY+8il2FQeWpOZah7ITS9tO93JfQk7I
XMJRcYH6bdoQnQjd82rOZrTQpiBYbJ4OAYD3zPFzoH5g8CLv1OSfad3LZZ8YGnme
Q/jp4+Xyzp7TCpMVeIAxryCuioQ3uFzicYA=
=afNZ
-----END PGP SIGNATURE-----

--aabb0dfe20b3a499392939201ba7efacaa56da55352f09fddd9109a83a93--


--===============6389734480940954222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6389734480940954222==--

