Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Scc81-0005Rm-F7
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 12:47:54 +0000
Message-ID: <1339073501.6875.104.camel@sauron.fi.intel.com>
Subject: Re: UBI and volume checksum
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Giovanni Malfara' <Giovanni.Malfara.ext@altran.it>
Date: Thu, 07 Jun 2012 15:51:41 +0300
In-Reply-To: <0D6614B1791E3B4C86DD3784FCD9B20617B90131@XMB-TODC-23.altranit.corp.altran.com>
References: <0D6614B1791E3B4C86DD3784FCD9B20617B90131@XMB-TODC-23.altranit.corp.altran.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ExCpTf5buuCzZX7wq4o0"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ExCpTf5buuCzZX7wq4o0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-07 at 14:21 +0200, Giovanni Malfara' wrote:
> Hi all,
>=20
> I need to verify that the UBI image once it has been written on the UBI
> volume.
> So I try to extract the content with the "dd" tool from the UBI bolume
> and I calculate the checksum to be compared with the one of the original
> UBI image.
>=20
> My question is: is it always true? If I extract the content of the UBI
> volume at any time (the fileystem is mounted read-only) , will the
> checksum always the same? Will the data move from a PEB that has
> bit-flips to a new one cause a difference in checksum?

Yes, if you read the UBI volume (/dev/ubiX_Y), and it is R/O, the CRC
should be the same all the time.

--=20
Best Regards,
Artem Bityutskiy

--=-ExCpTf5buuCzZX7wq4o0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP0KPeAAoJECmIfjd9wqK03GwQAMJRA4RqTs/JRY+fXe7793mw
18jmToKbK218sGNSMVk4jWI2f+5/NSoNZQwlM2OyVHxCS7+WyabvA43Ve8vpPbc+
XnhuFvz6PBhOKgalm7kvqBlFiGEp7yziqg1Hl+1pmqa4KJiLdgP6C6bIu72LWRrK
XvfonwilhxIgHk/BJb7zZJ9uC1AiXIcDZlTXEcLZHDu9fppaYndXE2vLr86Bv20b
gnEyZgbGWXG/t+vvHvx6hQx9yHZQ1M7CVk3apDJ+SxRrEYcyA38p6RQc2uKIa36H
IaOEvEcD62Q2zxJ7leZBWcraKXJrArl1FUQk+ls8R9JyccDI8N2BZzF1tjVYbtht
b1kxhlkcGzjEinJMxnq6PhTlw/wcmQ/xMyTsAFtM3I8LqfipOglduEvAbdfKuNNh
V/Wtegn/KW++B/VqcI6VK+nn1GwMidXOjY2Z13GUm+lR2k+WXKIzGfoKedWMLvce
tDX0jZo3ikdK2qrtY/+9XYglTfTXBa74eTagCt9+en2imkkn1FvM1ujE7ixfEcmu
YByJ0GAkrLdcWuSi/P7K/hDZ3GJWht+3cjyw6Ycaw0nmp+R0DpOdZi2pIKbi1LaS
GKVi+HYtvR+u51xSsJw4QhKSHl6JCKIs48ZUZToVWJnYVuOXzJcbziEE8Pt0YbE6
Ismv5F00vpDXsEFnv/dC
=OuSx
-----END PGP SIGNATURE-----

--=-ExCpTf5buuCzZX7wq4o0--
