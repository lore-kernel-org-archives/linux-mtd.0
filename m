Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IfsPG-0001z7-FF
	for linux-mtd@lists.infradead.org; Thu, 11 Oct 2007 08:24:32 +0100
Subject: Re: [PATCH] MTD: OneNAND: Fix typo related with recent commit
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kyungmin Park <kyungmin.park@samsung.com>
In-Reply-To: <20071010044814.GA4974@party>
References: <20071010044814.GA4974@party>
Content-Type: text/plain; charset=utf-8
Date: Thu, 11 Oct 2007 10:21:04 +0300
Message-Id: <1192087264.21337.1.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-10-10 at 13:48 +0900, Kyungmin Park wrote:
> MTD: OneNAND: Fix typo related with recent commit
>=20
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index 85a9719..b2c40f6 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -2065,7 +2065,7 @@ static int do_otp_write(struct mtd_info *mtd, loff_=
t to, size_t len,
> =20
>  	ops.len =3D len;
>  	ops.ooblen =3D 0;
> -	ops.databuf =3D pbuf;
> +	ops.datbuf =3D pbuf;
>  	ops.oobbuf =3D NULL;
>  	ret =3D onenand_write_ops_nolock(mtd, to, &ops);
>  	*retlen =3D ops.retlen;

Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
