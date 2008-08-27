Received: from mail.avrupayazilim.com ([88.247.191.72] helo=avrupayazilim.com)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KYJPE-0006tX-1k
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 11:41:45 +0000
Message-ID: <48B53D6C.4080801@multitekarge.com>
Date: Wed, 27 Aug 2008 14:41:32 +0300
From: Ensar Gul <ensar.gul@multitekarge.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: file system corruption
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Reply-To: ensar.gul@multitekarge.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

we used  128Mib ST Nand flash (NAND01GW3828N6)  with jffs2 as a file 
system for debian linux 2.6.11. Linux runs on ARM9 processor. The system 
works without any problem. It boots using uboot, mount filesystem and 
runs application program. Hovever, sometimes the file system becomes 
corrupt and it does not boot. In our application, we can not afford even 
a single failure. The logs are below. Could anyone tell me what was 
going wrong.

Thanks.

Regards

Ensar
--------------------

U-Boot 1.1.6 (Aug  7 2007 - 15:15:56) Mindspeed 0.04.0

DRAM:  128 MB
Comcerto Flash Subsystem Initialization
Flash:  0 kB
NAND:  board_nand_init nand->IO_ADDR_R =11400000
!!! oobsize: 0x40 - oobblock: 0x800
128 MiB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Reserve MSP memory
Comcerto-515 > run bootaa

NAND read: device 0 offset 0x200000, size 0x200000

Reading data from 0x3ff800 -- 100% complete.
  2097152 bytes read: OK
## Downloading image at 01000000 ...
code_offset=0x80
code_base=800000
data_offset=872c
code_size=86ac
data_base=8086ac
data_size=138110
zeroinit_base=9407bc
prog_entry=100

AIFHEADER:
BL_DecompressCode=e1a00000
BL_SelfRelocCode=e1a00000
BL_DbgInitZeroInit=eb00000c
EntryPointOffset=ff800100
ProgramExitInstr=ef000011
ImageReadOnlySize=86ac
ImageReadWriteSize=138110
ImageDebugSize=2060
ImageZeroInitSize=11324
ImageDebugType=1e681
ImageBase=800000
WorkSpace=0
AddressMode=20
DataBase=0
FirstFatOffset=14289c
Reserved2=0
DebugInitInstr=e1a00000
ZeroInitCode[0]=e04ec00f

NAND read: device 0 offset 0x0, size 0x200000

Reading data from 0x1ff800 -- 100% complete.
  2097152 bytes read: OK
Copying ARM1 startup code from 07e003c0, start address 02000000

Starting kernel ...
 
Linux version 2.6.11.7-1.08.9tsavo (root@mete) (gcc version 3.3.2 
20030820 (prerelease)) #75 Thu Jun 5 12:28:07 EEST 
2008�������������������������������������
CPU: ARM920Tid(wb) [41129200] revision 0 (ARMv4T)
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
CPU0: D cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
Machine: ARM-M825xx2 Comcerto
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists
Kernel command line: console=ttyS0,115200 mem=110M root=/dev/mtdblock2 
rw rootfstype=jffs2
PID hash table entries: 512 (order: 9, 8192 bytes)
HZ: 200
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 110MB = 110MB total
Memory: 109184KB available (1719K code, 594K data, 84K init)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
Comcerto GPIO: init
Comcerto GPIO: GPIOs 0 6 configured as IRQ source(s)
Comcerto PCI: init
Comcerto PCI: Comcerto device is not configured in PCI host
         Verify that HBMODE_n(low) pin is high and HBBURSTEN_n(high) pin 
is low
         On Mindspeed MH02-D370-xxx board, remove jumper JPCISLV1
