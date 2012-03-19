Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9dyF-0004i2-Lj
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 14:54:04 +0000
Message-ID: <1332168998.11468.3.camel@sauron.fi.intel.com>
Subject: Re: [patch] Remove notion of key schemes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Mon, 19 Mar 2012 16:56:38 +0200
In-Reply-To: <alpine.DEB.2.00.1203161601210.2249@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <1329152067.22240.214.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1202231558400.13720@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1203151545410.26775@eristoteles.iwoars.net>
 <1331902271.3730.76.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203161405090.2249@eristoteles.iwoars.net>
 <1331905305.3730.90.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203161601210.2249@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Qq/dV6dyBGb+8X+olUe/"
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


--=-Qq/dV6dyBGb+8X+olUe/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-16 at 16:02 +0100, Joel Reardon wrote:
> Removed the notion of different  key schemes for ubifs with a single 64
> bit key scheme. Reduced the size of UBIFS keys to 8 bytes
> globally. Fill in the void left behind with padding for the effected
> nodes, so previous version will not be effected.
> Changed zero_* functions to operate on the new padding. Replaced key
> scheme enum with one entry into a define.
>=20
> This was tested using integck and writing files on a nandsimmed partition
> using both the vanilla version of ubifs and the modified version. Data
> was written using both ubifs drivers and successfully read when later
> mounting with either driver.
>=20
> Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>

Pushed to linux-ubifs.git, branch "joel", thanks.

But please, note, that this patch was also a bit big for review. The
better way would be make things like re-naming to be separate, etc. In
general, all non-brainers (everything you can do with a simple regexp,
like re-naming) should be separate. Then reviewer knows that he should
not spend to much time on that noise. And "brainers" go separate.


--=20
Best Regards,
Artem Bityutskiy

--=-Qq/dV6dyBGb+8X+olUe/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPZ0kmAAoJECmIfjd9wqK0t74P/iircj05udED3slkLS52gRDZ
j0mDcp2rpOoy95Gv2LdP/dBB9L/o3tGfYSibKgi0WcJvIUoQjEEUWF3G+QWJHEEH
1ixdE5holk+PypgSsY9s/C5XOKAYuUsLrZZhRDT+6y/9s45EGpsrgng3oAR8rwdG
vG+J4k9+fhxc9cX2wPMq4NWwf4wGwV5dzk8zo2t6xaAJIN2Klm5c3Qk4WllKpzUA
CLRMpy6ylCWAFa7zxKWaaGeKW8hTuFoJYcupsP/OXtwh1yN/VWR68oDIXo2cxplZ
DnBwimIPNRQivkwuLUPzMVqRq7N6dRaBGm9MK6j3esZ8ky28CYfxkkzkD8NNFYCV
Jiu2D7rZtj/kmY9t+xukAxLgycukpEVg9x41L1vkawc078BEwmrc92uHVtgYpMj5
xOqbHvzr/gZXI/strmuN9AnJTQu6cyh/0XOIMAjAUsmTaWfHnd6MPc5AlUiQcTyS
lh0Bi107O/Rjnr4dcB9KAr30MzbKY63gDYsWzOMljferZjnrUsRQmRhk4KQGYdVF
grJWnfE58NbImNylbGDWXguWO1hvNZ11183isULxhDMf1vxnlm3tzJriVn3Zz1rp
hGrBgMoU8p1yczJRme/yJQLY6yuwG9p9GfcYv3gwszC24F0NcO3VJTq/E72i826i
R0UVnPjgtkzNIXS/Cnrk
=Hpf6
-----END PGP SIGNATURE-----

--=-Qq/dV6dyBGb+8X+olUe/--
