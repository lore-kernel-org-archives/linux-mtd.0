Received: from dsl-205-210-52-188.kingston.net ([205.210.52.188] helo=linux.interlinx.bc.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1872Z4-0001tS-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 23:47:59 +0000
Date: Wed, 30 Oct 2002 12:30:37 -0500
To: linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021030173036.GB27880@pc.ilinx>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ugEqy3masBx2OgH"
Content-Disposition: inline
In-Reply-To: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net>
From: "Brian J. Murrell" <6a127d328308423eb47c92a79d2841b6@interlinx.bc.ca>
Resent-Message-Id: <20021031001809.D8A74C6FD@pc.interlinx.bc.ca>
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

--1ugEqy3masBx2OgH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2002 at 11:22:50AM -0500, Hicks, Jamey wrote:
>=20
> Some MTD devices connect directly to the CPU.  It seems to me that
> if you have a CPU with a memory bus, then it is possible to have MTD
> devices, so drivers/mtd/Config.in needs to give you the option of
> selecting those devices.

Hmmmm.  It would seem then that the kernel configuration system is
lacking a specification for a "memory bus".  Yes/No, what kind,
whatever.  But it is possible to build and run a kernel that does not
actually have a CPU or a memory bus, for example, in the case of a UML
kernel.

The UML configuration process does a good job of weeding out actual
hardware devices (in fact it's just the kernel configuration that does
the work), but it does that by nature of the configuation system
encapsulating hardware selection options (like MTD) inside bus
configuation.

> The MTD configuration is all wrapped with the toplevel CONFIG_MTD
> option, so there is really only one question you would have to say
> 'No' to in order to avoid the others.

True, but it would be nice if CONFIG_MTD were tied to some kind of
hardware (i.e. a memory bus) so that you could take a .config from a
real hardware running kernel and use it to build a UML kernel without
having to go and diddle with things like CONFIG_MTD.

b.

--=20
Brian J. Murrell

--1ugEqy3masBx2OgH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9wBc8l3EQlGLyuXARAgJmAKDt/9Zk0G0fp7+EjSwjLpioJQSrwQCgpBUf
RVZBq8698hfqHNeWVmt/Yqg=
=cHwp
-----END PGP SIGNATURE-----

--1ugEqy3masBx2OgH--
