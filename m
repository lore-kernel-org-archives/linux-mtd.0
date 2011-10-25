Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RIbVp-00020n-Uz
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2011 07:33:31 +0000
Received: by wwf27 with SMTP id 27so180014wwf.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Oct 2011 00:33:28 -0700 (PDT)
Subject: Re: [PATCH] phram: make kernel boot command line arguments work
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Fache, Herve" <h-fache@ti.com>
Date: Tue, 25 Oct 2011 10:32:56 +0300
In-Reply-To: <CA+Xn3W3huOu_zu7MzSr0W1wpo7mD_ek8eOYNstkMnb9wm3-JZw@mail.gmail.com>
References: <1318866038-11781-1-git-send-email-h-fache@ti.com>
	<1319127627.20953.8.camel@sauron>
	<CA+Xn3W3huOu_zu7MzSr0W1wpo7mD_ek8eOYNstkMnb9wm3-JZw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-G/0nBOJe8AraGyyypgqL"
Message-ID: <1319528005.14178.2.camel@golum>
Mime-Version: 1.0
Cc: joern@lazybastard.org, joern@logfs.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-G/0nBOJe8AraGyyypgqL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-10-21 at 10:49 +0200, Fache, Herve wrote:
> > Accessing __initdata from non __init function. Please check that your
> > patch does not introduce a new section mismatch. There is even a kernel
> > config option to debug these issues.
>=20
> I enabled DEBUG_SECTION_MISMATCH but I don't get errors. Also, this
> part of the code will never be reached once init has run. If you think
> that it's a risk, then I can remove the __initdata keyword.

Did you test this for the case when it is compiled into the kernel as
well, not only as kernel module?

--=20
Best Regards,
Artem Bityutskiy

--=-G/0nBOJe8AraGyyypgqL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOpmYoAAoJEJtuLFy+q7fe1DsH/iAYcLzhOBtP54aczjIOdOLo
M9Csj15zrVz45DcjVPZ6JQ05nmNUJb38yGN5f2jB8c/WUefU6dPnlgWpIJKURe+5
0wwWhzFu6sVjHvHkRo+WAyMyNrvGH7squH6W915IGw9QBQZY34XbZqCPEPu52f/a
8V6FIbAlXnZ1+p43Oi8r44enBrAXxT+bkbPYAVPWHyQR0XeD0Pevy8RXf/m+X+7Y
JBbRhJ4F9Hgh88OgA1UG7UoM/cSnpf/hakDoCVOrequZMFC97hb8uYSrLmWE04wK
9jfZkBak3rxA25Sfyt8ahOU9MPPIWPVdyV3Vf8tdPc1hJ9CxQGTVdQ1AUaoAmzg=
=dIoF
-----END PGP SIGNATURE-----

--=-G/0nBOJe8AraGyyypgqL--
