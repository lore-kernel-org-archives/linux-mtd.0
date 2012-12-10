Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti4pc-0006QE-7D
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 14:59:45 +0000
Message-ID: <1355151644.2657.41.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Support Persistent Protection
 Bits (PPB) locking
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Date: Mon, 10 Dec 2012 17:00:44 +0200
In-Reply-To: <1354864954-30290-1-git-send-email-sr@denx.de>
References: <1354864954-30290-1-git-send-email-sr@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qmbivP428WM2wAwOGY+4"
Mime-Version: 1.0
Cc: Holger Brunck <holger.brunck@keymile.com>, devicetree-discuss@ozlabs.org,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-qmbivP428WM2wAwOGY+4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-12-07 at 08:22 +0100, Stefan Roese wrote:
> +       /*
> +        * Wait for some time as unlocking of all sectors takes quite lon=
g
> +        */
> +       timeo =3D jiffies + (2 * HZ);     /* 2s max (un)locking */

Please, use msecs_to_jiffies() instead.

> +       for (;;) {
> +               if (chip_ready(map, adr))
> +                       break;
> +
> +               if (time_after(jiffies, timeo)) {
> +                       printk(KERN_ERR "Waiting for chip to be ready tim=
ed out.\n");
> +                       ret =3D -EIO;
> +                       break;
> +               }
> +               mutex_unlock(&chip->mutex);
> +               cfi_udelay(1);
> +               mutex_lock(&chip->mutex);
> +       }=20

Would you please educate me a bit and explain what is protected by
'chip->mutex' and by 'get_chip()'.

Why you need to drop the mutex here?

Why is it not an ABBA deadlock to do this:

Task 1: In the loop above, has chip locked, doing
        mutex_lock(&chip->mutex);

Task 2: done mutex_lock(&chip->mutex), now doing
        ret =3D get_chip(map, chip, adr + chip->start, FL_LOCKING);

--=20
Best Regards,
Artem Bityutskiy

--=-qmbivP428WM2wAwOGY+4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQxfkcAAoJECmIfjd9wqK05A8P/A0ZeaRk0/BWp3jeGxmxvFwM
FjuxU48bhoek8JVhLip0pt7Ld4ta3FXydjE9iIvFeRm71snudMGye2s5VWCK2JJB
dECVW3/Gogt2HhlP6rFjCKA2E7yJUsRZOIFo2LF1v9rXo0YPVPS2EY2jpmd6CTcb
+2P8m5OnZsijTempqxeRogQcAsUzJd6YGsCA3HfcLQpFCCAz/ewWmf2HL/WcYW6g
k+r4mWLiCUmiRKE3SwR/9LrbnJXLZaBbMYitWmNQBxrF3CWj91+sX5AzpsxeK1n8
Th4WFdwpHSFpb5B+to1PcUVIyKG1EEyUZey7DG7uSGGh/p+sbBQ7I2XsD9WgAUSo
GHGpvZ+sEF9hUfiU7gJ2Y85N6Ne3jHFm+7E+cJE9whc6asktaxTu1E1p+pkBQVnO
LGxXjjuyYW7I+yA/9H6bNNoftWtxJNe8yaWljICGzD7pR3FyPw862OwHyx20Vdlw
cCOQmcm0zagLryLjjEUFMHWUhabeRgNfvurDF6plrIIazA40yFCeBPJvf2CYzS7c
MaarqWK0D9zXh5dWqgHgp/JVLVRxKTxsM2wtV25wf+f2ib52rC3SToR5t4lUbpeA
+POUewc/a97u3ZOu6EIsglZ6tjP7N6VQsbZ6E0wO7rVEpv7NFtk1+cQcAvWqRwr8
4rJ4139OLFl84avgPs59
=PI/C
-----END PGP SIGNATURE-----

--=-qmbivP428WM2wAwOGY+4--
