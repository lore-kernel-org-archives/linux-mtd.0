Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScPje-000166-5B
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 23:33:54 +0000
Received: by wgbds1 with SMTP id ds1so7507wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2012 16:33:51 -0700 (PDT)
Message-ID: <1339025375.8066.9.camel@brekeke>
Subject: Re: [PATCH 2/5] UBI: fastmap: kill junk newlines and add a TODO
 about that
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 07 Jun 2012 02:29:35 +0300
In-Reply-To: <4FCFCBE3.9000508@nod.at>
References: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
 <1338909119-5188-3-git-send-email-dedekind1@gmail.com>
 <4FCFCBE3.9000508@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wTHOnTwmI9kyJQysTQYx"
Mime-Version: 1.0
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wTHOnTwmI9kyJQysTQYx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 23:30 +0200, Richard Weinberger wrote:
> a =3D 1 + b;
> res =3D c + a;
>=20
> return res;
>=20
> vs:
>=20
> a =3D 1 + b;
> res =3D c + a;
> return res;

Sorry, but I think the above example is not quite suitable because it
looks too general, while I was asking only about a specific thing, not
for any return or goto.

ret =3D func();
if (ret) {
	free(x);

	goto out;
}

--=20
Best Regards,
Artem Bityutskiy

--=-wTHOnTwmI9kyJQysTQYx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPz+ffAAoJECmIfjd9wqK01g4P/3MdlM/8sSMSsg47BWLNk77e
vhwRXLm9krjvMP84bG7Pu1btG1MCtCgXLnxfWSMjz4f+dTuyP3OZqJT5BKJ/iitB
sGLBitI+f2/RIdzTPjdtugLA7W5NtRHHifNStUi91Ov08RdC3NzYaKcteASAqWng
N3xrbkNR9ROPWU9yNbuQ06QCDCFrDXR8eCjbb3Yzn6DlpI8UkSnu54X6OQmvsNbS
Cjg820rLNp87nxaorDdutuzEw78yqpJetOCHoeC6P25wdWKBLvayIw3ppYsJ6e4S
bC5YNlN+mzqQaZdIxr9bgUkNecyKx48a+QgUO4tJg0Vx/JQq9/Ju0sh6abj2D5X6
ph/bxECsiYYj7oI17DAvGibrD70WPXUwalzsYMPL729bQmdz0ULG6CWdsMlL+YU4
9xhJXYEgPznZieMjejc9pXKzKlCFZefI/9dwKmDydplwF9vxe/1SE9mhAv8EAGC1
R2Vj6PoFFeR9dP7bchhxjCJxr4oVQnGjtMMbzKbL3CG7PC/Qg20SGvreEf1ID/2t
f/RQWaWHH/8ZhIhRq5JjcZh9Qjt/EZZlY7clbWCxiSo2iwdNWBVoPKG5zNVYKSth
zxDywYCB9rZtPAJJ1VcP0HInuSCCC14RUXeqBhfdpRtVzae6WdtGhC3aNuEFr5UH
U0sWzt1mEsyYyaKmCvED
=FYhg
-----END PGP SIGNATURE-----

--=-wTHOnTwmI9kyJQysTQYx--
