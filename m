Received: from cc-smtpout2.netcologne.de ([89.1.8.212])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm8AA-0001hl-BT
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 17:12:39 +0000
Date: Sun, 06 Feb 2011 18:12:32 +0100
From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: Re: JFFS2: truncated files after power loss scenario
To: dedekind1@gmail.com
In-Reply-To: <1297008210.4460.71.camel@localhost> (from dedekind1@gmail.com
	on Sun Feb  6 17:03:30 2011)
Message-Id: <1297012353.1854.1@antares>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=PGP-SHA1; boundary="=-LjWWMdYyRJyPulHV4/KU"
Cc: Sven <svenjaborek@gmx.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-LjWWMdYyRJyPulHV4/KU
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 06.02.11 17:03 schrieb(en) Artem Bityutskiy:
> The bottom line is that it is difficult to fix broken applications by
> changing JFFS2. The right way to update configuration files is described
> here:
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_atomic_change

Dumb question: isn't it necessary to also run sync() after the fsync() - cl=
ose() - rename() sequence, as to ensure that the directory entries are actu=
ally flushed to the flash?  Or does a call to

	rename("configfile.tmp", "configfile");

*ensure* that after a crash during this call either the entry of the old fi=
le (configfile) or of the newly written contents (configfile.tmp) is access=
ible, independent of the moment when the crash happens?

Best, Albrecht.

--=-LjWWMdYyRJyPulHV4/KU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iD8DBQBNTtaBn/9unNAn/9ERAnEDAKCobdD2L2yYqHWvyGbNjz4Q4urAawCfckFA
2ZILwNnDSedhHDSlcjRFhPA=
=bAeQ
-----END PGP SIGNATURE-----

--=-LjWWMdYyRJyPulHV4/KU--
