Received: from [203.162.5.30] (helo=tlnet.com.vn)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17B5ja-00023m-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 04:27:21 +0100
Message-ID: <001001c20348$03f34b40$030010ac@sunyard.com.vn>
Reply-To: "Pham Cong Thien" <thien@tlnet.com.vn>
From: "Pham Cong Thien" <thien@tlnet.com.vn>
To: <linux-mtd@lists.infradead.org>
Subject: Fw: Help me with mtd, pls.
Date: Fri, 24 May 2002 10:25:35 -0700
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_000D_01C2030D.576218A0"
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

This is a multi-part message in MIME format.

------=_NextPart_000_000D_01C2030D.576218A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

 Dear Sir/Madam,
 I'm making kernel 2.4.18 support MTD for 8MiB Disk On Chip Mellenium. The
 attachment is the message I got from commanding dmesg. Please help me, I
 can't see the devices /dev/nftla.
 Best regards,
 Pham Cong Thien
 

------=_NextPart_000_000D_01C2030D.576218A0
Content-Type: application/octet-stream;
	name="Nftl_dme.dat"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Nftl_dme.dat"

Linux version 2.4.18 (thien@server.vn.sunyard.com) (gcc version 2.96 =
20000731 (Red Hat Linux 7.1 2.96-98)) #1 SMP Thu May 23 10:15:12 GMT+7 =
2002=0A=
BIOS-provided physical RAM map:=0A=
 BIOS-e820: 0000000000000000 - 0000000000098800 (usable)=0A=
 BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)=0A=
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)=0A=
 BIOS-e820: 0000000000100000 - 0000000003d80000 (usable)=0A=
 BIOS-e820: 00000000ffff0000 - 0000000100000000 (reserved)=0A=
On node 0 totalpages: 15744=0A=
zone(0): 4096 pages.=0A=
zone(1): 11648 pages.=0A=
zone(2): 0 pages.=0A=
No local APIC present or hardware disabled=0A=
Kernel command line: ro root=3D/dev/hda6=0A=
Initializing CPU#0=0A=
Working around Cyrix MediaGX virtual DMA bugs.=0A=
Console: colour VGA+ 80x25=0A=
Calibrating delay loop... 53.24 BogoMIPS=0A=
Memory: 58840k/62976k available (1569k kernel code, 3720k reserved, 440k =
data, 248k init, 0k highmem)=0A=
Checking if this processor honours the WP bit even in supervisor mode... =
Ok.=0A=
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)=0A=
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)=0A=
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)=0A=
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)=0A=
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)=0A=
CPU: Before vendor init, caps: 00808131 01818131 00000000, vendor =3D 1=0A=
Working around Cyrix MediaGX virtual DMA bugs.=0A=
CPU: After vendor init, caps: 00808121 00818131 00000000 00000001=0A=
CPU:     After generic, caps: 00808121 00818131 00000000 00000001=0A=
CPU:             Common caps: 00808121 00818131 00000000 00000001=0A=
Checking 'hlt' instruction... OK.=0A=
POSIX conformance testing by UNIFIX=0A=
CPU: Before vendor init, caps: 00808131 01818131 00000000, vendor =3D 1=0A=
Working around Cyrix MediaGX virtual DMA bugs.=0A=
CPU: After vendor init, caps: 00808121 00818131 00000000 00000001=0A=
CPU:     After generic, caps: 00808121 00818131 00000000 00000001=0A=
CPU:             Common caps: 00808121 00818131 00000000 00000001=0A=
CPU0: Cyrix MediaGXtm MMXtm Enhanced stepping 04=0A=
SMP motherboard not detected.=0A=
Local APIC not detected. Using dummy APIC emulation.=0A=
Waiting on wait_init_idle (map =3D 0x0)=0A=
All processors have done init_idle=0A=
PCI: PCI BIOS revision 2.10 entry at 0xfb2d0, last bus=3D0=0A=
PCI: Using configuration type 1=0A=
PCI: Probing PCI hardware=0A=
PCI: Using IRQ router NatSemi [1078/0100] at 00:12.0=0A=
isapnp: Scanning for PnP cards...=0A=
isapnp: Card 'D-Link DE-220P PnP ISA Card'=0A=
isapnp: Card 'Quicknet Internet PhoneJACK'=0A=
isapnp: 2 Plug & Play cards detected total=0A=
Linux NET4.0 for Linux 2.4=0A=
Based upon Swansea University Computer Society NET3.039=0A=
Initializing RT netlink socket=0A=
Starting kswapd=0A=
pty: 256 Unix98 ptys configured=0A=
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ =
SERIAL_PCI ISAPNP enabled=0A=
ttyS00 at 0x03f8 (irq =3D 4) is a 16550A=0A=
ttyS01 at 0x02f8 (irq =3D 3) is a 16550A=0A=
block: 128 slots per queue, batch=3D32=0A=
Uniform Multi-Platform E-IDE driver Revision: 6.31=0A=
ide: Assuming 33MHz system bus speed for PIO modes; override with =
idebus=3Dxx=0A=
CS5530: IDE controller on PCI bus 00 dev 92=0A=
CS5530: chipset revision 0=0A=
CS5530: not 100% native mode: will probe irqs later=0A=
    ide0: BM-DMA at 0xf000-0xf007, BIOS settings: hda:DMA, hdb:pio=0A=
    ide1: BM-DMA at 0xf008-0xf00f, BIOS settings: hdc:pio, hdd:pio=0A=
