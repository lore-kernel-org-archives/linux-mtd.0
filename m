Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv9zh-0000zx-5b
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 16:03:41 +0000
Received: by dakp5 with SMTP id p5so717629dak.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 08:03:39 -0800 (PST)
Message-ID: <1328717144.22240.66.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/9] mtd: MTD API rework
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Date: Wed, 08 Feb 2012 18:05:44 +0200
In-Reply-To: <1328714485-19536-1-git-send-email-dedekind1@gmail.com>
References: <1328714485-19536-1-git-send-email-dedekind1@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-N17fsunCSrxWWCr21EWq"
Mime-Version: 1.0
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-N17fsunCSrxWWCr21EWq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-08 at 17:21 +0200, Artem Bityutskiy wrote:
> here are the latest MTD API rework patches. I have plans to also harmoniz=
e the
> OOB-related functions, try to harmonize alignment checking in erase and w=
rite
> functions as well. Not sure I'll have time for this, though, will see.

I forgot this:

 drivers/mtd/chips/cfi_cmdset_0001.c |   26 ++--
 drivers/mtd/chips/cfi_cmdset_0002.c |   21 ---
 drivers/mtd/chips/cfi_cmdset_0020.c |   15 --
 drivers/mtd/chips/cfi_util.c        |    6 -
 drivers/mtd/chips/map_absent.c      |    2 -
 drivers/mtd/chips/map_ram.c         |    4 -
 drivers/mtd/chips/map_rom.c         |    3 +-
 drivers/mtd/devices/block2mtd.c     |   17 ---
 drivers/mtd/devices/doc2000.c       |   12 --
 drivers/mtd/devices/doc2001.c       |    9 --
 drivers/mtd/devices/doc2001plus.c   |    9 --
 drivers/mtd/devices/lart.c          |   10 --
 drivers/mtd/devices/m25p80.c        |   31 -----
 drivers/mtd/devices/ms02-nv.c       |    8 -
 drivers/mtd/devices/mtd_dataflash.c |   21 ---
 drivers/mtd/devices/mtdram.c        |   23 +---
 drivers/mtd/devices/phram.c         |   33 +-----
 drivers/mtd/devices/pmc551.c        |   85 ++++++------
 drivers/mtd/devices/slram.c         |   31 +----
 drivers/mtd/devices/spear_smi.c     |   28 ----
 drivers/mtd/devices/sst25l.c        |   20 ---
 drivers/mtd/lpddr/lpddr_cmds.c      |   21 ++--
 drivers/mtd/maps/vmu-flash.c        |    8 -
 drivers/mtd/mtdconcat.c             |   59 +--------
 drivers/mtd/mtdcore.c               |  254 +++++++++++++++++++++++++++++++=
++++
 drivers/mtd/mtdpart.c               |   48 +------
 drivers/mtd/nand/nand_base.c        |   38 -----
 drivers/mtd/onenand/onenand_base.c  |   23 ---
 drivers/mtd/ubi/gluebi.c            |   19 ---
 include/linux/mtd/mtd.h             |  201 +++++-----------------------
 include/linux/mtd/pmc551.h          |   78 -----------
 31 files changed, 360 insertions(+), 803 deletions(-)

--=20
Best Regards,
Artem Bityutskiy

--=-N17fsunCSrxWWCr21EWq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPMp1YAAoJECmIfjd9wqK0v7YQAIIQwBfB4mJVi0dNl+hVRdVB
fCrRncZBnmQ+Iu7p+XdGfEHI5+0ss6d7Y3Up8qrMaKT/92HiDCn+qeMNkCxWsVHt
Kk7YEQVcoQ98+uI1ZXHNitibdG6hqMals2BRbPaUVxp/tgGTqrgszIs8ViOcxNch
spdJDMq2gnWYC1zVXF7Re/VRraRrZobTE1ijQhgbNoKOrK47niQf35zISemdPWWd
zf52DwWzsa6cPsynhl3Q5lZi/+VB6p9nZlclU/1Fpqwlu0mPXnEvKCi3mxg5gA0Z
SzaOiRe3+tsQ1jzj4Hlb87NZf0jLQnXb4ZmR6WZ/z3gSgDgy1mI/r4LPgX7NxSUj
4AV/LmpOCgFjkyAmWLI+MM4d10GRRLoBE9wj9rtQgVJR3bqJnIAED40peqoKL0Mf
xCMJB7dPv8lIpotwkP3ThyzjNIDZoOU9K/PhjO1xRNVoSdzDdpblbr10F3cwd+m+
oTiZMcc/q4au1TzqzFxXAEvlwy7Pyu9wuXkGWOsKVbHrgEaG6C+Byj9+5Raqa8q2
bB7wTcRFl9DDSNgQQxRqekQQN2zLEJ9yFZ8kGAdqFO6+nQzp23IDpoT7exBqTLgL
iAGGCJWgaTzKkOLTUwszfb42D+TVkGqCg6+68WmpCs134cAVkTfH64opsr2botYB
TirGwSoZPlXLRhsLi3AF
=3OBo
-----END PGP SIGNATURE-----

--=-N17fsunCSrxWWCr21EWq--
