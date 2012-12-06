Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TgY7v-0002sy-RL
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2012 09:52:21 +0000
Date: Thu, 6 Dec 2012 10:52:13 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: nand: gpmi: reset BCH earlier, too, to avoid NAND
 startup problems
Message-ID: <20121206095213.GA2589@pengutronix.de>
References: <1354740362-20412-1-git-send-email-w.sang@pengutronix.de>
 <50BFFFE8.8040002@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <50BFFFE8.8040002@freescale.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>,
 linux-arm-kernel@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 06, 2012 at 10:16:08AM +0800, Huang Shijie wrote:
> =E4=BA=8E 2012=E5=B9=B412=E6=9C=8806=E6=97=A5 04:46, Wolfram Sang =E5=86=
=99=E9=81=93:
> > correctly after warm rebooting, so the kernel could not find the UBI or
> which Soc do you meet this issue? the mx23 or mx28?

MX28.

> It's bad news to me. I ever thought the BCH-reset-issue is gone.
> I ever tested many times in mx28(> 10000 times) with freescale's uboot.

Did you power-cycle between each test or reboot? I still need to test if
this really makes a difference, but I think the issue shows more often
when only rebooting.

> I guest you are not use the freescale's uboot. The uboot also will reset
> the BCH/GPMI.

I just checked its sources. It also has this flaw. GPMI and BCH need to
be reset at the same time, i.e. before first commands are sent to the
NAND (although they don't need ECC).

I use barebox, but that isn't of importance here. If I don't fix
barebox, I see NAND issues in barebox or the kernel. If I fix barebox, I
still see issues in the kernel, but not in barebox anymore.

The setup needs to be done properly to ensure a consistent state at the
beginning, especially when somebody used the NAND before (ROM code,
bootloader). Fixing the bootloader alone is not enough.

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlDAas0ACgkQD27XaX1/VRs8iQCgrqb5nADGL5Dyi+csfSdSLWSR
/mUAoJN91gz+1QiqVUsNdHtwX9jpAdZC
=nMk3
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
