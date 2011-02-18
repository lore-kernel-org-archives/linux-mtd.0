Received: from web30201.mail.mud.yahoo.com ([209.191.69.48])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PqO1s-0003Eu-Kw
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2011 10:57:41 +0000
Message-ID: <664335.29092.qm@web30201.mail.mud.yahoo.com>
Date: Fri, 18 Feb 2011 02:57:38 -0800 (PST)
From: Lars Michael <lh_post@yahoo.com>
Subject: mount ubi volume fails: No such device
To: dedekind1@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- On Mon, 14/2/11, Lars Michael <lh_post@yahoo.com> wrote:=0A> Unfortunat=
ely, booting Linux the NAND flash is now detected=0A> bad, so I do not have=
 an mtd1! what is the best way to try=0A> to recover? I do not understand h=
ow the flash can suddenly=0A> become bad!=0A> =0A> NAND device: Manufacture=
r ID: 0x2c, Chip ID: 0xca (Micron=0A> NAND 256MiB 3,3V 16-bit)=0A> Bad bloc=
k table not found for chip 0=0A> Bad block table not found for chip 0=0A> S=
canning device for bad blocks=0A> Bad eraseblock 0 at 0x000000000000=0A> Ba=
d eraseblock 1 at 0x000000020000=0A> Bad eraseblock 2 at 0x000000040000=0A>=
 Bad eraseblock 3 at 0x000000060000=0A> Bad eraseblock 4 at 0x000000080000=
=0A> Bad eraseblock 5 at 0x0000000a0000=0A> Bad eraseblock 6 at 0x0000000c0=
000=0A> <cut>=0A> Bad eraseblock 2046 at 0x00000ffc0000=0A> Bad eraseblock =
2047 at 0x00000ffe0000=0A> No space left to write bad block table=0A> fsl_n=
fc: NAND Flash not found !=0A> m25p80 spi1.1: at26df081a (1024 Kbytes)=0A> =
Creating 1 MTD partitions on "Atmel at26df081a SPI Flash=0A> chip":=0A> 0x0=
00000000000-0x000000100000 : "at26df081a"=0A> DSPI: Coldfire master initial=
ized=0A> ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver=0A> =0A=
=0AI try to diagnose the flash from U-Boot. When I e.g. try to read from th=
e=0Aflash I get:=0A=0ANAND read: device 0 offset 0x1, size 0xfffffff=0ASkip=
ping bad block 0x00000000=0ASkipping bad block 0x00020000=0ASkipping bad bl=
ock 0x00040000=0A<cut>=0ASkipping bad block 0x0ffa0000=0ASkipping bad block=
 0x0ffc0000=0ASkipping bad block 0x0ffe0000=0ANAND read from offset 1000000=
0 failed -22=0A 0 bytes read: ERROR=0A-> nand =0A=0AI am really stuck here,=
 and don't know how to proceed. Is it normal that=0Athe flash can suddenly =
go totally bad? At one moment in Linux the device=0Ajust had a few bad bloc=
ks and after a reboot, all went bad. I am really=0Aworried about this issue=
!=0A=0ADo I need to replace the device?=0A=0AAny comments on this is apprec=
iated.=0A=0AThanks and regards,=0A- Lars=0A=0A=0A      