hda: IBM-DTLA-305040, ATA DISK drive=0A=
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14=0A=
hda: 80418240 sectors (41174 MB) w/380KiB Cache, CHS=3D79780/16/63, =
UDMA(33)=0A=
Partition check:=0A=
 hda: hda1 hda2 hda3 < hda5 hda6 hda7 hda8 > hda4=0A=
FDC 0 is a post-1991 82077=0A=
8139too Fast Ethernet driver 0.9.24=0A=
PCI: Assigned IRQ 15 for device 00:0b.0=0A=
eth0: RealTek RTL8139 Fast Ethernet at 0xc4800000, 00:d0:c9:18:16:99, =
IRQ 15=0A=
eth0:  Identified 8139 chip type 'RTL-8139B'=0A=
Linux agpgart interface v0.99 (c) Jeff Hartmann=0A=
agpgart: Maximum main memory to use for agp memory: 25M=0A=
agpgart: no supported devices found.=0A=
[drm] Initialized tdfx 1.0.0 20010216 on minor 0=0A=
[drm] Initialized radeon 1.1.1 20010405 on minor 1=0A=
SCSI subsystem driver Revision: 1.00=0A=
request_module[scsi_hostadapter]: Root fs not mounted=0A=
es1371: version v0.30 time 10:16:59 May 23 2002=0A=
Possible DiskOnChip with unknown ChipID FF found at 0xc8000=0A=
Possible DiskOnChip with unknown ChipID FF found at 0xca000=0A=
Possible DiskOnChip with unknown ChipID FF found at 0xcc000=0A=
Possible DiskOnChip with unknown ChipID FF found at 0xce000=0A=
Possible DiskOnChip with unknown ChipID FF found at 0xd0000=0A=
Possible DiskOnChip with unknown ChipID FF found at 0xd2000=0A=
Possible DiskOnChip with unknown ChipID FF found at 0xd4000=0A=
Possible DiskOnChip with unknown ChipID FF found at 0xd6000=0A=
Possible DiskOnChip with unknown ChipID FF found at 0xd8000=0A=
Possible DiskOnChip with unknown ChipID FF found at 0xda000=0A=
DiskOnChip Millennium found at address 0xDC000=0A=
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba =
TC58V64AFT/DC)=0A=
1 flash chips found. Total DiskOnChip size: 8 MiB=0A=
Possible DiskOnChip with unknown ChipID FF found at 0xde000=0A=
Possible DiskOnChip with unknown ChipID D2 found at 0xe0000=0A=
DiskOnChip failed TOGGLE test, dropping.=0A=
Possible DiskOnChip with unknown ChipID 51 found at 0xe4000=0A=
Possible DiskOnChip with unknown ChipID 00 found at 0xe6000=0A=
Possible DiskOnChip with unknown ChipID BE found at 0xe8000=0A=
Possible DiskOnChip with unknown ChipID A4 found at 0xea000=0A=
Possible DiskOnChip with unknown ChipID 8B found at 0xec000=0A=
Possible DiskOnChip with unknown ChipID 44 found at 0xee000=0A=
NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $=0A=
 nftla:end_request: I/O error, dev 5d:00 (unknown), sector 0=0A=
end_request: I/O error, dev 5d:00 (unknown), sector 0=0A=
 unable to read partition table=0A=
Linux Kernel Card Services 3.1.22=0A=
  options:  [pci] [cardbus] [pm]=0A=
usb.c: registered new driver hub=0A=
uhci.c: USB Universal Host Controller Interface driver v1.1=0A=
Initializing USB Mass Storage driver...=0A=
usb.c: registered new driver usb-storage=0A=
USB Mass Storage support registered.=0A=
NET4: Linux TCP/IP 1.0 for NET4.0=0A=
IP Protocols: ICMP, UDP, TCP, IGMP=0A=
IP: routing cache hash table of 512 buckets, 4Kbytes=0A=
TCP: Hash tables configured (established 4096 bind 4096)=0A=
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.=0A=
ds: no socket drivers loaded!=0A=
VFS: Mounted root (ext2 filesystem) readonly.=0A=
Freeing unused kernel memory: 248k freed=0A=
Adding Swap: 512024k swap-space (priority -1)=0A=
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended=0A=
eth0: Setting half-duplex based on auto-negotiated partner ability 0000.=0A=
end_request: I/O error, dev 5d:00 (unknown), sector 0=0A=
end_request: I/O error, dev 5d:00 (unknown), sector 0=0A=

------=_NextPart_000_000D_01C2030D.576218A0--
