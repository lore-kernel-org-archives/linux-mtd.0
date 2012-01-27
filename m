Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqmaI-0005jX-EM
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 14:15:23 +0000
Received: by dadz9 with SMTP id z9so556384dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 06:15:21 -0800 (PST)
Message-ID: <1327673847.29385.4.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4] MTD: nand: add support for diskonchip G4 nand flash
 device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Fri, 27 Jan 2012 16:17:27 +0200
In-Reply-To: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
References: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lmy/62LDldhiub1lyqST"
Mime-Version: 1.0
Cc: robert.jarzmik@free.fr, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lmy/62LDldhiub1lyqST
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Tue, 2012-01-03 at 16:05 -0800, Mike Dunn wrote:
> +config MTD_NAND_DOCG4
> +	tristate "Support for DiskOnChip G4 (EXPERIMENTAL)"
> +	depends on EXPERIMENTAL
> +	select BCH
> +	select BITREVERSE
> +	help
> +	  Support for diskonchip G4 nand flash, found in various smartphones an=
d
> +	  PDAs, among them the Palm Treo680, HTC Prophet and Wizard, Toshiba
> +	  Portege G900, Asus P526, and O2 XDA Zinc.
> +
> +	  With this driver you will be able to use UBI and create a ubifs on th=
e
> +	  device, so you may wish to consider enabling UBI and UBIFS as well.
> +
> +	  These devices ship with the Mys/Sandisk SAFTL formatting, for which
> +	  there is currently no mtd parser, so you may want to use command line
> +	  partitioning to segregate write-protected blocks.  On the Treo680, th=
e
> +	  first five erase blocks (256K each) are write-protected, followed by
> +	  the block containing the saftl partition table.  This is probably
> +	  typical.

Why do add this to drivers/mtd/nand/Kconfig instead of
drivers/mtd/devices/Kconfig lige DOCG3 does?

--=20
Best Regards,
Artem Bityutskiy

--=-lmy/62LDldhiub1lyqST
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPIrH3AAoJECmIfjd9wqK0yfEQAJTlDc9ep1vvP+hIGaa77J0P
kF4cW7kK3F+zyyznUTLVfeeDi2B5DWREj5VYNgtaXRzr0HlBgLiWJc8FzeYTwnN/
MKKhjz8Paq7QrlFMozFN9+TcKud7LORhCf1HZL5mZsQv/5qcPXXCc+7sMewi5r28
8z39+Acvbf9wI7M5ciS8p8Klp3hyumYMiiPfhhibr4rftVLdB9FlFTIxoI89507n
ooJkC1hZ3Hn0xGImdVixAm8+B4muRIY6lQ/nKjMEoeh/xy4oS9pXXz0DeeGaR0p/
BCyroE/p9gk8i6ggkZ+vF8UxL3GDaP++7xsejECCx3jee+zCRP/ikytBbquvAV5A
6LDnDH1Xiu3mXOAOB2WLz2PI0lmtMFoedmiOxrUYWDa2ghYy6zHDEm7bbReDs43J
qtDk6EG0K0GLvBZLCSoqSlQjR+W14q5MKjmseJWLrYuk28bTwBQN5LyUSA2p7V+0
656KOEb09Iuz8ujEkljgJaOQ2nqHjzfzjwC9wUcmxghNK0AoEJXtb433G/0I2Pl4
CRzgrn/aE2vjKZiyHBbOBeoWJOtALHTM+tBR/kbgjKIDQyXyZ0om5Xqj46W7kipd
MyhH4S+yNFtm4qVqDKXb5PK0B0kEva5C7ZHarVWsL1DtJW44pVU3qqMyXbrmunbE
G37M5M4tAg8o3O5kGqbv
=zj8H
-----END PGP SIGNATURE-----

--=-lmy/62LDldhiub1lyqST--
