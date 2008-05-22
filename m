Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jz85Z-0007V0-1E
	for linux-mtd@lists.infradead.org; Thu, 22 May 2008 10:32:01 +0000
Subject: Re: [PATCH] UBI: Use the bit operation with min_io_size
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kyungmin Park <kyungmin.park@samsung.com>
In-Reply-To: <20080522013218.GA26360@party>
References: <20080522013218.GA26360@party>
Content-Type: text/plain; charset=utf-8
Date: Thu, 22 May 2008 13:31:10 +0300
Message-Id: <1211452270.31023.31.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, ext-adrian.hunter@nokia.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kyungmin,

you patch looks OK to me and I'll apply it, but with few changes
(see below).

On Thu, 2008-05-22 at 10:32 +0900, Kyungmin Park wrote:
> It already checks the min io size is the power of 2 at io_init.
>=20
>         /* Make sure minimal I/O unit is power of 2 */
I will add a comment here that we do not have any fundamental reason
to require this. It is just an optimization which makes it possible
to avoid costly division operations.

> +	n =3D req->alignment & (ubi->min_io_size - 1);
Probably we could introduce an ubi->min_io_mask variable even. But
this is anyway a subject of a separate change.

> -		ubi_assert(len % ubi->min_io_size =3D=3D 0);
> +		ubi_assert(len & (ubi->min_io_size - 1) =3D=3D 0);

Bitwise & has smaller priority than =3D=3D, so I think this should be

ubi_assert((len & (ubi->min_io_size - 1)) =3D=3D 0); or better
ubi_assert(!(len & (ubi->min_io_size - 1)));

> -	ubi_assert(length % ubi->min_io_size =3D=3D 0);
> +	ubi_assert(length & (ubi->min_io_size - 1) =3D=3D 0);
Similar.


Thank you!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
