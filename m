From: purushn@future.futsoft.com (Purushothaman N)
Date: Mon, 24 Feb 2003 15:54:26 +0530
Subject: Root file system as CRAMFS on Flash
Message-ID: <002a01c2dbee$e8a7b6c0$1504060a@future.futsoft.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Dear All,

Sorry for disturbing the list again. I was successfully able to mount a
cramfs
image in flash with NFS as root file system. But i am facing problems with
mounting the cramfs image as root file system. I have given the correct root
option
to the kernel. Please find below the trace message printed during kernel
booting:

ttyS00 at iomem 0xb8000800 (irq = 0) is a 16550A
Attempt to register invalid minor number with devfs (0:0).
Attempt to register invalid minor number with devfs (0:0).
ttyS00 at iomem 0xb8000820 (irq = 0) is a 16550A
Attempt to register invalid minor number with devfs (0:0).
Attempt to register invalid minor number with devfs (0:0).
Loading RC323xx MMU routines.
CPU revision is: 00001800
Primary instruction cache 8kb, linesize 16 bytes (2 ways)
Primary data cache 2kb, linesize 16 bytes (2 ways)
Number of TLB entries 16.
Linux version 2.4.5-pre1 (root at brg2.future.futsoft.com) (gcc version 2.95.3
1993
Index:  0 pgmask=01ffe000 va=e0000000 asid=00000000  [pa=40000000 c=2 d=1
v=1 g]
memory: 801ffc00 @ 80000400 (usable)
 memory: 01c71c10 @ 0038e3f0 (usable)
 On node 0 totalpages: 8192
 zone(0): 4096 pages.
 zone(1): 4096 pages.
 zone(2): 0 pages.
 Kernel command line: root=/dev/mtdblock2
 calculating r4koff... 0007a120(500000)
 CPU frequency 100.00 MHz
 ....
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd v1.8
block: queued sectors max/low 18880kB/6293kB, 64 slots per queue
devfs: v0.102 (20000622) Richard Gooch (rgooch at atnf.csiro.au)
devfs: devfs_debug: 0x0
devfs: boot_options: 0x0
loop: loaded (max 8 devices)
Serial driver version 5.05a (2001-03-20) with MANY_PORTS SHARE_IRQ
SERIAL_PCI ed
ttyS00 at 0x0000 (irq = 0) is a 16550A
ttyS01 at 0x0000 (irq = 0) is a 16550A
mtd: Giving out device 0 to M-Systems DiskOnChip 1000
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Using configured probe address 0x4000000
After ioremap->docptr: 0xa4000000
Calling doccheck with docptr - 0xa4000000 and physadr - 0x4000000
 (docprobe.c:114)=> signature 0x55 0xAA not found!!!
 After iounmap->docptr: 0xa4000000
 (slram.c:192)=>0x86000000
 mtd: Giving out device 1 to Raw memory
 Registered physmem device from 98304Kb to 131072Kb
 Mapped from 0x86000000 to 0x88000000
 Inter module registering - AMDEXT
 MIPS flash device: 800000 at 4000000
 Remapped address - 0xa4000000
 CFI probing with base = 0
 Value read at 0x2AA8 is - 0xffffffff
 MIPS Physically Mapped Flash: Found four side-by-side CFI devices at locae
 (cfi_probe.c:382)=> cfi.interleave: 4
 Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
 Primary Algorithm Table at 0040
 Alternative Vendor Command Set: 0000 (None)
 No Alternate Algorithm Table
 Vcc Minimum: 2.7 V
 Vcc Maximum: 3.6 V
 No Vpp line
 Typical byte/word write timeout: 16 ?s
 Maximum byte/word write timeout: 512 ?s
 Full buffer write not supported
 Typical block erase timeout: 1024 ?s
 Maximum block erase timeout: 16384 ?s
 Chip erase not supported
 Device size: 0x200000 bytes (2 Mb)
 Flash Device Interface description: 0x0002
   - supports x8 and x16 via BYTE# with asynchronous interface
     Max. bytes in buffer write: 0x1
     Number of Erase Block Regions: 4
       Erase Region #0: BlockSize 0x4000 bytes, 1 blocks
         Erase Region #1: BlockSize 0x0100 bytes, 65 blocks
           Erase Region #2: BlockSize 0x2000 bytes, 2 blocks
             Erase Region #3: BlockSize 0x0000 bytes, 33 blocks

             Size of the map - 8192k
             Value read at 0x2AA8 is - 0xffffffff
             MIPS Physically Mapped Flash: Found four side-by-side CFI
devices at locae
             FIXME: Do alias check at line 289 of cfi_probe.c
             Request the Probe for :cfi_cmdset_0002
              Amd/Fujitsu Extended Query Table at 0x0040
              number of CFI chips: 1
              mtd: Giving out device 2 to MIPS root filesystem
              mtd: Giving out device 3 to MIPS boot firmware
              mtd: Giving out device 4 to MIPS kernel
              init_mtdblock called
              CONFIG_DEVFS_FS defined
              NET4: Linux TCP/IP 1.0 for NET4.0
              IP Protocols: ICMP, UDP, TCP
              IP: routing cache hash table of 512 buckets, 4Kbytes
              TCP: Hash tables configured (established 2048 bind 2048)
              IP-Config: Device `eth0' not found.
              ip_conntrack (256 buckets, 2048 max)
              ip_tables: (c)2000 Netfilter core team
              NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
              ROOT_DEVICE_NAME = mtdblock2
              handle = 0x0
              Kernel panic: I have no root and I want to scream

Also is it necessary to define device fs (CONFIG_DEVFS_FS) for using
CRAMFS?.
Please help me to solve this issue.

Thanks and Regards,
Purush

***************************************************************************
This message is proprietary to Future Software Limited (FSL) 
and is intended solely for the use of the individual to whom it
is addressed. It may contain  privileged or confidential information 
and should not be circulated or used for any purpose other than for 
what it is intended. 

If you have received this message in error, please notify the
originator immediately. If you are not the intended recipient,
you are notified that you are strictly prohibited from using,
copying, altering, or disclosing the contents of this message. 
FSL accepts no responsibility for loss or damage arising from 
the use of the information transmitted by this email including
damage from virus.
***************************************************************************
