Subject: Re: [PATCH][MTD][OneNAND]Update oobretlen in onenand_write_ops_nolock
From: Artem Bityutskiy <dedekind@infradead.org>
To: rohit h <hrohit85@gmail.com>
In-Reply-To: <90d987c0806161044g4b52faa5qb62be9a7b5882d90@mail.gmail.com>
References: <90d987c0806161044g4b52faa5qb62be9a7b5882d90@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2008 08:41:32 +0300
Message-Id: <1213681292.6573.13.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Kyungmin Park <kmpark@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 2008-06-16 at 23:14 +0530, rohit h wrote:
> We are missing updating the oobretlen return parameter
> in onenand_write_ops_nolock. This patch fixes it.
> Regards,
> Rohit H
> Signed-off-by: Rohit H <hrohit85@gmail.com>
> ---
> --- a/drivers/mtd/onenand/onenand_base.c	2008-05-30 13:04:59.000000000 +0=
530
> +++ b/drivers/mtd/onenand/onenand_base.c	2008-06-16 22:27:02.000000000 +0=
530
> @@ -1554,6 +1554,7 @@ static int onenand_write_ops_nolock(stru
>  	}
>=20
>  	ops->retlen =3D written;
> +	ops->oobretlen =3D oobwritten;
>=20
>  	return ret;
>  }

Looks OK.
Acked-by: Artem Bityutskiy <dedekind@infradead.org>
CC: Kyungmin Park <kmpark@infradead.org>

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
