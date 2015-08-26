Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUbUL-0007qc-SV
 for linux-mtd@lists.infradead.org; Wed, 26 Aug 2015 14:15:42 +0000
Date: Wed, 26 Aug 2015 09:15:09 -0500
From: Josh Cartwright <joshc@ni.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Subodh Nijsure <snijsure@grid-net.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Brad Mouring <brad.mouring@ni.com>,
 Gratian Crisan <gratian.crisan@ni.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] ubifs: Remove dead xattr code
Message-ID: <20150826141509.GJ8016@jcartwri.amer.corp.natinst.com>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <55D54006.9030700@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <55D54006.9030700@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NyChO5MpGs3JHJbz"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--NyChO5MpGs3JHJbz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2015 at 10:48:38AM +0800, Dongsheng Yang wrote:
> On 08/20/2015 04:35 AM, Richard Weinberger wrote:
> >This is a partial revert of commit d7f0b70d30ffb9bbe6b8a3e1035cf0b79965e=
f53
> >("UBIFS: Add security.* XATTR support for the UBIFS").
>=20
> Hi Richard,
> 	What about a full reverting of this commit. In ubifs, we
> *can* support any namespace of xattr including user, trusted, security
> or other anyone prefixed by any words. But we have a check_namespace()
> in xattr.c to limit what we want to support. That said, if we want to
> "Add security.* XATTR support for the UBIFS", what we need to do is
> just extending the check_namespace() to allow security namespace pass.
> And yes, check_namespace() have been supporting security namespace.

Is this good enough?  Yes, it'd mean that the xattrs end up on disk, but
then who's responsible for invoking the selected LSMs inode_init_security()=
 hooks?
AFAICT, we'd still need to invoke security_inode_init_security for newly
created inodes (which, Richard's proposed commit still does).

Thanks,

  Josh (who, admittedly, is neither a filesystem nor security module guy :)

--NyChO5MpGs3JHJbz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJV3cnqAAoJEKp7ZBKwQFArZmUH/RahFRE6YWI4DZVqIl2bQe0L
wHn7x5pFPjExC3c+smzpxW+cJPyTDd28Eg1g8B7IrT3Ls7ZYUeHje2a2hNfuJ7FS
9RRz25RPz46dv/Tlgkr8Rocthng28WU5H/QQ3rk2k0EqJj0etH6dkEym8gB8BNi/
z28t+fFL9TmCrfOlPHRtKwTuNnlcbEsYCADmFHi6HlNSXyPv25IIp5Jyh9GA90uO
v8BRVbAgCKvbfW73aSHY3u0ovaD9gN+u1np/pnTWoV75OsFHZQPi81CpFKsr6bd/
l6QTy6MWlbt7GGVb1w2NeQVbn8vm8yR2o6lO864duj2BjD1X56CsyyoJDzHi1fc=
=bOUW
-----END PGP SIGNATURE-----

--NyChO5MpGs3JHJbz--
