Received: from kda-mailgw-02.mail.kongsberg.com ([193.71.180.105])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HlLDf-0005oP-4e
	for linux-mtd@lists.infradead.org; Tue, 08 May 2007 04:38:53 -0400
Received: from kda-beexc-06.kda.kongsberg.com (unverified [193.71.174.22]) by
	kda-mailgw-02.mail.kongsberg.com
	(Clearswift SMTPRS 5.2.9) with ESMTP id
	<T7f77a48c12c147b469bfc@kda-mailgw-02.mail.kongsberg.com> for
	<linux-mtd@lists.infradead.org>; Tue, 8 May 2007 10:28:39 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Wrong size at boot when loading partition
Date: Tue, 8 May 2007 10:28:38 +0200
Message-ID: <DFE4DC18931A1F46AD316DAF9ECFE50907906B@kda-beexc-03.kda.kongsberg.com>
From: <Staale.Aakermann@kongsberg.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,
I am trying to upgrade an Arcom Vulcan kernel from 2.6.11 to 2.6.21. The
kernel is almost vanilla, except some pci-bridge issues. It is an IXP425
based board with 16/32MB AMD MirrorBit flash. I'm newbie when it comes
to MTD/JFFS2 so I am not sure what causes the wrong partition allocation
on boot.=20

Could anybody help me on this issue?

I've posted the kernel boot messages below:

NET: Registered protocol family 2=20
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)=20
TCP established hash table entries: 2048 (order: 2, 16384 bytes)=20
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)=20
TCP: Hash tables configured (established 2048 bind 2048)=20
TCP reno registered=20
PCI: enabling device 0000:00:02.1 (0140 -> 0143)=20
NetWinder Floating Point Emulator V0.97 (double precision)=20
JFFS2 version 2.2. (NAND) (C) 2001-2006 Red Hat, Inc.=20
io scheduler noop registered=20
io scheduler cfq registered (default)=20
Non-volatile memory driver v1.2=20
Serial: 8250/16550 driver $Revision: 1.90 $ 8 ports, IRQ sharing enabled

serial8250.0: ttyS0 at MMIO 0xc8000000 (irq =3D 15) is a XScale=20
serial8250.0: ttyS1 at MMIO 0x53000000 (irq =3D 21) is a 16550A=20
serial8250.0: ttyS2 at MMIO 0x53000008 (irq =3D 21) is a 16550A=20
loop: loaded (max 8 devices)=20
MTD Sharp chip driver <ds@lineo.com>=20
IXP4XX-Flash.0: Found 1 x16 devices at 0x0 in 16-bit bank=20
Amd/Fujitsu Extended Query Table at 0x0040=20
IXP4XX-Flash.0: CFI does not contain boot bank location. Assuming top.=20
number of CFI chips: 1=20
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.

Searching for RedBoot partition table in IXP4XX-Flash.0 at offset
0xff0000=20
4 RedBoot partitions found on MTD device IXP4XX-Flash.0=20
Creating 4 MTD partitions on "IXP4XX-Flash.0":=20
0xb0000000-0xb0060000 : "RedBoot"=20
mtd: partition "RedBoot" is out of reach -- disabled=20
0xb0060000-0xb0ff0000 : "filesystem"=20
mtd: partition "filesystem" is out of reach -- disabled=20
0xb0ff0000-0xb0fff000 : "FIS directory"=20
mtd: partition "FIS directory" is out of reach -- disabled=20
0xb0fff000-0xb1000000 : "RedBoot config"=20
mtd: partition "RedBoot config" is out of reach -- disabled=20
TCP cubic registered=20
NET: Registered protocol family 1=20
XScale DSP coprocessor detected.=20
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)=20
jffs2: Too few erase blocks (0)=20
No filesystem could mount root, tried: jffs2=20
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(31,1)=20


Staale Aakermann
