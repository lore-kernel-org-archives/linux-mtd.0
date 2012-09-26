Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGmhp-0007Ph-JE
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 08:10:54 +0000
Message-ID: <1348647058.24309.33.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V3] mtd: basic (read only) driver for BCMA serial flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Wed, 26 Sep 2012 11:10:58 +0300
In-Reply-To: <CACna6rwPVzgQ1NA_yN5wdmW=TMw9ZpOLyf69ZSj2yYdK0gsZ1g@mail.gmail.com>
References: <1347875449-19318-1-git-send-email-zajec5@gmail.com>
 <1348645345.24309.24.camel@sauron.fi.intel.com>
 <CACna6rwPVzgQ1NA_yN5wdmW=TMw9ZpOLyf69ZSj2yYdK0gsZ1g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QmyEzTODHb4lAV3Br4cd"
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


--=-QmyEzTODHb4lAV3Br4cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-26 at 09:55 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> 2012/9/26 Artem Bityutskiy <dedekind1@gmail.com>:
> > On Mon, 2012-09-17 at 11:50 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> >> This registers MTD driver for serial flash platform device. Right now =
it
> >> supports reading only, writing still has to be implemented.
> >>
> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> >
> > Can you please confirm that you tested this and the driver works in R/O
> > mode just fine. If yes, I would also like to add a note that this is R/=
O
> > to the Kconfig text. If it does not even work, I am willing to drop it.
>=20
> OFC it works! :) It nicely cooperates with bcm47xxpart (partitions are
> detected) and I can read mtd content (bootloader, nvram, etc.).
>=20
> You're right, we miss info about R/O in Kconfig, I didn't think about thi=
s.

I've just folded the following changes in:

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index ce6e3d4..27f80cd 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -121,12 +121,12 @@ config MTD_SST25L
          if you want to specify device partitioning.
=20
 config MTD_BCM47XXSFLASH
-       tristate "Support for serial flash on BCMA bus"
+       tristate "R/O support for serial flash on BCMA bus"
        depends on BCMA_SFLASH
        help
          BCMA bus can have various flash memories attached, they are
          registered by bcma as platform devices. This enables driver for
-         serial flash memories.
+         serial flash memories (only read-only mode is implemented).
=20
 config MTD_SLRAM
        tristate "Uncached system RAM"


--=20
Best Regards,
Artem Bityutskiy

--=-QmyEzTODHb4lAV3Br4cd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYriSAAoJECmIfjd9wqK0gjkP/2CqvLw8EdT/O5cS/A2UN30W
iw9c3LRWLiFI2Vxl8xb+HHn15LmlFD3apG4RIrzAhPYZS4N69lloGfIFOPo0NjIw
44iSYN1/5+FVf0ppzjosHoIiZxMZeDa+94o+DmnN/r3vUnVxWtkWKKUu11Nbv0hg
nd3EPx6O2RI2TuHI8Aqa3w9H6MqBSMD0f6OXLWQP7fh05B1h1JdYYD0ogdhkFWZ7
Zh9YfoKwPoib7WImiQFbrPUZZyWqsBmd4RV8V6w7bJnrgLdlnehr35Q7x6tp5COO
TfI/XRyP4wO4UYm7SJGML/rVE9vjdGyKLiemXHJafrqXb8WDO7QF7TTUvm2p/IW8
ZdEnTkYUoSkClbwDZ7wHZszsmlBgfRZ7x46X+tV+DA5EZS5LwlMK4dXyFCAia9jg
B+er7Xcocscb5qKf33l1ZWRkBZg19IvlxxQY+/mbnAO04FDqveidFsPUqXbPmgcH
Ou8yER4xPfmfHkiZ45QwL2+n94MkO6C0Z8Jjp+mWFyqw3md4XLgLmgiNVafhSqMx
ZmyGkowwIG+iXiTIX+CBbGUAVlWoirjLbu2SWdGZ/ZAGECvl03ljEg7bcn05jymj
OoKlep+TSCsS5fL3IU2g94A478rdSHApR85aLx9Z4Xd+wQVauRWVVmTghotFLClX
SJF8UoNITiEvIwvC5NDs
=5t1C
-----END PGP SIGNATURE-----

--=-QmyEzTODHb4lAV3Br4cd--
