Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Ycqo-0000l7-LP
	for <linux-mtd@lists.infradead.org>; Sat, 05 Jul 2003 03:32:34 +0100
Received: from 192.168.1.100 (unknown [192.168.1.100])2FB8216894
	for <linux-mtd@lists.infradead.org>;
	Fri,  4 Jul 2003 22:33:41 -0400 (EDT)
From: Joshua Wise <joshua@joshuawise.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 4 Jul 2003 22:32:39 -0400
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200307042232.43815.joshua@joshuawise.com>
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: jedec_probe.c
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

Hi all,

I've added a new flash chip to the jedec_probe.c definitions, and it seems=
=20
that it's throwing back errors that the unlock codes don't match. I've=20
tracked this down to jedec_probe_chip's cfi->addr_unlock* garbage - it does=
=20
look like that function will need to be rewritten. Has anyone already start=
ed=20
this, or should I just go ahead?

~joshua

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/BjjLPn9tWOqA4LMRAkOnAJ9pIVC8b1nSW3lXJZhcnnMa+uSCQACgjUsJ
fK4lWnznSpEloOaklDaQRdg=3D
=3D7gh4
=2D----END PGP SIGNATURE-----
