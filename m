Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Zu5A-0005Un-Hr
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2003 16:08:40 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1057652512.28965.107.camel@imladris.demon.co.uk>
References: <200307042232.43815.joshua@joshuawise.com>
	 <200307052157.06325.joshua@joshuawise.com>
	 <m3el142yly.fsf@maxwell.lnxi.com>
	 <200307052215.35596.joshua@joshuawise.com>
	 <1057589533.1135.8572.camel@tubarao.lnxi.com>
	 <1057652512.28965.107.camel@imladris.demon.co.uk>
Message-Id: <1057676896.1251.8626.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 08 Jul 2003 09:08:16 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-339/b7bPR8DTcLwtFXIF"
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


--=-339/b7bPR8DTcLwtFXIF
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-07-08 at 02:21, David Woodhouse wrote:
> On Mon, 2003-07-07 at 15:52, Thayne Harbaugh wrote:
> > Having a generic, forced configuration would be very useful for those
> > that already know what they have in the system.  It would also fix case=
s
> > where hardware is impossible to reliably probe.  This type of work woul=
d
> > be very much appreciated.
>=20
> If we do this, it needs to be easy to switch back to the generic probe
> code.

The forced configuration would be an override.  I've played around and
have some modules that take parameters that override usual behavior.=20
I'm not sure if I like this or if I would rather have a separate module
(maybe forced_probe) that could be used instead of gen_probe and
jedec_probe (or even cfi_probe).

>  Many people don't really know how their board is wired up, or are
> given incorrect information. I have customers who _insist_ their boot
> flash is wired up as 32 bits, and file bugs against the working kernel
> because of the comments and board setup for 16 bit flash. Not because
> they claim it doesn't work, but just because they're comparing with
> their docs.

Makes perfect sense.  Most people would use the already established
probing mechanisms.

--=20
Thayne Harbaugh
Linux Networx

--=-339/b7bPR8DTcLwtFXIF
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA/Ct5ffsBPTKE6HMkRAuSbAJ4i6jpm1YLsbSxMuDlRr0hBoK2rqwCcC4jj
ORxWgsHwo4ZnsiuK+LWSeqM=
=y4tb
-----END PGP SIGNATURE-----

--=-339/b7bPR8DTcLwtFXIF--
