Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjt5m-0006yX-2p
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 14:19:38 +0000
Message-ID: <1340806994.3070.34.camel@sauron.fi.intel.com>
Subject: Re: Help needed with corruption detection/ubifs_wbuf_sync_nolock
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Reginald Perrin <reggyperrin@yahoo.com>
Date: Wed, 27 Jun 2012 17:23:14 +0300
In-Reply-To: <1340635736.72938.YahooMailNeo@web114615.mail.gq1.yahoo.com>
References: <1340632690.58836.YahooMailNeo@web114616.mail.gq1.yahoo.com>
 <1340635736.72938.YahooMailNeo@web114615.mail.gq1.yahoo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-BXM3oawrqGSbNXXl8E2A"
Mime-Version: 1.0
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-BXM3oawrqGSbNXXl8E2A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-25 at 07:48 -0700, Reginald Perrin wrote:
> Update: =20
>=20
> I'm now doing this, and it seems to work.  Is this correct?
>=20
> if ( wbuf->dtype !=3D UBI_UNKNOWN && ((struct ubifs_ch *)wbuf->buf)->node=
_type > UBIFS_ORPH_NODE )=20

I do not think so, wbuf->buf points to a random byte, not to the
beginning of a node.

--=20
Best Regards,
Artem Bityutskiy

--=-BXM3oawrqGSbNXXl8E2A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6xdSAAoJECmIfjd9wqK0rx8QAMtiZKPuDlxqiBF1LWxmzVH5
AWTjotBG71UdMesZrIR2tFQAoMqG9qSzhy+QC8g5Io+4QKRxqCNGB0MidC9U8MK3
DXnh+5IOGUQ7Tm5ezzGQfKvYCQmjqguHKYevPNFILTH5mL6vcpC+F4D2y9l3l+eP
8ye1B8iiYRE9PF87kk6479+Jaq+tHOzHOeb8EQLEHiNmk2QKb+dGnedm4LcJCO9t
q5Hfg67rFmZzOIPYVUj+YYx1B0LuG+Xp9Q8hqXCwI6qqRBrqFahGZV3RuMFXHt1/
/IjvrVpjQJnOiRjzuLxUJkUHzHiuMNIk+eo4cGBEnsdGDJTEFL4pdP7kFog7hgK6
Pfjq6j8uxLopUEt0jPPS81LlwH/AvtsaGkHTkJLdudGA6TRM9YxmiOXomjUhQpLZ
5zvzqTjflsByQWP+6n5EEuqspvO2uWJycVA64aLELi2kTjDk2pS096jU1SZb8jOY
Yq4EYK7UyRsIULfU+/yzKLfeXM5KDgfn0sq18KZh60cy88nTsQ2x1abGAphr4QAb
QyqmHmGzMvTipnHArnJYKN90v1rooIq7j+HEH7Tt60w7ft8zkUAAUFe7z24WXmFi
ERSlaZRheC/UBoDWkWT1y8dBfoCIGw+wG97gNIHBTPgRUmFZW4wV3/PqJib7QHxZ
zGH96m4nqixhZ5wOZI/l
=l3Xj
-----END PGP SIGNATURE-----

--=-BXM3oawrqGSbNXXl8E2A--
