Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RbwNT-0000mn-Cj
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 15:40:47 +0000
Received: by iadk27 with SMTP id k27so5580279iad.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 07:40:45 -0800 (PST)
Message-ID: <1324136533.4240.52.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: Kernel oops on a read only mounted file system
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Fahlgren <fahlgren@tutus.se>
Date: Sat, 17 Dec 2011 17:42:13 +0200
In-Reply-To: <1323762790.27828.30.camel@fahlgren-laptop>
References: <1323762790.27828.30.camel@fahlgren-laptop>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-v2L7ie34pyUPIiTIZ2eC"
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


--=-v2L7ie34pyUPIiTIZ2eC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-12-13 at 08:53 +0100, Daniel Fahlgren wrote:
> Neither the kernel nor the ubifs system is the latest, but the code in
> ubifs_write_inode hasn't changed since 2008-something.
>=20
> Looking at the list there is another similar report[1] but that isn't in
> the same place. Attached is a patch that fixes the problem for me. To be
> honest is my local version slightly different and is checking for
> inode->i_sb->s_flags & MS_RDONLY and not c->ro_mount. I'm not sure if it
> is in the correct place regarding locks, or if the check should be in
> ubifs_jnl_write instead.

I think this patch fixes the symptom, not the real cause. Most probably
it is a VFS bug in your kernel. If UBIFS is R/O, it should never have
any dirty inodes, so there should be nothing to write!

What is your kernel version? Can you enable generic UBIFS debugging and
collect the UBIFS prints and send them? Use ignore_loglevel kernel
argument when booting to make sure all UBIFS output goes to your
console, otherwise you'll not see them there and they will end up in the
ring buffer, and will probably overlap.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-v2L7ie34pyUPIiTIZ2eC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO7LhWAAoJECmIfjd9wqK0h3UP/0P9ads8m6Zr3nkDOBT1AROp
t1xgPxxBr73TSBhxfV5oBOiB9baWyugG5V+sCB6JnCuFa7kQ16Hb1QrLGSOLWSxQ
8KR3g85F+UYYtnpGVERkl71RieUmX5Blnhp3FMHLzxHxTfpVXRKBN54GVCdv0OQq
tiuB+xrsf3mmGzMzRcMlgdY77DCBR49PVyPXbeXmrZOTvql9Oc1L1jrnjaP018G1
epxmT6xhRYo5U0k4NUE+vHU6LdfNhd9/hvxSSwssCZJI5Y9RatptKbIYC2CJDIvz
gBXjrjIP582nRCkDN1hwl/HwPrwcGj64vtWPRLWq5Rco1LlLE3ud8zoP6a96k2U9
x+vt7p62c7gjPki4GsXeeAYD7WTytCcPlrmbce94wRT8T+J3wcK3BHDvF0FwIZp5
Eo/r0KGa9Mw+B2IbOuQScY1NFBn6lXxZ8iBjph92j/Czx+Gl4WSyomSKD/+HCRZK
YDv0W4ylRQy+DATKibKzU6hgvVo2WF4FTYxWPDJdSzJnXriK8LNe8kpXyaSOuffd
Kvxrs893ZkX4tGYlGQ6TTvFQbD3K1FkezgOENhRgddApJ+x00w5vQy9wKyxzTdlG
7sii3HL0hVDnFjo7b+gUHOyHHrXy1kNSf58X8/0UCchoBOdTsbgo/UZcQwdK+vdK
QmaPjNI4LlXuld1wMoi2
=q1Bc
-----END PGP SIGNATURE-----

--=-v2L7ie34pyUPIiTIZ2eC--