SPI core: loaded version 0.2
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
yaffs Jun  5 2008 12:25:46 Installing.
Serial: 8250/16550 driver $Revision: 1.1.1.3 $ 2 ports, IRQ sharing disabled
Serial: Comcerto 16550 serial driver $Revision: 1.4 $
ttyS0 at MMIO 0x10090000 (irq = 41) is a 16550A
io scheduler noop registered
loop: loaded (max 8 devices)
nbd: registered device at major 43
smi_memory_phy = a70000
CSPtoMSPCommunicationControlQueue(PA): 0x9000210
CSPtoMSPCommunicationControlQueue(VA): 0xf9000210
MSPtoCSPCommunicationControlQueue(PA): 0x9000220
MSPtoCSPCommunicationControlQueue(VA): 0xf9000220
SharedMemoryRxControlStructure(PA): 0x9000230
SharedMemoryRxControlStructure(VA): 0xf9000230
SharedMemoryTxControlStructure(PA): 0x9000248
SharedMemoryTxControlStructure(VA): 0xf9000248
Phy->storage: 0xd77968
Virt->storage: 0xf0d77968
NAND device: Manufacturer ID: 0x20, Chip ID: 0xf1 (ST Micro NAND 128MiB 
3,3V 8-bit)
Scanning device for bad blocks
Bad eraseblock 468 at 0x03a80000
Creating 5 MTD partitions on "NAND 128MiB 3,3V 8-bit":
0x00000000-0x00200000 : "MSP boot partition"
0x00200000-0x00400000 : "Linux boot partition"
0x00400000-0x02c00000 : "Comcerto Filesystem partition 1"
0x02c00000-0x05400000 : "Comcerto Filesystem partition 2"
0x05400000-0x08000000 : "Free data section"
Comcerto flash: request_mem_region(0x5000000, 4194304) failed
SPI core: add adapter comcerto-spi
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP established hash table entries: 4096 (order: 3, 32768 bytes)
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
NET: Registered protocol family 1
NET: Registered protocol family 17
mtd->read(0x1fbf8 bytes from 0x320408) returned ECC error
jffs2_scan_eraseblock(): Node at 0x00335a14 {0x1985, 0xe002, 0x0000044b) 
has invalid CRC 0xc79d4317 (calculated 0xc79d4397)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00335a18: 
0x044b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00335a1c: 
0x4317 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00335a20: 
0x03b3 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00335a24: 
0x0028 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00335a28: 
0x81ed instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00335a30: 
0x4a74 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00335a34: 
0xa241 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00335a38: 
0xa241 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00335a3c: 
0xa241 instead
Further such events for this erase block will not be printed
Empty flash at 0x01a4c5a8 ends at 0x01a4c800
Empty flash at 0x01a71548 ends at 0x01a71800
Empty flash at 0x01c974cc ends at 0x01c97800
Empty flash at 0x01f7f1ec ends at 0x01f7f800
Empty flash at 0x0202dd78 ends at 0x0202e000
Empty flash at 0x021bb850 ends at 0x021bc000
Empty flash at 0x023921c8 ends at 0x02392800
Empty flash at 0x024793e0 ends at 0x02479800
Empty flash at 0x027b9e54 ends at 0x027ba000
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 84K
mtd->read(0x44 bytes from 0x335e60) returned ECC error
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00335e60: Read 
0x6d989fd1, calculated 0xd1a48571
mtd->read(0x3f2 bytes from 0x335620) returned ECC error
jffs2_get_inode_nodes(): Data CRC failed on node at 0x003355dc: Read 
0xc9f2a6c2, calculated 0x3a9c8604
jffs2_get_inode_nodes(): Data CRC failed on node at 0x01a4b564: Read 
0x46bd3053, calculated 0xa1cecbbe
jffs2_get_inode_nodes(): Data CRC failed on node at 0x01f7efac: Read 
0xceff7023, calculated 0x7d174f5a
jffs2_get_inode_nodes(): Data CRC failed on node at 0x01c96488: Read 
0xc9f49189, calculated 0x7df38c4b
jffs2_get_inode_nodes(): Data CRC failed on node at 0x02391184: Read 
0xc869a0b9, calculated 0x777c9efb
jffs2_get_inode_nodes(): Data CRC failed on node at 0x026bb540: Read 
0x0ceb5936, calculated 0xdf626212
jffs2_get_inode_nodes(): Data CRC failed on node at 0x027b93d4: Read 
0x491a7085, calculated 0x6a8ab7a9
jffs2_get_inode_nodes(): Data CRC failed on node at 0x021bb694: Read 
0xf30656e5, calculated 0xb75cfdac
jffs2_get_inode_nodes(): Data CRC failed on node at 0x01a70504: Read 
0xadaa9d29, calculated 0xc94c9f9a
jffs2_get_inode_nodes(): Data CRC failed on node at 0x0247839c: Read 
0xdc965a8b, calculated 0x2606b314
jffs2_get_inode_nodes(): Data CRC failed on node at 0x0202cd34: Read 
0xfa9a425d, calculated 0x44ffb299
