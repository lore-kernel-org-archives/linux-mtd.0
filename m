Received: from diel.co.at ([62.99.210.210])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bk1GU-0008Gl-QR
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2004 09:54:44 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Jul 2004 15:54:35 +0200
Message-ID: <A446DD6D20CA7B428A49427F9A42CD42165131@SBGSRVMAIL1.internal.diel.co.at>
From: "JUPE Peter Jungreuthmayer" <JUPE@diel.co.at>
To: <linux-mtd@lists.infradead.org>
Subject: jffs2, NAND flash, which kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

I am relatively new to linux and jffs2 so please forgive me for my lack
of knowledge.=20

I work with the SMDK2410 evaluation board  with Samsung S3C2410 ARM
processor and K9S1208 SmartMedia Card (=3D 64MB NAND flash).
Till now I used a 2.4.18 kernel with modifications for the SMDK from
MIZI research and  tried to use jffs2 on an 8MB NAND flash partition.
For a while I thought everthing is ok ( I can  mount and create and read
small test files) but then I encountered problems when I write a file
which crosses an block boundary (erase size is 16kB):

e.g.
# cp ./touchtest  /tmp/jffs2/
ARGH. About to write node to 0x00208760 on flash, but there's data
already ther:
0x00208760: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
ARGH. About to write node to 0x00208ce8 on flash, but there's data
already ther:
0x00208ce8: 0e da cd 3b 9e 9a ea 7c 53 26 3f 83 79 d5 81 7d
ARGH. About to write node to 0x00209444 on flash, but there's data
already ther:
0x00209444: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
ARGH. About to write node to 0x00209904 on flash, but there's data
already ther:
0x00209904: 4b 79 dc b4 8f 3c d4 97 2b e5 72 8c 95 1f 17 7e
ARGH. About to write node to 0x00209da8 on flash, but there's data
already ther:
0x00209da8: 37 09 20 e2 a7 e8 86 be f0 3f 5b 8b fb 97 00 42
ARGH. About to write node to 0x0020a074 on flash, but there's data
already ther:
0x0020a074: f0 bf 75 bd e2 2f ef 4c ad f6 1a cc 55 28 59 70
ARGH. About to write node to 0x0020a704 on flash, but there's data
already ther:
0x0020a704: 93 a4 02 97 24 a9 c8 67 c3 89 e5 bd cf b1 0b 9f
ARGH. About to write node to 0x0020ad88 on flash, but there's data
already ther:
0x0020ad88: 66 4f 29 06 08 30 00 22 43 f6 75 a7 93 a4 02 97
ARGH. About to write node to 0x0020b3f0 on flash, but there's data
already ther:
0x0020b3f0: e5 b1 29 2b 02 02 1a fc cf e0 3c fa 5f 00 41 fb

Searching the archive I often saw the hint: "use a more recent kernel",
so my question:

 Which kernel version would you at least suggest for my configuration?

I would like to change only as little as possible because all in all my
system works quite fine and to many new things in one step means a lot
of sources of confusion.

Thanks in advance

Peter


------------------------
Peter Jungreuthmayer
Digital Elektronik GmbH
Berchtesgadnerstrasse 10
A-5083 Gartenau
email: jupe@diel.co.at
