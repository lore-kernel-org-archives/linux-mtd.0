Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AQE1X-0005yC-43
	for <linux-mtd@lists.infradead.org>; Sat, 29 Nov 2003 22:57:11 +0000
Received: from 192.168.1.100 (unknown [192.168.1.100])F239F1441D
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Nov 2003 17:56:09 -0500 (EST)
From: Joshua Wise <joshua@joshuawise.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Sat, 29 Nov 2003 17:55:32 -0500
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200311291755.33309.joshua@joshuawise.com>
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [NAND] Multi-page OOB reads
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

I'm on an iPAQ h1910 board working with a Samsung NAND 16MiB 3,3V chip=20
(0xec/0x73).

I have a few questions about reading from the out of band area, namely with=
=20
reading multiple pages. First off, by reading the spec sheet for this flash=
=20
chip, I don't see any information about multiple pages of OOB data. Would i=
t=20
be called something else?

Secondly, I don't see any code in nanddump or nandwrite to deal with multip=
le=20
pages of OOB data. Should there be?

=46inally, I'm looking through drivers/mtd/nand/nand.c, and I'm looking at =
the=20
particular block that begins with the comment:
        /*
         * Read the data, if we read more than one page
         * oob data, let the device transfer the data !
         */
I see how there's a read command before that. Should that be inside the loo=
p=20
if we're going to modify col?

Thanks,
/joshua

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/ySPkPn9tWOqA4LMRAi0lAKCn3EKofWY81eUaff0O3iR0GSRTdQCfbUv0
Gnd8CfRPe0xzV0vOuN3/pHQ=3D
=3DnHv3
=2D----END PGP SIGNATURE-----
