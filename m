Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TOTZQ-0008R3-Eo
 for linux-mtd@lists.infradead.org; Wed, 17 Oct 2012 13:22:01 +0000
Message-ID: <1350480112.5769.160.camel@sauron.fi.intel.com>
Subject: Re: GPMI NAND crashes with UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Vasut <marex@denx.de>
Date: Wed, 17 Oct 2012 16:21:52 +0300
In-Reply-To: <201210171516.55693.marex@denx.de>
References: <201210050345.49507.marex@denx.de>
 <201210111355.33836.marex@denx.de>
 <1350479529.5769.155.camel@sauron.fi.intel.com>
 <201210171516.55693.marex@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-YEbQ5i+BD4R22u5Yo1pM"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-YEbQ5i+BD4R22u5Yo1pM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-17 at 15:16 +0200, Marek Vasut wrote:
> Ok, I'll re-check. Though I suspect this problem disappeared with the
> recently=20
> applied UBI patches.

No, you ask UBIFS to emulate a power cut, so it switched to R/O mode at
a random point. It printed scary error messages, which are normal
because an I/O operation failed. Then integck reported you the error and
stopped.

All expected.

If you use -p integck option you will just make integck _not_ fail when
the file-system suddenly becomes R/O, integck will just unmount it,
mount back, remove all its data, and start over. Then you'll get another
emulated power cut, and so on.

Ideally this should never stop. The idea is to test that UBIFS can mount
the file-system in case of a power cut.

If there is a problem, integck should die.

To just stress-test your driver you do not need power-cut emulation.
=20
--=20
Best Regards,
Artem Bityutskiy

--=-YEbQ5i+BD4R22u5Yo1pM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfrDwAAoJECmIfjd9wqK0T/0QAJVqry5eMpThqDcESW1wr6y5
/qp8HxqX+oo5Uvp9ksZGv3EHegntza3eoR0l+CgqBSn00gFSECYMSVfUZlHkyNyJ
PiapiSieeEXRpsqtfdItZ2U8DCj2P6N4MxrmQZ4H79qB91LEJjdHqC5M439AD1cf
K75GH9/i62l8AD/blxsf6m4l+V4K3Ahi0Zh/8jEnh7veAVHDxrAzV6VXx3mWCtZl
6IWNNpO1/7EM3irX9ZbfrVvu4HvFK1rUaSSU7xGlqu4ki/Tn3ZPpfMZkQrXlK1Ui
snzIfwPTuxQAcbOEflDSI9ZbU16wcohakTmU5Foh8Q3OTMnZyiXRveodORAe2rPJ
MA+k3QYvSnloUQSsC77jPfQQ0m+/GBXNxDACxonfMi0sVSFWzpBQXkpKMuTJV6de
4l+X6gOPiQp4HLtXBkJIDDSgvj//5uRiqnyTcTvg+j8cBpD4QxBjnwkxaLWkW5Fg
ht4gxbsLT9j2yUHZKIa9aJ0LqM1sek+E+eQp4OzhV6E2fg3arnSu4wrxNJbVsnXB
3bndJLPZHhdQ0EsT46YOIr90puV3SLfFzym09CFqdmo+4cBqUXz+6V/ydvDT5H8U
ikgU2YtNy4BVW77tfI9WvHzED6NjtWkRxawsaYSbjfoCH09RsE9CWB7IATTbZdir
IRvvQB2NrC66FMQ5EiPX
=cQmv
-----END PGP SIGNATURE-----

--=-YEbQ5i+BD4R22u5Yo1pM--
