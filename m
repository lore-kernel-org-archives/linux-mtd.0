Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sm0Z1-0003fF-4T
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 10:42:43 +0000
Message-ID: <1341312382.2979.51.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: add minimal amount of reserved erase blocks in
 Kconfig
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Tue, 03 Jul 2012 13:46:22 +0300
In-Reply-To: <20120630234303.148c612b@halley>
References: <1340636918-7505-1-git-send-email-richard.genoud@gmail.com>
 <20120628205303.676fa2ea@halley>
 <1340974064.3070.177.camel@sauron.fi.intel.com>
 <20120630234303.148c612b@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-L4jJppNaaV0l2k1u4Lqt"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
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


--=-L4jJppNaaV0l2k1u4Lqt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-06-30 at 23:43 +0300, Shmulik Ladkani wrote:
> First, change the semantics of CONFIG_MTD_UBI_BEB_RESERVE to be the
> percent of total number of eraseblocks (instead of total number of
> _good_ eraseblocks). And 'reserve' counts for both existing bad PEBs
> and those reserved for future bad PEB handling.
> Note this would still be % of the blocks in the mtd partition (and as
> such, it is very loosely related to the MBB of the device, if at all).
>=20
> Then, Richard may introduce the MBB parameter to ubiattach, and later
> may kill CONFIG_MTD_UBI_BEB_RESERVE (if no longer needed). The
> calculations will be according to the new parameter.
>=20
> What do you say?
>=20
> On a side note, the new ubiattach parameter should not be called MBB,
> but rather a generic "reserved" (or "% reserved").
>=20
> This is since the MBB is a property of the mtd nand device.
> But the ubi user may issue, for the partition attached, a value other
> than the device's MBB, according to his storage needs and
> risks/securities he is willing to take.

Sounds good, thank you!

--=20
Best Regards,
Artem Bityutskiy

--=-L4jJppNaaV0l2k1u4Lqt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP8s1+AAoJECmIfjd9wqK0osEP/3Sxf+9E15xjHDbkr7F2pMFl
2YHeT5A+AaYDmARhZ6KpocnBFvew8pkCKkj7A5PZVIB5CIsdArS9/3F4+oXP4kt5
em0jvIsTPtmqYTKvDVhQ+XQE6GMyJCui9CxliH3FdxU05r7r/IFSlivy+wn8M5qn
yiCV034HWtQW8dUU9usJ4mb12Antqji2f5u+wlXhvfoYesFuMAfZz5uwXUNXB7Yu
cNKjU6NA1lLT9G+bdra6QPMQHoiIGPlXEZaobJ60szANgkeWHddSnPWc1yz/x2BM
4HiT3o9MZI2fFZZ4mJPdg7K51sGHqZXOlkSkr0mBooNy96gGzcg14HZnRr+02nYh
VmxeRUHp2Evp0HQp/s4FbnN13MbRL7+thoP4LsrsHDPN4SgCe2xbRKD+lHqZbtT4
nWkPdfRyEy58nGYl23WMKwpNmf1CK2Nrhn5KioJtrkNrkKW3HRvQR1p56s+ePkzR
GkU9rNxtnWQoxyt4avA82QPG2SCRe7VDWMIK1lVHC8LbqG4M00ynf1IRs7B5Jde+
EzkK+h7j/xULegw4NuCXAk312QdGt4InNkXQoVBBb8EYGXNqZi4DHXVma/kGQYr6
NwzfAXoc9NbqwwssRF8dZU8jjk1UQNslUWAMX/qpgOvh60oYCGQ1UuKTagoyP2EY
H4Dvkdd+PAmuIG3xHn6a
=QL5Q
-----END PGP SIGNATURE-----

--=-L4jJppNaaV0l2k1u4Lqt--
