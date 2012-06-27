Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjpt3-0000vf-Dr
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 10:54:17 +0000
Message-ID: <1340794700.29342.53.camel@sauron.fi.intel.com>
Subject: Re: UBI and volume checksum
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Giovanni Malfara' <Giovanni.Malfara.ext@altran.it>
Date: Wed, 27 Jun 2012 13:58:20 +0300
In-Reply-To: <0D6614B1791E3B4C86DD3784FCD9B20617B90149@XMB-TODC-23.altranit.corp.altran.com>
References: <0D6614B1791E3B4C86DD3784FCD9B20617B90131@XMB-TODC-23.altranit.corp.altran.com>
 <1339073501.6875.104.camel@sauron.fi.intel.com>
 <0D6614B1791E3B4C86DD3784FCD9B20617B90149@XMB-TODC-23.altranit.corp.altran.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-S/Hy6ZFxvKIfnjb9owaN"
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


--=-S/Hy6ZFxvKIfnjb9owaN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-18 at 22:22 +0200, Giovanni Malfara' wrote:
> If I try to read back from the volume (using "dd") after I write the
> NAND Flash (using "ubipudatevol") I get a different value compared to
> the CRC of the image file for the CRC of the volume content if there are
> some bad blocks.
> Do I have to use another tool (e.g. nanddump)?

Could you please create a small test script which demonstates this and
send it?

--=20
Best Regards,
Artem Bityutskiy

--=-S/Hy6ZFxvKIfnjb9owaN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6udMAAoJECmIfjd9wqK0xXoP/RPMtLjcEkb3LmY8vcnPuJfh
auZQ0XRutjUPPySnjgGlwjTesfNmqxD24ysSzBIwyROIG2+XXaeqEGfC66CklsLE
m0bJJfMN9Y5G8Qzqr3mwMjJWcQZU/CT8f6R2qvmCUSeNEEbixlj5acNz8voiOjZa
j9lH925lx7SO1+IM3zwOoyQFbcbVu48c4Hf+sV6L+clhINPmB0Pi2QXYq7hRmVzT
I7XSoDqFj6AUqnYlwwqTj8Z2qyzz/wZVsZXfTx8/4qfjYzwSfaQT2D/Lfxy6H/ms
f2QorCFuKHvJalYNOVT8GhYLNji1dXtIan3Ddz/RLhEhyk71BvBRnaq8238fmroX
rpNtSzda4hkywKt1ttrQzD4GFGxJ8YqMxVsM9+IgBnc46j1oP2QrYssvMt3dFLTW
zqNUv6drladoZS/TqtBSfr4HTitErJcaA9uprFV0EZabFXwqgqKqnDq/rnY/wwN8
v8HxiZWaQfbd8Xjt8Ud4DWjCD14PdD7597TOl4DjXyCx1bT4yDtw+U++g8x+SB6w
s/u2su4qjmG/AXdGy0GEo8ShvuMSWsW77013dLBhGjgkOL/sAqMqKxqSCRq3/Nn7
jaIYGOYfHLRY9efIqeKFNb/UoqR+NkNf71n9R4ppNBZ3IMvG1qtlIgfQCR3LKNGH
2oEfohIzuYcRrEZilOOj
=g0Tq
-----END PGP SIGNATURE-----

--=-S/Hy6ZFxvKIfnjb9owaN--
