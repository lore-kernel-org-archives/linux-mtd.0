Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFFEF5580D
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2026 10:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3F68mXOgD1ykVGDhvrVDEEzyyZypiU7yWJscZvBryAQ=; b=VC/j1WQWBDnJi64b8cQ5Dr7yjn
	Msco5FZHK36eDMaEc0dsnDBnAIo53ZtlsIXc9IJreqfv+IBrZ2Emzs+0u0xXUmvdFwYqB4hpVy4P/
	iVL3pHRR9H8bxbgXLOgC7bJYK7UxtX7nDMQdlF+WxXmrLqrO9R+RxzhCkSiIIzfs4RPISxjaGn+nV
	/4Mb9eFIZAFN1u3uOWXzSZxhTdtg+KAlyvDpx3XZs/ia5Huw4teOvO7zqi68skUOSVU82tM22I/8K
	X4gn+Kwv8pdCRQ3lainy3vD37m/zIMJ/h2zGJq9CJNT2Yf2ErBBgHOu+DMGjNDFSLXg4pENPjbd3U
	PEApzAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEm7d-00000006kHi-44Lh;
	Mon, 20 Apr 2026 10:44:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEm7d-00000006kHc-1lUZ
	for linux-mtd@lists.infradead.org;
	Mon, 20 Apr 2026 10:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DCDA960141;
	Mon, 20 Apr 2026 10:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3EFC19425;
	Mon, 20 Apr 2026 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776681896;
	bh=TMJkCzOessYLb1VcTlPJbCPICj+wBOUKL06CBrs8khA=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=tMdX5CwiHoXzX8CUsVQ/OzXjx8I7xpNwOcJBlDObbQv3H4ZFVp+s6ZGOIuMxZFu1l
	 87FXhgEmowV85SSAQ+COeSBAAGHzPWX8DhZ2mTvTI61aPRlYcXslBFJrld5alQnS1r
	 1TRgpRbY25k6MZpHdoASSnu9vuHSz1DdlnGBdTP0VmxnCDfp16M/VaYDFoqornyyDL
	 9pxOdpEPON6Au0xAiU2Dy1CTI0cmR0vf9LgNRDNl7wJv0vGDwRk6thCjlpJtnyGgLt
	 zv1dMpbiysbd+snOZuOksjzl4+IGb+vrQaj+Z1Xyd6a+6VbxamNqNfzViIWJlaD1Sv
	 575Acx3/pdD5Q==
Mime-Version: 1.0
Date: Mon, 20 Apr 2026 12:44:52 +0200
Message-Id: <DHXX61QRBDVA.2VIO2J63UKZC3@kernel.org>
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <Takahiro.Kuwano@infineon.com>,
 <wuweimin@huaqin.corp-partner.google.com>
Subject: Re: [PATCH] [v3] mtd: spi-nor: gigadevice: Add support for
 GD25LQ255E
X-Mailer: aerc 0.20.0
References: <20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com> <DHXTLXWEPUDM.2LSB322E4R3ZZ@kernel.org> <792c09f5ae754bf899693f110ef1dbe0@infineon.com>
In-Reply-To: <792c09f5ae754bf899693f110ef1dbe0@infineon.com>
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
Content-Type: multipart/mixed; boundary="===============3204903764092697500=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3204903764092697500==
Content-Type: multipart/signed;
 boundary=73dfe8a03485c5b565fa61a9fcc3cdf1d267ae70f3a48ecb534463a67e83;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--73dfe8a03485c5b565fa61a9fcc3cdf1d267ae70f3a48ecb534463a67e83
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Apr 20, 2026 at 11:51 AM CEST, Takahiro.Kuwano wrote:
> Hi,
>
>>=20
>> On Sat Apr 18, 2026 at 10:42 AM CEST, Weimin Wu wrote:
>> > Add support for the GigaDevice GD25LQ255E (JEDEC ID c8 60 19),
>> > a 256Mbit (32MB) SPI NOR flash chip which supports SFDP.
>> >
>> > The chip supports 4K sector erase, dual read, and quad read modes.
>> >
>> > Link: https://download.gigadevice.com/Datasheet/DS-00562-GD25LQ255E-Re=
v1.2.pdf
>>=20
>> Please move the Link: tag above your SoB line.
>>=20
>> ..
>>=20
>> > diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gi=
gadevice.c
>> > index ef1edd0ad..22a430798 100644
>> > --- a/drivers/mtd/spi-nor/gigadevice.c
>> > +++ b/drivers/mtd/spi-nor/gigadevice.c
>> > @@ -82,6 +82,10 @@ static const struct flash_info gigadevice_nor_parts=
[] =3D {
>> >  		.size =3D SZ_16M,
>> >  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>> >  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>> > +	}, {
>> > +		/* gd25lb256 */
>> > +		.id =3D SNOR_ID(0xc8, 0x60, 0x19),
>> > +		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP | SPI_NOR_HAS_TB | SP=
I_NOR_TB_SR_BIT6,
>>=20
>> Reviewed-by: Michael Walle <mwalle@kernel.org>
>>=20
> The datasheet explains (in Table 5) that BP2-BP0 control the length
> of protection area (all, 1/2 ... 1/64, 0) and BP3 controls upper/lower.
> It looks 3 BP and 1 TB so SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB should work.
> BP4 protects top or bottom 4KB to 32KB and current SWP doesn't support
> that protection mechanism, right? Sorry if I missed something...

Ha, you are right, thanks for pointing that out. I actually fell for
the wrong comment and looked at that datasheet in the end.. for
which the flags are correct. And what weird name is that gd25lq255..
Anyway. The ID matches the linked datasheet. So something is wrong
here. Weimin, please test the locking properly and update the
comment as Tudor already pointed out.

Thanks,
-michael

--73dfe8a03485c5b565fa61a9fcc3cdf1d267ae70f3a48ecb534463a67e83
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaeYDpBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hmXgF+J5yrTL1g+ijLWNJIwfr4xp8z3Nb/rM6v
KIiJRwmWkPuvKlGpTOFENqDxWCVi0mDNAXwPVJ4WBSMPSbLj9CVoqC6eG6eWJfBK
Nnv5LArxqw8GGxF5zqFfUOhcKEfXaVVEFzs=
=8ycM
-----END PGP SIGNATURE-----

--73dfe8a03485c5b565fa61a9fcc3cdf1d267ae70f3a48ecb534463a67e83--


--===============3204903764092697500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3204903764092697500==--

