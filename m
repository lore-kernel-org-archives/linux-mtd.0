Received: from dsl-205-210-52-251.kingston.net ([205.210.52.251] helo=linux.interlinx.bc.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189maW-0005Ye-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2002 13:20:48 +0000
Date: Thu, 7 Nov 2002 08:50:53 -0500
To: linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021107135052.GA13914@pc.ilinx>
References: <20021106204530.GE12743@pc.ilinx> <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <6557.1036
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <6557.1036656036@passion.cambridge.redhat.com>
From: "Brian J. Murrell" <e88cd5ffd87e620fdc30b3e6db510d03@interlinx.bc.ca>
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

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2002 at 08:00:36AM +0000, David Woodhouse wrote:
>=20
> What happens when someone makes a mapping driver for UML which mmaps part=
=20
> of /dev/kmem from the host?

I hope I am understanding the question/scenario you are proposing, but
the answer seems to simple, so I am sure I am missing something.

When/if someone makes that UML mapping driver, it would have it's
CONFIG_MTD_UML (or whatever they will call it) outside of the
CONFIG_MEMORY bus protected portions of the MTD Config.in files.

b.

--=20
Brian J. Murrell

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9ym+8l3EQlGLyuXARAr5XAKCTh9Pa718B6NFfQPvev3ApxnoyoACgooOo
98hStMrx8tlHvTzghh7gqSo=
=MGzG
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
