Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkWWA-0007WJ-4O
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 07:53:15 +0000
Received: by iakk12 with SMTP id k12so632115iak.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 23:53:11 -0800 (PST)
Message-ID: <1326182125.8847.7.camel@sauron.fi.intel.com>
Subject: Re: No oob scheme defined for oobsize 218
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joo Aun Saw <jasaw@dius.com.au>
Date: Tue, 10 Jan 2012 09:55:25 +0200
In-Reply-To: <CA+0Dg4q8+6Z+UAr6ni0v_GA70Phhaug-s=PCZyYLjHV1Sk-Qww@mail.gmail.com>
References: <CA+0Dg4q8+6Z+UAr6ni0v_GA70Phhaug-s=PCZyYLjHV1Sk-Qww@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/7iNfLvD2AR/XAxrTDeF"
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


--=-/7iNfLvD2AR/XAxrTDeF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-09 at 17:34 +1100, Joo Aun Saw wrote:
> Hi all,
>=20
> I'm getting this error and hope someone can help me.
>=20
> ONFI flash detected
> ONFI param page 0 valid
> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xd3 (Micron MT29F8G08AAA)
> No oob scheme defined for oobsize 218
>=20
> Do I need to define struct nand_ecclayout nand_oob_218? or can I use
> the nand_oob_128 ecc layout?
> I'm running Linux version 3.0.4.

Please, be aware of the unstable bits UBIFS problem - it is still not
resolved and no one is working on this AFAIK. This issue may cause
unrecoverable corruptions after power cuts. Someone should invest few
men-months to fix this.

See: http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits

Artem.


--=20
Best Regards,
Artem Bityutskiy

--=-/7iNfLvD2AR/XAxrTDeF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPC+7tAAoJECmIfjd9wqK03DMP/i5N2NV/GICfrPREmI2E1RF8
CFQATviZIv2AGRGX8eoI9Kqby18RJONtSHlwTDNSA+7ftOVDlf8+VwQvydyMUPnk
44W++zUNOFVpmCzEgXNoaDCGghRUKDdjZmfYU0dXLZ8WTGR+6AFYsGSlt0zAp7hY
m/QOFDBXd5wX9U5fuNMWz8geASPFWAh94p0ZD2CRrYu9Zu+3T74wtGmKr9zMArI8
4DnT4nVcRhC/lYgk+zyngGRlLThN7NEfnH2bZz0CeO835WiMtT1Lxa9cckCPO3xC
mMFM+F21seQMr4T/HU6jAysRhiFM59EEAuRu68NHhketJXrfumClv/zaM/e3Nh3G
bUx9hf8d7yZzBbFbyUNLcO5X7MA0EjILlRK0ZspKFCZjUnfS+DoUXLaqr4KlvsxE
dBRuKfzyXBRxqZjQuySkjeI6Ps/QEWNs+ql2axwkuZr7nRjvr1afCm95SVZl/Wh3
ChXuTQ89GzY39jdmZ7oDX8dIeEgQ9rlSdKPDLWEj/5JvQphanu7/FchzUozWJOXo
5II3te3q/XiEStAb51vjsDV+0hqSB7Flj8T6wTWdzmOdlZbqsGHRJZoOA98jD8Fr
KUSWzVKYcJqGh9RaAiBzByNLn14qyUw90XypR68XANsYKYO6vvxJnqTU1EhOZ2ji
SNMY69hKvZny9D4Yh/5N
=zZRO
-----END PGP SIGNATURE-----

--=-/7iNfLvD2AR/XAxrTDeF--
