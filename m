Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rww84-0004jV-Vy
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 13:39:41 +0000
Received: by dakp5 with SMTP id p5so5493407dak.36
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2012 05:39:39 -0800 (PST)
Message-ID: <1329140515.22240.145.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 0/7] SH Mobile sh_flctl driver brush up
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bastian Hecht <hechtb@googlemail.com>
Date: Mon, 13 Feb 2012 15:41:55 +0200
In-Reply-To: <1328960705-18699-1-git-send-email-hechtb@gmail.com>
References: <1328960705-18699-1-git-send-email-hechtb@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-JHzTCu//G6JlmVgoQz9W"
Mime-Version: 1.0
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-JHzTCu//G6JlmVgoQz9W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-02-11 at 12:44 +0100, Bastian Hecht wrote:
> This patch series brushs up the sh_flctl.c a bit to make it work with
> the mackerel board. The hardware has changed and this needed to be
> reflected in the NAND host driver.
> On the road some minor enhancements have been incorporated.

I cannot even compile-test this patch because I get the following error:


sh4-linux-gcc: error: command line option '-m4-nofpu' is not supported
by this configuration


with the cross-compiler downloaded from here:

http://kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.0/x86_64-gcc-4.6=
.0-nolibc_sh4-linux.tar.bz2

Could you please describe how could I compile-test it?

--=20
Best Regards,
Artem Bityutskiy

--=-JHzTCu//G6JlmVgoQz9W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPORMjAAoJECmIfjd9wqK0l7wP/00MVUTfzqyD7GtD+XVhZdL/
N1+jmB+l9x6rZa2dfWiK3DFrYa0ARVHPZ6e5gUInyt4Sz9NHyKTisNc9WCVc+DsO
x+4/Hp41O8+3UleRlNZpalIuOP1/aePfUfyanUBILemUfk3NONyi0qFgH+ph6goy
CAMLVikc0m2j+yB00kCKBhNmYykfCHN3otcX6BjbJWg5GfNs2U9p4DtoDPOx+ivR
V/nE41+3b4mGMfe92pHCaBMt5ICJ22PCYnjqzfa+AAHqCyvZXP73eSu5USsUTjwW
U4E730buU8OQL1TiGg/6QvSeocdngBGxE3/3J/BZXGQoap+DiU3j5muakhABOSdD
WwD5CdjIYZjpG72pOFRNMcIz0+NUs67obwSPySrISfQd4PL3hQojMyvOTCBcB4yf
D07XQwdB/8rYYIiL6WzV01bhnXCSy7imJgDdkC3SZ5ujgIVcKQPBC8Rqyy3qjymm
kkeGobZjH76bFH/EJrqv9PJlR8FlBQP8uJCtYS5WasUI60HiYZ+AmTD/J6CjkJPL
RLBGmSkiBglagbFuf6yIqZMy6XQaMDcOWxH0wHH58A7nhEVaVzNUdG15LpH+swTA
WfAYZp0gokCrDrRFNxFZR/fAaXJjbqpULc32IRVlTgTndRLFTrHUXvjT7NNZMYLw
/0Mrt1eHiIJGweSTfoq6
=0Cvo
-----END PGP SIGNATURE-----

--=-JHzTCu//G6JlmVgoQz9W--
