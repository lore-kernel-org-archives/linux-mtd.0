Received: from mail.digineo.de ([185.55.116.143] helo=digineo.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7k25-0002Z4-9Z
 for linux-mtd@lists.infradead.org; Fri, 18 Nov 2016 14:20:59 +0000
Received: from dominik.digineo.lan (unknown
 [IPv6:2a06:8780:dead:0:8a88:88ff:fe88:8788])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dom)
 by digineo.de (Postfix) with ESMTPSA id EB7126080A
 for <linux-mtd@lists.infradead.org>; Fri, 18 Nov 2016 15:20:24 +0100 (CET)
Message-ID: <1479478821.2465.41.camel@digineo.de>
Subject: Handling soft reset on mt7261 Soc with 32M flash
From: Dominik Menke <dom@digineo.de>
To: linux-mtd@lists.infradead.org
Date: Fri, 18 Nov 2016 15:20:21 +0100
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-ciGUJ7sEMsrC85IkfF0L"
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ciGUJ7sEMsrC85IkfF0L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello list,

I've been redirected here by Mathias Kresin (mkresin; LEDE project) to
ask for comments on how to handle the following situation:

We have a router board using MediaTek's MT7261 SoC with 32M flash memory
(Winbond W25Q256FV [1]). To address >16M, the SPI bus must be configured
to use 4-byte addressing mode. The problem arises after a soft reset,
when the SoC expects the SPI to be in 3-byte addressing mode, but then
can't communicate with the flash memory.

When researching the issue, I've found this [2] mail in the OpenWRT
mailing list archives, describing the problem as

> Paul Fertser on openwrt-devel, 2015-07-08
>=20
> Apparently MT7620 can't handle 4 byte addressing mode of the flash
> memory on hardware level so it needs to be reset somehow prior to
> resetting the SoC.

=46rom that mail, I have buthered together a patch [3] which fixes the
problem for my hardware, but it'll most likely not work with other flash
chips (cp. [4]):

> Daniel Golle on commit comment, 2015-11-11
>=20
> At least on Macronix SPI chips, using 0x66, 0x99 to reset the chip is
> not nough as that will not clear the adressing-mode bits.
> Using 0xE9 (EX4B; exit 4-byte mode) instead fixes the issue eg. on
> MX25L256.

In another Pull Request [5], introducing a modalias for a Macronix
MX25l25635E flash on the Lenovo Newifi D1 [6], the same reset sequence
appears. Mathias hinted in the PR, that the flash reset sequence should
be executed conditionally, based on the JEDED id (I have not a clue
though, how to do that, to be honest).

How would you proceed?

Thanks for your advice,
Dominik


[1]:
https://www.winbond.com/resource-files/w25q256fv_revg1_120214_qpi_website_r=
ev_g.pdf
[2]:
https://lists.openwrt.org/pipermail/openwrt-devel/2015-July/034153.html
[3]: https://gist.github.com/dmke/d389bc364b3f73f525076eaee0019dc1
[4]: https://patchwork.ozlabs.org/patch/541391/
[5]: https://github.com/lede-project/source/pull/464
[6]: https://wikidevi.com/wiki/Lenovo_Newifi_D1



--=-ciGUJ7sEMsrC85IkfF0L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJYLw4lAAoJEChok9YuKEw1MoQP/0x1Yrnnzn7YXOo3Xr3EbS7P
xGrc+0Qq9wUqpWLYMii0tpCT1Y+RcZLLmcEbNRZ0aqknol5gBfPCaLB7ZIhs5D1B
fTJKoeXa/F0A06Yk8RrIPH95dzDbDwaBr2Bwr9sX+ZLrDlvbJX3HJcpL6mxaP+P6
boZK/RXyMiO+jHdEGcAfoR1a8kgaDtXu/EgquJn/5J0nnUzPnYUi0CBHnEincKqN
XY6Q+AkJz7gxeix/ehEzkmVHMT0e/RZxdQWx8l6YklhRefL1j0v4IN8LJmXTokyy
Qs3fN6HnYzH3BEJ9DzC87JoouyNG4mGJsxh6e0S7Iefq2/n4s8f2p3NG3HFnwoYa
2Prck8LISKtlWk8hE/Xmlko4CZWsmbwcTrpqQW3xWJqU8vUJk2gNAnxTHEyn+cTT
HH0PCsMNqgIacBu4gMIKXyJvy3N+PBmes+Q/KIhJJ3W7RnBZk1ULyMV4ifguhyu+
g5ablT73YgNTfMwD+9zr2GBcvqvCK4oeaybqDWjoS+B9D+8QZFbhS5RMkLSdWLkO
QuLFoPRC3TzWmA5b+G7TEjKK6rMwfstuPDIQC4+AxvZxvRxqBv3cdm/PH7wHz5XD
0XEI7sk/vILmwZPV+scwpPNf8O8hER5nyUGqfnqYcqalN2XiSZegWPSEJKCS1RmM
ZkqNeMDDCTHGqvkXosgT
=e5pp
-----END PGP SIGNATURE-----

--=-ciGUJ7sEMsrC85IkfF0L--
