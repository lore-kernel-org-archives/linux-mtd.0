Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv6W6-0005v7-Hu
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 13:25:28 +0000
Message-ID: <1358256409.2731.137.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: adjust names of bus-specific functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Tue, 15 Jan 2013 15:26:49 +0200
In-Reply-To: <1356526466-27360-1-git-send-email-zajec5@gmail.com>
References: <1356526466-27360-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-X/b8GUXUn+AXoHZQFXcy"
Mime-Version: 1.0
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-X/b8GUXUn+AXoHZQFXcy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-12-26 at 13:54 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> This is needed to add clean support for other buses (like SSB) in the
> future.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Cannot compile-test this patch because of the following build regression
in 3.8-rc4:

In file included from arch/mips/pci/pci-bcm47xx.c:27:0:
include/linux/ssb/ssb.h:440:19: error: field 'gpio' has incomplete type
In file included from include/linux/bcma/bcma.h:7:0,
                 from arch/mips/pci/pci-bcm47xx.c:28:
include/linux/bcma/bcma_driver_chipcommon.h:582:19: error: field 'gpio' has=
 incomplete type
make[2]: *** [arch/mips/pci/pci-bcm47xx.o] Error 1

--=20
Best Regards,
Artem Bityutskiy

--=-X/b8GUXUn+AXoHZQFXcy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9VkZAAoJECmIfjd9wqK01hkP/1iRW9NwzRtgieYkuFk9lFd6
1ly31+1MRmQ02P/img4q8IbqgwluWlrlvHD39lEyljYbP7QEy0d1EpaHKv3C53vn
mTG26YVeMo3Db/sJLIv/Tlxf7OxD8Ec/+q5UBO+qSzwixrfbsNAMYwnYQFpWNPpu
bLOXOjiqv1UlVaNAaREHJRnw3GxETAXCSPNppzM0WNw6ZTXRbPp6V+o+PcKuENgQ
Vt2GmF0FR/9ZU1qjGldXJqoyw5RwdMo3wFZHq4cqXiBNU7p8OpXiPR+PYzI39CH+
pbTfa8fEmBxrsvBPmhMXCU8ib23C5vXikKRhhKhYLgrMOfJKpQmleFfzyjjnDQ93
NUoZZPqJZlW3MtM++EheOZRe18jQRb31Kmsrf44Jc5ra8F6r1l/FZMSpTSaCQ4+m
Z31DNrkJuY6a7bxUR3MsshhCvbFJ9bDlfRjQknrxi0qPVTwJIwzdTGyOr3DrjorD
IylfGdt7xezOSMXACOA0QUeC0IB9Xmg3b8uXc8KeJ0+pR5ig5XCVn11gJDqBkYzf
iHRcP1qKX4f+XZ04h+7d96fptuHtqeywex9nvjaVK7dM5hSyLfXkWSn6B5dtXw2C
7Ani92jkSf2LLtbPr1dRqAMMyDiLOLhJgLyQAAZmzzfIzxPp1rbwe3gWd9ILDKz5
YAhhtVTS5YleSQbh/Ttq
=STuZ
-----END PGP SIGNATURE-----

--=-X/b8GUXUn+AXoHZQFXcy--
