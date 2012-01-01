Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RhTyc-00005W-JJ
 for linux-mtd@lists.infradead.org; Sun, 01 Jan 2012 22:34:04 +0000
Date: Sun, 1 Jan 2012 23:33:35 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2] MTD/GPMI bugfix : reset the BCH module when it is not
 MX23
Message-ID: <20120101223335.GA3756@pengutronix.de>
References: <1325233646-3343-1-git-send-email-b32955@freescale.com>
 <20111230143658.GA9141@pengutronix.de>
 <4EFE7236.10609@freescale.com>
 <20111231154338.GA27544@pengutronix.de>
 <CAMiH66HsFn4+6-whEC6G-qSPda3+3pBzd50i7iHh9Pg9TXHTXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <CAMiH66HsFn4+6-whEC6G-qSPda3+3pBzd50i7iHh9Pg9TXHTXw@mail.gmail.com>
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


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> This happens because we do NOT follow the right init procedure. The IC
> guy told me.
> If the BCH was not initialized correctly, it can not guarantees the
> data is right.
> This is why the mx28 failed.
=2E..
> For mx23, it should not reset the BCH, this is the right init
> procedure for mx23.

Okay, this was the information I was looking for. So, the MX23 cannot be re=
set
due to bug #2847. But it also does not NEED to be reset, which is unlike the
MX28 which needs the reset. Correct? Before that, it was only clear that MX=
23
cannot be reset. It was not clear (at least to me) if it still could then r=
un
into the same problems as the MX28 after 10000+x boot cycles. That would be=
 a
really bad situation: being in need of the reset which we can't do due to 2=
847.

> But I did not ever boot 10000 times on mx23. I am not sure if it can
> fail or not.

Hmm, can't your IC guy tell you? I was hoping he knows if the same problem =
which
happens on the MX28 can also happen on the MX23? I don't want to make your =
life
unnecessarily hard, but I'd really like to know if I need to warn customers
when using MX23 and NAND (and if so, we have to update the comment in the c=
ode).

> > bug 2847, we have a serious problem, because NAND won't work until the =
next
> > power-cycle? I am curious if my assumptions are true and we have a seri=
ous
> > problem on the MX23.
> You can test it if you have time. :)

Testing is guessing in this case, the problem could arise after <n+1> cycle=
s if
I tested <n>. Actually knowing the situation would be more helpful, I'd thi=
nk.
If this is not possible to find out, we'd need to add this as a comment, to=
o,
so people experiencing problems have a pointer which can save them *a lot o=
f*
time.

Kind regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk8A3z8ACgkQD27XaX1/VRsiTQCgqPYhJLU03P2AslZ1sRlJvzbK
fWwAn0ZULlivPoVtRSSPgRIEYNEUQqk6
=Hbn/
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
