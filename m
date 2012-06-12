Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SeOPu-0000MJ-UR
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 10:33:43 +0000
Message-ID: <1339497450.2401.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: ignore ecc errors during bbt reads
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 12 Jun 2012 13:37:30 +0300
In-Reply-To: <CAN8TOE_JVZYnVqAL=63ErnUHxdREjQw6EMZNNTm6h=jeyG9=6A@mail.gmail.com>
References: <1339093928-17545-1-git-send-email-mikedunn@newsguy.com>
 <20120610145004.702d24d7@pixies.home.jungo.com>
 <CAN8TOE_JVZYnVqAL=63ErnUHxdREjQw6EMZNNTm6h=jeyG9=6A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-yrGbJ6r3jjdPMimRFxwB"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-yrGbJ6r3jjdPMimRFxwB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-06-10 at 22:45 -0700, Brian Norris wrote:
>=20
> This brings up a side issue: I think many of the "_raw" function names
> in nand_bbt.c are misleading. They do not all use MTD_OPS_RAW (and
> shouldn't). Effectively, I would prefer that *all* the calls in
> nand_bbt.c use the non-RAW version of the MTD/NAND interfaces, and
> then ignore the errors if sensible. e.g., when reading a bad block
> marker. But nand_bbt.c does a lot more (reading BBTs from flash,
> checking for "Bbt0" and "1tbB" table marker, etc.) that *must* use ECC
> to provide any robustness.
>=20
> So, I can send a patch that straightens out naming and brings
> scan_block_fast() and scan_block_full() into alignment on using
> MTD_OPS_PLACE_OOB.

Sounds like a good idea to me.

--=20
Best Regards,
Artem Bityutskiy

--=-yrGbJ6r3jjdPMimRFxwB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP1xvqAAoJECmIfjd9wqK0CXEP/jiuO7TCiixOKw0wd4xbFTOq
jqdJWvdgPQrb/GEeIpm7me4iX55wSrRo32ef6oCVpvsuOrgTQdbUPeOWaAfGinfI
wZIK53+VwrlILqvBvhYIzgjLKvMo8nOqI6PWvDuaXJDNDME/35T9001hWc/kFLjK
WXQjsB+MP7yGTrHEysM5INRQFa04mfn0JaqAb9m8L17yNwubYYhkua0YmuCty1YT
wBRekaxoeujIpbySHIqaA9YRCNScPR0YIhi3GxopkvQvSkAV6HB07/MdgBEb+YKe
fwr/8voFm3ycx6Qs62T3rPEXGheWpVjalTKE0eNdfzYbenKyMlVp1TLIa0RIWyzr
0qyAKanLi5QTK/6Fcb4DHPo2bwuoc9XVbRiLwlMu/gniaZFEYUZuJYJKvQRGb2FA
yko0L3hWi4WfGDv047aPnsZ4kM4lK8qqbNTUVB8wntbZ+2dP+guGJQzmgUsV/vzQ
hmYxQuKyp9htfrxDy2cWtrv9sDpyhkEDAcjXM5mIV4DUlOSeDAdbihyoX8MBONwz
0bfuxRcGtLnmF6BU2hdPJTXhUbOC0HhgGKsATkXa1oUF11DCURM+x8o5v7XsZmaB
+HK1BnVNwIOOkuRrMiHiAVnQ4Uxymki9p7QP+Zk5poJ3RhJIaumUOphOypb4fn6t
gbpAibgSGLKTIvnFhigk
=tNUR
-----END PGP SIGNATURE-----

--=-yrGbJ6r3jjdPMimRFxwB--
