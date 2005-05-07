Received: from imo-d03.mx.aol.com ([205.188.157.35])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DURm2-0007em-Pg
	for linux-mtd@lists.infradead.org; Sat, 07 May 2005 12:03:28 -0400
Received: from JobHunts02@aol.com
	by imo-d03.mx.aol.com (mail_out_v38_r1.7.) id 3.ae.71dc49ee (4214)
	for <linux-mtd@lists.infradead.org>;
	Sat, 7 May 2005 11:57:47 -0400 (EDT)
From: JobHunts02@aol.com
Message-ID: <ae.71dc49ee.2fae3f7b@aol.com>
Date: Sat, 7 May 2005 11:57:47 EDT
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Subject: Debug level "fixing" crash?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While booting, I was constantly crashing when attempting to mount the JFFS2 
filesystem (see below).  So, I changed the JFFS2 debugging verbosity from 0 to 
2.  After doing this, I have not crashed again in numerous tests.


Anyone else seen this kind of behavior and have an explanation?


Thank you.




                                                                              
  

U-Boot 1.1.1 (Apr 28 2005 - 17:13:43)

                                                                              
  

MPC8260 Reset Status: Check Stop, External Soft, External Hard

                                                                              
  

MPC8260 Clock Configuration

 - Bus-to-Core Mult 4x, VCO Div 2, 60x Bus Freq  25-75 , Core Freq 100-300

 - dfbrg 1, corecnf 0x0a, busdf 3, cpmdf 1, plldf 0, pllmf 3

 - vco_out  264000000, scc_clk   66000000, brg_clk   16500000

 - cpu_clk  264000000, cpm_clk  132000000, bus_clk   66000000

 - pci_clk   33000000

                                                                              
  

CPU:   MPC8260 (HiP7 Rev 13, Mask 0.1 1K49M) at 264 MHz

Motorola MPC8275

DRAM:  32 MB

FLASH: 8 MB

In:    serial

Out:   serial

Err:   serial

Net:   FCC2 ETHERNET

Hit any key to stop autoboot:  0

### JFFS2 loading '/boot/vmlinux.pkg' to 0x100000

Scanning JFFS2 FS: .................................... done.

### JFFS2 load complete: 811224 bytes loaded to 0x100000

## Booting image at 00100000 ...

   Image Name:   Linux kernel for PQ2FADS

   Image Type:   PowerPC Linux Kernel Image (gzip compressed)

   Data Size:    811160 Bytes = 792.1 kB

   Load Address: 00000000

   Entry Point:  00000000

   Verifying Checksum ... OK

   Uncompressing Kernel Image ... OK

MPC82xxADS/PQ2FADS board support by Arabella

Memory BAT mapping: BAT2=32Mb, BAT3=0Mb, residual: 0Mb

Linux version 2.4.26 (root@localhost.localdomain) (gcc version 3.3.2) #1 Wed 
May 4 22:30:56 UTC 2005

ADS setup arch

MPC82xx PCI bridge initialization

On node 0 totalpages: 8192

zone(0): 8192 pages.

zone(1): 0 pages.

zone(2): 0 pages.

Kernel command line: root=/dev/mtdblock2

ADS init IRQ. NR_IRQS=256

PIC: fully preemptible IRQ mode

ADS time init

ADS calibrate decrementer. FREQ=66000000, tb_ticks_per_jiffy=165000

Calibrating delay loop... 175.71 BogoMIPS

Memory: 30472k available (1252k kernel code, 388k data, 224k init, 0k highmem)

Dentry cache hash table entries: 4096 (order: 3, 32768 bytes)

Inode cache hash table entries: 2048 (order: 2, 16384 bytes)

Mount cache hash table entries: 512 (order: 0, 4096 bytes)

Buffer cache hash table entries: 1024 (order: 0, 4096 bytes)

Page-cache hash table entries: 8192 (order: 3, 32768 bytes)

POSIX conformance testing by UNIFIX

PCI: Probing PCI hardware

ADS init

