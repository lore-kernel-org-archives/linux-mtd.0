Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tvo0a-0002X8-Cy
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 11:51:49 +0000
Message-ID: <1358423594.2731.231.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: mxc_nand: compress ID info for send_read_id_v3
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Schneider <schneider@at.festo.com>
Date: Thu, 17 Jan 2013 13:53:14 +0200
In-Reply-To: <1358265384-23138-1-git-send-email-schneider@at.festo.com>
References: <1358265384-23138-1-git-send-email-schneider@at.festo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-M/iTSbCMEYWvV0qXh+Mk"
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


--=-M/iTSbCMEYWvV0qXh+Mk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-01-15 at 16:56 +0100, Roman Schneider wrote:
> ---
>  Also compress the id in case of a v3 NAND flash controller (i.mx51, i.mx=
53)
>  and 16Bit buswidth.

OK, I fixed the commit message and added your S-o-b, just like Fabio
noted, and pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-M/iTSbCMEYWvV0qXh+Mk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9+YqAAoJECmIfjd9wqK0uc8P/ih/3AtjLEqje/d6bTfAfkUw
+jpDiPNV61W5dsWZtIe850Yb5cDMqj9yXEHixkikg4hCkewKzcWctse0ybPwNMC6
Zxes+R+zD8DKbR77i8Lcau9QWwEk1F2kv+BJQZl/cZSVp6SjDK6sWkNCNsZV4h9n
FbRJS+JO5Y/k4wFcc3qqHkS5easIZ6JeK7L12pv3dEYPkNRp1l8V+0o0NZ/Rz0F3
OZIVufT4UxsWwgsBq3cMnCGq2qLQXK/ulR6U0G6LL1+TQWYjcrRRrQUR0O8amdqj
Lf0u90h+HjmfrIdxbnnJRq3Ep8BI6dgShT6yIiASIkW37L1T/ii2/S9GggGeXMh+
o3K7Msc0BtxJGAF38QJfTG74OkYqz3sB+Qttz4AUJVc1Fyc2XuakOsWz7I9kXZWW
xRZOuwlx4MWRM1a5NWGVqAUOC0JEwQzkToXaPvVDbbS2clG0G3xOXarxvQ3I4RA5
4gzekEMNiCiDock5YHXoqwCX5xAUOy7sFMNOhyPqfidBv5lP72DDwObTrgeW3R3M
2MrCDy8uK1P/mAz28qXvMXVrT8WRm8ZZNPExwz0qs1jM2oUjLyy7GRE2KvbsM9qi
f1d8jK+j23qgPvvz4caTLDkYvD78g2Alap1gik+LOVbGfKMoUeHyUcJfNl75MKet
NSCal95zppNh5uHJ091A
=h7mb
-----END PGP SIGNATURE-----

--=-M/iTSbCMEYWvV0qXh+Mk--
