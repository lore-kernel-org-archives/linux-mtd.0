Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACqu0-0003xb-4I
	for <linux-mtd@lists.infradead.org>; Fri, 24 Oct 2003 02:38:08 +0100
From: Joshua Wise <joshua@joshuawise.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 23 Oct 2003 21:36:54 -0400
References: <3F984931.E6409ED7@mvista.com>
In-Reply-To: <3F984931.E6409ED7@mvista.com>
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200310232136.58256.joshua@joshuawise.com>
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: Alice Hennessy <ahennessy@mvista.com>
Subject: Re: Different nand interface
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

> I need some advice on how to support a board that has a hardware state
> machine
> that creates a parallel bus style interface to the NAND chip.  It is
> totally
> different from the standard 8 IO signal controls.=20

I'm not certain if this is what you're looking for, but the iPAQ h1910 has=
=20
NAND connected to the address pins. (Is this what you mean?) Take a look at=
=20
the NAND code in handhelds.org CVS (module linux/kernel26, I think, althoug=
h=20
if h1910 flash is not an option there, try module linux/kernel) - it's just=
=20
standard MTD NAND, except with some changes not to do moronic caching of=20
IO_ADDR_R and IO_ADDR_W. (You can also look at the 1910 flash driver to see=
=20
how I change IO_ADDR_R/W based on ALE and CLE.)

/j

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/mII5Pn9tWOqA4LMRAvDuAKCLJ0Oq1P9lJpvWdZFSEkR+scf0BACgkXI4
1A7evWeG40v8DYM8dsUI9nU=3D
=3D/6q9
=2D----END PGP SIGNATURE-----
