Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RISq7-0006dl-5W
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2011 22:17:51 +0000
Received: by faaf16 with SMTP id f16so172239faa.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Oct 2011 15:17:49 -0700 (PDT)
Subject: Re: [BUG] Re: mtd_stresstest module bricked my dockstar
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Tue, 25 Oct 2011 01:16:54 +0300
In-Reply-To: <20111024212455.GC6326@pengutronix.de>
References: <69501156.1798237.1319395066798.JavaMail.fmail@mwmweb003>
	<20111024055705.GA4020@1wt.eu>
	<B10F15EA8AB74E698DC0D94563A30BE7@samsungnetbook>
	<20111024195313.GA6326@pengutronix.de> <1319490276.12314.9.camel@golum>
	<20111024212455.GC6326@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-D+ePolUnIfEekThgAwNo"
Message-ID: <1319494666.13057.1.camel@golum>
Mime-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Roland Kletzing <devzero@web.de>,
	linux-mtd@lists.infradead.org, adrian.hunter@intel.com,
	Willy Tarreau <w@1wt.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-D+ePolUnIfEekThgAwNo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-10-24 at 23:24 +0200, Wolfram Sang wrote:
> > Yes, we should use -1 as the default value, and print a scary warning
> > message when the module is inserted without a parameter. We should
> > probably also put word "destructive" or something like this to the
> > module description.
>=20
> I would volunteer to do this tomorrow if nobody is working on it at this

Please, go ahead. I'll try to pick them to my l2 mtd tree ASAP so that
they get merged this merge window. I guess we also want to cc
stable@kernel.org.

--=20
Best Regards,
Artem Bityutskiy

--=-D+ePolUnIfEekThgAwNo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOpePWAAoJEJtuLFy+q7fe5PMH/1mGbxGZy0ar3bRAW0r/1jmf
OyOKTZzt2wyyfY0KAUhCdGRZf1d+MLjSeLvaO3/td1G0NliLXGVhgwt6ezK4djM1
Q54DxhZrLZHWnsk+CHkXGd5SkVS7GD/d46/7NIt+OxWzERZOQ3xcberSKuhF98Tf
0VvVv2402k3ku+wZFJ7Dg9WqyON0258vVd7B/Ap49d/9wtWnLG/cqwJyn9OeNDiS
CHOBUBUoJEXyzsxaU5lcXQsuX2KGX13KkXHuIvUHZT/2ecH8CWLBwzMfsj+mX5DE
+qyhAL4jyR0dZRqoXBeAy2BgwRHK1hzIp+Ad1Gbk8hE3q8dPM209hEzzpFUHlwo=
=1DVm
-----END PGP SIGNATURE-----

--=-D+ePolUnIfEekThgAwNo--
