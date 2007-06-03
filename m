Received: from lug-owl.de ([195.71.106.12])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HuvaW-0002jN-EG
	for linux-mtd@lists.infradead.org; Sun, 03 Jun 2007 15:19:39 -0400
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
Subject: Re: LogFS take four
Message-ID: <20070603191744.GU2649@lug-owl.de>
References: <20070603183845.GA8952@lazybastard.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R10gueRtU1pFqy+X"
Content-Disposition: inline
In-Reply-To: <20070603183845.GA8952@lazybastard.org>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Roland Dreier <rdreier@cisco.com>, Arnd Bergmann <arnd@arndb.de>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Sun, 03 Jun 2007 19:20:05 -0000


--R10gueRtU1pFqy+X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2007-06-03 20:38:46 +0200, J=C3=B6rn Engel <joern@lazybastard.org> =
wrote:
> This round the patch is split into file-sized hunks.  There actually
> seem to be kernel developers not manly enough to digest 6000+ lines of
> code at once.  An I thought I was the only wimp around.

Though it would be nice to have them as a pile of patches so that
after applying them one-by-one, the kernel still compiles.

Eg. if the first patches wire up the new feature into the build
system, but the actual .c file aren't yet there, that won't compile
and thus make git-bisect'ing harder...

MfG, JBG

--=20
      Jan-Benedict Glaw      jbglaw@lug-owl.de              +49-172-7608481
Signature of:         Alles wird gut! ...und heute wirds schon ein bi=C3=9F=
chen besser.
the second  :

--R10gueRtU1pFqy+X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGYxPYHb1edYOZ4bsRAuYEAJ4wyb55K7xjMA756Zgks2UoX7uoBgCeJ1O8
CbO2o3g+2MscPNvsEeteFwQ=
=O4MV
-----END PGP SIGNATURE-----

--R10gueRtU1pFqy+X--
