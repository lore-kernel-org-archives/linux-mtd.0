Received: from dsl-205-210-52-188.kingston.net ([205.210.52.188] helo=linux.interlinx.bc.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187K9x-0003d5-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2002 18:35:13 +0000
Date: Thu, 31 Oct 2002 14:05:19 -0500
To: linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021031190518.GL27880@pc.ilinx>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021030204937.GG27880@pc.ilinx> <200210311
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I2AcQh+/kfs26T/w"
Content-Disposition: inline
In-Reply-To: <20021031183718.GA31035@wohnheim.fh-wedel.de>
From: "Brian J. Murrell" <4b07d544b5c5062e647d85db08f8d05c@interlinx.bc.ca>
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

--I2AcQh+/kfs26T/w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2002 at 07:37:18PM +0100, J=F6rn Engel wrote:
>=20
> All right. This patch will only create the mtd devices from ram and
> block devices, unless $CONFIG_MEMORY_BUS is defined.

Cool.  Is the memory bus the only bus that MTD devices can be attached
to?  They can't be attached to USB or PCMCIA or anything else?  Or
perhaps the only ones supported by Linux right now are ones attached
to a memory bus?

> Brian, can you define this option for all platforms other tham uml?

I will take a look.

> Also, this might still be a little too broad for nand flash. Nand
> needs more than just a memory bus, but I don't know what exactly.
> But this should be close enough for now.

OK.

Thanx!

b.

--=20
Brian J. Murrell

--I2AcQh+/kfs26T/w
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9wX7ul3EQlGLyuXARAs2zAKCTBVvdZiUA5qz0HzaxFeCw3oXoBACfTOVR
I3NSDOJUsdMhKVP9VLeWwwE=
=2PjD
-----END PGP SIGNATURE-----

--I2AcQh+/kfs26T/w--
--I2AcQh+/kfs26T/w--
