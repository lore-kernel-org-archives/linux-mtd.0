Received: from motgate8.mot.com ([129.188.136.8])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0LsO-0006S0-Lz
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 11:09:32 -0400
Received: from az33exr01.mot.com (az33exr01.mot.com [10.64.251.231])
	by motgate8.mot.com (Motorola/Motgate8) with ESMTP id i7QFACGU024854
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Aug 2004 08:10:13 -0700 (MST)
Message-ID: <903E17B6FF22A24C96B4E28C2C0214D7025D7F84@sr-bng-exc01.ap.mot.com>
From: "Kodandaram, Harish" <Harish.Kodandaram@fci.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Thu, 26 Aug 2004 20:38:40 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Cc: 
Subject: failing to edit files in mtdblock0 after mounting a jffs image
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Hi all, 
> This problem has been reported before. 
> I have a 16MB 16 bit wide, 8-bit buswidth  Intel Strataflash chip
> (TE28F128J3C)  on a custom board with a Pentium 3 processor, running Linux
> kernel 2.4.20.
> I have a map driver for read/write access to the Strataflash.
>  I can successfully recognize the flash chip through MTD and partition it,
> and mount JFFS on it. I can create new files in the partition, read them,
> cat them, etc. However I am not able do the same with files which were
> present in the jffs image, the segmentation fault is occuring (I have
> attached the dump of error message below). Also once I unmount the
> partition and re-mount, I can create a new file and edit it, but the same
> problem persisits with existing files in partition.
> I have no problem mounting the jffs image with any number of files and
> creating new files in partition after mounting. But when I try to edit
> existing partition I am getting Segmentation Fault.
> 
> I have eneabled the verbose option to give you a clear picture of my
> problem
> 
> **************************************************************************
> *****************************
> Linux version 2.4.20_mvlcge31-cpci747 (root@localhost.localdomain) (gcc
> version 3.3.1 (MontaVista 3.3.1-3.0.10.0300532 2003-12-24)) #44 Thu Aug 26
> 19:37:42 IST 2004
> BIOS-provided physical RAM map:
>  BIOS-e820: 0000000000000000 - 000000000008c000 (usable)
>  BIOS-e820: 000000000008c000 - 00000000000a0000 (reserved)
>  BIOS-e820: 00000000000ce000 - 00000000000d0000 (reserved)
>  BIOS-e820: 00000000000d8000 - 0000000000100000 (reserved)
>  BIOS-e820: 0000000000100000 - 000000003f6fc000 (usable)
>  BIOS-e820: 000000003f6fc000 - 000000003f700000 (ACPI NVS)
>  BIOS-e820: 000000003f700000 - 0000000040000000 (reserved)
>  BIOS-e820: 00000000fec10000 - 00000000fec20000 (reserved)
>  BIOS-e820: 00000000ff800000 - 00000000ffc00000 (reserved)
>  BIOS-e820: 00000000fff00000 - 0000000100000000 (reserved)
> 118MB HIGHMEM available.
> 896MB LOWMEM available.
> On node 0 totalpages: 259836
> zone(0): 4096 pages.
> zone(1): 225280 pages.
> zone(2): 30460 pages.
> Kernel command line: BOOT_IMAGE=linux_mtd root=/dev/nfs rw ip=bootp 
> Initializing CPU#0
> Detected 1098.151 MHz processor.
> Console: colour VGA+ 80x25
> Calibrating delay loop... 2188.90 BogoMIPS
> Memory: 1023656k/1039344k available (1779k kernel code, 15224k reserved,
> 568k data, 124k init, 121840k highmem)
> Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
> Inode cache hash table entries: 65536 (order: 7, 524288 bytes)
> Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
> Buffer-cache hash table entries: 65536 (order: 6, 262144 bytes)
> Page-cache hash table entries: 262144 (order: 8, 1048576 bytes)
> CPU: L1 I cache: 32K, L1 D cache: 32K
> CPU: L2 cache: 1024K
> Intel machine check architecture supported.
> Intel machine check reporting enabled on CPU#0.
> CPU:     After generic, caps: a7e9f9bf 00000000 00000000 00000000
> CPU:             Common caps: a7e9f9bf 00000000 00000000 00000000
> CPU: Intel Mobile Genuine Intel(R) processor       1100MHz stepping 05
> Enabling fast FPU save and restore... done.
> Enabling unmasked SIMD FPU exception support... done.
> Checking 'hlt' instruction... OK.
> POSIX conformance testing by UNIFIX
> PCI: PCI BIOS revision 2.10 entry at 0xfd964, last bus=3
> PCI: Using configuration type 1
> PCI: Probing PCI hardware
> Transparent bridge - Intel Corp. 82801BA/CA/DB PCI Bridge (#2)
> PCI: Using IRQ router PIIX [8086/25a1] at 0000:00:1f.0
> PCI: Found IRQ 7 for device 0000:00:1f.1
> PCI: Failed to allocate resource 4(0-ffffffff) for 0000:02:0c.0
> Linux NET4.0 for Linux 2.4
> Based upon Swansea University Computer Society NET3.039
> Initializing RT netlink socket
> IA-32 Microcode Update Driver: v1.11 <tigran@veritas.com>
> LSP Revision 1
> Starting kswapd
> Disabling the Out Of Memory Killer
> allocated 32 pages and 32 bhs reserved for the highmem bounces
> Journalled Block Device driver loaded
> devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
> devfs: boot_options: 0x1
> Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
> NTFS driver v1.1.22 [Flags: R/O]
> JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
> Detected PS/2 Mouse Port.
> pty: 256 Unix98 ptys configured
> Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
> SERIAL_PCI ISAPNP enabled
> ttyS00 at 0x03f8 (irq = 4) is a 16550A
> ttyS01 at 0x02f8 (irq = 3) is a 16550A
> Real Time Clock Driver v1.10e
> Uniform Multi-Platform E-IDE driver Revision: 6.31
> ide: Assuming 33MHz system bus speed for PIO modes; override with
> idebus=xx
> PCI_IDE: unknown IDE controller on PCI bus 00 device f9, VID=8086,
> DID=25a2
> PCI: Device 0000:00:1f.1 not available because of resource collisions
> PCI: Found IRQ 7 for device 0000:00:1f.1
> PCI_IDE: BIOS setup was incomplete.
> PCI_IDE: chipset revision 2
> PCI_IDE: not 100% native mode: will probe irqs later
>     ide0: BM-DMA at 0x1810-0x1817, BIOS settings: hda:pio, hdb:pio
>     ide1: BM-DMA at 0x1818-0x181f, BIOS settings: hdc:DMA, hdd:pio
> hdc: IC35L040AVVN07-0, ATA DISK drive
> ide1 at 0x170-0x177,0x376 on irq 15
> blk: queue c03dac74, I/O limit 4095Mb (mask 0xffffffff)
> hdc: 80418240 sectors (41174 MB) w/1863KiB Cache, CHS=79780/16/63,
> UDMA(33)
> Partition check:
>  /dev/ide/host0/bus1/target0/lun0: [PTBL] [5005/255/63] p1 p2 p3 p4 < p5
> p6 p7 >
> Floppy drive(s): fd0 is 1.44M
> FDC 0 is a National Semiconductor PC87306
> loop: loaded (max 8 devices)
> Intel(R) PRO/1000 Network Driver - version 5.0.43
> Copyright (c) 1999-2003 Intel Corporation.
> PCI: Assigned IRQ 9 for device 0000:02:04.0
> PCI: Sharing IRQ 9 with 0000:02:04.1
> PCI: Sharing IRQ 9 with 0000:02:0c.0
> eth0: Intel(R) PRO/1000 Network Connection
> PCI: Assigned IRQ 9 for device 0000:02:04.1
> PCI: Sharing IRQ 9 with 0000:02:04.0
> PCI: Sharing IRQ 9 with 0000:02:0c.0
> eth1: Intel(R) PRO/1000 Network Connection
> Linux agpgart interface v0.99 (c) Jeff Hartmann
> agpgart: Maximum main memory to use for agp memory: 932M
> agpgart: Unsupported Intel chipset (device id: 3580), you might want to
> try agp_try_unsupported=1.
> agpgart: no supported devices found.
> Intel flash device on CPCI-747 1000000 at ff000000
> init_cpci747: iomapadr = f8844000 <5>cfi_cmdset_0001: Erase suspend on
> write enabled
> 0: offset=0x0,size=0x20000,blocks=128
> Using buffer write method
> 
> init_cpci747: Found Flash device flags = 5 Size = 1000000<5>Creating 4 MTD
> partitions on "28F128J3 UserFlash":
> 0x00000000-0x00100000 : "filesystem"
> mtd: Giving out device 0 to filesystem
> 0x00d00000-0x00e00000 : "Filesys image"
> mtd: Giving out device 1 to Filesys image
> 0x00e00000-0x00f00000 : "BIOS imageC"
> mtd: Giving out device 2 to BIOS imageC
> 0x00f00000-0x01000000 : "BIOS image"
> mtd: Giving out device 3 to BIOS image
> mice: PS/2 mouse device common for all mice
> NET4: Linux TCP/IP 1.0 for NET4.0
> IP Protocols: ICMP, UDP, TCP, IGMP
> IP: routing cache hash table of 8192 buckets, 64Kbytes
> TCP: Hash tables configured (established 262144 bind 65536)
> Sending BOOTP requests .<6>e1000: eth1 NIC Link is Up 1000 Mbps Full
> Duplex
> . OK
> IP-Config: Got BOOTP answer from 10.208.33.67, my address is 10.208.33.69
> IP-Config: Complete:
>       device=eth1, addr=10.208.33.69, mask=255.255.255.0,
> gw=255.255.255.255,
>      host=10.208.33.69, domain=, nis-domain=(none),
>      bootserver=10.208.33.67, rootserver=10.208.33.67,
> rootpath=/opt/montavista/cge/devkit/x86/pentium3/target
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> isapnp: Scanning for PnP cards...
> isapnp: No Plug & Play device found
> Done starting sysfs
> Looking up port of RPC 100003/2 on 10.208.33.67
> Looking up port of RPC 100005/1 on 10.208.33.67
> e1000: eth1 NIC Link is Down
> e1000: eth1 NIC Link is Up 1000 Mbps Full Duplex
> VFS: Mounted root (nfs filesystem).
> Mounted devfs on /dev
> Freeing unused kernel memory: 124k freed
> **************************************************************************
> ************************************************
> 
> root@10.208.33.67# mount -t jffs /dev/mtd/0 /mnt/jffs
> ----------------------------------------------------
> 
> Jun  1 04:41:38 10 kernel: sh_safe_read(f7e5b484, 00023c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00024c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00025c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00026c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00027c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00028c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00029c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0002ac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0002bc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0002cc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0002dc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0002ec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0002fc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00030c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00031c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00032c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00033c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00034c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00035c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00036c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00037c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00038c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00039c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0003ac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0003bc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0003cc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0003dc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0003ec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0003fc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00040c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00041c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00042c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00043c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00044c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00045c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00046c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00047c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00048c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00049c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0004ac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0004bc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0004cc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0004dc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0004ec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0004fc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00050c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00051c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00052c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00053c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00054c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00055c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00056c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00057c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00058c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00059c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0005ac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0005bc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0005cc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0005dc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0005ec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0005fc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00060c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00061c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00062c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00063c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00064c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00065c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00066c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00067c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00068c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00069c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0006ac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0006bc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0006cc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0006dc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0006ec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0006fc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00070c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00071c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00072c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00073c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00074c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00075c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00076c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00077c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00078c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00079c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0007ac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0007bc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0007cc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0007dc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0007ec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0007fc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00080c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00081c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00082c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00083c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00084c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00085c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00086c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00087c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00088c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00089c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0008ac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0008bc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0008cc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0008dc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0008ec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0008fc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00090c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00091c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00092c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00093c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00094c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00095c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00096c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00097c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00098c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 00099c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0009ac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0009bc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0009cc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0009dc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0009ec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 0009fc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000a0c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000a1c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000a2c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000a3c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000a4c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000a5c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000a6c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000a7c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000a8c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000a9c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000aac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000abc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000acc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000adc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000aec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000afc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000b0c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000b1c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000b2c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000b3c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000b4c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000b5c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000b6c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000b7c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000b8c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000b9c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000bac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000bbc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000bcc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000bdc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000bec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000bfc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000c0c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000c1c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000c2c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000c3c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000c4c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000c5c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000c6c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000c7c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000c8c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000c9c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000cac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000cbc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000ccc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000cdc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000cec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000cfc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000d0c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000d1c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000d2c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000d3c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000d4c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000d5c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000d6c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000d7c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000d8c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000d9c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000dac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000dbc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000dcc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000ddc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000dec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000dfc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000e0c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000e1c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000e2c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000e3c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000e4c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000e5c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000e6c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000e7c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000e8c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000e9c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000eac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000ebc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000ecc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000edc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000eec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000efc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000f0c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000f1c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000f2c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000f3c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000f4c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000f5c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000f6c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000f7c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000f8c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000f9c30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000fac30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000fbc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000fcc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000fdc30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000fec30, f771b000,
> 00001000)
> Jun  1 04:41:38 10 kernel: flash_safe_read(f7e5b484, 000ffc30, f771b000,
> 000003d0)
> Jun  1 04:41:38 10 kernel: jffs_scan_flash():0xffffffff ended at pos
> 0x100000.
> Jun  1 04:41:38 10 kernel: Free space accepted: Starting 0x5c30 for
> 0xfa3d0 bytes
> Jun  1 04:41:38 10 kernel: was hole = 0 end_offset = 0
> Jun  1 04:41:38 10 kernel: now = fa3d0 end_offset = 100000
> Jun  1 04:41:38 10 kernel: jffs_build_end()
> Jun  1 04:41:38 10 kernel: struct jffs_fmcontrol: 0xf75c0d64
> Jun  1 04:41:38 10 kernel: {
> Jun  1 04:41:38 10 kernel:         1048576, /* flash_size  */
> Jun  1 04:41:38 10 kernel:         23600, /* used_size  */
> Jun  1 04:41:38 10 kernel:         0, /* dirty_size  */
> Jun  1 04:41:38 10 kernel:         1024976, /* free_size  */
> Jun  1 04:41:38 10 kernel:         131072, /* sector_size  */
> Jun  1 04:41:38 10 kernel:         524288, /* min_free_size  */
> Jun  1 04:41:38 10 kernel:         65536, /* max_chunk_size  */
> Jun  1 04:41:38 10 kernel:         0xf7e5b484, /* mtd  */
> Jun  1 04:41:38 10 kernel:         0xf71b3224, /* head  */
> (head->offset = 0x00000000)
> Jun  1 04:41:38 10 kernel:         0xf71b3278, /* tail  */
> (tail->offset + tail->size = 0x00005c30)
> Jun  1 04:41:38 10 kernel:         0x00000000, /* head_extra  */
> Jun  1 04:41:38 10 kernel:         0x00000000, /* tail_extra  */
> Jun  1 04:41:38 10 kernel: }
> Jun  1 04:41:38 10 kernel: jffs_scan_flash(): Leaving...
> Jun  1 04:41:38 10 kernel: jffs_find_file(): ino: 1
> Jun  1 04:41:38 10 kernel: jffs_find_file(): Found file with ino 1. (name:
> "")
> Jun  1 04:41:38 10 kernel: jffs_possibly_delete_file(): ino: 1
> Jun  1 04:41:38 10 kernel: jffs_possibly_delete_file(): ino: 2
> Jun  1 04:41:38 10 kernel: jffs_possibly_delete_file(): ino: 3
> Jun  1 04:41:38 10 kernel: jffs_possibly_delete_file(): ino: 4
> Jun  1 04:41:38 10 kernel: jffs_remove_redundant_nodes(): ino: 1, name:
> "", newest_type: 1
> Jun  1 04:41:38 10 kernel: jffs_remove_redundant_nodes(): ino: 2, name:
> "config", newest_type: 7
> Jun  1 04:41:38 10 kernel: jffs_remove_redundant_nodes(): ino: 3, name:
> "temp", newest_type: 7
> Jun  1 04:41:38 10 kernel: jffs_remove_redundant_nodes(): ino: 4, name:
> "temp1", newest_type: 7
> Jun  1 04:41:38 10 kernel: jffs_insert_file_into_tree(): name: ""
> Jun  1 04:41:38 10 kernel: jffs_find_file(): ino: 0
> Jun  1 04:41:38 10 kernel: jffs_find_file(): Didn't find file with ino 0.
> Jun  1 04:41:38 10 kernel: jffs_insert_file_into_tree(): name: "config"
> Jun  1 04:41:38 10 kernel: jffs_find_file(): ino: 1
> Jun  1 04:41:38 10 kernel: jffs_find_file(): Found file with ino 1. (name:
> "")
> Jun  1 04:41:38 10 kernel: jffs_insert_file_into_tree(): name: "temp"
> Jun  1 04:41:38 10 kernel: jffs_find_file(): ino: 1
> Jun  1 04:41:38 10 kernel: jffs_find_file(): Found file with ino 1. (name:
> "")
> Jun  1 04:41:38 10 kernel: jffs_insert_file_into_tree(): name: "temp1"
> Jun  1 04:41:38 10 kernel: jffs_find_file(): ino: 1
> Jun  1 04:41:38 10 kernel: jffs_find_file(): Found file with ino 1. (name:
> "")
> Jun  1 04:41:38 10 kernel: jffs_build_file(): ino: 1, name: ""
> Jun  1 04:41:38 10 kernel: jffs_update_file(): ino: 1, version: 1
> Jun  1 04:41:38 10 kernel: jffs_build_file(): ino: 2, name: "config"
> Jun  1 04:41:38 10 kernel: jffs_update_file(): ino: 2, version: 1
> Jun  1 04:41:38 10 kernel: jffs_delete_data(): offset = 0, remove_size = 0
> Jun  1 04:41:38 10 kernel: jffs_insert_data(): node->data_offset = 0,
> node->data_size = 23306, f->size = 0
> Jun  1 04:41:38 10 kernel: jffs_insert_data(): f->size = 23306
> Jun  1 04:41:38 10 kernel: jffs_build_file(): ino: 3, name: "temp"
> Jun  1 04:41:38 10 kernel: jffs_update_file(): ino: 3, version: 1
> Jun  1 04:41:38 10 kernel: jffs_delete_data(): offset = 0, remove_size = 0
> Jun  1 04:41:38 10 kernel: jffs_insert_data(): node->data_offset = 0,
> node->data_size = 10, f->size = 0
> Jun  1 04:41:38 10 kernel: jffs_insert_data(): f->size = 10
> Jun  1 04:41:38 10 kernel: jffs_build_file(): ino: 4, name: "temp1"
> Jun  1 04:41:38 10 kernel: jffs_update_file(): ino: 4, version: 1
> Jun  1 04:41:38 10 kernel: jffs_delete_data(): offset = 0, remove_size = 0
> Jun  1 04:41:38 10 kernel: jffs_insert_data(): node->data_offset = 0,
> node->data_size = 19, f->size = 0
> Jun  1 04:41:38 10 kernel: jffs_insert_data(): f->size = 19
> Jun  1 04:41:38 10 kernel: JFFS: Dumping the file system's hash table...
> Jun  1 04:41:38 10 kernel: *** c->hash[1]: "" (ino: 1, pino: 0)
> Jun  1 04:41:38 10 kernel: *** c->hash[2]: "config" (ino: 2, pino: 1)
> Jun  1 04:41:38 10 kernel: *** c->hash[3]: "temp" (ino: 3, pino: 1)
> Jun  1 04:41:38 10 kernel: *** c->hash[4]: "temp1" (ino: 4, pino: 1)
> Jun  1 04:41:38 10 kernel: / (ino: 1, highest_version: 1, size: 0)
> Jun  1 04:41:38 10 kernel:   temp1 (ino: 4, highest_version: 1, size: 19)
> Jun  1 04:41:38 10 kernel:   temp (ino: 3, highest_version: 1, size: 10)
> Jun  1 04:41:38 10 kernel:   config (ino: 2, highest_version: 1, size:
> 23306)
> Jun  1 04:41:38 10 kernel: jffs_read_inode(): inode->i_ino == 1
> Jun  1 04:41:38 10 kernel: read_inode(): down biglock
> Jun  1 04:41:38 10 kernel: jffs_find_file(): ino: 1
> Jun  1 04:41:38 10 kernel: jffs_find_file(): Found file with ino 1. (name:
> "")
> Jun  1 04:41:38 10 kernel: read_inode(): up biglock
> Jun  1 04:41:38 10 kernel: JFFS: GC thread pid=553.
> Jun  1 04:41:38 10 kernel: JFFS: Successfully mounted device 1f:00.
> Jun  1 04:41:38 10 kernel: jffs_garbage_collect_thread(): Starting
> infinite loop.
> Jun  1 04:41:38 10 kernel: thread_should_wake(): free=1024976, dirty=0,
> blocksize=131072.
> Jun  1 04:41:38 10 kernel: thread_should_wake(): Not waking. Insufficient
> dirty space
> 
> **************************************************************************
> *
> 
> root@10.208.33.67#  ls
> -------------------------------------------
> 
> Jun  1 04:42:00 10 kernel: readdir(): down biglock
> Jun  1 04:42:00 10 kernel: jffs_readdir(): inode: 0xf71b8a80, filp:
> 0xf7680de4
> Jun  1 04:42:00 10 kernel: jffs_readdir(): "." 1
> Jun  1 04:42:00 10 kernel: jffs_readdir(): ".." 1
> Jun  1 04:42:00 10 kernel: jffs_readdir(): "temp1" ino: 4
> Jun  1 04:42:00 10 kernel: jffs_readdir(): "temp" ino: 3
> Jun  1 04:42:00 10 kernel: jffs_readdir(): "config" ino: 2
> Jun  1 04:42:00 10 kernel: readdir(): up biglock
> Jun  1 04:42:00 10 kernel: readdir(): down biglock
> Jun  1 04:42:00 10 kernel: jffs_readdir(): inode: 0xf71b8a80, filp:
> 0xf7680de4
> Jun  1 04:42:00 10 kernel: readdir(): up biglock
> config temp temp1
> 
> **************************************************************************
> **********1
> 
> root@10.208.33.67#  vi config
> ------------------------------------------------
> Jun  1 04:42:09 10 kernel: jffs_lookup(): dir: 0xf71b8a80, name: "config"
> Jun  1 04:42:09 10 kernel: lookup(): down biglock
> Jun  1 04:42:09 10 kernel: jffs_find_child()
> Jun  1 04:42:09 10 kernel: jffs_find_child(): Found "config".
> Jun  1 04:42:09 10 kernel: lookup(): up biglock
> Jun  1 04:42:09 10 kernel: jffs_read_inode(): inode->i_ino == 2
> Jun  1 04:42:09 10 kernel: read_inode(): down biglock
> Jun  1 04:42:09 10 kernel: jffs_find_file(): ino: 2
> Jun  1 04:42:09 10 kernel: jffs_find_file(): Found file with ino 2. (name:
> "config")
> Jun  1 04:42:09 10 kernel: read_inode(): up biglock
> Jun  1 04:42:09 10 kernel: lookup(): down biglock
> Jun  1 04:42:09 10 kernel: lookup(): up biglock
> Jun  1 04:42:09 10 kernel: jffs_lookup(): dir: 0xf71b8a80, name:
> ".config.swp"
> Jun  1 04:42:09 10 kernel: lookup(): down biglock
> Jun  1 04:42:09 10 kernel: jffs_find_child()
> Jun  1 04:42:09 10 kernel: jffs_find_child(): Didn't find the file
> ".config.swp".
> Jun  1 04:42:09 10 kernel: jffs_lookup(): Couldn't find the file. f =
> 0x00000000, name = ".config.swp", d = 0xf75c0cdc, d->ino = 1
> Jun  1 04:42:09 10 kernel: lookup(): up biglock
> Jun  1 04:42:09 10 kernel: jffs_create(): dir: 0xf71b8a80, name:
> ".config.swp"
> Jun  1 04:42:09 10 kernel: create(): down biglock
> Jun  1 04:42:09 10 kernel: jffs_write_node(): filename = ".config.swp",
> ino = 5, total_size = 72
> Jun  1 04:42:09 10 kernel: jffs_fmalloc(): fmc = 0xf75c0d64, size = 72,
> node = 0xf71b4224
> Jun  1 04:42:09 10 kernel: jffs_fmalloc(): free_chunk_size1 = 1024976,
> free_chunk_size2 = 0
> Jun  1 04:42:09 10 kernel: struct jffs_fmcontrol: 0xf75c0d64
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:         1048576, /* flash_size  */
> Jun  1 04:42:09 10 kernel:         23672, /* used_size  */
> Jun  1 04:42:09 10 kernel:         0, /* dirty_size  */
> Jun  1 04:42:09 10 kernel:         1024904, /* free_size  */
> Jun  1 04:42:09 10 kernel:         131072, /* sector_size  */
> Jun  1 04:42:09 10 kernel:         524288, /* min_free_size  */
> Jun  1 04:42:09 10 kernel:         65536, /* max_chunk_size  */
> Jun  1 04:42:09 10 kernel:         0xf7e5b484, /* mtd  */
> Jun  1 04:42:09 10 kernel:         0xf71b3224, /* head  */
> (head->offset = 0x00000000)
> Jun  1 04:42:09 10 kernel:         0xf71b3294, /* tail  */
> (tail->offset + tail->size = 0x00005c78)
> Jun  1 04:42:09 10 kernel:         0x00000000, /* head_extra  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* tail_extra  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: struct jffs_fm: 0xf71b3294
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:        0x00005c30, /* offset  */
> Jun  1 04:42:09 10 kernel:        72, /* size  */
> Jun  1 04:42:09 10 kernel:        0xf71b3278, /* prev  */
> Jun  1 04:42:09 10 kernel:        0x00000000, /* next  */
> Jun  1 04:42:09 10 kernel:        0xf71b2334, /* nodes  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: , result: 0x00000000
> Jun  1 04:42:09 10 kernel: , result: 0x0000042c
> Jun  1 04:42:09 10 kernel: , result: 0x0000058c
> Jun  1 04:42:09 10 kernel: jffs_write_node(): About to write this raw
> inode to the flash at pos 0x5c30:
> Jun  1 04:42:09 10 kernel: jffs_raw_inode: inode number: 5
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:         0x34383931, /* magic  */
> Jun  1 04:42:09 10 kernel:         0x00000005, /* ino  */
> Jun  1 04:42:09 10 kernel:         0x00000001, /* pino  */
> Jun  1 04:42:09 10 kernel:         0x00000001, /* version  */
> Jun  1 04:42:09 10 kernel:         0x00008180, /* mode  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* uid  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* gid  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* atime  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* mtime  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* ctime  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* offset  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* dsize  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* rsize  */
> Jun  1 04:42:09 10 kernel:         0x0b,       /* nsize  */
> Jun  1 04:42:09 10 kernel:         0x01,       /* nlink  */
> Jun  1 04:42:09 10 kernel:         0x00,       /* spare  */
> Jun  1 04:42:09 10 kernel:         0,          /* rename  */
> Jun  1 04:42:09 10 kernel:         0,          /* deleted  */
> Jun  1 04:42:09 10 kernel:         0xff,       /* accurate  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* dchksum  */
> Jun  1 04:42:09 10 kernel:         0x042c,     /* nchksum  */
> Jun  1 04:42:09 10 kernel:         0x058c,     /* chksum  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: flash_safe_writev(f7e5b484, 00005c30, f71abe68)
> Jun  1 04:42:09 10 kernel: jffs_write_node(): Leaving...
> Jun  1 04:42:09 10 kernel: jffs_insert_node(): ino = 5, version = 1, name
> = ".config.swp", deleted = 0
> Jun  1 04:42:09 10 kernel: jffs_find_file(): ino: 5
> Jun  1 04:42:09 10 kernel: jffs_find_file(): Didn't find file with ino 5.
> Jun  1 04:42:09 10 kernel: jffs_insert_file_into_hash(): f->ino: 5
> Jun  1 04:42:09 10 kernel: jffs_insert_node(): Updated the name of the
> file to ".config.swp".
> Jun  1 04:42:09 10 kernel: jffs_insert_node():
> ---------------------------------------------------------------------- 1
> Jun  1 04:42:09 10 kernel: jffs_insert_file_into_tree(): name:
> ".config.swp"
> Jun  1 04:42:09 10 kernel: jffs_find_file(): ino: 1
> Jun  1 04:42:09 10 kernel: jffs_find_file(): Found file with ino 1. (name:
> "")
> Jun  1 04:42:09 10 kernel: jffs_remove_redundant_nodes(): ino: 5, name:
> ".config.swp", newest_type: 3
> Jun  1 04:42:09 10 kernel: thread_should_wake(): free=1024904, dirty=0,
> blocksize=131072.
> Jun  1 04:42:09 10 kernel: thread_should_wake(): Not waking. Insufficient
> dirty space
> Jun  1 04:42:09 10 kernel: jffs_insert_node():
> ---------------------------------------------------------------------- 2
> Jun  1 04:42:09 10 kernel: jffs_find_file(): ino: 5
> Jun  1 04:42:09 10 kernel: jffs_find_file(): Found file with ino 5. (name:
> ".config.swp")
> Jun  1 04:42:09 10 kernel: create(): up biglock
> Jun  1 04:42:09 10 kernel: jffs_lookup(): dir: 0xf71b8a80, name:
> ".config.swpx"
> Jun  1 04:42:09 10 kernel: lookup(): down biglock
> Jun  1 04:42:09 10 kernel: jffs_find_child()
> Jun  1 04:42:09 10 kernel: jffs_find_child(): Didn't find the file
> ".config.swpx".
> Jun  1 04:42:09 10 kernel: jffs_lookup(): Couldn't find the file. f =
> 0x00000000, name = ".config.swpx", d = 0xf75c0cdc, d->ino = 1
> Jun  1 04:42:09 10 kernel: lookup(): up biglock
> Jun  1 04:42:09 10 kernel: jffs_create(): dir: 0xf71b8a80, name:
> ".config.swpx"
> Jun  1 04:42:09 10 kernel: create(): down biglock
> Jun  1 04:42:09 10 kernel: jffs_write_node(): filename = ".config.swpx",
> ino = 6, total_size = 72
> Jun  1 04:42:09 10 kernel: jffs_fmalloc(): fmc = 0xf75c0d64, size = 72,
> node = 0xf71b425c
> Jun  1 04:42:09 10 kernel: jffs_fmalloc(): free_chunk_size1 = 1024904,
> free_chunk_size2 = 0
> Jun  1 04:42:09 10 kernel: struct jffs_fmcontrol: 0xf75c0d64
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:         1048576, /* flash_size  */
> Jun  1 04:42:09 10 kernel:         23744, /* used_size  */
> Jun  1 04:42:09 10 kernel:         0, /* dirty_size  */
> Jun  1 04:42:09 10 kernel:         1024832, /* free_size  */
> Jun  1 04:42:09 10 kernel:         131072, /* sector_size  */
> Jun  1 04:42:09 10 kernel:         524288, /* min_free_size  */
> Jun  1 04:42:09 10 kernel:         65536, /* max_chunk_size  */
> Jun  1 04:42:09 10 kernel:         0xf7e5b484, /* mtd  */
> Jun  1 04:42:09 10 kernel:         0xf71b3224, /* head  */
> (head->offset = 0x00000000)
> Jun  1 04:42:09 10 kernel:         0xf71b32b0, /* tail  */
> (tail->offset + tail->size = 0x00005cc0)
> Jun  1 04:42:09 10 kernel:         0x00000000, /* head_extra  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* tail_extra  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: struct jffs_fm: 0xf71b32b0
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:        0x00005c78, /* offset  */
> Jun  1 04:42:09 10 kernel:        72, /* size  */
> Jun  1 04:42:09 10 kernel:        0xf71b3294, /* prev  */
> Jun  1 04:42:09 10 kernel:        0x00000000, /* next  */
> Jun  1 04:42:09 10 kernel:        0xf71b2384, /* nodes  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: , result: 0x00000000
> Jun  1 04:42:09 10 kernel: , result: 0x000004a4
> Jun  1 04:42:09 10 kernel: , result: 0x00000606
> Jun  1 04:42:09 10 kernel: jffs_write_node(): About to write this raw
> inode to the flash at pos 0x5c78:
> Jun  1 04:42:09 10 kernel: jffs_raw_inode: inode number: 6
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:         0x34383931, /* magic  */
> Jun  1 04:42:09 10 kernel:         0x00000006, /* ino  */
> Jun  1 04:42:09 10 kernel:         0x00000001, /* pino  */
> Jun  1 04:42:09 10 kernel:         0x00000001, /* version  */
> Jun  1 04:42:09 10 kernel:         0x00008180, /* mode  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* uid  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* gid  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* atime  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* mtime  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* ctime  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* offset  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* dsize  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* rsize  */
> Jun  1 04:42:09 10 kernel:         0x0c,       /* nsize  */
> Jun  1 04:42:09 10 kernel:         0x01,       /* nlink  */
> Jun  1 04:42:09 10 kernel:         0x00,       /* spare  */
> Jun  1 04:42:09 10 kernel:         0,          /* rename  */
> Jun  1 04:42:09 10 kernel:         0,          /* deleted  */
> Jun  1 04:42:09 10 kernel:         0xff,       /* accurate  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* dchksum  */
> Jun  1 04:42:09 10 kernel:         0x04a4,     /* nchksum  */
> Jun  1 04:42:09 10 kernel:         0x0606,     /* chksum  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: flash_safe_writev(f7e5b484, 00005c78, f71abe68)
> Jun  1 04:42:09 10 kernel: jffs_write_node(): Leaving...
> Jun  1 04:42:09 10 kernel: jffs_insert_node(): ino = 6, version = 1, name
> = ".config.swpx", deleted = 0
> Jun  1 04:42:09 10 kernel: jffs_find_file(): ino: 6
> Jun  1 04:42:09 10 kernel: jffs_find_file(): Didn't find file with ino 6.
> Jun  1 04:42:09 10 kernel: jffs_insert_file_into_hash(): f->ino: 6
> Jun  1 04:42:09 10 kernel: jffs_insert_node(): Updated the name of the
> file to ".config.swpx".
> Jun  1 04:42:09 10 kernel: jffs_insert_node():
> ---------------------------------------------------------------------- 1
> Jun  1 04:42:09 10 kernel: jffs_insert_file_into_tree(): name:
> ".config.swpx"
> Jun  1 04:42:09 10 kernel: jffs_find_file(): ino: 1
> Jun  1 04:42:09 10 kernel: jffs_find_file(): Found file with ino 1. (name:
> "")
> Jun  1 04:42:09 10 kernel: jffs_remove_redundant_nodes(): ino: 6, name:
> ".config.swpx", newest_type: 3
> Jun  1 04:42:09 10 kernel: thread_should_wake(): free=1024832, dirty=0,
> blocksize=131072.
> Jun  1 04:42:09 10 kernel: thread_should_wake(): Not waking. Insufficient
> dirty space
> Jun  1 04:42:09 10 kernel: jffs_insert_node():
> ---------------------------------------------------------------------- 2
> Jun  1 04:42:09 10 kernel: jffs_find_file(): ino: 6
> Jun  1 04:42:09 10 kernel: jffs_find_file(): Found file with ino 6. (name:
> ".config.swpx")
> Jun  1 04:42:09 10 kernel: create(): up biglock
> Jun  1 04:42:09 10 kernel: ***jffs_unlink()
> Jun  1 04:42:09 10 kernel: unlink(): down biglock
> Jun  1 04:42:09 10 kernel: ***jffs_remove(): file = ".config.swpx", ino =
> 6
> Jun  1 04:42:09 10 kernel: jffs_find_child()
> Jun  1 04:42:09 10 kernel: jffs_find_child(): Found ".config.swpx".
> Jun  1 04:42:09 10 kernel: jffs_write_node(): filename = "", ino = 6,
> total_size = 60
> Jun  1 04:42:09 10 kernel: jffs_fmalloc(): fmc = 0xf75c0d64, size = 60,
> node = 0xf71b4294
> Jun  1 04:42:09 10 kernel: jffs_fmalloc(): free_chunk_size1 = 1024832,
> free_chunk_size2 = 0
> Jun  1 04:42:09 10 kernel: struct jffs_fmcontrol: 0xf75c0d64
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:         1048576, /* flash_size  */
> Jun  1 04:42:09 10 kernel:         23804, /* used_size  */
> Jun  1 04:42:09 10 kernel:         0, /* dirty_size  */
> Jun  1 04:42:09 10 kernel:         1024772, /* free_size  */
> Jun  1 04:42:09 10 kernel:         131072, /* sector_size  */
> Jun  1 04:42:09 10 kernel:         524288, /* min_free_size  */
> Jun  1 04:42:09 10 kernel:         65536, /* max_chunk_size  */
> Jun  1 04:42:09 10 kernel:         0xf7e5b484, /* mtd  */
> Jun  1 04:42:09 10 kernel:         0xf71b3224, /* head  */
> (head->offset = 0x00000000)
> Jun  1 04:42:09 10 kernel:         0xf71b32cc, /* tail  */
> (tail->offset + tail->size = 0x00005cfc)
> Jun  1 04:42:09 10 kernel:         0x00000000, /* head_extra  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* tail_extra  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: struct jffs_fm: 0xf71b32cc
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:        0x00005cc0, /* offset  */
> Jun  1 04:42:09 10 kernel:        60, /* size  */
> Jun  1 04:42:09 10 kernel:        0xf71b32b0, /* prev  */
> Jun  1 04:42:09 10 kernel:        0x00000000, /* next  */
> Jun  1 04:42:09 10 kernel:        0xf71b23d4, /* nodes  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: jffs_write_node(): setting version of
> .config.swpx to 2
> Jun  1 04:42:09 10 kernel: , result: 0x00000000
> Jun  1 04:42:09 10 kernel: , result: 0x00000000
> Jun  1 04:42:09 10 kernel: , result: 0x000005d3
> Jun  1 04:42:09 10 kernel: jffs_write_node(): About to write this raw
> inode to the flash at pos 0x5cc0:
> Jun  1 04:42:09 10 kernel: jffs_raw_inode: inode number: 6
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:         0x34383931, /* magic  */
> Jun  1 04:42:09 10 kernel:         0x00000006, /* ino  */
> Jun  1 04:42:09 10 kernel:         0x00000001, /* pino  */
> Jun  1 04:42:09 10 kernel:         0x00000002, /* version  */
> Jun  1 04:42:09 10 kernel:         0x00008180, /* mode  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* uid  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* gid  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* atime  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* mtime  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* ctime  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* offset  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* dsize  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* rsize  */
> Jun  1 04:42:09 10 kernel:         0x00,       /* nsize  */
> Jun  1 04:42:09 10 kernel:         0x01,       /* nlink  */
> Jun  1 04:42:09 10 kernel:         0x00,       /* spare  */
> Jun  1 04:42:09 10 kernel:         0,          /* rename  */
> Jun  1 04:42:09 10 kernel:         1,          /* deleted  */
> Jun  1 04:42:09 10 kernel:         0xff,       /* accurate  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* dchksum  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* nchksum  */
> Jun  1 04:42:09 10 kernel:         0x05d3,     /* chksum  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: flash_safe_writev(f7e5b484, 00005cc0, f71abe98)
> Jun  1 04:42:09 10 kernel: jffs_write_node(): Leaving...
> Jun  1 04:42:09 10 kernel: jffs_insert_node(): ino = 6, version = 2, name
> = "", deleted = 1
> Jun  1 04:42:09 10 kernel: jffs_insert_node():
> ---------------------------------------------------------------------- 1
> Jun  1 04:42:09 10 kernel: jffs_remove_redundant_nodes(): ino: 6, name:
> ".config.swpx", newest_type: 1
> Jun  1 04:42:09 10 kernel: thread_should_wake(): free=1024772, dirty=0,
> blocksize=131072.
> Jun  1 04:42:09 10 kernel: thread_should_wake(): Not waking. Insufficient
> dirty space
> Jun  1 04:42:09 10 kernel: jffs_insert_node():
> ---------------------------------------------------------------------- 2
> Jun  1 04:42:09 10 kernel: jffs_delete_inode(): inode->i_ino == 6
> Jun  1 04:42:09 10 kernel: jffs_find_file(): ino: 6
> Jun  1 04:42:09 10 kernel: jffs_find_file(): Found file with ino 6. (name:
> ".config.swpx")
> Jun  1 04:42:09 10 kernel: jffs_possibly_delete_file(): ino: 6
> Jun  1 04:42:09 10 kernel: jffs_fmfree(): node->ino = 6, node->version = 1
> Jun  1 04:42:09 10 kernel: jffs_fmfree(): node->ino = 6, node->version = 2
> Jun  1 04:42:09 10 kernel: jffs_unlink_file_from_tree(): ino: 6, pino: 1,
> name: ".config.swpx"
> Jun  1 04:42:09 10 kernel: f->parent=f75c0cdc
> Jun  1 04:42:09 10 kernel: jffs_unlink_file_from_hash(): f: 0xf71b6724,
> ino 6
> Jun  1 04:42:09 10 kernel: jffs_free_node_list(): f #6, ".config.swpx"
> Jun  1 04:42:09 10 kernel: jffs_free_file: f #6, ".config.swpx"
> Jun  1 04:42:09 10 kernel: unlink(): up biglock
> Jun  1 04:42:09 10 kernel: ***jffs_unlink()
> Jun  1 04:42:09 10 kernel: unlink(): down biglock
> Jun  1 04:42:09 10 kernel: ***jffs_remove(): file = ".config.swp", ino = 5
> Jun  1 04:42:09 10 kernel: jffs_find_child()
> Jun  1 04:42:09 10 kernel: jffs_find_child(): Found ".config.swp".
> Jun  1 04:42:09 10 kernel: jffs_write_node(): filename = "", ino = 5,
> total_size = 60
> Jun  1 04:42:09 10 kernel: jffs_fmalloc(): fmc = 0xf75c0d64, size = 60,
> node = 0xf71b4294
> Jun  1 04:42:09 10 kernel: jffs_fmalloc(): free_chunk_size1 = 1024772,
> free_chunk_size2 = 0
> Jun  1 04:42:09 10 kernel: struct jffs_fmcontrol: 0xf75c0d64
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:         1048576, /* flash_size  */
> Jun  1 04:42:09 10 kernel:         23732, /* used_size  */
> Jun  1 04:42:09 10 kernel:         132, /* dirty_size  */
> Jun  1 04:42:09 10 kernel:         1024712, /* free_size  */
> Jun  1 04:42:09 10 kernel:         131072, /* sector_size  */
> Jun  1 04:42:09 10 kernel:         524288, /* min_free_size  */
> Jun  1 04:42:09 10 kernel:         65536, /* max_chunk_size  */
> Jun  1 04:42:09 10 kernel:         0xf7e5b484, /* mtd  */
> Jun  1 04:42:09 10 kernel:         0xf71b3224, /* head  */
> (head->offset = 0x00000000)
> Jun  1 04:42:09 10 kernel:         0xf71b32e8, /* tail  */
> (tail->offset + tail->size = 0x00005d38)
> Jun  1 04:42:09 10 kernel:         0x00000000, /* head_extra  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* tail_extra  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: struct jffs_fm: 0xf71b32e8
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:        0x00005cfc, /* offset  */
> Jun  1 04:42:09 10 kernel:        60, /* size  */
> Jun  1 04:42:09 10 kernel:        0xf71b32cc, /* prev  */
> Jun  1 04:42:09 10 kernel:        0x00000000, /* next  */
> Jun  1 04:42:09 10 kernel:        0xf71b23ac, /* nodes  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: jffs_write_node(): setting version of
> .config.swp to 2
> Jun  1 04:42:09 10 kernel: , result: 0x00000000
> Jun  1 04:42:09 10 kernel: , result: 0x00000000
> Jun  1 04:42:09 10 kernel: , result: 0x000005d2
> Jun  1 04:42:09 10 kernel: jffs_write_node(): About to write this raw
> inode to the flash at pos 0x5cfc:
> Jun  1 04:42:09 10 kernel: jffs_raw_inode: inode number: 5
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:         0x34383931, /* magic  */
> Jun  1 04:42:09 10 kernel:         0x00000005, /* ino  */
> Jun  1 04:42:09 10 kernel:         0x00000001, /* pino  */
> Jun  1 04:42:09 10 kernel:         0x00000002, /* version  */
> Jun  1 04:42:09 10 kernel:         0x00008180, /* mode  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* uid  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* gid  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* atime  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* mtime  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* ctime  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* offset  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* dsize  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* rsize  */
> Jun  1 04:42:09 10 kernel:         0x00,       /* nsize  */
> Jun  1 04:42:09 10 kernel:         0x01,       /* nlink  */
> Jun  1 04:42:09 10 kernel:         0x00,       /* spare  */
> Jun  1 04:42:09 10 kernel:         0,          /* rename  */
> Jun  1 04:42:09 10 kernel:         1,          /* deleted  */
> Jun  1 04:42:09 10 kernel:         0xff,       /* accurate  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* dchksum  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* nchksum  */
> Jun  1 04:42:09 10 kernel:         0x05d2,     /* chksum  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: flash_safe_writev(f7e5b484, 00005cfc, f71abe98)
> Jun  1 04:42:09 10 kernel: jffs_write_node(): Leaving...
> Jun  1 04:42:09 10 kernel: jffs_insert_node(): ino = 5, version = 2, name
> = "", deleted = 1
> Jun  1 04:42:09 10 kernel: jffs_insert_node():
> ---------------------------------------------------------------------- 1
> Jun  1 04:42:09 10 kernel: jffs_remove_redundant_nodes(): ino: 5, name:
> ".config.swp", newest_type: 1
> Jun  1 04:42:09 10 kernel: thread_should_wake(): free=1024712, dirty=132,
> blocksize=131072.
> Jun  1 04:42:09 10 kernel: thread_should_wake(): Not waking. Insufficient
> dirty space
> Jun  1 04:42:09 10 kernel: jffs_insert_node():
> ---------------------------------------------------------------------- 2
> Jun  1 04:42:09 10 kernel: jffs_delete_inode(): inode->i_ino == 5
> Jun  1 04:42:09 10 kernel: jffs_find_file(): ino: 5
> Jun  1 04:42:09 10 kernel: jffs_find_file(): Found file with ino 5. (name:
> ".config.swp")
> Jun  1 04:42:09 10 kernel: jffs_possibly_delete_file(): ino: 5
> Jun  1 04:42:09 10 kernel: jffs_fmfree(): node->ino = 5, node->version = 1
> Jun  1 04:42:09 10 kernel: jffs_fmfree(): node->ino = 5, node->version = 2
> Jun  1 04:42:09 10 kernel: jffs_unlink_file_from_tree(): ino: 5, pino: 1,
> name: ".config.swp"
> Jun  1 04:42:09 10 kernel: f->parent=f75c0cdc
> Jun  1 04:42:09 10 kernel: jffs_unlink_file_from_hash(): f: 0xf71b6504,
> ino 5
> Jun  1 04:42:09 10 kernel: jffs_free_node_list(): f #5, ".config.swp"
> Jun  1 04:42:09 10 kernel: jffs_free_file: f #5, ".config.swp"
> Jun  1 04:42:09 10 kernel: unlink(): up biglock
> Jun  1 04:42:09 10 kernel: jffs_create(): dir: 0xf71b8a80, name:
> ".config.swp"
> Jun  1 04:42:09 10 kernel: create(): down biglock
> Jun  1 04:42:09 10 kernel: jffs_write_node(): filename = ".config.swp",
> ino = 7, total_size = 72
> Jun  1 04:42:09 10 kernel: jffs_fmalloc(): fmc = 0xf75c0d64, size = 72,
> node = 0xf71b4294
> Jun  1 04:42:09 10 kernel: jffs_fmalloc(): free_chunk_size1 = 1024712,
> free_chunk_size2 = 0
> Jun  1 04:42:09 10 kernel: struct jffs_fmcontrol: 0xf75c0d64
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:         1048576, /* flash_size  */
> Jun  1 04:42:09 10 kernel:         23672, /* used_size  */
> Jun  1 04:42:09 10 kernel:         264, /* dirty_size  */
> Jun  1 04:42:09 10 kernel:         1024640, /* free_size  */
> Jun  1 04:42:09 10 kernel:         131072, /* sector_size  */
> Jun  1 04:42:09 10 kernel:         524288, /* min_free_size  */
> Jun  1 04:42:09 10 kernel:         65536, /* max_chunk_size  */
> Jun  1 04:42:09 10 kernel:         0xf7e5b484, /* mtd  */
> Jun  1 04:42:09 10 kernel:         0xf71b3224, /* head  */
> (head->offset = 0x00000000)
> Jun  1 04:42:09 10 kernel:         0xf71b3304, /* tail  */
> (tail->offset + tail->size = 0x00005d80)
> Jun  1 04:42:09 10 kernel:         0x00000000, /* head_extra  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* tail_extra  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: struct jffs_fm: 0xf71b3304
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:        0x00005d38, /* offset  */
> Jun  1 04:42:09 10 kernel:        72, /* size  */
> Jun  1 04:42:09 10 kernel:        0xf71b32e8, /* prev  */
> Jun  1 04:42:09 10 kernel:        0x00000000, /* next  */
> Jun  1 04:42:09 10 kernel:        0xf71b235c, /* nodes  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: , result: 0x00000000
> Jun  1 04:42:09 10 kernel: , result: 0x0000042c
> Jun  1 04:42:09 10 kernel: , result: 0x0000058e
> Jun  1 04:42:09 10 kernel: jffs_write_node(): About to write this raw
> inode to the flash at pos 0x5d38:
> Jun  1 04:42:09 10 kernel: jffs_raw_inode: inode number: 7
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:         0x34383931, /* magic  */
> Jun  1 04:42:09 10 kernel:         0x00000007, /* ino  */
> Jun  1 04:42:09 10 kernel:         0x00000001, /* pino  */
> Jun  1 04:42:09 10 kernel:         0x00000001, /* version  */
> Jun  1 04:42:09 10 kernel:         0x00008180, /* mode  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* uid  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* gid  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* atime  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* mtime  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* ctime  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* offset  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* dsize  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* rsize  */
> Jun  1 04:42:09 10 kernel:         0x0b,       /* nsize  */
> Jun  1 04:42:09 10 kernel:         0x01,       /* nlink  */
> Jun  1 04:42:09 10 kernel:         0x00,       /* spare  */
> Jun  1 04:42:09 10 kernel:         0,          /* rename  */
> Jun  1 04:42:09 10 kernel:         0,          /* deleted  */
> Jun  1 04:42:09 10 kernel:         0xff,       /* accurate  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* dchksum  */
> Jun  1 04:42:09 10 kernel:         0x042c,     /* nchksum  */
> Jun  1 04:42:09 10 kernel:         0x058e,     /* chksum  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: flash_safe_writev(f7e5b484, 00005d38, f71abe68)
> Jun  1 04:42:09 10 kernel: jffs_write_node(): Leaving...
> Jun  1 04:42:09 10 kernel: jffs_insert_node(): ino = 7, version = 1, name
> = ".config.swp", deleted = 0
> Jun  1 04:42:09 10 kernel: jffs_find_file(): ino: 7
> Jun  1 04:42:09 10 kernel: jffs_find_file(): Didn't find file with ino 7.
> Jun  1 04:42:09 10 kernel: jffs_insert_file_into_hash(): f->ino: 7
> Jun  1 04:42:09 10 kernel: jffs_insert_node(): Updated the name of the
> file to ".config.swp".
> Jun  1 04:42:09 10 kernel: jffs_insert_node():
> ---------------------------------------------------------------------- 1
> Jun  1 04:42:09 10 kernel: jffs_insert_file_into_tree(): name:
> ".config.swp"
> Jun  1 04:42:09 10 kernel: jffs_find_file(): ino: 1
> Jun  1 04:42:09 10 kernel: jffs_find_file(): Found file with ino 1. (name:
> "")
> Jun  1 04:42:09 10 kernel: jffs_remove_redundant_nodes(): ino: 7, name:
> ".config.swp", newest_type: 3
> Jun  1 04:42:09 10 kernel: thread_should_wake(): free=1024640, dirty=264,
> blocksize=131072.
> Jun  1 04:42:09 10 kernel: thread_should_wake(): Not waking. Insufficient
> dirty space
> Jun  1 04:42:09 10 kernel: jffs_insert_node():
> ---------------------------------------------------------------------- 2
> Jun  1 04:42:09 10 kernel: jffs_find_file(): ino: 7
> Jun  1 04:42:09 10 kernel: jffs_find_file(): Found file with ino 7. (name:
> ".config.swp")
> Jun  1 04:42:09 10 kernel: create(): up biglock
> Jun  1 04:42:09 10 kernel: ***jffs_file_write(): inode: 0xf71afd00 (ino:
> 7), filp: 0xf76fd5e4, buf: 0xfe174000, count: 4096
> Jun  1 04:42:09 10 kernel: file_write(): down biglock
> Jun  1 04:42:09 10 kernel: jffs_write_node(): filename = ".config.swp",
> ino = 7, total_size = 4168
> Jun  1 04:42:09 10 kernel: jffs_fmalloc(): fmc = 0xf75c0d64, size = 4168,
> node = 0xf71b4224
> Jun  1 04:42:09 10 kernel: jffs_fmalloc(): free_chunk_size1 = 1024640,
> free_chunk_size2 = 0
> Jun  1 04:42:09 10 kernel: struct jffs_fmcontrol: 0xf75c0d64
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:         1048576, /* flash_size  */
> Jun  1 04:42:09 10 kernel:         27840, /* used_size  */
> Jun  1 04:42:09 10 kernel:         264, /* dirty_size  */
> Jun  1 04:42:09 10 kernel:         1020472, /* free_size  */
> Jun  1 04:42:09 10 kernel:         131072, /* sector_size  */
> Jun  1 04:42:09 10 kernel:         524288, /* min_free_size  */
> Jun  1 04:42:09 10 kernel:         65536, /* max_chunk_size  */
> Jun  1 04:42:09 10 kernel:         0xf7e5b484, /* mtd  */
> Jun  1 04:42:09 10 kernel:         0xf71b3224, /* head  */
> (head->offset = 0x00000000)
> Jun  1 04:42:09 10 kernel:         0xf71b3320, /* tail  */
> (tail->offset + tail->size = 0x00006dc8)
> Jun  1 04:42:09 10 kernel:         0x00000000, /* head_extra  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* tail_extra  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: struct jffs_fm: 0xf71b3320
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:        0x00005d80, /* offset  */
> Jun  1 04:42:09 10 kernel:        4168, /* size  */
> Jun  1 04:42:09 10 kernel:        0xf71b3304, /* prev  */
> Jun  1 04:42:09 10 kernel:        0x00000000, /* next  */
> Jun  1 04:42:09 10 kernel:        0xf71b2334, /* nodes  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: jffs_write_node(): setting version of
> .config.swp to 2
> Jun  1 04:42:09 10 kernel: , result: 0x00000f2f
> Jun  1 04:42:09 10 kernel: , result: 0x0000042c
> Jun  1 04:42:09 10 kernel: , result: 0x000005dd
> Jun  1 04:42:09 10 kernel: jffs_write_node(): About to write this raw
> inode to the flash at pos 0x5d80:
> Jun  1 04:42:09 10 kernel: jffs_raw_inode: inode number: 7
> Jun  1 04:42:09 10 kernel: {
> Jun  1 04:42:09 10 kernel:         0x34383931, /* magic  */
> Jun  1 04:42:09 10 kernel:         0x00000007, /* ino  */
> Jun  1 04:42:09 10 kernel:         0x00000001, /* pino  */
> Jun  1 04:42:09 10 kernel:         0x00000002, /* version  */
> Jun  1 04:42:09 10 kernel:         0x00008180, /* mode  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* uid  */
> Jun  1 04:42:09 10 kernel:         0x0000,     /* gid  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* atime  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* mtime  */
> Jun  1 04:42:09 10 kernel:         0x40bc0921, /* ctime  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* offset  */
> Jun  1 04:42:09 10 kernel:         0x00001000, /* dsize  */
> Jun  1 04:42:09 10 kernel:         0x00000000, /* rsize  */
> Jun  1 04:42:09 10 kernel:         0x0b,       /* nsize  */
> Jun  1 04:42:09 10 kernel:         0x01,       /* nlink  */
> Jun  1 04:42:09 10 kernel:         0x00,       /* spare  */
> Jun  1 04:42:09 10 kernel:         0,          /* rename  */
> Jun  1 04:42:09 10 kernel:         0,          /* deleted  */
> Jun  1 04:42:09 10 kernel:         0xff,       /* accurate  */
> Jun  1 04:42:09 10 kernel:         0x00000f2f, /* dchksum  */
> Jun  1 04:42:09 10 kernel:         0x042c,     /* nchksum  */
> Jun  1 04:42:09 10 kernel:         0x05dd,     /* chksum  */
> Jun  1 04:42:09 10 kernel: }
> Jun  1 04:42:09 10 kernel: flash_safe_writev(f7e5b484, 00005d80, f71abe38)
> Jun  1 04:42:09 10 kernel: jffs_write_node(): Leaving...
> Jun  1 04:42:09 10 kernel: jffs_insert_node(): ino = 7, version = 2, name
> = "", deleted = 0
> Jun  1 04:42:09 10 kernel: jffs_insert_node():
> ---------------------------------------------------------------------- 1
> Jun  1 04:42:09 10 kernel: jffs_update_file(): ino: 7, version: 2
> Jun  1 04:42:09 10 kernel: jffs_delete_data(): offset = 0, remove_size = 0
> Jun  1 04:42:09 10 kernel: jffs_insert_data(): node->data_offset = 0,
> node->data_size = 4096, f->size = 0
> Jun  1 04:42:09 10 kernel: jffs_insert_data(): f->size = 4096
> Jun  1 04:42:09 10 kernel: jffs_remove_redundant_nodes(): ino: 7, name:
> ".config.swp", newest_type: 7
> Jun  1 04:42:09 10 kernel: jffs_remove_redundant_nodes(): Removing node:
> ino: 7, version: 1, mod_type: 3
> Jun  1 04:42:09 10 kernel: jffs_fmfree(): node->ino = 7, node->version = 1
> Jun  1 04:42:09 10 kernel: thread_should_wake(): free=1020472, dirty=336,
> blocksize=131072.
> Jun  1 04:42:09 10 kernel: thread_should_wake(): Not waking. Insufficient
> dirty space
> Jun  1 04:42:09 10 kernel: jffs_insert_node():
> ---------------------------------------------------------------------- 2
> Jun  1 04:42:09 10 kernel: jffs_file_write(): new f_pos 4096.
> Jun  1 04:42:09 10 kernel: file_write(): up biglock
> Jun  1 04:42:09 10 kernel: ***jffs_readpage(): file = "config",
> page->index = 0
> Jun  1 04:42:09 10 kernel: readpage(): down biglock
> Jun  1 04:42:09 10 kernel: jffs_read_data(): file = "config", read_offset
> = 0, size = 4096
> Jun  1 04:42:09 10 kernel:   jffs_get_node_data(): file: "config", ino: 2,
> version: 1, node_offset: 0
> Jun  1 04:42:09 10 kernel: jffs_get_node_data
> Jun  1 04:42:09 10 kernel: flash_safe_read(f7e5b484, 00000080, 00000000,
> 00001000)
> Jun  1 04:42:09 10 kernel:  printing eip:
> Jun  1 04:42:09 10 kernel: c024cb00
> Jun  1 04:42:09 10 kernel: Oops: 0002
> Jun  1 04:42:09 10 kernel:  
> Jun  1 04:42:09 10 kernel: CPU:    0
> Jun  1 04:42:09 10 kernel: EIP:    0060:[ip_send_check+32/80]    Not
> tainted
> Jun  1 04:42:09 10 kernel: EFLAGS: 00010216
> Jun  1 04:42:09 10 kernel: eax: f9744080   ebx: 00001000   ecx: 00000400
> edx: f71aa000
> Jun  1 04:42:09 10 kernel: esi: f9744080   edi: 00000000   ebp: f71abd74
> esp: f71abd58
> Jun  1 04:42:09 10 kernel: ds: 0068   es: 0068   ss: 0068
> Jun  1 04:42:09 10 kernel: Process vim (pid: 555, stackpage=f71ab000)
> Jun  1 04:42:09 10 kernel: Stack: f9744080 c02f6a4c 00000082 f71aa000
> f71aa000 00000080 00000000 f71abda4 
> Jun  1 04:42:09 10 kernel:        c024b17a c03458a0 00000000 00000080
> 00001000 00000000 f7ba59ec 00000080 
> Jun  1 04:42:09 10 kernel:        00001000 00001000 00000000 f71abde0
> c0248cbc c03458a0 f7ba5a28 00000080 
> Jun  1 04:42:09 10 kernel: Call Trace: [ip_options_rcv_srr+442/448]
> [ip_rcv_finish+12/592]  [netlink_recvmsg+82/368]  [do_con_write+1635/1776]
> [rs_interrupt+117/352]  [rs_interrupt_single+121/304]  [rmqueue+171/592]
> [block_til_ready+454/736]  [block_til_ready+670/736]
> [set_page_dirty+78/112]  [invalidate_list_pages2+160/176]
> [generic_buffer_fdatasync+184/256]  [invalidate_list_pages2+160/176]
> [get_device_list+37/128]  [spurious_interrupt_bug+7/24] 
> Jun  1 04:42:09 10 kernel: Code: f3 a5 f6 c3 02 74 02 66 a5 f6 c3 01 74 01
> a4 8b 45 f0 ff 48 
> Jun  1 04:42:09 10 kernel:  <6>note: vim[555] exited with preempt_count 2
****************************************************************************
******** 

Thanks in advance,

Harish 
