Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19YfD7-00015r-Ln
	for <linux-mtd@lists.infradead.org>; Sat, 05 Jul 2003 06:03:45 +0100
Received: from 192.168.1.100 (unknown [192.168.1.100])4186718FB8
	for <linux-mtd@lists.infradead.org>;
	Sat,  5 Jul 2003 01:04:52 -0400 (EDT)
From: Joshua Wise <joshua@joshuawise.com>
To: linux-mtd@lists.infradead.org
Date: Sat, 5 Jul 2003 01:03:56 -0400
References: <200307042232.43815.joshua@joshuawise.com>
In-Reply-To: <200307042232.43815.joshua@joshuawise.com>
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200307050103.58666.joshua@joshuawise.com>
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: jedec_probe.c
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

On Friday 04 July 2003 10:32 pm, Joshua Wise wrote:
> tracked this down to jedec_probe_chip's cfi->addr_unlock* garbage - it do=
es
> look like that function will need to be rewritten. Has anyone already
> started this, or should I just go ahead?
I stand corrected. It seems like it's also possible that jedec_probe() could
be rewritten to just probe all the chips that we know about. Methinks I'll
try that.

(Addendum a few minutes later)
Sigh.. This just exposes fscking LAYERS of cruft that MTD was built on,=20
including the idea that every flash chip would be CFI, and this horrible=20
probing cruft. Someone please shoot me.

> ~joshua

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/Blw8Pn9tWOqA4LMRAratAJ9flffrOczi5a5pTa/Vi1PestkHSQCeNXEM
PD9pfEOR53oD2NHJHXtU2I8=3D
=3Dw4wO
=2D----END PGP SIGNATURE-----
