Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M97Ii-00057b-06
	for linux-mtd@lists.infradead.org; Wed, 27 May 2009 00:47:31 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH 1/3] mtd/maps: uclinux: allow systems to override map
	addr/size
Date: Tue, 26 May 2009 20:46:24 -0400
References: <20090526231902.GA6295@linux-sh.org>
	<1243380798-10089-1-git-send-email-vapier@gentoo.org>
	<20090526234616.GC6295@linux-sh.org>
In-Reply-To: <20090526234616.GC6295@linux-sh.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5121164.yJ2B4dnUz4";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200905262047.21041.vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, uclinux-dev@uclinux.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart5121164.yJ2B4dnUz4
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 26 May 2009 19:46:16 Paul Mundt wrote:
> On Tue, May 26, 2009 at 07:33:16PM -0400, Mike Frysinger wrote:
> > +extern char _ebss;
> > +
>
> Also, it would be nice if the remaining architectures that define _ebss
> could shove this in their asm/sections.h so we can kill this off from the
> driver itself.

well, everyone would still have to define the _ebss symbol otherwise they'd=
=20
get an undefined error due to how the map is initialized.
=2Dmike

--nextPart5121164.yJ2B4dnUz4
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iQIcBAABAgAGBQJKHI2YAAoJEEFjO5/oN/WBNyoP/AuWRIuiYsz8rfmy4+BhABfm
hdwnqRsQHBToW21wdM/nLfbKOFJBRh1vGFeY8AzDwzwBV3Dgj8xEeDRQHbDxmjqk
FkSepOhiOnl+Edi9jyhHrznDYfQBiwhm78BN4wpYON0Ix8MjJEhDaaOJXzpjYoA1
Ps1THncpkfSdRkdtPkYeKh1Ag3XdNGoQzdecR+AF84SDTscHZ4zSb5N2cJQ9d/oA
qMfMOGJPepeLB3FelhzOF32VV/viRYA1KvRZiNJhdIwlTTEAz+A7D81Ij/qOznMR
pAKjj0/FkfRJIhL1xrrOFrMoiE2OVVWzR6TScspGP0EqCtVwbpNuaJhOiPK7thGv
PJMAHuEC6jMXTRQ3usvZLfrWy5P4UPrgQcaZSYsNG5L0Qy9BKiOsNzR4Hvf0JjVi
wTSsYl42N64BEg2u0Kf3jegSUvDaug9Cod3g9PiV5mtfD36cA+Mh7k3a4mAlm3ax
3LGOJXLsISCXyBZDbzQ3Si2YCWjZdEozH3ncqt3oR7TGMzdhT5XLOUJPY7E0J04R
uUChujv/YnOQdmCNItKA88wJoZhhscPjF13gXtREgIwouJRa5D6RVCSAe48ZVnbd
CVbpgPGxm8ZLke/bpf93jskJV+AFbU1uCsO7UdLQ1avsrAOV6kLmHTdbyayG08hz
zFHsbhbIAJKjBwbBjMXJ
=bDQO
-----END PGP SIGNATURE-----

--nextPart5121164.yJ2B4dnUz4--
