Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZXM2-0002Ju-EN
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jul 2003 15:52:34 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Joshua Wise <joshua@joshuawise.com>
In-Reply-To: <200307052215.35596.joshua@joshuawise.com>
References: <200307042232.43815.joshua@joshuawise.com>
	 <200307052157.06325.joshua@joshuawise.com>
	 <m3el142yly.fsf@maxwell.lnxi.com>
	 <200307052215.35596.joshua@joshuawise.com>
Message-Id: <1057589533.1135.8572.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 07 Jul 2003 08:52:13 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-mwJR1nRm40qwUuvg1hzF"
cc: linux-mtd@lists.infradead.org
Subject: Re: jedec_probe.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mwJR1nRm40qwUuvg1hzF
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-07-05 at 20:15, Joshua Wise wrote:

> On Saturday 05 July 2003 10:11 pm, Eric W. Biederman wrote:

> > It shouldn't be, and the probes are just used at probe time.  The
> > rest of the time their modules can even be unloaded if necessary.
>=20
> Sweet, so if jedec_probe was rewritten to not have to use jedec_probe_chi=
p, or=20
> gen_probe at all for that matter, we would not have to deal with=20
> jedec_probe_chip anywhere else?

jedec_probe only does chip setup.  Once things are setup then
jedec_probe and gen_probe are no longer needed - they can be unloaded if
they are modules.

In the case of an embedded platform I can't see gen_probe and
jedec_probe being too useful.  I would imagine that someone would write
a very simple setup that initializes what is already expected to be
there.  jedec_probe and gen_probe are very useful, however, on platforms
that are generic.  Do you propose to write a replacement jedec_probe
that is still generic?

I do realize that jedec_probe is not guaranteed to work and is poor when
the configuration is known.  I have proposed writing a module that can
take configuration information as arguments or from userspace and simply
initialize the parts without stumbling around in the dark trying to find
MTD's.  I have even written some code - I just never committed it
because I wasn't happy with the solution and didn't have time to
complete it (that might change in the future).

Having a generic, forced configuration would be very useful for those
that already know what they have in the system.  It would also fix cases
where hardware is impossible to reliably probe.  This type of work would
be very much appreciated.

--=20
Thayne Harbaugh
Linux Networx

--=-mwJR1nRm40qwUuvg1hzF
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA/CYkcfsBPTKE6HMkRAl56AJ9WbqB6A//CT3BlpCRbmIW0jUBT7gCcDp0g
agQdCU4m41U/y0eTEuyxUlw=
=L12O
-----END PGP SIGNATURE-----

--=-mwJR1nRm40qwUuvg1hzF--
