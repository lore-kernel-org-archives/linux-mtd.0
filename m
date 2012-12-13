Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tj6xT-0000wG-AT
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2012 11:28:08 +0000
Message-ID: <1355398120.3400.46.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 07/10] mtd: nand/gpio: use io{read,write}*_rep accessors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Will Deacon <will.deacon@arm.com>
Date: Thu, 13 Dec 2012 13:28:40 +0200
In-Reply-To: <1355166762-15133-8-git-send-email-will.deacon@arm.com>
References: <1355166762-15133-1-git-send-email-will.deacon@arm.com>
 <1355166762-15133-8-git-send-email-will.deacon@arm.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-LSJehB3qcSwBLeZbc8kf"
Mime-Version: 1.0
Cc: linux-arch@vger.kernel.org, Matthew Leach <matthew@mattleach.net>,
 james.hogan@imgtec.com, arnd@arndb.de, benh@kernel.crashing.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-LSJehB3qcSwBLeZbc8kf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-10 at 19:12 +0000, Will Deacon wrote:
> From: Matthew Leach <matthew@mattleach.net>
>=20
> The {read,write}s{b,w,l} operations are not defined by all
> architectures and are being removed from the asm-generic/io.h
> interface.
>=20
> This patch replaces the usage of these string functions in the mtd
> gpio accessors with io{read,write}{8,16,32}_rep calls instead.

Pushed this one to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-LSJehB3qcSwBLeZbc8kf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQybvpAAoJECmIfjd9wqK0vtcQAKliGYZyOYPGvbM1we/D6O44
hq2RBr01Aa7/3R/NmqSxkMmWEeET0zP88/FMIKVS/dEx1xF2ZYMSJPuMhMjchWzV
xkChUg1nbkr5Nh5WTCSjVwk4LYcichcqifsgTsDsLGPuNqJqTmiZtUCnPoAMfn6Z
AT2gzcJUMWglkB1YbaznEShBlsq575GBKKEfjp/jqwyO3uneOdVtuOu+L5wtL8Of
XCXsaYdE0f0+hQft3m5fbTv9MRtRONKHKCmVR8Cai1FZ53j0fRQZi0Z2K31Gdrko
/jaJKiVcEpiBS8WCzkDbhcsbeSIDaS7t7FeGCdKfwp5X21aGS09c74tURrz1wbyG
bzEu2HEpP9sMxS2gMeKwpSDjdBnlLQOjw++1a7KtiGGDkhA+GdpD8bOG9/x0ynm9
HsutjqmkW+JapFVqlueHqEVNyRuen2ig34MFNIVjaKnMnDY1bk9pI/9VgqWRQ4N1
zZDAMUvPH+JyJz7JDdMW8mmYnoJkKCPh2DZE1VxHzU7BLdmJZOG164vvhpGLnVee
KRBpX2d5M1vLAWQ1IjfqU74c5BJCJ0b/Xj7Rhl89jBkPdjYhEYzM2MHZsPmSm6ai
D9gcm5CmBve6cf/0/iKff44089r1EtPJycc27sLY/iu43+IwMqtmMG7txV7b5Fs0
EGyxq227AKhkU02Iiaj6
=SDm3
-----END PGP SIGNATURE-----

--=-LSJehB3qcSwBLeZbc8kf--
