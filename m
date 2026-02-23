Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAD7E98DF9
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Feb 2026 08:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsHSQlmrJYgWD93OF4r6I/dtapxGSDFFIFaDMuyLkdI=; b=QvaFvEdNh5THrtp4TFcLD0Q2cq
	PHqsdbzzp/o5etNnFjS56dp9cBOjrI8WZWLVsWE5avirbPcmWO1PnDM9RbLDCuQwS02n4rn7rAC8m
	Pb3/zLLQSrwW3SppUMeuQH97CDYKkZudoBM24E//SLt2rb0HpRKBEaXSKZ990gal2J59qqg1eNz9t
	e7Xt0wPBxbZn8fuiOJPrcs9T4tsISW5bK4egJ3zx2fr64cKE6PNm8jMweWC+BuZ/j7CkR7N4qCjwN
	F+mT1BMmc3WteYS4+/aRa0JLfd4XLPcwH2DVtMbiFHZYSRrlc0ATF7hR+PNnE+cwZzaVJjQY8gQ0V
	nItUBB+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuR9e-0000000HPqx-2Irs;
	Mon, 23 Feb 2026 08:18:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuR9c-0000000HPqQ-0lU5
	for linux-mtd@lists.infradead.org;
	Mon, 23 Feb 2026 08:18:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 714574339C;
	Mon, 23 Feb 2026 08:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE270C116C6;
	Mon, 23 Feb 2026 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771834733;
	bh=mfi2oIDXNC1HeAdz8FltvcXDHo2fg6vdS90o6q5YbVM=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=od8D7jdW7TFsA+JB6QfJ2xsO67R7VAugMTfRmqNDSI7mN+E8B2btyjyCFEFhb9b+s
	 fLdO+k+OXWCFbv0RubweEW+mB/kC97QA1sAHe9CPo6Si1gh4Jbsv/YZq9ymqxsrBdC
	 84GY8nmrFmXw6HXr+i5vrCkUNx1AKnocG7TxA/wWdP6azdf7hQJKmwoFPIANXjNScg
	 sliuYuOGm3H0iH9IzJfbh3ur775I4a93YYRiAxxgLqj+f4h9Ej+mDesUeMj9a6hDL4
	 0izYKEsVNyqib0e1brhpuDgBzs6h/Y01HDSVAUn8jmXOE1Im44NRVbj5AHH7Z+1bv1
	 n2VPW98pf8/UQ==
Mime-Version: 1.0
Date: Mon, 23 Feb 2026 09:18:49 +0100
Message-Id: <DGM6ZPOT1WCR.157JI0LW4W3E8@kernel.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: sst: Fix write enable before AAI
 sequence
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>, "Sanjaikumar V S"
 <sanjaikumar.vs@dicortech.com>, <stable@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Sanjaikumar V S" <sanjaikumarvs@gmail.com>,
 <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <20260220094236.28-1-sanjaikumarvs@gmail.com>
 <20260220094236.28-2-sanjaikumarvs@gmail.com>
In-Reply-To: <20260220094236.28-2-sanjaikumarvs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_001856_364036_221BD6DC 
X-CRM114-Status: GOOD (  21.32  )
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
Content-Type: multipart/mixed; boundary="===============7370075151277910645=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7370075151277910645==
Content-Type: multipart/signed;
 boundary=ccacc5352b054326ba4c60c385f192b499ae4e18e1c3c67f98baab600635;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--ccacc5352b054326ba4c60c385f192b499ae4e18e1c3c67f98baab600635
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Feb 20, 2026 at 10:42 AM CET, Sanjaikumar V S wrote:
> From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
>
> When writing to SST flash starting at an odd address, a single byte is
> first programmed using the byte program (BP) command. After this
> operation completes, the flash hardware automatically clears the Write
> Enable Latch (WEL) bit.
>
> If an AAI (Auto Address Increment) word program sequence follows, it
> requires WEL to be set. Without re-enabling writes, the AAI sequence
> fails.
>
> Add spi_nor_write_enable() after the odd-address byte program, but only
> when an AAI sequence will follow (len > 2 bytes remaining).
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>

Very strange. If that is correct, it actually never worked
correctly.

Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")

You've said, you didn't test this. Shouldn't it be pretty easy to
write to an odd offset? Also, from reading the code, it looks like
if write ends on an odd offset, it doesn't work either?

> ---
>  drivers/mtd/spi-nor/sst.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 175211fe6a5e..fe714e6d0914 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -210,6 +210,13 @@ static int sst_nor_write(struct mtd_info *mtd, loff_=
t to, size_t len,
> =20
>  		to++;
>  		actual++;
> +
> +		/* BP clears WEL, re-enable if AAI sequence follows */
> +		if (actual < len - 1) {

For brevity, I'd drop the repeated condition and just do the
write_enable unconditionally.

-michael

> +			ret =3D spi_nor_write_enable(nor);
> +			if (ret)
> +				goto out;
> +		}
>  	}
> =20
>  	/* Write out most of the data here. */


--ccacc5352b054326ba4c60c385f192b499ae4e18e1c3c67f98baab600635
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaZwNaRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gLsQGApjeWKQX5yJH4CBKLSNiWdTrh4NTbDWUt
lptAM8AtNMVx31LV6DaadYlN0foO+Y4IAYDaz0UUpx1XRDDBfte/N9aQlQhPeA4I
06h0L+1+WOBKvarpcFSW3Cu6R3D1PmZgD1Y=
=kEFN
-----END PGP SIGNATURE-----

--ccacc5352b054326ba4c60c385f192b499ae4e18e1c3c67f98baab600635--


--===============7370075151277910645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7370075151277910645==--

