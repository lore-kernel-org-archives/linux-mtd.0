Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATnk1-00067q-FR
	for <linux-mtd@lists.infradead.org>; Tue, 09 Dec 2003 19:41:53 +0000
Received: from 192.168.1.100 (unknown [192.168.1.100])E7509175D4
	for <linux-mtd@lists.infradead.org>;
	Tue,  9 Dec 2003 14:40:34 -0500 (EST)
From: Joshua Wise <joshua@joshuawise.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 9 Dec 2003 14:40:18 -0500
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200312091440.22926.joshua@joshuawise.com>
Subject: nand: oob question
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

I've been porting Linux to the iPAQ h1910. I'm having lots of issues mounti=
ng=20
jffs2 partitions that I've traced down to there only being 16 bytes of nand=
=20
oob, not the 32 bytes that jffs2 seems to be expecting.

Is my flash weird, or am I just dense?

/joshua

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/1iUlPn9tWOqA4LMRAtWcAJ9sOFXpRIrvjCaJrZZyIloFwz5DRACggc82
LRxgvXIkcfd+kBzKrbAxGMk=3D
=3DiHrx
=2D----END PGP SIGNATURE-----
