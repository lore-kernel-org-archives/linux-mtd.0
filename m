Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SQDM0-00060f-Jk
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 07:55:04 +0000
Message-ID: <1336118303.4275.3.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4 01/10] mtd: nand: add 'oob_required' argument to NAND
 {read, write}_page interfaces
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 04 May 2012 10:58:23 +0300
In-Reply-To: <CAN8TOE9ETNcbFamO-rAzb-5GzTwA9x7UiOzgjC+E_rPJPWQ7Zw@mail.gmail.com>
References: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
 <1335978904-8005-2-git-send-email-computersforpeace@gmail.com>
 <4FA2BD85.1050102@newsguy.com> <20120503204307.6d93115d@halley>
 <CAN8TOE9ETNcbFamO-rAzb-5GzTwA9x7UiOzgjC+E_rPJPWQ7Zw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-VwAJyLKB6AKRelUtIoe+"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>, Lei Wen <leiwen@marvell.com>,
 Kevin Cernekee <cernekee@gmail.com>, Bastian Hecht <hechtb@googlemail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>, Florian Fainelli <ffainelli@freebox.fr>,
 Scott Wood <scottwood@freescale.com>, Jamie Iles <jamie@jamieiles.com>,
 Thomas Gleixner <tglx@linutronix.de>, Li Yang <leoli@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>, Axel Lin <axel.lin@gmail.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-VwAJyLKB6AKRelUtIoe+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-03 at 15:34 -0700, Brian Norris wrote:
> The docg4 stuff already went into l2-mtd-2.6.git; Artem can add the
> Acked-by as he rebases.

Done, but please guys, provide full tags with the name which I can
copy-paste as is.

--=20
Best Regards,
Artem Bityutskiy

--=-VwAJyLKB6AKRelUtIoe+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPo4wfAAoJECmIfjd9wqK0B64QAJIOUOsYWEu/dZ+zkT+mVquD
jEUca1Fco4XaJHnM1zSt32ZLKJzQIQEo/MVVajIJSddAXH9OcqkD6YSIsWhDFGUI
7J4OXGhKPfcB2QvvRLtKvZQ/KUKWssvIJPlkWUlQKetsUhYeqf5Bti9w53bL3LKs
OITpW8p41/sz7pGht9V3fLPnxUM2P+hjuZ9MJHt7svbCu/Gw3Tg7QvN0xP6iS9IV
s79jmqg22i0mnoiy1hQBtrh/W2d4pVlUwpS+ylSIbCgDsIwQe1gtcKhrhac9aMMb
i9giULH4nYP9qEmX6zld1XzukVVQseCRqcljwA2yE8+HKskhUF5XVAl1wVC2EEZH
D7wrcVQ/NUAQbdyRpaTFN3HI9xN2r+mNhs3ieBQIE49rYPtb1d70BMvqx8lqX6RB
XbAeZwijwFIjeY0O/UXR7yydBzw2Ppiul9XZhMl+LwPB7SVzR2CFNCEnIl6lH5FR
TAXeasMSGbJMSGxOrQtDT0kU7lI0QfoPeE6wW0e2PmrwunC7yyvlMiybOm/oOwzf
PeQrl7ao8b3AkiaxV6sBtj52PRK0bJ8Ex47arYpebj2X+g99zgYPYPYgwi05UNWh
HkBQ7iYTzXypjzFq226kPf8MmSRIsKL5UF/Ile8O/DJfi4K8JdgaPWrL+xQ5rMUV
vkHaRhyEAN6OA1rWAuM0
=S946
-----END PGP SIGNATURE-----

--=-VwAJyLKB6AKRelUtIoe+--
