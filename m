Received: from vds-320151.amen-pro.com ([62.193.204.86])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D4gDM-0006Kb-Fs
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2005 09:13:09 -0500
From: Lorenzo =?ISO-8859-1?Q?Hern=E1ndez_?= =?ISO-8859-1?Q?Garc=EDa-Hierro?=
	<lorenzo@gnu.org>
To: tglx@linutronix.de
In-Reply-To: <1109325105.3033.10.camel@lap02.tec.linutronix.de>
References: <44BDAFB888F59F408FAE3CC35AB47041014F9285@orsmsx409>
	<1109206700.8215.4.camel@windu.rchland.ibm.com>
	<20050223171559.A23461@unix-os.sc.intel.com>
	<1109259722.3796.22.camel@localhost.localdomain>
	<20050224155559.A727@unix-os.sc.intel.com>
	<1109325105.3033.10.camel@lap02.tec.linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-GbFMT0hlafKc1ebt2a8w"
Date: Fri, 25 Feb 2005 15:12:34 +0100
Message-Id: <1109340754.18747.20.camel@localhost.localdomain>
Mime-Version: 1.0
Cc: lorenzo@gun.org, linux-mtd@lists.infradead.org
Subject: Re: xattr support  for JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-GbFMT0hlafKc1ebt2a8w
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

El vie, 25-02-2005 a las 10:51 +0100, Thomas Gleixner escribi=F3:
> I backup Davids POV. xattrs should go into new node type(s) rather than
> into the reiser style "everything is a directory" approach. It's an ugly
> hack. I prefer designed functionality over the patchwork approach. I
> know that it will take more time, but it will fit better and will be
> easier to maintain.

Me too, ignore my patches that use the weird reiserfs-based
implementation, among that they wouldn't compile yet :)

And yes, we can't break ABI/API compatibility by adding ugly hacks, so,
I will do as David commented, will try to start some new work on it this
weekend, but I'm still busy with exams and other stuff.

Thanks again for the comments,
Cheers.
PS: Those who are interested in this and also in contributing and
working together to get it, would write their names and contact info at
http://wiki.tuxedo-es.org/tuxedo/JFFS2xattr ?
--=20
Lorenzo Hern=E1ndez Garc=EDa-Hierro <lorenzo@gnu.org>=20
[1024D/6F2B2DEC] & [2048g/9AE91A22][http://tuxedo-es.org]

--=-GbFMT0hlafKc1ebt2a8w
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta parte del mensaje =?ISO-8859-1?Q?est=E1?= firmada
	digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBCHzJSDcEopW8rLewRAkS2AJ9KVmh09KVLac6gx1o9JVuLEjcvUgCgoMzr
IOvn39zAn1CBdangX8/MDYw=
=0k0Y
-----END PGP SIGNATURE-----

--=-GbFMT0hlafKc1ebt2a8w--
