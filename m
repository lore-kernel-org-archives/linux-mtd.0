Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfW4M-0007f2-H6
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 13:28:23 +0000
Message-ID: <1354541353.11583.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: Kconfig: drop utf8 characters
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Date: Mon, 03 Dec 2012 15:29:13 +0200
In-Reply-To: <1353971928.2383.18@tyr>
References: <1353971245-26735-1-git-send-email-wolfram@the-dreams.de>
 <1353971928.2383.18@tyr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/RtS4dDaQ1X34gnkXKF9"
Mime-Version: 1.0
Cc: Wolfram Sang <wolfram@the-dreams.de>, Martin Walch <walch.martin@web.de>,
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


--=-/RtS4dDaQ1X34gnkXKF9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-11-26 at 17:18 -0600, Scott Wood wrote:
> On 11/26/2012 05:07:25 PM, Wolfram Sang wrote:
> > The Linux Kernel Configuration system (lkc) expects 8 bit characters
> > only (declared in scripts/kconfig/zconf.l: %option 8bit).
>=20
> That option contrasts with being limited to 7-bit characters, not with =
=20
> accepting UTF-8.  It may be that kconfig has problems with UTF-8, but I =
=20
> don't think this is why.

Whatever has problems with UTF-8 - it is better to fix that instead of
hiding the problem by removing UTF-8 characters.

--=20
Best Regards,
Artem Bityutskiy

--=-/RtS4dDaQ1X34gnkXKF9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvKkpAAoJECmIfjd9wqK0nioQAJAtWsYNekQNTXZZo38gCFMa
0NrobaAPsCidCzpe1ZAnHPcfJgfjrItsBLjxrsJL7jw5KShMOKDHvcQDvZxUQJgu
PAiI4IvY8B+ejytSUjZe55Wi3nn6XWhGr36FKvjsaKQsnEPWdaJUDY3o1eGaA06K
m+ZBreOdy25wIpOd4WkZJ2GSro3QJrNLJw6HwFxuZE89aRQuAsEp52xQg4UTe1PD
4C3tEknnzw3GC8HczYU9G2YxykQSaPrc1TgSlQL0QzyTH+suede2vyM1vZv35SuL
Q0Rn3H1cWjfUxaEkpTSWKjVUscdSHvG5N4soLuD22ZHR+uDubF6fqjaAz9hasWbK
9RHd0aISp+Xs35GmrRjFKvI/fT/MMAWmmgbYiic3F3FJ52pnTXvu8SHw3nrhLdBv
HLGtPTXGEKPtgCUw52B2N7wSkDBso6UpU805h1ePMBOAPtysqTtntpEHkcutmD2L
Hz3yzvYFg/9//dNFCto/gO7ZJEFF/psWsz9jPufSPjqqmXm2v9grpRUpdJTULAgg
qlfluKrJxjFkjBLs8QZatTlWEPZ3yQTp0bzq8dA+izmov9EKmcFH8W5U8cuBnqfu
rxm5FHNpco9GdA32Ur6Hfctb8txtAhh6qfy1kdCZ0SI+VDuD0JDqgi2tFgD6F9vj
HzV0+BFwcGNKzK1SYFcS
=tp6R
-----END PGP SIGNATURE-----

--=-/RtS4dDaQ1X34gnkXKF9--
