Received: from huva.hittite.isp.9tel.net ([62.62.156.28])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al8Hy-0000aN-Lo
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 15:04:34 +0000
Received: from jennifer (14.170.62.62.internet9t.9massy1-1-ro-bas-2.9tel.net
	[62.62.170.14])
	by huva.hittite.isp.9tel.net (Postfix) with ESMTP id 231EF9BC3C
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Jan 2004 16:04:14 +0100 (CET)
From: "Philippe" <philippe@accuitee.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 26 Jan 2004 16:05:06 +0100
Message-ID: <000501c3e41d$c858e780$247dfea9@jennifer>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: DOC2k booting speed ...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,
=A0
I=92m using=20
-=A0=A0=A0=A0=A0=A0=A0=A0=A0 doc2000 (32MB)
-=A0=A0=A0=A0=A0=A0=A0=A0=A0 via c3=A0800
-=A0=A0=A0=A0=A0=A0=A0=A0=A0 linux kernel 2.4.22
-=A0=A0=A0=A0=A0=A0=A0=A0=A0 mtd mtd-snapshot-20040124.tar.bz2
-=A0=A0=A0=A0=A0=A0=A0=A0=A0 I use nftl
=A0
=A0
I have build a little system (kernel+initrd). My initrd is about 4MB
compressed (10MB uncompressed)
I have set up grub in the doc
=A0
When grub is booting, it takes 10 seconds to load the kernel and 35 =
seconds
to load the initrd.
=A0-> 5MB loaded=A0: 45sec
=A0
When I boot from the Doc but with loading from the hard drive it takes 1
seconds to load the kernel and 2 seconds to load the initrd.
=A0-> 5MB loaded=A0: 3sec
=A0
on the m-sys web, they say that the DOC2k should have a read rate about
1MB/s so if I=92m right everything should be loaded in less than 10sec
=A0
If anyone has a clue=20
=A0
Thanks
=A0
Philippe
=A0
=A0
