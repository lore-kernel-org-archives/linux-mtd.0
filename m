Received: from dev.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UasZe-0003QY-9D
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 19:01:46 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [mtd-utils] nanddump: print ecc.stat info after reading
Date: Fri, 10 May 2013 15:01:24 -0400
References: <20980858CB6D3A4BAE95CA194937D5E73E9C3862@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9C3862@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13437116.IJ4mx2EAnB";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201305101501.25854.vapier@gentoo.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart13437116.IJ4mx2EAnB
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday 10 May 2013 04:32:50 Gupta, Pekon wrote:
> One more request..
> Shouldn't the following ecc.stat info moved after actual mtd_read() ?
>=20
> fprintf(stderr, "ECC failed: %d\n", stat1.failed);
> fprintf(stderr, "ECC corrected: %d\n", stat1.corrected);
> fprintf(stderr, "Number of bad blocks: %d\n", stat1.badblocks);
> fprintf(stderr, "Number of bbt blocks: %d\n", stat1.bbtblocks);
>=20
> Currently this info is printed, before the actual reads happen on
> MTD device. I'm not sure if this was intended for some other purpose?

i think the idea is that header/device info is shown first before we dump e=
ach=20
page.  so all that info should come first.
=2Dmike

--nextPart13437116.IJ4mx2EAnB
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRjUQFAAoJEEFjO5/oN/WBOf8QANqNzE6zJGIhWeXWlG/2LIe6
xSmZGsijkJZSLEgV2eYDt5IJ4pCvEgx1XHZVuF8JQ4j8Pd9oDTGr8gMQrB+z+uVS
zLNHNwN5cfBZ7RAqy7dQ26YCGfc9r6E8MES7tu3Il7A9FZZcUUyTaBEEfzVBHUrd
t5km08hcmxbJBvEUZU6aBUTMlyf1drnmgCGTbugMG372q+MpNABq5cJqo6S0R8bW
moHcOk8wb7Z2k2Xf76mIQuEJ551RW9lLZDckCYJ1lxNImvWLsIfKSmw+Zaz4quhB
PMR8o5n9vmR99pey09mTxUNpK/WUbVaRwGJLHQ+f5bSqoLUdUpCZTnLD/2+IBB1V
r/h17PIJTsPiqpMMy3D6ZKTEq+OZMsCdqb9zbA3p9Cv0EW/IdDmgWs6I2KQ3RuLT
7DZ2VoCgCMKdtcUCmU2P+PVS1RlKCmvPj34nqZJK+RH5/qDIx9bkRUFXiVOwcylB
e+ZKPqYsVEyVQStIHVewhOxsxNcyPQJuZcHvOykcNSvZFdrMPiiP56aEq8lcn+P7
uC9BiCkgsXU2hCL5zyt+vg5gr4oyXDePbVZEpqZG/PcBlU03SguHBgj8bjBEiPVs
7xF68FqL4majm/CAf2z1gC9koQUWWyLWwcs5Ei5wNqqOjnhZHLV8RXiF81SJEfp2
kIySMFoEz1i3g0IGrYFc
=z6YW
-----END PGP SIGNATURE-----

--nextPart13437116.IJ4mx2EAnB--
