Received: from mlbmx2.corp.harris.com ([137.237.90.74])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 164kWQ-0001Ce-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2001 15:03:14 +0000
Message-ID: <8D4C69676E66D511A1CB00508BBBB1921578A7@ranmx1.ran.harris.com>
From: "Fend, Matthias" <mfend@harris.com>
To: 'linux mtd' <linux-mtd@lists.infradead.org>
Subject: Re: problems to write a partition table
Date: Fri, 16 Nov 2001 10:11:42 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

i guess you get this message=20
"nftla : unknown partition table"
if you try to write the partition(s) with fdisk ?

if yes check if you've enabled the partition type support (for example =
MSDOS
partition tables) in your kernel configuration.

the same for the filesystem stuff ... after solving the partition =
problem :-)


matthias

	-----Urspr=FCngliche Nachricht-----
	Von:	Fend, Matthias=20
	Gesendet am:	Freitag, 16. November 2001 16:04
	An:	Fend, Matthias
	Betreff:=09


	Useing a doc2000 device (32Mb) and a kernel v2.4.14.

	After insert some MTD modules :
	mtdcore docecc doc2000 mtdchar mtdblock and nftl;
	I run nflt_format to format my doc2000 chip;
	but it complain :Erasesize not 8Kb - I'm confused!

	For someone's advice I skip the erasesize check in nftl_format.c.
	so nftl_format works well.
	but when I run fdisk on /dev/nftla.
	it's say :
	You will not be able to write partition table.
	Device contains neither a valid DOS partition table, nor Sun, SGI or =
OSF
	disklabel Building a new DOS disklabel.Changes will remain in memory
only,until
	you decide to write them.After that, of course,the previous content
won't be
	recoverable.

	Command (m for help):

	Even if I created a partition and enter "w",the partition also can not
be writed
	into /dev/nftla.

	run nftldump on /dev/mtd0:
	NFTL Media Header found at offset 0x00000000:
	NumEraseUnits: 2048
	FirstPhysicalEUN:0
	Formatted Size:33488896
	UnitSizeFactor: 0xff
	Second NFTL Media Header found at offset 0x00004000
	Unit 0 is free
	Unit 1 is free
	...
	...
