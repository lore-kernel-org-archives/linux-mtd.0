Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14kEv7-0003Ko-00
	for mtd-list@infradead.org; Tue, 03 Apr 2001 01:43:41 +0100
Received: from gateway-1237.mvista.com ([12.44.186.158] helo=thud.mvista.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14kEv5-0003Ki-00
	for mtd@infradead.org; Tue, 03 Apr 2001 01:43:39 +0100
Received: (from mferrell@localhost)
	by thud.mvista.com (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) id f330gWQ21836
	for mtd@infradead.org; Mon, 2 Apr 2001 17:42:32 -0700
Date: Mon, 2 Apr 2001 17:42:32 -0700
From: mferrell@mvista.com
To: mtd@infradead.org
Subject: Re: RPX Classic/Lite and byte ordering
Message-ID: <20010402174232.A13731@thud.mvista.com>
References: <3AC8E6A2.E0E43DC1@emware.com> <3AC9245B.4000205@bigpond.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <3AC9245B.4000205@bigpond.com>; from brendan.simon@bigpond.com on Tue, Apr 03, 2001 at 11:16:11AM +1000
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I was talking with some people who work with the Embeded Planet RPX stuff a=
nd
apparently a couple of chips on the system are wired backwards.  The
developers could remember "exacly" which models they ran across that where
wired this way, but he remembered that it only showed up when dealing with
double words.  Dunno if that helps.

As far as the PPC stuff, a few can be little endian, but under linux they a=
re
all big endian so far.


On Tue, Apr 03, 2001 at 11:16:11AM +1000, Brendan J Simon wrote:
> Nope.  A powerpc cross compiler *should* produce *exactly* the same code=
=20
> as a naitive compiler.  This assumes you are using exactly the same=20
> version of gcc, gas and glibc.  Having said that, I just remembered that=
=20
> the PowerPC architecture can be big endian or little endian.  There must=
=20
> be a configuration option when building the compilers that sets the=20
> default.  You should be able to specify which you want, either in the=20
> spec file or on the command line.
>=20
> I've had a look at my spec file.  Try the -mbig-endian (or -mbig) for=20
> big endian.  Try -mlittle-endian (or -mlittle) for little endian.  I=20
> prefer -mbig-endian or -mlittle-endian because they are a lot clearer=20
> than -mbig or -mlittle.
>=20
> My spec file has the following:
>=20
> *multilib_defaults:
> mbig mcall-linux
>=20
> *cpp_endian_default:
> %(cpp_endian_big)
>=20
> *cc1_endian_default:
> %(cc1_endian_big_spec)
>=20
>=20
> Regards,
> Brendan Simon.
>=20
>=20
>=20
> Tim Bowman wrote:
>=20
> > Would cross-compiling the kernel on an x86 produce different ordering
> > than compiling natively on a PowerPC (which is how I am building it)?=
=20
> > Maybe I need to build it on an x86?
>=20
>=20
>=20
>=20
>=20
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

--=20
Mark Ferrell <mferrell@mvista.com>
Monta Vista Software Inc. <http://www.mvista.com>

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6yRx3xfbss44dZwgRAvV8AJ0Yr83T+VH+i88G8HmyjB1k0EUGCgCeKRxk
+diPP8VBaLzX/VIcb2TgY1k=
=UTCb
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
