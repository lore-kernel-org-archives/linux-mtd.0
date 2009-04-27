Received: from 32.27.354a.static.theplanet.com ([74.53.39.50]
	helo=UrlSunMail2.dellwebserver.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LyKkY-0003LQ-Oi
	for linux-mtd@lists.infradead.org; Mon, 27 Apr 2009 06:55:41 +0000
Received: from Internet5 [192.168.50.21] by Proxy+ with ESMTP
	for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2009 12:23:58 +0530
From: "Shailesh Panchal" <Shailesh.Panchal@Matrixtelesol.com>
To: <linux-mtd@lists.infradead.org>
Subject: Jffs2 file system get corrupt with multiple read/wite operation 
Date: Mon, 27 Apr 2009 12:24:09 +0530
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA/hGuTXQOIEaZbnWSCvcMzsKAAAAQAAAA0+flS67tW0Sy8Dcm03xziQEAAAAA@Matrixtelesol.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Reply-To: Shailesh Panchal <Shailesh.Panchal@Matrixtelesol.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear All,

I am newbe in linux-kernel development, currently we are working on custom
MPc8360 board,
We facing problem with jffs2 file system, when we read/write the jffs2 file
system,
It gets corrupt, help me. Here I am sending u kernel booting message with
jffs2 error,


I am using the linux-2.6.22 with Spansion flash S29GL256n. 


U-Boot 1.3.4 (Jan 22 2009 - 17:40:24) MPC83XX

Reset Status: Software Hard, External/Internal Soft, External/Internal Hard

CPU:   e300c1, MPC8360EA, Rev: 2.1 at 396 MHz, CSB: 264 MHz
Board: UCP - CPU card
I2C:   ready
DRAM:  256 MB (DDR2, 64-bit, ECC off, 264 MHz)
FLASH: 32 MB
In:    serial
Out:   serial
Err:   serial
Net:   FSL UEC0, FSL UEC1
Hit any key to stop autoboot:  3 \0x08\0x08\0x08 2 \0x08\0x08\0x08 1
\0x08\0x08\0x08 0 
## Booting kernel from Legacy Image at ffd00000 ...
   Image Name:   Linux-2.6.22
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    1382700 Bytes =  1.3 MB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
## Flattened Device Tree blob at fff00000
   Booting using the fdt blob at 0xfff00000
   Loading Device Tree to 007fa000, end 007fffff ... OK
Using MPC836x MDS machine description
Linux version 2.6.22 (saileshpanchal@saileshpanchal) (gcc version 4.3.2
(GCC) ) #312 Mon Apr 20 11:11:03 IST 2009
Ethernet PHY reset Done !

HW Revision is 2.1
Zone PFN ranges:
  DMA             0 ->    65536
  Normal      65536 ->    65536
early_node_map[1] active PFN ranges
    0:        0 ->    65536
Built 1 zonelists.  Total pages: 65024
Kernel command line: root=/dev/mtdblock1 rootfstype=jffs2
console=ttyS0,115200 clock=tsc
Warning! clock= boot option is deprecated. Use clocksource=xyz
IPIC (128 IRQ sources) at fdefd700
QEIC (64 IRQ sources) at fdefc080
PID hash table entries: 1024 (order: 10, 4096 bytes)
Console: colour dummy device 80x25
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 256316k/262144k available (2732k kernel code, 5524k reserved, 128k
data, 108k bss, 140k init)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
Generic PHY: Registered new driver
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP reno registered
JFFS2 version 2.2. (NAND) \0xc2\0xa9 2001-2006 Red Hat, Inc.
io scheduler noop registered
io scheduler anticipatory registered (default)
io scheduler deadline registered
io scheduler cfq registered
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0xe0004500 (irq = 16) is a 16550A
serial8250.0: ttyS1 at MMIO 0xe0004600 (irq = 17) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 32768K size 1024 blocksize
loop: module loaded
UCC Ethernet Controller MII Bus: probed
ucc_geth: QE UCC Gigabit Ethernet Controller

PHY interface = 1<6>
Max speed = 1000<6>ucc_geth: UCC1 at 0xe0102000 (irq = 22) 
calling register_netdev in ucc_geth.c
eth0: MTU=1500 (frame
size=1518,rx_buffer_size=1536,truesize=1792,sk_buff=160)

PHY interface = 1<6>
Max speed = 1000<6>ucc_geth: UCC2 at 0xe0103000 (irq = 23) 
calling register_netdev in ucc_geth.c
eth1: MTU=1500 (frame
size=1518,rx_buffer_size=1536,truesize=1792,sk_buff=160)

PHY interface = 4<6>
Max speed = 100<6>ucc_geth: UCC5 at 0xe0102400 (irq = 40) 
calling register_netdev in ucc_geth.c
eth2: MTU=1500 (frame
size=1518,rx_buffer_size=1536,truesize=1792,sk_buff=160)

PHY interface = 4<6>
Max speed = 100<6>ucc_geth: UCC8 at 0xe0103600 (irq = 43) 
calling register_netdev in ucc_geth.c
eth3: MTU=1500 (frame
size=1518,rx_buffer_size=1536,truesize=1792,sk_buff=160)
SKB Handler initialized(max=64)
Vitesse VSC8641: Registered new driver
Fixed PHY: Registered new driver
PPP generic driver version 2.4.2
NET: Registered protocol family 24
MPC8360E MDS flash device: 2000000 at fe000000 Partition number 4
Number of erase regions: 1
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum:  2.7 V
Vcc Maximum:  3.6 V
No Vpp line
Typical byte/word write timeout: 64 \0xc2\0xb5s
Maximum byte/word write timeout: 512 \0xc2\0xb5s
Typical full buffer write timeout: 64 \0xc2\0xb5s
Maximum full buffer write timeout: 2048 \0xc2\0xb5s
Typical block erase timeout: 512 ms
Maximum block erase timeout: 4096 ms
Typical chip erase timeout: 524288 ms
Maximum chip erase timeout: 2097152 ms
Device size: 0x2000000 bytes (32 MiB)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x40
Number of Erase Block Regions: 1
  Erase Region #0: BlockSize 0x20000 bytes, 256 blocks
MPC8360E MDS Flash Map Info: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
  Silicon revision: 10
  Address sensitive unlock: Required
  Erase Suspend: Read/write
  Block protection: 1 sectors per group
  Temporary block unprotect: Not supported
  Block protect/unprotect scheme: 8
  Number of simultaneous operations: 0
  Burst mode: Not supported
  Page mode: 8 word page
  Vpp Supply Minimum Program/Erase Voltage: 11.5 V
  Vpp Supply Maximum Program/Erase Voltage: 12.5 V
  Top/Bottom Boot Block: Uniform, Top WP
MPC8360E MDS Flash Map Info: CFI does not contain boot bank location.
Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 4 MTD partitions on "MPC8360E MDS Flash Map Info":
0x00000000-0x00100000 : "U-Boot"
0x00100000-0x01d00000 : "JFFS2"
0x01d00000-0x01f00000 : "Kernel"
0x01f00000-0x02000000 : "dtb"
MPC8360E MDS flash device (MPC8360E MDS Flash Map Info) initialized
fhci_hcd_of: 2007 June Freescale QE USB Host Driver 
fhci_hcd_of e01006c0.usb: FHCI HOST Controller
fhci_hcd_of e01006c0.usb: new USB bus registered, assigned bus number 1
fhci_hcd_of e01006c0.usb: irq 24, io base 0x00000000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
rtc-s35390a: dev (254:0)
rtc-s35390a 1-0030: rtc core: registered rtc-s35390a as rtc0
usbcore: registered new interface driver usbhid
drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
rtc-s35390a 1-0030: setting the system clock to 2009-04-22 12:08:48
(1240402128)
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 140k init
set the host name 
Mounting filesystems
Set up default network : 
Setting up networking on loopback device: 

Using QE_CLK_DUMMY in register 1 for UCC 0<6>
Using QE_CLK_DUMMY in register 3 for UCC 1fixed_mdio_get_phydev = 0
fixed_mdio_get_phydev = 1
mv: cannot rename '/matrix/MacConfig.sh': No such file or directory
Trying 100/FULL
Trying 100/FULL
PHY: 1:01 - Link is Up - 100/Full
PHY: 1:02 - Link is Up - 100/Full
Starting telnetd: 
Starting proftpd: 
now run usr application

Using QE_CLK_DUMMY in register 1 for UCC 0<6>
Using QE_CLK_DUMMY in register 3 for UCC 1ifconfig: SIOCSIFHWADDR: Device or
resource busy
ifconfig: SIOCSIFHWADDR: Device or resource busy
******************************************
 Create the Ramdisk partition
******************************************
10944 inodes
32768 blocks
Firstdatazone=350 (350)
Zonesize=1024
Maxsize=268966912
******************************************
 Run Matrix Driver
******************************************
Starting Matrix Gpio Driver
<4>Gpio: module license 'unspecified' taints kernel.
Major Number :  252
Starting Hpi Driver
Major Number :  251
******************************************
 Run application
******************************************
IpcQueue Appl started
IPC_INFO: Media msg queue Id = 0
IPC_INFO: Radius msg queue Id = 32769
IPC_INFO: SysLog msg queue Id = 65538
IPC_INFO: Smtp msg queue Id = 98307
IPC_INFO: DynDns msg queue Id = 131076
Sccessfully set application as SuperUser
Sccessfully set application Priority
sysLog: Successfully get syslog msg queue Id =65538
Registered SIGTERM Signal in MediaClient
Application Modified Date: Apr 18 2009 09:49:36
Sccessfully set application as SuperUser
Sccessfully set application Priority
TEST: Failed to open NetWork.cfg file
passwd: unknown user 1234
cp: cannot stat '../SnmpClient/Matrix_Change/snmpd.conf': No such file or
directory
Failed to set file pointer: No such file or directory

IP-PBX login: root
Password: 
Apr 22 12:11:15 login[861]: root login on 'ttyS0'
-sh: id: not found
-sh: id: not found
# ps
PID   USER     TIME   COMMAND
    1 root       0:04 init       
    2 root       0:00 [kthreadd]
    3 root       0:00 [ksoftirqd/0]
    4 root       0:00 [watchdog/0]
    5 root       0:00 [events/0]
    6 root       0:00 [khelper]
   31 root       0:00 [kblockd/0]
   35 root       0:00 [khubd]
   68 root       0:00 [pdflush]
   69 root       0:06 [pdflush]
   70 root       0:00 [kswapd0]
   71 root       0:00 [aio/0]
  701 root       0:00 [scsi_tgtd/0]
  704 root       0:00 [mtdblockd]
  735 root       0:00 [jffs2_gcd_mtd1]
  754 root       0:00 /usr/sbin/telnetd 
  761 admin      0:00 proftpd: (accepting connections)       
  790 root       0:00 ./matrix/appl/IpcQueue 
  792 root       0:00 ./matrix/appl/sysLogClient 
  794 root       0:00 ./matrix/appl/SmtpClient 
  796 root       0:00 ./matrix/appl/RadiusClient 
  798 root       0:08 ./matrix/appl/MediaClient 
  800 root       1:03 ./matrix/appl/IpPbx 
  860 root       0:00 ./webs 
  861 root       0:00 -sh 
  867 root       0:00 ps 

/bin/df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/root                28672     12248     16424  43% /
# /bin/df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/root                28672     12660     16012  44% /
# /bin/df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/root                28672     12704     15968  44% /
# ps
argh. node added in wrong place at 0x016e8d28(2)
nextblock 0x016e0000, expected at 016e9100
Unable to handle kernel paging request for data at address 0xffffffee
Faulting instruction address: 0xc00ed594
Oops: Kernel access of bad area, sig: 11 [#1]
DEBUG_PAGEALLOC MPC836x MDS
Modules linked in: DspHpi(P) Gpio(P)
NIP: c00ed594 LR: c00f1530 CTR: c017c49c
REGS: cf7e5b20 TRAP: 0300   Tainted: P        (2.6.22)
MSR: 00009032 <EE,ME,IR,DR>  CR: 88222088  XER: 00000000
DAR: ffffffee, DSISR: 20000000
TASK = cff4c7f0[861] 'sh' THREAD: cf7e4000
GPR00: c00f1530 cf7e5bd0 cff4c7f0 c0760800 ffffffea 00000000 ce9edd78
00000084 
GPR08: cefed598 00000000 00000000 cec3d968 28222024 1005f0f4 cf7e5c18
cf7e5c24 
GPR16: cf7e5c20 cf7e5c1c fffff000 ffffe002 00001985 00000000 00000000
00001000 
GPR24: 00000049 cef9a000 00000000 c0760800 ffffffea ceda9cd8 c0760800
cee564b4 
Call Trace:
[cf7e5bd0] [c00ec4f0]  (unreliable)
[cf7e5c10] [c00f1530] 
[cf7e5c80] [c00eb43c] 
[cf7e5cc0] [c00439f0] 
[cf7e5d80] [c004432c] 
[cf7e5e00] [c0044568] 
[cf7e5e30] [c0063a54] 
[cf7e5ef0] [c0064564] 
[cf7e5f10] [c0064724] 
[cf7e5f40] [c000f0cc] 
--- Exception: c01Instruction dump:
7d295810 7d294910 7d2900d0 7d234b78 4e800020 9421ffc0 7c0802a6 bf210024 
7c9c2379 7c7e1b78 90010044 41820380 <809c0004> 548007be 2f800001 419e021c 



Welcome to MATRIX IP-PBX
IP-PBX login: root
Password: 
Write of 117 bytes at 0x01580fd0 failed. returned -5, retlen 116
argh. node added in wrong place at 0x01580fd0(1)
nextblock 0x01580000, expected at 01581568
Apr 22 12:14:26 login[882]: root login on 'ttyS0'
-sh: id: not found
-sh: id: not found
# Node CRC 684614c0 != calculated CRC ed530c06 for node at 01580fd0


Reboot system 


U-Boot 1.3.4 (Jan 22 2009 - 17:40:24) MPC83XX

Reset Status:

CPU:   e300c1, MPC8360EA, Rev: 2.1 at 396 MHz, CSB: 264 MHz
Board: UCP - CPU card
I2C:   ready
DRAM:  256 MB (DDR2, 64-bit, ECC off, 264 MHz)
FLASH: 32 MB
In:    serial
Out:   serial
Err:   serial
Net:   FSL UEC0, FSL UEC1
Hit any key to stop autoboot:  3 \0x08\0x08\0x08 2 \0x08\0x08\0x08 1
\0x08\0x08\0x08 0 
## Booting kernel from Legacy Image at ffd00000 ...
   Image Name:   Linux-2.6.22
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    1382700 Bytes =  1.3 MB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
## Flattened Device Tree blob at fff00000
   Booting using the fdt blob at 0xfff00000
   Loading Device Tree to 007fa000, end 007fffff ... OK
Using MPC836x MDS machine description
Linux version 2.6.22 (saileshpanchal@saileshpanchal) (gcc version 4.3.2
(GCC) ) #312 Mon Apr 20 11:11:03 IST 2009
Ethernet PHY reset Done !

HW Revision is 2.1
Zone PFN ranges:
  DMA             0 ->    65536
  Normal      65536 ->    65536
early_node_map[1] active PFN ranges
    0:        0 ->    65536
Built 1 zonelists.  Total pages: 65024
Kernel command line: root=/dev/mtdblock1 rootfstype=jffs2
console=ttyS0,115200 clock=tsc
Warning! clock= boot option is deprecated. Use clocksource=xyz
IPIC (128 IRQ sources) at fdefd700
QEIC (64 IRQ sources) at fdefc080
PID hash table entries: 1024 (order: 10, 4096 bytes)
Console: colour dummy device 80x25
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 256316k/262144k available (2732k kernel code, 5524k reserved, 128k
data, 108k bss, 140k init)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
Generic PHY: Registered new driver
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP reno registered
JFFS2 version 2.2. (NAND) \0xc2\0xa9 2001-2006 Red Hat, Inc.
io scheduler noop registered
io scheduler anticipatory registered (default)
io scheduler deadline registered
io scheduler cfq registered
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0xe0004500 (irq = 16) is a 16550A
serial8250.0: ttyS1 at MMIO 0xe0004600 (irq = 17) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 32768K size 1024 blocksize
loop: module loaded
UCC Ethernet Controller MII Bus: probed
ucc_geth: QE UCC Gigabit Ethernet Controller

PHY interface = 1<6>
Max speed = 1000<6>ucc_geth: UCC1 at 0xe0102000 (irq = 22) 
calling register_netdev in ucc_geth.c
eth0: MTU=1500 (frame
size=1518,rx_buffer_size=1536,truesize=1792,sk_buff=160)

PHY interface = 1<6>
Max speed = 1000<6>ucc_geth: UCC2 at 0xe0103000 (irq = 23) 
calling register_netdev in ucc_geth.c
eth1: MTU=1500 (frame
size=1518,rx_buffer_size=1536,truesize=1792,sk_buff=160)

PHY interface = 4<6>
Max speed = 100<6>ucc_geth: UCC5 at 0xe0102400 (irq = 40) 
calling register_netdev in ucc_geth.c
eth2: MTU=1500 (frame
size=1518,rx_buffer_size=1536,truesize=1792,sk_buff=160)

PHY interface = 4<6>
Max speed = 100<6>ucc_geth: UCC8 at 0xe0103600 (irq = 43) 
calling register_netdev in ucc_geth.c
eth3: MTU=1500 (frame
size=1518,rx_buffer_size=1536,truesize=1792,sk_buff=160)
SKB Handler initialized(max=64)
Vitesse VSC8641: Registered new driver
Fixed PHY: Registered new driver
PPP generic driver version 2.4.2
NET: Registered protocol family 24
MPC8360E MDS flash device: 2000000 at fe000000 Partition number 4
Number of erase regions: 1
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum:  2.7 V
Vcc Maximum:  3.6 V
No Vpp line
Typical byte/word write timeout: 64 \0xc2\0xb5s
Maximum byte/word write timeout: 512 \0xc2\0xb5s
Typical full buffer write timeout: 64 \0xc2\0xb5s
Maximum full buffer write timeout: 2048 \0xc2\0xb5s
Typical block erase timeout: 512 ms
Maximum block erase timeout: 4096 ms
Typical chip erase timeout: 524288 ms
Maximum chip erase timeout: 2097152 ms
Device size: 0x2000000 bytes (32 MiB)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x40
Number of Erase Block Regions: 1
  Erase Region #0: BlockSize 0x20000 bytes, 256 blocks
MPC8360E MDS Flash Map Info: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
  Silicon revision: 10
  Address sensitive unlock: Required
  Erase Suspend: Read/write
  Block protection: 1 sectors per group
  Temporary block unprotect: Not supported
  Block protect/unprotect scheme: 8
  Number of simultaneous operations: 0
  Burst mode: Not supported
  Page mode: 8 word page
  Vpp Supply Minimum Program/Erase Voltage: 11.5 V
  Vpp Supply Maximum Program/Erase Voltage: 12.5 V
  Top/Bottom Boot Block: Uniform, Top WP
MPC8360E MDS Flash Map Info: CFI does not contain boot bank location.
Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 4 MTD partitions on "MPC8360E MDS Flash Map Info":
0x00000000-0x00100000 : "U-Boot"
0x00100000-0x01d00000 : "JFFS2"
0x01d00000-0x01f00000 : "Kernel"
0x01f00000-0x02000000 : "dtb"
MPC8360E MDS flash device (MPC8360E MDS Flash Map Info) initialized
fhci_hcd_of: 2007 June Freescale QE USB Host Driver 
fhci_hcd_of e01006c0.usb: FHCI HOST Controller
fhci_hcd_of e01006c0.usb: new USB bus registered, assigned bus number 1
fhci_hcd_of e01006c0.usb: irq 24, io base 0x00000000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
rtc-s35390a: dev (254:0)
rtc-s35390a 1-0030: rtc core: registered rtc-s35390a as rtc0
usbcore: registered new interface driver usbhid
drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
rtc-s35390a 1-0030: setting the system clock to 2009-04-22 12:16:00
(1240402560)
jffs2_scan_eraseblock(): Node at 0x01580fd0 {0x1985, 0xe002, 0x00000014) has
invalid CRC 0xb1012000 (calculated 0xcf8473ca)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01580fd8:
0xb101 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01580ff0:
0x49ef instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01580ff4:
0x49ef instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01580ff8:
0x49ef instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01581008:
0x0600 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0158100c:
0x0483 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01581010:
0x6846 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01581014:
0x785e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01581018:
0x6700 instead
Further such events for this erase block will not be printed
jffs2_scan_eraseblock(): Node at 0x016e8d28 {0x1985, 0xe002, 0x00000044) has
invalid CRC 0x00ca022e (calculated 0xa4ef223e)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016e8d30:
0x00ca instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016e8d48:
0x49ef instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016e8d4c:
0x49ef instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016e8d50:
0x49ef instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016e8d68:
0x8810 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016e8d6c:
0x785e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016e8d70:
0x3f48 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016e8d74:
0x1cc7 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x016e8d78:
0x6988 instead
Further such events for this erase block will not be printed
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 140k init
set the host name 
Mounting filesystems
Set up default network : 
Setting up networking on loopback device: 

Using QE_CLK_DUMMY in register 1 for UCC 0<6>
Using QE_CLK_DUMMY in register 3 for UCC 1


Regards,
shailesh
