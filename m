Received: from dsl-205-210-52-188.kingston.net ([205.210.52.188] helo=linux.interlinx.bc.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1872ZO-0001te-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 23:48:19 +0000
Date: Wed, 30 Oct 2002 14:38:34 -0500
To: linux-mtd@lists.infradead.org
Cc: joern@wohnheim.fh-wedel.de, Jamey.Hicks@hp.com
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021030193834.GE27880@pc.ilinx>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V4N4TvXMNzuFMHdo"
Content-Disposition: inline
In-Reply-To: <20021030185507.GA31547@wohnheim.fh-wedel.de>
From: "Brian J. Murrell" <23e66ee85dd6f572f5e9fdbfa506bf85@interlinx.bc.ca>
Resent-Message-Id: <20021031001823.65824C6FD@pc.interlinx.bc.ca>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--V4N4TvXMNzuFMHdo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[ I dunno if this will make it to the list or not as I seem to be
getting bounced from list postings, most likely in the name of spam
prevention.  What the spammers have done to our Internet!  ~sigh~ ]

On Wed, Oct 30, 2002 at 07:55:07PM +0100, J=F6rn Engel wrote:
>=20
> NOR flashes are basically ram sans write access. You can connect them
> to the memory bus, execute code directly from those. And I know of no
> system without a memory bus that linux is running on. ;-)

As I wrote to Jamey, and got a bounce back from the linux-mtd list,
Linux does run on a "system" without a memory bus.  UML, is linux in a
user-space process.  It has no access to any hardware directly.  It
does a pretty good job of isolating itself from trying to build
hardware drivers, as long as the drivers are connected to "bus"es in
the kernel configuration system.

He also did point out that MTDs can be attached to memory buses, and
unless I have missed it, the linux kernel configuration system does
not recognize memory buses as a device which needs to be explicitly
configured.  Perhaps it should be, such that MTDs could be dealt with
in a manner such as:

if [ "$CONFIG_MEMORY_BUS" =3D "y" -o
     "$CONFIG_SOME_OTHER_BUS" =3D "y" -o
     "$CONFIG_YET_ANOTHER_BUS" =3D "y" ]; then
     <ask about CONFIG_MTD>
fi

and UML kernels and undef CONFIG_MEMORY_BUS.

b.

--=20
Brian J. Murrell

--V4N4TvXMNzuFMHdo
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9wDU6l3EQlGLyuXARArOxAKCCw2JZbp3XElITjDf14dzkw6TujACg9oyN
KoftMimJNNgSC+3EMqxisbE=
=wAxR
-----END PGP SIGNATURE-----

--V4N4TvXMNzuFMHdo--
