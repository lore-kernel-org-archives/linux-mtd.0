Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SfCgE-0003g1-Di
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2012 16:13:55 +0000
Message-ID: <1339690667.2401.213.camel@sauron.fi.intel.com>
Subject: RE: [PATCH 00/10] Prepare for GPMC driver conversion (w.r.t MTD)
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: "Mohammed, Afzal" <afzal@ti.com>
Date: Thu, 14 Jun 2012 19:17:47 +0300
In-Reply-To: <C8443D0743D26F4388EA172BF4E2A7A93E999E95@DBDE01.ent.ti.com>
References: <cover.1338790117.git.afzal@ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E9962E7@DBDE01.ent.ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E997FF8@DBDE01.ent.ti.com>
 <20120613110908.GJ12766@atomide.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E999E95@DBDE01.ent.ti.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-x4RAQtLRdCe1n2SQaWlY"
Mime-Version: 1.0
Cc: Tony Lindgren <tony@atomide.com>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-x4RAQtLRdCe1n2SQaWlY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-14 at 16:01 +0000, Mohammed, Afzal wrote:
> Hi Artem,
>=20
> On Wed, Jun 13, 2012 at 16:39:08, Tony Lindgren wrote:
>=20
> > Looks good to me, made one comment to "mtd: nand: omap2: handle nand on=
 gpmc"
> > patch. Maybe after that is fixed Artem can take a look and maybe ack
> > the two mtd related patches?
>=20
> After fixing as per Tony's comments, V2 [1] of the series has been
> posted, can you please take a look at it.

I do not have any objections if Tony takes the entire series and merges
via his tree. I do not have time to review your patches, but they look
OK on the quick glance. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-x4RAQtLRdCe1n2SQaWlY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP2g6rAAoJECmIfjd9wqK0+2QQAMGeruyeXRvnX0RfLXU/Opy4
prS8BPYGPSdBRs1MA6oe8iVuXKkqkKfoeLNOjIi8F91vWHGmBKGZZe/Vi4Qi3wbf
maHnFKPOerukhTWapTjVbVVKSUatKsXwU8U7xB3z/lP+XRuLBOdH8LeN75xHGyiM
McxrrElxzZ8UPyrsrO9fgi0rYTgxSjamnzeGOFpxn3+dZeRC0tmLiQIQGUDwqI0P
zK3XuaUnNTOTTRWelyu+3gGdsD2Z+04H8e8idLJ1GXUEQJh9Ybs3PMLIBTc60mSH
iu2ej2kbVzyfqNuvNnAhmDq+0bKJDvH7ltVzEZfu8rPdkabYM6qUR3GArVf7RXYG
SJjPTNtzjFt4nvRvCc4Lp2RO0OLAQquLWuscOPbHFCgGrlHjxGwDtBNjL1eAe8zr
xySmdpY6eh03YvG+44OzyVlJBuo/uGyQjOiKmdccrmV03SlW683r++7AcmwlPJjA
3VBMptVeCZGXQpmK9Xloz/gGKPygY9Kun/bwdHeuUlKpN5/E2zjqAnyPD6XHmr9s
I+231n7WbEC8P/3OO+m3e/QFZeL68CHEtPoIWdAQsUoZb/lyvtBpvkcgbSRiQYD3
vFGfVXqlv9f03VpwYChojOEZ09iFsw6WSPsmSvPEunfX0s3q4ylP0ocX0Tv2xiXl
oqwG+zNnzZF66//MbVMr
=dbSm
-----END PGP SIGNATURE-----

--=-x4RAQtLRdCe1n2SQaWlY--
