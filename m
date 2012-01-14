Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rm5bZ-00061z-5Y
 for linux-mtd@lists.infradead.org; Sat, 14 Jan 2012 15:33:19 +0000
Received: by iakl21 with SMTP id l21so7087229iak.36
 for <linux-mtd@lists.infradead.org>; Sat, 14 Jan 2012 07:33:15 -0800 (PST)
Message-ID: <1326555295.14299.5.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3] MTD: ST SPEAr: Add SMI driver for serial NOR flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Date: Sat, 14 Jan 2012 17:34:55 +0200
In-Reply-To: <1326375537-29656-1-git-send-email-sr@denx.de>
References: <1326375537-29656-1-git-send-email-sr@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mckr/x/0k7ivhVAdKdyR"
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


--=-mckr/x/0k7ivhVAdKdyR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-01-12 at 14:38 +0100, Stefan Roese wrote:
> From: Shiraz Hashim <shiraz.hashim@st.com>
>=20
> SPEAr platforms (spear3xx/spear6xx/spear13xx) provide SMI (Serial Memory
> Interface) controller to access serial NOR flash. SMI provides a simple
> interface for SPI/serial NOR flashes and has certain inbuilt commands
> and features to support these flashes easily. It also makes it possible
> to map an address range in order to directly access (read/write) the SNOR
> over address bus. This patch intends to provide serial nor driver support
> for spear platforms which are accessed through SMI.
>=20
> Signed-off-by: Shiraz Hashim <shiraz.hashim@st.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-mckr/x/0k7ivhVAdKdyR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPEaCfAAoJECmIfjd9wqK0UxcP/23J1KU/+VVO4Uwbf3nYsANu
DiWl/q/83OdzqM5IelEMrrhO/bEVBP3OuUt9m8KC6aU0s0ddIr80BRqjsGf/UFTM
6O8DDBvjlw83apS1gpoGKQqAVmzNLoaUfWyjmPO6FqMJ5TqO2O4mM4QlON2vWSJQ
WZv+XVy4oQ74GKE/TimZ9MNscmOeLGu+OuFnzrtp1eLwd6WeuaSY3EBoQt+kfb55
997kIya8h0s/3azcEyPmQXUGTIzy/gp3HnHZrOYX67T6FXHA0SpcEc5aB1fkHJDE
/w6ur0ilDLPLOgeIyBjnqjmm8YcFbDG+DkfLKuPbtkNYSs7gbVCY4jAvTLCdjqD1
uV9yV8OuOkVYxFcWJvlr/rIWX4Wx2zaFaHW1AiiNd7XJexjVkf6lgm+fDwR0HV3i
U8u172o4g5PKT95wdthu3pt73Ptm8U3z7pUgYW70jwvq0053QypxG3o34XF0UoMr
29OgNFEPOW+QPuwLa4IrSoadLXd7koofM2bdUE4lXdzu5kiL4iCcNU+D9LgjRMEd
7oPXCut5LH7hNf+uGUQH3TTt+VDethugnZ5sr0pPHiS6Wnb0vRxmt7lC+36MuZmL
WYvKZxuvXjqArNSJgFtXIYj4NuziUGpDE7mNRvQdb7GpWG0sIaElMR6+2lLXprcI
AdbpxRmLjUlel3D8snS8
=YJ5S
-----END PGP SIGNATURE-----

--=-mckr/x/0k7ivhVAdKdyR--
