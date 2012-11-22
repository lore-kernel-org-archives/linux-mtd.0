Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbRJA-0007lo-Er
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 07:34:49 +0000
Message-ID: <1353569732.2701.19.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V2 0/6] bcm47xxnflash: read support for BCM4706
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Thu, 22 Nov 2012 09:35:32 +0200
In-Reply-To: <CACna6rzc1zvMQWD=eFoiNWjXV40BkDv-gCkH=tgKqEEb=b36wg@mail.gmail.com>
References: <1352721805-14064-1-git-send-email-zajec5@gmail.com>
 <1353511181.2701.13.camel@sauron.fi.intel.com>
 <CACna6rzc1zvMQWD=eFoiNWjXV40BkDv-gCkH=tgKqEEb=b36wg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-XfMu30dDPIFyKIr6AMo3"
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


--=-XfMu30dDPIFyKIr6AMo3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-21 at 17:19 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> 2012/11/21 Artem Bityutskiy <dedekind1@gmail.com>:
> > On Mon, 2012-11-12 at 13:03 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> >> I believe I've made "verify" tool working in my system and fixed
> >> all warning/errors reported by it.
> >
> > Please, send me a configuration which I can use to compile-test this
> > stuff.
>=20
> I think this is the .config user by OpenWRT building system. It has
> CONFIG_MTD_NAND_BCM47XXNFLASH=3Dy
> so looks sane.
>=20
> Unfortunately it's not a minimal config possible, that allows testing
> bcm47xxnflash. Are you OK with that?

Thanks. I've actually instead modified my own mips-bcm47xx_defconfig
from the 'maintaining.git' project, so it has
CONFIG_MTD_NAND_BCM47XXNFLASH=3Dm now.

--=20
Best Regards,
Artem Bityutskiy

--=-XfMu30dDPIFyKIr6AMo3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrdXEAAoJECmIfjd9wqK0iGAP/idc678wj3pKIIkMme4RDCpy
UogGHrZbOI/5aoyyUYCSwJxLrGBqW45pX/Sh2Av9mseHx2MliXkKUlV+gqxe72ia
nibn2QEWnOOqJYkFyMNwbrCbShNdsnaocgbZQcN2fZUS5hdCa806XzfyVZa7TDqv
6KC+zfKYy+FDcw67K2a3d05GRFXHwFDyL1ZYE1hEbb/Msws1YTpcsm/KYIhaBYPk
UNF2IS3UTV2UZNYRCZVWAI/vg2n6V20SGRzJcjUHsFoJx8KZKqhPuQvWgpFp02z0
rWTX6GssuS8l5GfsxIBmRlDddtijlk+tGNE8G+5XbIG2goO9beOy/TIn+0K0dkxW
UA9aBsr/AUi/Kd6ejwQrThk3eK/SX7hdcjtKcyXLbgyxRy7ckaDi0fla7HXU0Tie
u5RNS65idUgKrxxUtihtZjWVnee/Hskk3bGc8S+KBDSwyH5vaWiTrmvUmcYagXrC
ImMrVzXUI4Dui5STgCq+MpcgFt5acX54Q/JMHZDLJBOvkSLB8CjqyMeQ+F4QjfNz
OFXfjrb4REUbwEPLHZV5QzsDdLzPRV/BEMO7/SsWHt7cTdSMpcCnKALxEUEuE03m
iYKtedZ07+FpKjd9KituuBX44U1JEwHlkP42K2eXQEa5P+XXOox1PalUa3eAiGDk
Zq+v727EA4GS8O+HdqzZ
=S/Iq
-----END PGP SIGNATURE-----

--=-XfMu30dDPIFyKIr6AMo3--
