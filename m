Received: from dsl-205-210-52-188.kingston.net ([205.210.52.188] helo=linux.interlinx.bc.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1872ZW-0001tj-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 23:48:26 +0000
Date: Wed, 30 Oct 2002 15:49:37 -0500
To: linux-mtd@lists.infradead.org
Cc: joern@wohnheim.fh-wedel.de, Jamey.Hicks@hp.com
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021030204937.GG27880@pc.ilinx>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YfqBrEkRVu0wMIYz"
Content-Disposition: inline
In-Reply-To: <20021030201608.GA28523@wohnheim.fh-wedel.de>
From: "Brian J. Murrell" <8db422baa67bd7a698f50768bba0d47e@interlinx.bc.ca>
Resent-Message-Id: <20021031001833.5C11DC6FD@pc.interlinx.bc.ca>
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

--YfqBrEkRVu0wMIYz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2002 at 09:16:08PM +0100, J=F6rn Engel wrote:
>=20
> Usually, the list is a bit slow. My worst delay was a couple of days.

Actually, no, this is a hard (550) bounce.  I have e-mailed the
postmaster but got nothing back yet.

> Correct, uml does not have a memory bus. But it does have memory and
> it does have block devices, which can both be used to create mtd
> devices from.

OK, I must be mis-understanding what an MTD device is then, not
surprisingly.  Which is precicely why I came and asked here about
this.  I had assumed that an MTD was the likes of a Compact Flash card
/PCMCIA memory device and the like.  Some physical piece of memory
hardware device that required physical connection to the machine.

Can you elaborate on how an MTD could be used by a UML kernel?  Is
this similar to using loopback devices to access files as block
devices?  i.e. virtual MTD devices.

So the MTD subsystem will build and run on a UML (i.e. it has no
hardware properties such as IRQ's, DMA, etc. itself)?  Surely there
must be some aspect of the MTD system which becomes dependent on
addressing specific hardware devices though?

Perhaps the test for specific hardware required to support MTD devices
needs to be finer grained than around the whole CONFIG_MTD option.
Something more like:

      <ask about CONFIG_MTD>
if [ "$CONFIG_MEMORY_BUS" =3D "y" -o
      "$CONFIG_SOME_OTHER_BUS" =3D "y" -o
      "$CONFIG_YET_ANOTHER_BUS" =3D "y" ]; then
      <ask about device specific MTD options>
fi

with different test for different kinds of buses specific to each type
of hardware MTD.

> You can say, it already is. But=20
>=20
> [ "$CONFIG_MEMORY_BUS" =3D "y" -o
>   "$CONFIG_HAS_MEMORY" =3D "y" -o
>   "$CONFIG_HAS_BLOCK_DEVICES" =3D "y" ]
>=20
> evaluates to true for all current platforms, including uml.

Are you saying this is how it is already and it is correct?  How can
you attribute a memory bus to UML?  Block devices, I can understand,
in that there are some UML provided block devices like UBD disks etc.

> Your turn, can you still think of a system that doesn't allow for mtd?

I dunno.  I don't know much about MTD, which is why I am asking for
advice here.  Are there any CONFIG_*_MTD* options in the kernel that
need to be protected by any bus options?

--=20
Brian J. Murrell

--YfqBrEkRVu0wMIYz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9wEXhl3EQlGLyuXARAmXmAKCzCbpDGq8JsS7LC+yzFwVERs1+PwCePDi7
Z6ap3NFT4682WiUiwXZLY/0=
=k0hD
-----END PGP SIGNATURE-----

--YfqBrEkRVu0wMIYz--
