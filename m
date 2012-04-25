Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN31d-000557-7u
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 14:16:57 +0000
Received: by lboj14 with SMTP id j14so135738lbo.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 07:16:54 -0700 (PDT)
Subject: Re: [PATCH 0/2] mtd: nand: rework nand_ecc_ctrl interface for OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 25 Apr 2012 17:16:50 +0300
In-Reply-To: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-NZcdxo4jnEvaqOig7Stj"
Message-ID: <1335363413.5114.20.camel@koala>
Mime-Version: 1.0
Cc: Viresh Kumar <viresh.kumar@st.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Vipin Kumar <vipin.kumar@st.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 Mike Dunn <mikedunn@newsguy.com>, Bastian Hecht <hechtb@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>, Liu Shuo <b35362@freescale.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Wolfram Sang <w.sang@pengutronix.de>, Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-NZcdxo4jnEvaqOig7Stj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-16 at 15:35 -0700, Brian Norris wrote:
> Note that I could not compile all the affected drivers, since some requir=
ed
> ARCH-specific builds that I am not familiar with.
>=20
> Artem: can you perform your regular compile tests? I compile-tested as ma=
ny as
> I could.

Yes, I compile-test for several architecture/platforms, but not sure I
cover everything. I'll check your patches once I reach that point in my
inbox queue. I am currently having paternity leave, and I'll be very
busy once I return back to work, but I am slowly processing my inbox
anyway in background.

--=20
Best Regards,
Artem Bityutskiy

--=-NZcdxo4jnEvaqOig7Stj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPmAdTAAoJEJtuLFy+q7fePnwH/jtMlZtbbvYzQ8Ijevutkz+O
rwbl5qCuBQWWcAfKzF0Tr7i2w5iVXRlOYhRSzJJpzPa+DIi/WWaID+HyU7P57Jg/
rJ41RrarIksA+hJg6rqE1M6ttoWqCNAfF4ZPOkbY/awoUq9bxs7H3DSPEZ+uwOwW
M3OOxBYdGmZwlXlAimJWqchAq3tzgmA/JBRiXiPtFYZ+QmnAaCtIkl0ZZiwDrKsb
sDL5mllu0rzDLeUtfSK7RZg1vTuBxS9Pq6l6spzT1WeqgdHGxzK0CU+QVlmEZARr
xfrlVtoauPCXxqQbLSyV3VzrUjOFydnRskK3SWJGCmuMEiDwQ4tqZD1dDfSFhoc=
=a3Tj
-----END PGP SIGNATURE-----

--=-NZcdxo4jnEvaqOig7Stj--
