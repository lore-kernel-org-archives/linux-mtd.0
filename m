Received: from web30201.mail.mud.yahoo.com ([209.191.69.48])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PxMQ5-0005tC-TQ
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2011 16:39:34 +0000
Message-ID: <227729.21879.qm@web30201.mail.mud.yahoo.com>
Date: Wed, 9 Mar 2011 08:39:27 -0800 (PST)
From: Lars Michael <lars.michael@yahoo.com>
Subject: NAND device: all blocks bad after restart, how to recover?
To: linux-mtd@lists.infradead.org
In-Reply-To: <mailman.15984.1299679972.1534.linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,=0A=0AI repost this issue, with correct subject and hope to have some=
=0Afeedback. After working with getting UBI images mounted in Linux (it did=
=0Awork for a sec!) the NAND device suddenly went totally bad after a syste=
m=0Arestart! So all blocks are reported bad and the mtd is no longer visibl=
e=0Ain Linux. Before it had just a few bad blocks. I am really worried abou=
t=0Awhat has happend and if this can occur on our custom board too.=0A=0ATh=
e hardware is Freescale TWR-MCF5441X with 256MB NAND flash.=0AThe kernel is=
 2.6.29 with 167 patches from the back port tree.=0A=0AFrom kernel boot:=0A=
=0ANAND device: Manufacturer ID: 0x2c, Chip ID: 0xca (Micron=0ANAND 256MiB =
3,3V 16-bit)=0ABad block table not found for chip 0=0ABad block table not f=
ound for chip 0=0AScanning device for bad blocks=0ABad eraseblock 0 at 0x00=
0000000000=0ABad eraseblock 1 at 0x000000020000=0ABad eraseblock 2 at 0x000=
000040000=0ABad eraseblock 3 at 0x000000060000=0ABad eraseblock 4 at 0x0000=
00080000=0ABad eraseblock 5 at 0x0000000a0000=0ABad eraseblock 6 at 0x00000=
00c0000=0A<cut>=0ABad eraseblock 2046 at 0x00000ffc0000=0ABad eraseblock 20=
47 at 0x00000ffe0000=0ANo space left to write bad block table=0Afsl_nfc: NA=
ND Flash not found !=0Am25p80 spi1.1: at26df081a (1024 Kbytes)=0ACreating 1=
 MTD partitions on "Atmel at26df081a SPI Flash=0Achip":=0A0x000000000000-0x=
000000100000 : "at26df081a"=0A=0AI try to diagnose the flash from U-Boot. W=
hen I e.g. read from the=0Aflash I get:=0A=0ANAND read: device 0 offset 0x1=
, size 0xfffffff=0ASkipping bad block 0x00000000=0ASkipping bad block 0x000=
20000=0ASkipping bad block 0x00040000=0A<cut>=0ASkipping bad block 0x0ffa00=
00=0ASkipping bad block 0x0ffc0000=0ASkipping bad block 0x0ffe0000=0ANAND r=
ead from offset 10000000 failed -22=0A0 bytes read: ERROR=0A-> nand =0A=0AA=
ssuming this is a software issue, can the bbt somehow be corrupt,=0Areporti=
ng all blocks bad even if they are not?=0A=0AIs the problem likely to be in=
 the UBI layer or in the NAND driver=0A(I suspect the first) and how can I =
troubleshoot this?=0A=0AI tried 'nand scrub' but still says no space to wri=
te bbt.=0A=0AThanks and regards,=0A- Lars=0A=0A=0A=0A=0A      
