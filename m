Received: from haggis.tip.net.au ([2402:b800:7003:1::20]
 helo=members.tip.net.au)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rt6T4-0002di-Oj
 for linux-mtd@lists.infradead.org; Thu, 02 Feb 2012 23:53:31 +0000
Date: Fri, 3 Feb 2012 10:44:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: linux-next: Tree for Feb 2 (fs/jffs2)
Message-Id: <20120203104453.8438182da9f365c24d3c2128@canb.auug.org.au>
In-Reply-To: <4F2AD4DE.7040508@xenotime.net>
References: <20120202144516.11b33e667a7cbb8d85d96226@canb.auug.org.au>
 <4F2AD4DE.7040508@xenotime.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__3_Feb_2012_10_44_53_+1100_KPBENjOXy6lr7v/K"
Cc: linux-mtd@lists.infradead.org, Randy Dunlap <rdunlap@xenotime.net>,
 linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Fri__3_Feb_2012_10_44_53_+1100_KPBENjOXy6lr7v/K
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 02 Feb 2012 10:24:30 -0800 Randy Dunlap <rdunlap@xenotime.net> wrot=
e:
>=20
> fs/jffs2/*.c still contains uses of ->read etc. instead of using
> mtd_read() etc.
>=20
> fs/jffs2/read.c:36:8: error: 'struct mtd_info' has no member named 'read'
> fs/jffs2/read.c:112:8: error: 'struct mtd_info' has no member named 'read'
> fs/jffs2/nodemgmt.c:669:8: error: 'struct mtd_info' has no member named '=
read'
> fs/jffs2/readinode.c:83:9: error: 'struct mtd_info' has no member named '=
read'
> fs/jffs2/readinode.c:676:9: error: 'struct mtd_info' has no member named =
'read'
> fs/jffs2/readinode.c:954:8: error: 'struct mtd_info' has no member named =
'read'
> fs/jffs2/readinode.c:1040:9: error: 'struct mtd_info' has no member named=
 'read'
> fs/jffs2/readinode.c:1216:8: error: 'struct mtd_info' has no member named=
 'read'
> fs/jffs2/readinode.c:1275:10: error: 'struct mtd_info' has no member name=
d 'read'
> fs/jffs2/scan.c:286:8: error: 'struct mtd_info' has no member named 'read'
> fs/jffs2/gc.c:590:8: error: 'struct mtd_info' has no member named 'read'
> fs/jffs2/gc.c:894:10: error: 'struct mtd_info' has no member named 'read'
> fs/jffs2/gc.c:977:9: error: 'struct mtd_info' has no member named 'read'

They were probably missed because they use the jffs2_flash_read() macro
in fs/jffs2/os-linux.h

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__3_Feb_2012_10_44_53_+1100_KPBENjOXy6lr7v/K
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPKx/1AAoJEECxmPOUX5FEjfMQAKkQBMSZ1l1DbYtAXeqWSI74
gTF0UQn3Ejj6yQr9VlQRzBik46yxhSVsScvVZ6waIVAN/m3KVMyjninNm5LMdaWq
rni9lCDUFXUTKQwZCtmTpyNQHxm4ua62xlH4wuWS0+YtS918XEpR8cnDoQHEYTO9
kvhWf4X8tZoGzboBeCcKMH9TcA1WhEwnruVZ+jG4OF1QTvbiANss9dZxTe56DpnM
ONRBqglftu+O6qpv/JIbxYZ6bKVyRJt7LU4iPKDi9qK2qgC1SJ83zSFq4BCGPjHs
zoShD2rBfrNX9RRjgOYNeiUI+mGj0XVIt4oTQuRyzeA018xV5F7ep/OsFBSGfaYa
9RqkZXTcBNjQ/xI7JB86YHrRjd/p3IHliYLfZ8jx/+v09Q7rYbC/rlxCdvvYz9cT
D0nQ9qYme6AJAwx1alFv1ZOnJ2S/cOz3fM4MK7C9vJDdNsAXzOJN4u+o8DB2eddw
GZR+ejy15WmgKVluIJi9XVOYKfGPgok6tILhMB3cC7YDz0op0KvXyrviO9HWBDJb
IYgRWOnT9cus1Zk8ZcIJ3p0La/mE6RZhmFuJV8yb19/nw5ckuI4U9cpG6gsAGyoW
IzGZOvuhg/jNleRX1Y9osJUmNOrfmUE+3LNl2f0RbDai2TiqyRdV5EUAD+WtH0bw
sI2pkGkPKTdndIfyK0AQ
=Nl48
-----END PGP SIGNATURE-----

--Signature=_Fri__3_Feb_2012_10_44_53_+1100_KPBENjOXy6lr7v/K--
