Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AJP6X-0005rx-IG
	for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2003 03:22:09 +0000
Received: from 192.168.1.100 (unknown [192.168.1.100])86AD118826
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Nov 2003 22:24:15 -0500 (EST)
From: Joshua Wise <joshua@joshuawise.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 10 Nov 2003 22:20:42 -0500
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200311102220.43215.joshua@joshuawise.com>
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: NAND flash backup
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

As some of you may know, I'm doing the port of Linux to the iPAQ h1910. I'm=
=20
almost to the point of flashing a root filesystem to the device, but first =
I=20
need to be able to make a backup of the 16MB NAND flash. I do not know what=
=20
ECC I'm supposed to use, so I just use ECC_NONE at present. I have verified=
=20
that mtdblock reads do not fail, but I have not verified any contents.

Anyway, to the point. I want to be able to make an *exact* copy of the=20
previous WinCE image on the device, down to the bad blocks. Is there a=20
utility that allows me to do this? I've heard of nanddump, but I've not don=
e=20
much research into it. This code is not going to run in userland (this is i=
n=20
the kernel, for Linux as Bootloader project), but I'm fine with porting any=
=20
utilities I need into the kernel.

Thanks, and sorry if my writing is a little unclear (been spending most of =
the=20
day hacking on h1910 USB setup, and my brain feels like it's been put in th=
e=20
blender.)
/joshua
=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/sFWKPn9tWOqA4LMRAtWMAJwOVG9Kt/Xn6sQKRy0zeawSsl0lcgCdEBv5
19CW9E6Lg4qhS0R1P7XNeDk=3D
=3D+jMn
=2D----END PGP SIGNATURE-----
