Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKtx7-0001qb-Ek
	for <linux-mtd@lists.infradead.org>; Sat, 15 Nov 2003 06:30:37 +0000
Received: from 192.168.1.100 (unknown [192.168.1.100])12E338DBD
	for <linux-mtd@lists.infradead.org>;
	Sat, 15 Nov 2003 01:32:54 -0500 (EST)
From: Joshua Wise <joshua@joshuawise.com>
To: linux-mtd@lists.infradead.org
Date: Sat, 15 Nov 2003 01:29:09 -0500
References: <200311150109.39539.joshua@joshuawise.com>
In-Reply-To: <200311150109.39539.joshua@joshuawise.com>
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200311150129.10424.joshua@joshuawise.com>
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: JEDEC probing redux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> In the mean time, I'll nuke the unlock address verify in jedec_match, and
> see if that solves my problem.

I decided to go with option three out of two and just add a check for addr =
>>=20
1 in jedec_match, so I don't have to worry about Stuff Going Boom. I'll cle=
an=20
it all up and check it in to hh.org tonight.

/joshua
=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/tce1Pn9tWOqA4LMRAihSAJ9/+m6QCxIRGLe7Sd71bfLrG0KjSQCeJyeO
fMDejdjv8ucdgHcjjGSGcsA=3D
=3Dq4CV
=2D----END PGP SIGNATURE-----
