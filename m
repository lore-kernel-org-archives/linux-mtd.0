Received: from mail.rdsor.ro ([193.231.238.10])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D9UL0-0005Vc-AL
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 15:32:56 -0500
From: Balint Cristian <rezso@rdsor.ro>
To: linux-mtd@lists.infradead.org
Date: Thu, 10 Mar 2005 22:32:47 +0200
References: <4230692B.3020303@opticon.com>
In-Reply-To: <4230692B.3020303@opticon.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200503102232.47454.rezso@rdsor.ro>
Cc: 
Subject: Re: Can't load DOC driver, DOC address unknown?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 10 March 2005 17:35, Wolter Kamphuis wrote:


Hi !

	Use the new DoC driver under nand section, the old one what you use is onl=
y 8 bit mode ready
hence your problem ..

	In what mode is your DoC chip?=20
	8bit or 16 bit ?

> Hello,
>=20
> We're working on the Linux port for the E-ten P700. We've got a problem
> accessing the DiskOnChip (Millennium Plus 64Mb). The spec's we have
> (possibly outdated) say it should be mapped at address 0xA4000000 but
> the driver (doc2001plus) can't find it there.
>=20
> The driver does find a DOC on all addresses < 0x04000000 offset 0x1000
> but fails to find the flash chips. Doesn't look right.
>=20
> Is there a way to figure where the DOC is mapped without the use of JTAG
> (which we haven't). Maybe through a WindowsCE program?
>=20
> The P700 has a M-systems DOC+ MD-3331-D64-V3.
> We start the kernel using HaRET, below is the output. I've added some
> debug to the docprobe and doc2001plus drivers.
>=20
>=20
> E-ten bootloader starting:
> *******Beginning System Initialization*******
>           CPU ID     =3D A0 PXA255
>           SDCLK[1]   =3D MemClk
>           MemClk     =3D 99.53 MHz
>           Run Mode   =3D 2 * MemClk
>           Turbo Mode =3D 2 * Run Mode
> Mode:    TURBO
>=20
> MMU Enabled!
> ******************************************************
> ******************************************************
> ******************************************************
> ******************************************************
> ******************************************************
> OEMInitDebugSerial using UART1
>=20
> *****************************************************************
> *    Paladin, Version 2.30
> *    Built: 13:00:27  Jan 26 2005
> *
> *
> *    Copyright (C) 2003, E-TEN Information System Co., Ltd.
> *****************************************************************
> MSC1 Pre value =3D 7FF07FF0
> MSC1 Post value =3D 7FF172FC
> Tenerife ID =3D 1884D51
> DC_0=3D0x1......
> DC_1=3D0x43......
> DC_2=3D0x1......
> DC_4=3D0x4......
> DC_5=3D0x1......
> DC_8=3D0x868B8649......
> M1_0=3D0x1......
> M1_1=3D0x1B676CA0......
> M1_2=3D0x117700B0......
> M1_5=3D0x170211......
> CC_0=3D0x2......
> CC_2=3D0x200000......
> CC_5=3D0x0......
> SW_6=3D0xAABBCCDD......
> ulStride=3D0x1E0......
> (G1_BASE+GC_START_ADDR)=3D0x1B0......
> ulStride=3D0x1E0..0x140..0x25800..
> ulStride=3D0x1E0..0x140..0x9600..
> FP06R=3D0x80000000......
> FP07R=3D0x0......
> FP08R=3D0x3......
> FP08R aw=3D0x3......
> FP07R aw=3D0x0......
> FP0FR aw=3D0x10......
> =3D=3D=3D=3D> Y =3D 320
> =3D=3D=3D=3D> FB_BASE =3D B8300000
> flRegisterComponents
> Adapter Found....
> flRegisterDOCPLUS()....
> flRegisterINFTL()....
> bdkReadInit OK!
> read from 11 to 0x83FD0000  -> bdkReadBlock OK!
> read from 12 to 0x83FD8000  -> bdkReadBlock OK!
> read from 13 to 0x83FE0000  -> bdkReadBlock OK!
> read from 14 to 0x83FE8000  -> bdkReadBlock OK!
> read from 15 to 0x83FF0000  -> bdkReadBlock OK!
> Version String is AB2110.100.0014.WWE.premium.   .100.0000
> RCSR =3D 0x00000001
> dwNK =3D EA0003FE
> memset(0x80040000, 0, 0x01EC0000);
> memset(0x82000000, 0, 0x01F00000);
> Launch OS image...
> Launch=E0
>=20
>=20
>=20
> HaRET starting kernel:
> x<x.=D8x=FCx=FC=D8x<=FF=D8xx..x<=D8x=FC.x=FC.x<.=D8x.=D8x=FC.x..x<.=D8x.=
=D8x<xx.x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x..x=
=2E.x..x..x..x..x..x..x..x..x..x5
> CPU: XScale-PXA255 [69052d06] revision 6 (ARMv5TE)
> CPU0: D VIVT undefined 5 cache
> CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
> CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
> Machine: E-ten P700
> Memory policy: ECC disabled, Data cache writethrough
> Memory clock: 99.53MHz (*27)
> Run Mode clock: 199.07MHz (*2)
> Turbo Mode clock: 398.13MHz (*2.0, active)
> Built 1 zonelists
> Kernel command line: noinitrd console=3DttyS1,38400n8 root=3D/dev/nfs
> init=3D/linuxrc ip=3D192.168.131.201:192.168.131.102:::::
> nfsroot=3D192.168.131.102:/mnt/nfsrootd
> PID hash table entries: 256 (order: 8, 4096 bytes)
> Console: colour dummy device 80x30
> Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
> Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
> Memory: 56MB =3D 56MB total
> Memory: 54820KB available (1487K code, 330K data, 84K init)
> Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
> CPU: Testing write buffer coherency: ok
> NET: Registered protocol family 16
> NetWinder Floating Point Emulator V0.97 (double precision)
> devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
> devfs: boot_options: 0x1
> ttyS0 at MMIO 0x40100000 (irq =3D 15) is a FFUART
> ttyS1 at MMIO 0x40200000 (irq =3D 14) is a BTUART
> ttyS2 at MMIO 0x40700000 (irq =3D 13) is a STUART
> io scheduler noop registered
> io scheduler anticipatory registered
> io scheduler deadline registered
> io scheduler cfq registered
> loop: loaded (max 8 devices)
> pxa2xx_udc: version 14-Dec-2003
> usb0: Ethernet Gadget, version: Equinox 2004
> usb0: using pxa2xx_udc, OUT ep2out-bulk IN ep1in-bulk
> usb0: MAC 52:b1:32:84:10:2f
> mice: PS/2 mouse device common for all mice
> NET: Registered protocol family 2
> IP: routing cache hash table of 512 buckets, 4Kbytes
> TCP established hash table entries: 2048 (order: 2, 16384 bytes)
> TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
> TCP: Hash tables configured (established 2048 bind 2048)
> NET: Registered protocol family 1
> IP-Config: Guessing netmask 255.255.255.0
> IP-Config: Complete:
>        device=3Dusb0, addr=3D192.168.131.201, mask=3D255.255.255.0,
> gw=3D255.255.255.255,
>       host=3D192.168.131.201, domain=3D, nis-domain=3D(none),
>       bootserver=3D192.168.131.102, rootserver=3D192.168.131.102, rootpat=
h=3D
> Looking up port of RPC 100003/2 on 192.168.131.102
> udc: USB reset
> usb0: full speed config #1: 100 mA, Ethernet Gadget, using CDC Ethernet
> Subset
> Looking up port of RPC 100005/1 on 192.168.131.102
> VFS: Mounted root (nfs filesystem).
> Mounted devfs on /dev
> Freeing init memory: 84K
> BusyBox v1.00-rc3 (2005.02.25-09:50+0000) Built-in shell (ash)
> Enter 'help' for a list of built-in commands.
> / # modprobe -v doc2001plus
> insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/mtdcore.ko
> insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/mtdpart.ko
> insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docecc.ko
> insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/nand/nand_ids.ko
> insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/doc2001plus.=
ko
>=20
>=20
>=20
> Try address 0x1000:
> / # modprobe -v docprobe doc_config_location=3D0x1000
> insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docprobe.ko
> doc_config_location=3D0x1000
> Using configured DiskOnChip probe address 0x1000
> drivers/mtd/devices/docprobe.c:142 (doccheck) 0x40
> drivers/mtd/devices/docprobe.c:194 (doccheck) 0x40
> drivers/mtd/devices/docprobe.c:255 (DoC_Probe) 0x40
> DiskOnChip Millennium Plus found at address 0x1000
> _DoC_WaitReady called for out-of-line wait
> drivers/mtd/devices/doc2001plus.c:83 (_DoC_WaitReady) 65534 ReadDOC's
> _DoC_WaitReady timed out.
> _DoC_WaitReady called for out-of-line wait
> drivers/mtd/devices/doc2001plus.c:83 (_DoC_WaitReady) 65534 ReadDOC's
> _DoC_WaitReady timed out.
> drivers/mtd/devices/doc2001plus.c:316 (DoC_IdentChip) mfr =3D 0x40
> drivers/mtd/devices/doc2001plus.c:321 (DoC_IdentChip) id =3D 0x40
> No flash chips recognised.
> insmod: cannot insert
> `/lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docprobe.ko':
> Resource temporarily unavailable (-1): Resource temporarily unavailae
> modprobe: failed to load module docprobe
>=20
>=20
>=20
> Try address 0xA4000000:
> / # modprobe -v docprobe doc_config_location=3D0xA4000000
> insmod    /lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docprobe.ko
> doc_config_location=3D0xA4000000
> drivers/mtd/devices/docprobe.c:254 (DoC_Probe) physadr=3D0xa4000000
> docptr=3D0xc4000000
> drivers/mtd/devices/docprobe.c:144 (doccheck) physadr=3D0xa4000000
> ChipID=3D0x85
> No recognised DiskOnChip devices found
> insmod: cannot insert
> `/lib/modules/2.6.11-hh0/kernel/drivers/mtd/devices/docprobe.ko':
> Resource temporarily unavailable (-1): Resource temporarily unavailae
> modprobe: failed to load module docprobe
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