Linux NET4.0 for Linux 2.4

Based upon Swansea University Computer Society NET3.039

Initializing RT netlink socket

Starting kswapd

devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)

devfs: boot_options: 0x0

JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications AB.

pty: 256 Unix98 ptys configured

Generic RTC Driver v1.07

devsoc: devsoc_init:

loop: loaded (max 8 devices)

PPP generic driver version 2.4.2

PPP Deflate Compression module registered
flash: 8192KB at FF800000

Number of erase regions: 2

Primary Vendor Command Set: 0003 (Intel/Sharp Standard)

Primary Algorithm Table at 0035

Alternative Vendor Command Set: 0000 (None)

No Alternate Algorithm Table

Vcc Minimum: 2.7 V

Vcc Maximum: 3.6 V

Vpp Minimum: b.4 V

Vpp Maximum: c.6 V

Typical byte/word write timeout: 32 us

Maximum byte/word write timeout: 512 us

Full buffer write not supported

Typical block erase timeout: 1024 ms

Maximum block erase timeout: 8192 ms

Chip erase not supported

Device size: 0x400000 bytes (4 MiB)

Flash Device Interface description: 0x0001

  - x16-only asynchronous interface

Max. bytes in buffer write: 0x1

Number of Erase Block Regions: 2

  Erase Region #0: BlockSize 0x2000 bytes, 8 blocks

  Erase Region #1: BlockSize 0x10000 bytes, 63 blocks

cfi_cmdset_0001: Erase suspend on write enabled

Using word write method

Creating 4 MTD partitions on "Intel Flash":

0x00000000-0x00040000 : "HRCW"

0x00040000-0x00700000 : "JFFS2"

0x00700000-0x00780000 : "U-Boot"

0x00780000-0x00800000 : "Kernel"

MPC8260 FCC Ethernet driver

devsoc_xcc_create c03c0000

MDIO on PC10, MDC on PC11

Created eth0

devsoc_xcc_create c03a0000

MDIO on PC10, MDC on PC11

Created eth1

NET4: Linux TCP/IP 1.0 for NET4.0

IP: routing cache hash table of 512 buckets, 4Kbytes

TCP: Hash tables configured (established 2048 bind 4096)

NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.

Machine check in kernel mode.

Caused by (from SRR1=89032): Machine check signal

Oops: machine check, sig: 7

NIP: C008D840 XER: 20000000 LR: C00912E4 SP: C025FCA0 REGS: c025fbf0 TRAP: 
0200

   Not tainted

MSR: 00089032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11

TASK = c025e000[1] 'swapper' Last syscall: 120

last math 00000000 last altivec 00000000

GPR00: 0000004C C025FCA0 C025E000 C038188C C0367A54 35BB7372 00000002 C0363000

GPR08: C03631E0 C038189C 0000025D C038189C 00040000 7EFFCFFD 01FFF000 00000001

GPR16: FFFFFFFF 00000000 00000000 01FF9424 003FF000 00000002 C0296574 C0296554

GPR24: C029654C 00000000 C0366910 C025FD58 00000000 C02964E4 0000025D C0367A54

Call backtrace:

C00912B8 C0091548 C0090F3C C00906F8 C0093454 C008FB1C C0041034

C0041430 C0056060 C00563E4 C005691C C0173A08 C0003BC0 C00039A4

C000642C

Kernel panic: Attempted to kill init!

 <0>Rebooting in 180 seconds..


                                                                              
  

If there is no crash, the next lines under the "NET4: Unix domain sockets 
1.0/SMP for Linux NET4.0." line are:


VFS: Mounted root (jffs2 filesystem) readonly.

Freeing unused kernel memory: 220k init

*** Running rc.modules

*** Running rc.serial

*** Attempting to start S05syslog

*** Attempting to start S15inet

Starting inetd

Done

*** Attempting to start S20network

*** Running rc.local

                                                                              
  

(none) login: root

login[44]: root login  on `ttyS0'

                                                                              
  

# 
