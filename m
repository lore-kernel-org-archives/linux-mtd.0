Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Ip2gm-0001Gi-70
	for linux-mtd@lists.infradead.org; Mon, 05 Nov 2007 09:12:34 -0500
Date: Mon, 5 Nov 2007 14:35:06 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: "Johnson, Charles F" <charles.f.johnson@intel.com>
Subject: Re: MTD Size Limit
Message-ID: <20071105133506.GB19232@lazybastard.org>
References: <B1EDF20A6EAAD74EA65E46F774F1784502C6D585@orsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <B1EDF20A6EAAD74EA65E46F774F1784502C6D585@orsmsx413.amr.corp.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 31 October 2007 12:03:48 -0700, Johnson, Charles F wrote:
>=20
> I hear about a size limit for the MTD layer due to a 32 bit size
> variable. So is the limitation 4GBytes ??=20

Possibly even less.  The usual bugs to watch out for is signed/unsigned
usage and 4GiB (or 2GiB if signed) wrapping to 0 or -2GiB.  I wouldn't
trust things beyond 1.9GiB or so without thorough code review and
testing.

> If you partition a device using UBI, is this limiation then per
> partition or is it still over the entire device??

Both.

> Is there any effort to increase the limit.  Particularlly give the large
> NAND flashes that are coming.

I have seen patches, but not in a merge-worthy state.  And I just heard
some people decided to ignore mtd and wrote drivers directly for YAFFS.

If you want to get this done by a certain date you either have to do it
yourself or pay someone.  As always.

J=C3=B6rn

--=20
He that composes himself is wiser than he that composes a book.
-- B. Franklin

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFHLxwKfbqVtkXfjukRAh0SAKCyccQkI7NBZ+I5y/h3jGTXQ6KYUQCg182r
G1J6Mc/RrAp5lwv8oGvawzQ=
=5vl5
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
