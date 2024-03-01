Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8E9C5478C
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2024 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+3d31DE9Q+4wmyOIlcaATbWN18BvzZ9IDVZI5UDkyU=; b=PMNzQgEskDOu3W4T3a9bGoT3Hx
	51PJ/Q9GhBcxLVlUbXMJHY0VJwyX5U2aEEy3tlPgLoKBFCl+nezaLs77+KjwaqarVpmvYJOZkqSb2
	MEI2/HEPyp24ovmoeU6R9hE2peo9RrEVAxz9mfz49okCKX2vMwFVSPayqd64FsDd3oIYp5MushiXh
	TYyLUr+OXraCYnZ3XNAyqXtHqkxzPKMCtbFclDF0otT47IWfYo+1NJdSEpIhfWkZeqrhVRU32Uo83
	QaE/Hidmt5i7jr5WpPrI/8RiGrzooKXUOzv0WD9HS2q/s3WJ/XWLEfL3CyzwwArXQwrH716k1gFUa
	F9we5WYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg4Qp-00000000pEX-0fX7;
	Fri, 01 Mar 2024 15:04:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg4Ql-00000000pDa-1YYc
	for linux-mtd@lists.infradead.org;
	Fri, 01 Mar 2024 15:04:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E8D46157D;
	Fri,  1 Mar 2024 15:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600BDC433C7;
	Fri,  1 Mar 2024 15:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709305449;
	bh=8b4klxTgnQVm/tbELPg2yxa2m+O4M5Ntj7KUNSDPzxg=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=RAsmulBD3Akg3zzYlXjxlRTxDWhi/Fo0WxID12TKQmSSDDZOusA3Z4zsU9uKPqCA2
	 v/wdNRKOuev6YAhsF4mePiXcMqyCmuoDuV+vPQtwPBtFeAQH3Rxc0Ae2GQY3MnJzrZ
	 jtTlBhXMNkBfUXs/acOJcd9RNZAPDBAU+VaUgZPf0BX+7LCfmmOMSh55tBg1C/wiFb
	 UreKVTdQBQ41iVSPGbGw6Smae41j5NtyqA66Wv/Eug5cAysB/hQlp5KCqiRZbJ/KQZ
	 pF0kdv2SItktqY+T5RBCWsCrykY4XWp7B/s6SFMRJeRYIePc3YkwGQC27iCa357ra8
	 E1qXS+7qwHSUw==
Date: Fri, 01 Mar 2024 16:04:01 +0100
Message-Id: <CZII7JH72OWF.1IAQO5VJCBZX3@kernel.org>
Cc: <kernel@collabora.com>, <kernel-janitors@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Muhammad Usama Anjum" <usama.anjum@collabora.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: core: correct type of i to be signed
X-Mailer: aerc 0.16.0
References: <20240301144517.2811370-1-usama.anjum@collabora.com>
In-Reply-To: <20240301144517.2811370-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_070411_502021_675539DB 
X-CRM114-Status: GOOD (  15.97  )
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
Content-Type: multipart/mixed; boundary="===============0911300172355896092=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0911300172355896092==
Content-Type: multipart/signed;
 boundary=dcbc775c0ca5af93bb9f19526977feebad1ad56af9d8f64d40c34533ac2c;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--dcbc775c0ca5af93bb9f19526977feebad1ad56af9d8f64d40c34533ac2c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Mar 1, 2024 at 3:45 PM CET, Muhammad Usama Anjum wrote:
> The i should be signed to find out the end of the loop. Otherwise,
> i >=3D 0 is always true and loop becomes infinite.
>
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-u=
niform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 65b32ea59afc6..46bc45b80883f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3373,7 +3373,7 @@ static u32
>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>  			     const struct spi_nor_erase_type *erase_type)
>  {
> -	u8 i;
> +	s8 i;

Can we just have an "int" here. So we don't shoot ourselves in the
foot again. I'm really no friend of these kind of micro
optimizations, it should have been int in the first place IMHO.

-michael

> =20
>  	if (region->overlaid)
>  		return region->size;


--dcbc775c0ca5af93bb9f19526977feebad1ad56af9d8f64d40c34533ac2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZeHuYRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvtp+wD+KQl+p3C2+4qOt0VnkpYbjzqiMJxIj7gj
O7VZPJX0mA0BAJvAJ948Oer0qeYQC9QCjaW69eLEjcNaL1fCCTXoBPQH
=vz1B
-----END PGP SIGNATURE-----

--dcbc775c0ca5af93bb9f19526977feebad1ad56af9d8f64d40c34533ac2c--


--===============0911300172355896092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0911300172355896092==--

