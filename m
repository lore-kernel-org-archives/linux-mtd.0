Received: from vds-320151.amen-pro.com ([62.193.204.86])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D4L8O-00083f-5w
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2005 10:42:37 -0500
From: Lorenzo =?ISO-8859-1?Q?Hern=E1ndez_?= =?ISO-8859-1?Q?Garc=EDa-Hierro?=
	<lorenzo@gnu.org>
To: Keshavamurthy Anil S <anil.s.keshavamurthy@intel.com>
In-Reply-To: <20050223171559.A23461@unix-os.sc.intel.com>
References: <44BDAFB888F59F408FAE3CC35AB47041014F9285@orsmsx409>
	<1109206700.8215.4.camel@windu.rchland.ibm.com>
	<20050223171559.A23461@unix-os.sc.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-oXdabHPFCdNrclNd0gQ9"
Date: Thu, 24 Feb 2005 16:42:02 +0100
Message-Id: <1109259722.3796.22.camel@localhost.localdomain>
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


--=-oXdabHPFCdNrclNd0gQ9
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

El mi=E9, 23-02-2005 a las 17:15 -0800, Keshavamurthy Anil S escribi=F3:
> On Wed, Feb 23, 2005 at 06:58:19PM -0600, Josh Boyer wrote:
> > On Wed, 2005-02-23 at 15:31 -0800, Keshavamurthy, Anil S wrote:
> > > Hi,
> > > 	I am new to this mailing list but would like to contribute to
> > > xattr for flash file system. While looking at the archive seems like
> > > jffs2 is just a bug fix only and any new feature development should g=
o
> > > to jffs3. So here is my question.
> >=20
> > xattr support seems to be a popular topic these days.  You might want t=
o
> > take a look at this thread on the lkml:
> >=20
> > http://lkml.org/lkml/2005/2/22/85
> >=20
> > Lorenzo already has something started.  Perhaps the two of you could
> > work together.
> Sure, I will take a look at his patch and will work with him to
> get this feature into JFFS3.

Fine, it could be great if, apart of working together which would be a
pleasure for me, creating a work team for this.

I've read the tech. specs. of JFFS2 as David recommended to me, so, we
should separate two possible solutions:

	- use a new node type(s)     <- what David likes (& wants AFAIK)
	- use reiserfs style-storage <- what I have done partially

We need also a little road-map and to-do list to know what exactly needs
to be done in each code "section" to achieve our goal.

Just let me know when do you want to start, I would like to talk with
you at #mtd in irc.freenode.org if it's possible.

Thanks in advance and for your interest,
Cheers.
--=20
Lorenzo Hern=E1ndez Garc=EDa-Hierro <lorenzo@gnu.org>=20
[1024D/6F2B2DEC] & [2048g/9AE91A22][http://tuxedo-es.org]

--=-oXdabHPFCdNrclNd0gQ9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta parte del mensaje =?ISO-8859-1?Q?est=E1?= firmada
	digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBCHfXKDcEopW8rLewRAsRYAJ9gTixtL8ptnD0a+eBhGmud2310NwCeM4IU
4x/RduRbg/WZf0J9m5mZt9o=
=KLiD
-----END PGP SIGNATURE-----

--=-oXdabHPFCdNrclNd0gQ9--
