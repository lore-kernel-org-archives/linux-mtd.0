Received: from node-d-1ea6.a2000.nl ([62.195.30.166] helo=laptop.fenrus.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M2Md-0002gh-HE
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 10:09:23 +0100
From: Arjan van de Ven <arjanv@redhat.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20030531075615.GA25089@wohnheim.fh-wedel.de>
References: <20030530174319.GA16687@wohnheim.fh-wedel.de>
	 <20030530.171410.104043496.davem@redhat.com>
	 <20030531064851.GA20822@wohnheim.fh-wedel.de>
	 <20030530.235505.23020750.davem@redhat.com>
	 <20030531075615.GA25089@wohnheim.fh-wedel.de>
Message-Id: <1054372158.5259.0.camel@laptop.fenrus.com>
Mime-Version: 1.0
Date: 31 May 2003 11:09:19 +0200
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-WGyCU2SqoXTxuFsnq5WU"
cc: "David S. Miller" <davem@redhat.com>
cc: linux-mtd@lists.infradead.org
cc: linux-kernel@vger.kernel.org
cc: jmorris@intercode.com.au
cc: Con Kolivas <kernel@kolivas.org>
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
Reply-To: arjanv@redhat.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-WGyCU2SqoXTxuFsnq5WU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-05-31 at 09:56, J=C3=B6rn Engel wrote:
> CC List pruned a little.
>=20
> On Fri, 30 May 2003 23:55:05 -0700, David S. Miller wrote:
> >    From: J=C3=B6rn Engel <joern@wohnheim.fh-wedel.de>
> >   =20
> >    How about preemption?  zlib operations take their time, so at least =
on
> >    up, it makes sense to preempt them, when not in softirq context.  Ca=
n
> >    this still be done lockless?
> >=20
> > You'll need to disable preemption.
>=20
> My gut feeling claims that this would hurt interactivity.=20

the code is decompressing data that was 4096 bytes originally. I doubt
that will be anything close to some real wallclock time nowadays....

--=-WGyCU2SqoXTxuFsnq5WU
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA+2HE+xULwo51rQBIRAti2AJ9+42PNjQlhlXi7ID0200udIuYulgCbBDV+
vDobyg5RSQ2gy7x9qtzmKdo=
=fStp
-----END PGP SIGNATURE-----

--=-WGyCU2SqoXTxuFsnq5WU--
