Received: from smtp10.wanadoo.fr ([193.252.22.21] helo=mwinf1008.wanadoo.fr)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C4JCz-0005Ga-TX
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2004 09:07:01 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf1008.wanadoo.fr (SMTP Server) with SMTP id 2C67A1800118
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Sep 2004 15:06:56 +0200 (CEST)
Received: from genevrier (ARennes-303-1-27-125.w81-53.abo.wanadoo.fr
	[81.53.112.125])
	by mwinf1008.wanadoo.fr (SMTP Server) with ESMTP id C1DC31800126
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Sep 2004 15:06:55 +0200 (CEST)
From: "Pascal Fifre" <pascal.fifre@cleode.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 6 Sep 2004 15:06:52 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20040906130655.C1DC31800126@mwinf1008.wanadoo.fr>
Subject: Pb with DOC millenium Plus 64MB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=20

=20

I=92m developping a board with a DOC Millenium Plus 64MB. I use a 16 =
bits
Access on a MPC5200 to dialog with it.

I modify the doc2001plus.c to do that (only 8 bits access has been =
supported
for now).

I=92ve formatted the DOC with the msysteme Dformat utility.

The doc2001plus and inflmount driver recognized the DOC.

But only the first 1024 blocks has been correct. The doc2001plus can=92t =
read
the 1024 other blocks.

It seems to be wrong to access on the 1024 others blocks.

I have these messages when Linux boot:

Using configured DiskOnChip probe address 0x10000000
ChipID : 0
ChipID 1: 40
DiskOnChip Millennium Plus found at address 0x10000000
Manufacturer ID: 98, Chip ID: 75
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba:NAND 32MiB =
3,3V
8-bi
t)
Manufacturer ID: 98, Chip ID: 75
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba:NAND 32MiB =
3,3V
8-bi
t)
2 flash chips found. Total DiskOnChip size: 64 MiB
mtd: Giving out device 0 to DiskOnChip Millennium Plus
INFTL: corrupt block 1024 in chain 1024, chain length 0, erase mark =
0xbf?
INFTL: formatting chain at block 1024
INFTL: formatting block 1024
MTD: Error 0xffffffa5 erasing at 0x2000000
INFTL: error while formatting block 1024
INFTL: corrupt block 1025 in chain 1025, chain length 0, erase mark =
0xbf?
INFTL: formatting chain at block 1025
INFTL: formatting block 1025
MTD: Error 0xffffffa5 erasing at 0x2008000
....
INFTL: corrupt block 2047 in chain 2047, chain length 0, erase mark =
0xbf?
INFTL: formatting chain at block 2047
INFTL: formatting block 2047
MTD: Error 0xffffffa5 erasing at 0x3ff8000
INFTL: error while formatting block 2047

Is anybody works on it or have an idea to help me?

=20

Thanks a lot.


Pascal FIFRE
Responsable Syst=E8mes Embarqu=E9s
CLEODE
5, rue de Broglie
22300 LANNION
Tel : 02 96 48 68 18
http://www.cleode.com
