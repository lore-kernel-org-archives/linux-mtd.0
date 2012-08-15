Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1ckL-0001AJ-M4
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 12:30:50 +0000
Message-ID: <1345034131.3393.136.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 5/8] mtd: nand: rename '_raw' BBT scan functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 15 Aug 2012 15:35:31 +0300
In-Reply-To: <1340408145-24531-6-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-6-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MCLkp6NQRsHBfRoUI5UE"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MCLkp6NQRsHBfRoUI5UE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-22 at 16:35 -0700, Brian Norris wrote:
> None of these scanning functions use MTD_OPS_RAW mode any more, so there'=
s
> really nothing 'raw' about them. Rename them to (hopefully) make the code
> a little clearer.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed this one as the last patch. I think now the entire patch-set is
in the l2 tree.

--=20
Best Regards,
Artem Bityutskiy

--=-MCLkp6NQRsHBfRoUI5UE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQK5eTAAoJECmIfjd9wqK0EbgP/2CfuVvLJR+lIkoPRynLHsWl
i/b+TIPxQ96DRH62dXLrOnjkiOqZMJjHJ2WXaNKiiq5aDbvsAh+3w5LI71SO1SgE
Q0ZZ98TnqRQxkZZtFWw7+i3xk8zqTDX4bfUKkRJmWb2Kx70n1CNQ9J+KCtjGEI5z
wK759F+FSXCBMHDD12Mw9X6OUBW8HAdo+lRfUFBFDh6i3fh0BNjVIkyPEnL4Sqyc
3i5H8uAkxmg9B5GDw+YUUq2oyEeZdEQxlTT85MEgmbmrlcLA/TbS4c190Tgbq00Z
MuRcKRxbXeKPOd1F0F4pc+h0l2OI6xWA+fhasxNvJQHQg6As4OM6YnG/KHS7Iu+K
Ao3vAmF94JTIlnPwRr3ZPmTdllvtfDnekBvEPRqjdcD8Nai7a+vWvQdQR7Or+QHB
8ZVT24KuSBlhPKhPkBCIp4eUYoiQMomvrffn8QOiQdi851d9LFIsAApgKKS8mRXR
m+7BJWARvKMyEox159svm9EWAF7Dxitrkm8MWuASdnuqd9Y+AUUnj+zQMRN9vuBe
2CQbeOfQTC4P8Ik495ebnGRrIuNjmuQinpMSHjypxSbWHO3NuMLDbJDTNDwLi3Zq
ilsfLki/hqualM+xYO4TaCv49qdX9lNsBN3/0W9kU/HZ4Y07gh5mG3VD2gVXYS1x
gzFG4M914K4ZE4W60Xuq
=ZfUG
-----END PGP SIGNATURE-----

--=-MCLkp6NQRsHBfRoUI5UE--
