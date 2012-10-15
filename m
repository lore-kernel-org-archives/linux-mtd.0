Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TNqLC-0003jK-IO
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 19:28:43 +0000
Received: by mail-lb0-f177.google.com with SMTP id gi11so3647406lbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2012 12:28:38 -0700 (PDT)
Message-ID: <1350329299.1509.6.camel@kyv>
Subject: Re: [PATCH] [MTD] Adjust the NOR CFI flash timeouts to round better
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 15 Oct 2012 22:28:19 +0300
In-Reply-To: <1350317380.14124.26.camel@shinybook.infradead.org>
References: <20121005183202.GA11385@obsidianresearch.com>
 <1350308556.5769.5.camel@sauron.fi.intel.com>
 <1350317380.14124.26.camel@shinybook.infradead.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Y7B3sRuiziqGT+usGfUz"
Mime-Version: 1.0
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Y7B3sRuiziqGT+usGfUz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-10-15 at 09:09 -0700, David Woodhouse wrote:
> On Mon, 2012-10-15 at 16:42 +0300, Artem Bityutskiy wrote:
> > On Fri, 2012-10-05 at 12:32 -0600, Jason Gunthorpe wrote:
> > > -	/* see comments in do_write_oneword() regarding uWriteTimeo. */
> > > -	unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
> > > +	/* see comments in do_write_oneword() regarding uWriteTimeo.
> > > +	   Note: write_buffer commands take longer so we use a higher
> > > +	   time. The AMD 29LV256M for instance has a datasheet max
> > > +	   of 1.2ms for page and 600us for byte */
> > > +	unsigned long uWriteTimeout =3D (HZ / 1500) + 2;
> >=20
> > What does HZ / 1500 mean? HZ is amount of timer interrupts per second,
> > which may be 1/100, or 1/1000, or 1/300, depending on the system.
>=20
> If HZ is the amount of timer interrupts per second, then HZ/1500 is the
> amount of timer interrupts in 1/1500 of a second, aka 666.7=C2=B5s.=C2=B9

First of all, yes, my e-mail was not very clear, I guess I just wanted
to express that it is not very readable. Also, HZ / 1500 would be 0 for
HZ < 1500, since we are using integer arithmetic.

--=20
Best Regards,
Artem Bityutskiy

--=-Y7B3sRuiziqGT+usGfUz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfGPTAAoJECmIfjd9wqK0kloP/jAKQxkGTOLeptvRaJRG2SNS
P7uVviTW3Hv75xjiOWpoQssODYRkcQgSqF85TaYA14YHfpTWXVBXd9UPdTprT0gY
PkCmH0KJz9fMYZCzv5P/A3bpZUXymZ4ZQ91/ZblOWNNzYV5kvKSZ2/4Yp4awLvtd
RqvTJLrxJsoVnBPowuWjInQ7CueCCOojsITTrO6yduQYdQv47+XPb2htf8XkqFWv
sWhtGE9z8CYhzxjUbkmmtAeA5rLMQiNXklUCzISKlhuEp4jdu2uCMLu20prG2dAb
/FwHzLC4ef8M/Byc5OL//4cQdr3PL/Ojyg/bhbrrhB/H6BQ+/oL7N89L0qlQZj/f
h2MMKQQ5+1+IlIGld2QnnZk7B/La7OEbj798zR6Ld8bW2CTqttvpxSPS1xi2N4a0
5NQyN0/8+P8Tp8QyxXmX7dxkeabqJO8iekyzuv8KnWh4VzIOGNN83eFZ15qp7tnj
x46q8Dpt7zJ0/LuD+EuEA5Sz1R+sAl5rNPV4T/SJZe2EBztiruPKjaBLwmCfjDLm
M8e3IdIvM6HDIsqE7C9+j3KflzgQikg+7vnMYuIPMcns+P6UAqTUmWnkLCCFccLw
Am5ltc2ybb5CZ2Z30G/L+4T4XotzPoZJ0y2li+BjwgqAIws1aqMoTjwE2Z2BgjUC
5an2uuL/g9GvwjlAp/1c
=ozjR
-----END PGP SIGNATURE-----

--=-Y7B3sRuiziqGT+usGfUz--
