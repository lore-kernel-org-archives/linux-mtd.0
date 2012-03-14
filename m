Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7lNr-0003o2-OA
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 10:24:44 +0000
Message-ID: <1331720835.2140.4.camel@sauron.fi.intel.com>
Subject: Re: [patch] Adding Secure Deletion to UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Wed, 14 Mar 2012 12:27:15 +0200
In-Reply-To: <alpine.DEB.2.00.1203141117430.14300@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <1330536308.3545.158.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203011434220.2462@eristoteles.iwoars.net>
 <1331278562.22872.18.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203091959570.25737@eristoteles.iwoars.net>
 <1331559053.12037.25.camel@sauron.fi.intel.com>
 <1331559361.12037.29.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203141117430.14300@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-K6Lh/2wvzSKZbG3dHkSV"
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-K6Lh/2wvzSKZbG3dHkSV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-03-14 at 11:20 +0100, Joel Reardon wrote:
> For removing the key scheme notion, is it correct to remove:
> UBIFS_KEY_MAX_LEN and UBIFS_SK_, UBIFS_S_KEY_BLOCK_BITS, ... and replace
> it with a fixed UBIFS_KEY_LEN (and other values), thus also ignoring
> key_fmt in key_max_inode_size and simply use a fixed key scheme? Or shoul=
d
> I simply reduce MAX_LEN to 8 but still allow multiple bit assignments
> within those 8 bytes via selecting a different key_fmt.

Yes, sounds reasonable.

--=20
Best Regards,
Artem Bityutskiy

--=-K6Lh/2wvzSKZbG3dHkSV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYHKDAAoJECmIfjd9wqK0sosP/R8f0u4XyhtShLcQkqJL2BKy
PovVEOi48W8OsOF2F3XwSlyfwOGUxJBix3lljlYIfU+R0N66uq/U5YUPvB8dZ3sp
DvmdxWRiNl5WjyT9YzYQ0VzrWKgl21QwS0O6BiwL/r8OfCfeNLSpzKgmmuW694wU
/GDa9KNjkPP8rD/ZUO2UX7/J4i5G0K904gPEJvLO0Af7qY8UI/RlaJ12OSf9MG30
DeznqaXnj9cn0szM201MBV6SEqHQa2yLA/Ed/OtpmdRHT72/dkmJ5y0V5EhcueCv
HOhSu9JSDqoNdPUrCz9rOzA94jsDFVgqVmoaOEPM2VAUvhldBRgy3PM1Gq947TMg
oRWI1Ux8Ua1gW3PUJfgPGIzoxM06BLs/I3unqcBwVxHLnanDuhKKiVTdgezbSbzs
CnC0c8ttiP0KWCa0jJ9q1PRW1311H7xueaVCdeHtgykJ8XaYHQkZeCpSqi0gea2n
E8nfAhQe/1cRMU3E8SKv1JCO5kIjyTX0QqCgIc8t79jHiAngX355w2k4z62+Pvro
Nc9ghmbNwtR7LKFaMX6q0EG/JVh7cH5im1KyXrO0DLamHfXcDS6ADJefUz6pP038
jly6V5PZ17KZ/JkfeEGkkjXE6fLvNfKiyi+nz/yLAUq9fIxRKlWt9G4ON0ccaocp
7SyBipAOIOuxuRA9pGVU
=AFKq
-----END PGP SIGNATURE-----

--=-K6Lh/2wvzSKZbG3dHkSV--
