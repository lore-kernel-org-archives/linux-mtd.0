Received: from dsl-205-210-52-188.kingston.net ([205.210.52.188] helo=linux.interlinx.bc.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18718R-0001kj-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 22:16:23 +0000
Date: Wed, 30 Oct 2002 17:46:33 -0500
To: linux-mtd@lists.infradead.org
Cc: Jamey.Hicks@hp.com, joern@wohnheim.fh-wedel.de
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021030224633.GI27880@pc.ilinx>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021030204937.GG27880@pc.ilinx> <200210302
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bina0ufSB9dLMnVr"
Content-Disposition: inline
In-Reply-To: <20021030214341.GC25383@wohnheim.fh-wedel.de>
From: "Brian J. Murrell" <23025b7367b1a31e3ff7682b8a6ae18e@interlinx.bc.ca>
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

--Bina0ufSB9dLMnVr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2002 at 10:43:41PM +0100, J=F6rn Engel wrote:
>=20
> In simple terms, mtd is an interface to read, write and erase memory
> devices:
> - Read any part of the device.
> - Write any part of the device, writing only flips 1s to 0s.
> - Erase predefined blocks atomically, erasing flips all 0s in the
>   block to 1s.

OK.

> This is a perfect interface for flash memory, might also be nice for
> cdrw, dvdram, etc. and sucks for most everything else.

I see.

> Yes, quite similar. The only use I see for this is development and
> testing,

Which coincides with the use of UML nicely.

> but that is not the worst use. A notebook with uml is
> sufficient to do a lot of stuff without real hardware.

Right.

> Kinda. You need some sort of memory to create an mtd device from. But
> this memory does not have to be real hardware, just as you can create
> filesystems on raid devices, network block devices, loopback files,...

OK, so the general MTD subsystem is applicable without hardware, parts
are not though.

> Maybe. The stuff in drivers/mtd/chips and /nand looks like a good
> candidate.

Right.

> > > You can say, it already is. But=20
> > >=20
> > > [ "$CONFIG_MEMORY_BUS" =3D "y" -o
> > >   "$CONFIG_HAS_MEMORY" =3D "y" -o
> > >   "$CONFIG_HAS_BLOCK_DEVICES" =3D "y" ]
>=20
> -o is the key. ;-)
> Any system sans uml has a memory bus and uml has block devices.

Right.  My example was a generalization around the whole MTD
sub-system.  If it were going to be finer grained to specific devices,
the tests would specific to the bus(es) they can use.

> So the
> test evaluates to true in either case. Ignoring it completely keeps
> Config.in shorter and simpler, which is a Good Thing(tm).

But any device that requires access to physical hardware will break
during a UML build if it is enabled during the configure.  It should
not even be selectable if it's required hardware is not selected,
IMHO.

> "need to be protected by"? Propably not. "don't make much sense
> without"? Propable yes.

And will break the building of a UML if selected.  The idea is not to
get a couple of hours into a kernel build and go "oooops, I forgot to
disable ______ hardware driver" when the build breaks because of some
hardware access not being available in the UML configuration.

> This looks like a tradeoff between complexity in the Config.ins and in
> .config or the make *config interface. If you want to keep the user
> interface shorter and are willing to do the work, go ahead!

It's fairly simple work in the Config.ins.  I would do it but I don't
really know what kinds of devices (i.e. buses) are required by the
various MTD devices.  I did do this work for PC apple/ethertalk cards
and submitted it to Marcelo.

> Actually, the longer I think about it, the more sense it makes. Might
> really be a good idea.

I hoped I could bring you (rather, somebody, anybody with more
knowlege about this than I) around.  :-)

b.

--=20
Brian J. Murrell

--Bina0ufSB9dLMnVr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9wGFJl3EQlGLyuXARAhrWAKDMht/qBA/xDw0/44zDVrHSVwXhLACfRmWC
WVonhbu0o7L8DijhAhEpPUw=
=qyuN
-----END PGP SIGNATURE-----

--Bina0ufSB9dLMnVr--
