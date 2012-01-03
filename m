Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ri2HE-0003ur-NO
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2012 11:11:33 +0000
Date: Tue, 3 Jan 2012 12:11:14 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2] MTD/GPMI bugfix : reset the BCH module when it is
 not MX23
Message-ID: <20120103111114.GA9083@pengutronix.de>
References: <1325233646-3343-1-git-send-email-b32955@freescale.com>
 <20111230143658.GA9141@pengutronix.de>
 <4EFE7236.10609@freescale.com>
 <20111231154338.GA27544@pengutronix.de>
 <CAMiH66HsFn4+6-whEC6G-qSPda3+3pBzd50i7iHh9Pg9TXHTXw@mail.gmail.com>
 <20120101223335.GA3756@pengutronix.de>
 <CAMiH66Fwh-su6ucLDMM7hhCjH7MJPeavt1u4O=_jWn5w=DyfKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <CAMiH66Fwh-su6ucLDMM7hhCjH7MJPeavt1u4O=_jWn5w=DyfKA@mail.gmail.com>
Cc: baruch@tkos.co.il, marek.vasut@gmail.com, koen.beel.barco@gmail.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Artem.Bityutskiy@intel.com, linux-arm-kernel@lists.infradead.org,
 LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Huang,

> I will do the MX23 test, when i am free. It really costs lot of time :(

My point is like this: I wondered if you really found out _why_ the MX28
has this problem, e.g. "There is a case where the rom code does <x>, and
when the NAND then does <y> the BCH goes to state <z> which requires a
soft reset of the ip-core." If you had been at that point, it should be
quite easy to check if this can happen on MX23, too, I think.

If you don't know the cause of the problem in that detail because the
problem is hardly reproducable, well, that can happen, too. I fully
understand that. I don't want to enforce the time-consuming test on you
(would be interesting, though), but then at least the comments need
proper updates, so people are informed. From my understanding of the
situation, it could look like this:

=3D=3D=3D

Due to Errata #2847 of the MX23, the BCH cannot be soft reset on this
chip, otherwise it will lock up. So we skip resetting BCH on the MX23.
On the other hand, the MX28 needs the reset, because one case has been
seen where the BCH produced ECC errors constantly after 10000
consecutive reboots. The latter case has not been seen on the MX23 yet,
still we don't if it could happen there as well.

=3D=3D=3D

What do you think?

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8C4lIACgkQD27XaX1/VRvo7QCfd+GF8jRVOXLGxu5EW1IyfHYu
SksAnjblbKtEOt4Zy+ldiaRAVC8N7fFn
=Y7AX
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
