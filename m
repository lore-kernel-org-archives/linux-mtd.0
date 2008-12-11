Received: from web58902.mail.re1.yahoo.com ([66.196.100.231])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAs9l-0000hi-6F
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 20:29:10 +0000
Date: Thu, 11 Dec 2008 12:29:07 -0800 (PST)
From: Philip Rakity <prakity@yahoo.com>
Subject: UBIFS:  HELP --- cannot figure out correct linux bootline values
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <704760.43815.qm@web58902.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Can someone help.

Can mount if I boot from nfs --- cannot figure out commands for booting from linux..

Philip

    ========================================
    foxes-linux:~# ubiattach /dev/ubi_ctrl -m 3
    UBI device number 0, total 8186 LEBs (2112380928 bytes, 2.0 GiB), available 380 LEBs (98058240 bytes, 93.5 MiB), LEB size 258048 bytes (252.0 KiB)
    foxes-linux:~# cat /proc/mtd 
    dev:    size       erasesize  name
    mtd0: 000000100000 00020000 "u-boot"
    mtd1: 000000200000 00020000 "uImage"
    mtd2: 000007d00000 00020000 "root"
    mtd3: 000080000000 00040000 "cafe_nand"
    mtd4: 000076c17000 0003f000 "rootfs"
    foxes-linux:~# ubinfo /dev/ubi
    ubi0      ubi0_0    ubi_ctrl  
    foxes-linux:~# ubinfo /dev/ubi0_0
    Volume ID:   0 (on ubi0)
    Type:        dynamic
    Alignment:   1
    Size:        7721 LEBs (1992388608 bytes, 1.9 GiB)
    State:       OK
    Name:        rootfs
    Character device major/minor: 253:1
    foxes-linux:~# ubinfo /dev/ubi0_0 -a

- Ignored:
    Volume ID:   0 (on ubi0)
    Type:        dynamic
    Alignment:   1
    Size:        7721 LEBs (1992388608 bytes, 1.9 GiB)
    State:       OK
    Name:        rootfs
    Character device major/minor: 253:1
    
    foxes-linux:~# mount -t ubifs ubi0 /mnt/root
    foxes-linux:~# cd /mnt/root/
    foxes-linux:/mnt/root# ls
    apps  boot  etc   lib         media  opt   root  selinux  sys  usr
    bin   dev   home  lost+found  mnt    proc  sbin  srv      tmp  var
    
    =============
    boot output
    ===========
    
    Uncompressing Linux........................................................................................................................................................
done.
    Linux version 2.6.22.18 (ap85@MSI-BBU-S1) (gcc version 3.4.4 (release) (CodeSourcery ARM 2005q3-2)) #26 Wed Dec 10 15:57:41 PST 2008
    CPU: ARM926EJ-S [56251311] revision 1 (ARMv5TE), cr=00053977
    Machine: Feroceon-KW
    Using UBoot passing parameters structure
    Memory policy: ECC disabled, Data cache writeback
    CPU0: D VIVT write-back cache
    CPU0: I cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
    CPU0: D cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
    Built 1 zonelists.  Total pages: 130048
    Kernel command line: console=ttyS0,115200 ubi.mtd=3 root=ubi0 rootfstype=ubifs ip=dhcp
    PID hash table entries: 2048 (order: 11, 8192 bytes)
    Console: colour dummy device 80x30
    Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
    Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
    Memory: 256MB 256MB 0MB 0MB = 512MB total
    Memory: 514816KB available (4444K code, 313K data, 128K init)
    Mount-cache hash table entries: 512
    CPU: Testing write buffer coherency: ok
    NET: Registered protocol family 16
    
    CPU Interface
    -------------
    SDRAM_CS0 ....base 00000000, size 256MB 
    SDRAM_CS1 ....base 10000000, size 256MB 
    SDRAM_CS2 ....disable
    SDRAM_CS3 ....disable
    PEX0_MEM ....base e8000000, size 128MB 
    PEX0_IO ....base f2000000, size   1MB 
    INTER_REGS ....base f1000000, size   1MB 
    NFLASH_CS ....base fa000000, size   2MB 
    SPI_CS ....base f4000000, size  16MB 
    BOOT_ROM_CS ....no such
    DEV_BOOTCS ....no such
    CRYPT_ENGSAGE_UNIT ....base f0000000, size   2MB 
    
      Marvell Development Board (LSP Version KW_LSP_4.1.4)-- DB-88F6281-BP  Soc: 88F6281 Z0 LE
    
     Detected Tclk 166666667 and SysClk 400000000 
    MV Buttons Device Load
    MV SPI Device Load
    Marvell USB EHCI Host controller #0: c095e600
    PCI: bus0: Fast back to back transfers disabled
    PCI: bus1: Fast back to back transfers disabled
    PCI: Bridge: 0000:00:01.0
      IO window: disabled.
      MEM window: e8000000-e8bfffff
      PREFETCH window: disabled.
    pci 0000:00:01.0: Error creating sysfs bridge symlink, continuing...
    SCSI subsystem initialized
    usbcore: registered new interface driver usbfs
    usbcore: registered new interface driver hub
    usbcore: registered new device driver usb
    NET: Registered protocol family 2
    Time: kw_clocksource clocksource has been installed.
    IP route cache hash table entries: 16384 (order: 4, 65536 bytes)
    TCP established hash table entries: 65536 (order: 7, 524288 bytes)
    TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
    TCP: Hash tables configured (established 65536 bind 65536)
    TCP reno registered
    RTC registered
    Use the XOR engines (acceleration) for enhancing the following functions:
      o RAID 5 Xor calculation
      o kernel memcpy
      o kenrel memzero
      o copy user to/from kernel buffers
    Number of XOR engines to use: 4
    cesadev_init(c000cf1c)
    mvCesaInit: sessions=640, queue=64, pSram=f0000000
    MV Buttons Driver Load
    JFFS2 version 2.2. (NAND) (SUMMARY)  .... 2001-2006 Red Hat, Inc.
    JFS: nTxBlock = 4022, nTxLock = 32179
    io scheduler noop registered
    io scheduler anticipatory registered (default)
    Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
    serial8250.0: ttyS0 at MMIO 0xf1012000 (irq = 33) is a 16550A
    serial8250.0: ttyS1 at MMIO 0xf1012100 (irq = 34) is a 16550A
    sm501 0000:01:07.0: SM501 At e0c00000: Version 050100c0, 0 Mb, IRQ 9
    sm501 0000:01:07.0: SM502 is detected.
    sm501 0000:01:07.0: clock 2a1a0209, mode 00000000
    sm501 0000:01:07.0: clock 2a1a0201, mode 00000000
    sm501-fb[0] flags 00000200: e8880000..e888ffff
    sm501-fb[1] flags 00000200: e8900000..e894ffff
    sm501-fb[2] flags 00000200: e8000000..e87fffff
    sm501-fb[3] flags 00000400: 00000009..00000009
    sm501-fb sm501-fb.88: fb sm501fb-crt disabled at start
    sm501-fb sm501-fb.88: fb sm501fb-panel disabled at start
    sm501 0000:01:07.0: clock 401a0201, mode 00000000
    sm501 0000:01:07.0: clock 401a0201, mode 00000000
    Console: switching to colour frame buffer device 128x75
    Intel(R) PRO/1000 Network Driver - version 7.3.20-k2-NAPI
    Copyright (c) 1999-2006 Intel Corporation.
    Marvell Ethernet Driver egiga:
      o Cached descriptors in DRAM
      o DRAM SW cache-coherency
      o TCP segmentation offload enabled
      o Checksum offload enabled
      o Network Fast Processing (Routing) supported
      o Driver statistics enabled
      o Proc tool API enabled
      o Rx desc: 128
      o Tx desc: 276
      o Loading network interface 'egiga0' 
    Warning: Giga 1 is Powered Off
    
    Network Fast Processing Disabled
    mvFpRuleDb (df8d0000): 16384 entries, 65536 bytes
    e100: Intel(R) PRO/100 Network Driver, 3.5.17-k4-NAPI
    e100: Copyright(c) 1999-2006 Intel Corporation
    Linux video capture interface: v2.00
    Marvell M88ALP01 'CAFE' Camera Controller version 4
    OmniVision ov7670 sensor driver, at your service
    cafe1000-ccic 0000:01:08.2: SMBUS write (42/12/80) timed out
    OmniVision ov7680 sensor driver, at your service
    cafe1000-ccic 0000:01:08.2: SMBUS write (42/12/80) timed out
    Intergrated Sata device found
    scsi0 : Marvell SCSI to SATA adapter
    scsi1 : Marvell SCSI to SATA adapter
    NFTL driver: nftlcore.c $Revision: 1.98 $, nftlmount.c $Revision: 1.41 $
    NAND device: Manufacturer ID: 0x20, Chip ID: 0xf1 (ST Micro NAND 128MiB 3,3V 8-bit)
    create_bbt:Scanning device for bad blocks
    enter parse_mtd_partitions
    parse_mtd_partitions: parser = c049e68c, type = cmdlinepart
    Using static partition definition
    Creating 3 MTD partitions on "nand_mtd":
    0x00000000-0x100000 : "u-boot"
    add_mtd_partitions:position = 17, size = 8 (100000), eraseSize = 1 (20000)
    0x00100000-0x300000 : "uImage"
    add_mtd_partitions:position = 17, size = 10 (200000), eraseSize = 1 (20000)
    0x00300000-0x8000000 : "root"
    add_mtd_partitions:position = 17, size = 3e8 (7d00000), eraseSize = 1 (20000)
    CAF.. NAND 0000:01:08.0: Timing registers unset; using most conservative defaults
    NAND device: Manufacturer ID: 0xec, Chip ID: 0xd5 (Samsung NAND 2GiB 3,3V 8-bit)
    cafe->nand.ecc.mode = 3, mtd->writesize = 800
    cafe_nand_probe:Timing registers already set (ffffffff ffffffff ffffffff)
            Register 0: 64000000
            Register 4: 28000000
            Register 8: 40000000
            Register c: 40000000
            Register 10: 00000000
            Register 14: ffffffff
            Register 18: 00000840
            Register 1c: 00000000
            Register 20: 000fff80
            Register 24: ffffffff
            Register 28: ffffffff
            Register 2c: ffffffff
            Register 30: 00000000
            Register 34: 00000000
            Register 38: 005ece4c
            Register 3c: 00020000
            Register 40: a0000840
            Register 44: 1f916000
            Register 48: 00000000
            Register 4c: 00000000
            Register 50: 00000000
            Register 54: 00000000
            Register 58: 00000000
            Register 5c: 00000000
            Register 60: 00000000
            Register 64: 0000000f
    calling parse_mtd_partitions
    enter parse_mtd_partitions
    parse_mtd_partitions: parser = c049e68c, type = cmdlinepart
    parse_mtd_partitions: parser = 00000000, type = RedBoot
    RedBoot partition parsing not available
    cafe_nand_probe: nr_parts = -22
    UBI: attaching mtd3 to ubi0
    UBI: physical eraseblock size:   262144 bytes (256 KiB)
    UBI: logical eraseblock size:    258048 bytes
    UBI: smallest flash I/O unit:    2048
    UBI: VID header offset:          2048 (aligned 2048)
    UBI: data offset:                4096
    UBI: attached mtd3 to ubi0
    UBI: MTD device name:            "cafe_nand"
    UBI: MTD device size:            2048 MiB
    UBI: number of good PEBs:        8186
    UBI: number of bad PEBs:         6
    UBI: max. allowed volumes:       128
    UBI: wear-leveling threshold:    4096
    UBI: number of internal volumes: 1
    UBI: number of user volumes:     1
    UBI: available PEBs:             380
    UBI: total number of reserved PEBs: 7806
    UBI: number of PEBs reserved for bad PEB handling: 81
    UBI: max/mean erase counter: 2/0
    UBI: background thread "ubi_bgt0d" started, PID 330
    ehci_marvell ehci_marvell.70059: Marvell Orion EHCI
    ehci_marvell ehci_marvell.70059: new USB bus registered, assigned bus number 1
    ehci_marvell ehci_marvell.70059: irq 19, io base 0xf1050100
    ehci_marvell ehci_marvell.70059: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
    usb usb1: configuration #1 chosen from 1 choice
    hub 1-0:1.0: USB hub found
    hub 1-0:1.0: 1 port detected
    USB Universal Host Controller Interface driver v3.0
    usb 1-1: new high speed USB device using ehci_marvell and address 2
    usb 1-1: configuration #1 chosen from 1 choice
    hub 1-1:1.0: USB hub found
    hub 1-1:1.0: 4 ports detected
    usb 1-1.2: new low speed USB device using ehci_marvell and address 3
    usb 1-1.2: configuration #1 chosen from 1 choice
    usb 1-1.3: new low speed USB device using ehci_marvell and address 4
    usb 1-1.3: configuration #1 chosen from 1 choice
    usbcore: registered new interface driver usblp
    drivers/usb/class/usblp.c: v0.13: USB Printer Device Class driver
    Initializing USB Mass Storage driver...
    usbcore: registered new interface driver usb-storage
    USB Mass Storage support registered.
    mice: PS/2 mouse device common for all mice
    i2c /dev entries driver
    Linux telephony interface: v1.00
    Marvell Telephony Driver:
    
    Warning Tdm is Powered Off
    md: linear personality registered for level -1
    md: raid0 personality registered for level 0
    md: raid1 personality registered for level 1
    raid6: int32x1    101 MB/s
    raid6: int32x2    146 MB/s
    raid6: int32x4    127 MB/s
    raid6: int32x8    112 MB/s
    raid6: using algorithm int32x2 (146 MB/s)
    md: raid6 personality registered for level 6
    md: raid5 personality registered for level 5
    md: raid4 personality registered for level 4
    raid5: measuring checksumming speed
       arm4regs  :   978.000 MB/sec
       8regs     :   632.000 MB/sec
       32regs    :   845.200 MB/sec
    raid5: using function: arm4regs (978.000 MB/sec)
    device-mapper: ioctl: 4.11.0-ioctl (2006-10-12) initialised: dm-devel@redhat.com
    dm_crypt using the OCF package.
    sdhci: Secure Digital Host Controller Interface driver
    sdhci: Copyright(c) Pierre Ossman
    sdhci: SDHCI controller found at 0000:01:08.1 [11ab:4101] (rev 10)
    sdhci: Invalid iomem size. You may experience problems.
    sdhci_set_clock: clock=0
    mmc0: SDHCI at 0xe8a04000 irq 9 DMA
    sdhci_set_clock: clock=0
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    input: Dell Dell USB Keyboard as /class/input/input0
    input: USB HID v1.10 Keyboard [Dell Dell USB Keyboard] on usb-ehci_marvell.70059-1.2
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    input: Logitech Optical USB Mouse as /class/input/input1
    input: USB HID v1.10 Mouse [Logitech Optical USB Mouse] on usb-ehci_marvell.70059-1.3
    usbcore: registered new interface driver usbhid
    drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver
    Advanced Linux Sound Architecture Driver Version 1.0.14 (Thu May 31 09:03:25 2007 UTC).
    sdhci_set_clock: clock=0
    ALSA device list:
      No soundcards found.
    oprofile: using timer interrupt.
    TCP cubic registered
    NET: Registered protocol family 1
    NET: Registered protocol family 17
    ieee80211: 802.11 data/management/control stack, git-1.1.13
    ieee80211: Copyright (C) 2004-2005 Intel Corporation <jketreno@linux.intel.com>
    mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
    mvsdmmc_irq: mvsdmmc_check_error returned error -71
    mvsdmmc: command,data error 
    mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0x4813
    mvsdmmc_irq: mvsdmmc_check_error returned error -71
    mvsdmmc: command,data error 
    mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0x4813
    mvsdmmc_irq: mvsdmmc_check_error returned error -71
    mvsdmmc: command,data error 
    mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
    mvsdmmc_irq: mvsdmmc_check_error returned error -71
    mvsdmmc: command,data error 
    mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
    mvsdmmc_irq: mvsdmmc_check_error returned error -71
    mvsdmmc: command,data error 
    mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
    mvsdmmc_irq: mvsdmmc_check_error returned error -71
    mvsdmmc: command,data error 
    mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0x4813
    mvsdmmc_irq: mvsdmmc_check_error returned error -71
    mvsdmmc: command,data error 
    mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
    mvsdmmc_irq: mvsdmmc_check_error returned error -71
    mvsdmmc: command,data error 
    mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
    mvsdmmc_irq: mvsdmmc_check_error returned error -71
    mvsdmmc: command,data error 
    mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
    mvsdmmc_irq: mvsdmmc_check_error returned error -71
    mvsdmmc: command,data error 
    mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0x4813
    mvsdmmc_irq: mvsdmmc_check_error returned error -71
    mvsdmmc: command,data error 
    egiga0: link down
    egiga0: started
    sdhci_set_clock: clock=0
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=187500
    sdhci_set_clock: clock=48000000
    sdhci_set_clock: clock=48000000
    mmc0: new high speed SDHC card at address dffd
    mmcblk0: mmc0:dffd SD08G 7782400KiB 
     mmcblk0: p1
    Sending DHCP requests .<5>egiga0: link up, full duplex, speed 1 Gbps
    ., OK
    IP-Config: Got DHCP answer from 0.0.0.0, my address is 10.81.40.132
    IP-Config: Complete:
          device=egiga0, addr=10.81.40.132, mask=255.255.252.0, gw=10.81.40.1,
         host=10.81.40.132, domain=marvell.com, nis-domain=(none),
         bootserver=0.0.0.0, rootserver=0.0.0.0, rootpath=
    md: Autodetecting RAID arrays.
    md: autorun ...
    md: ... autorun DONE.
    VFS: Cannot open root device "ubi0" or unknown-block(0,0)
    Please append a correct "root=" boot option; here are the available partitions:
    1f00       1024 mtdblock0 (driver?)
    1f01       2048 mtdblock1 (driver?)
    1f02     128000 mtdblock2 (driver?)
    1f03    2097152 mtdblock3 (driver?)
    1f04    1945692 mtdblock4 (driver?)
    b300    7782400 mmcblk0 driver: mmcblk
      b301    7782392 mmcblk0p1
    Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
    
    
          
    

- Done.




-----Inline Message Follows-----

Output from Manually mounting the disk !
========================================

foxes-linux:~# ubiattach /dev/ubi_ctrl -m 3
UBI
device number 0, total 8186 LEBs (2112380928 bytes, 2.0 GiB), available
380 LEBs (98058240 bytes, 93.5 MiB), LEB size 258048 bytes (252.0 KiB)

foxes-linux:~# cat /proc/mtd 
dev:    size       erasesize  name
mtd0: 000000100000 00020000 "u-boot"
mtd1: 000000200000 00020000 "uImage"
mtd2: 000007d00000 00020000 "root"
mtd3: 000080000000 00040000 "cafe_nand"
mtd4: 000076c17000 0003f000 "rootfs"

foxes-linux:~# ubinfo /dev/ubi
ubi0      ubi0_0    ubi_ctrl  
foxes-linux:~# ubinfo /dev/ubi0_0
Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        7721 LEBs (1992388608 bytes, 1.9 GiB)
State:       OK
Name:        rootfs
Character device major/minor: 253:1
foxes-linux:~# ubinfo /dev/ubi0_0 -a
Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        7721 LEBs (1992388608 bytes, 1.9 GiB)
State:       OK
Name:        rootfs
Character device major/minor: 253:1

foxes-linux:~# mount -t ubifs ubi0 /mnt/root
foxes-linux:~# cd /mnt/root/
foxes-linux:/mnt/root# ls
apps  boot  etc   lib         media  opt   root  selinux  sys  usr
bin   dev   home  lost+found  mnt    proc  sbin  srv      tmp  var

=============
boot output
===========

Uncompressing
Linux........................................................................................................................................................
done.
Linux version 2.6.22.18 (ap85@MSI-BBU-S1) (gcc version 3.4.4
(release) (CodeSourcery ARM 2005q3-2)) #26 Wed Dec 10 15:57:41 PST 2008
CPU: ARM926EJ-S [56251311] revision 1 (ARMv5TE), cr=00053977
Machine: Feroceon-KW
Using UBoot passing parameters structure
Memory policy: ECC disabled, Data cache writeback
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
CPU0: D cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
Built 1 zonelists.  Total pages: 130048
Kernel command line: console=ttyS0,115200 ubi.mtd=3 root=ubi0 rootfstype=ubifs ip=dhcp
PID hash table entries: 2048 (order: 11, 8192 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 256MB 256MB 0MB 0MB = 512MB total
Memory: 514816KB available (4444K code, 313K data, 128K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16

CPU Interface
-------------
SDRAM_CS0 ....base 00000000, size 256MB 
SDRAM_CS1 ....base 10000000, size 256MB 
SDRAM_CS2 ....disable
SDRAM_CS3 ....disable
PEX0_MEM ....base e8000000, size 128MB 
PEX0_IO ....base f2000000, size   1MB 
INTER_REGS ....base f1000000, size   1MB 
NFLASH_CS ....base fa000000, size   2MB 
SPI_CS ....base f4000000, size  16MB 
BOOT_ROM_CS ....no such
DEV_BOOTCS ....no such
CRYPT_ENGSAGE_UNIT ....base f0000000, size   2MB 

  Marvell Development Board (LSP Version KW_LSP_4.1.4)-- DB-88F6281-BP  Soc: 88F6281 Z0 LE

Detected Tclk 166666667 and SysClk 400000000 
MV Buttons Device Load
MV SPI Device Load
Marvell USB EHCI Host controller #0: c095e600
PCI: bus0: Fast back to back transfers disabled
PCI: bus1: Fast back to back transfers disabled
PCI: Bridge: 0000:00:01.0
  IO window: disabled.
  MEM window: e8000000-e8bfffff
  PREFETCH window: disabled.
pci 0000:00:01.0: Error creating sysfs bridge symlink, continuing...
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
Time: kw_clocksource clocksource has been installed.
IP route cache hash table entries: 16384 (order: 4, 65536 bytes)
TCP established hash table entries: 65536 (order: 7, 524288 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 65536 bind 65536)
TCP reno registered
RTC registered
Use the XOR engines (acceleration) for enhancing the following functions:
  o RAID 5 Xor calculation
  o kernel memcpy
  o kenrel memzero
  o copy user to/from kernel buffers
Number of XOR engines to use: 4
cesadev_init(c000cf1c)
mvCesaInit: sessions=640, queue=64, pSram=f0000000
MV Buttons Driver Load
JFFS2 version 2.2. (NAND) (SUMMARY)  .... 2001-2006 Red Hat, Inc.
JFS: nTxBlock = 4022, nTxLock = 32179
io scheduler noop registered
io scheduler anticipatory registered (default)
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0xf1012000 (irq = 33) is a 16550A
serial8250.0: ttyS1 at MMIO 0xf1012100 (irq = 34) is a 16550A
sm501 0000:01:07.0: SM501 At e0c00000: Version 050100c0, 0 Mb, IRQ 9
sm501 0000:01:07.0: SM502 is detected.
sm501 0000:01:07.0: clock 2a1a0209, mode 00000000
sm501 0000:01:07.0: clock 2a1a0201, mode 00000000
sm501-fb[0] flags 00000200: e8880000..e888ffff
sm501-fb[1] flags 00000200: e8900000..e894ffff
sm501-fb[2] flags 00000200: e8000000..e87fffff
sm501-fb[3] flags 00000400: 00000009..00000009
sm501-fb sm501-fb.88: fb sm501fb-crt disabled at start
sm501-fb sm501-fb.88: fb sm501fb-panel disabled at start
sm501 0000:01:07.0: clock 401a0201, mode 00000000
sm501 0000:01:07.0: clock 401a0201, mode 00000000
Console: switching to colour frame buffer device 128x75
Intel(R) PRO/1000 Network Driver - version 7.3.20-k2-NAPI
Copyright (c) 1999-2006 Intel Corporation.
Marvell Ethernet Driver egiga:
  o Cached descriptors in DRAM
  o DRAM SW cache-coherency
  o TCP segmentation offload enabled
  o Checksum offload enabled
  o Network Fast Processing (Routing) supported
  o Driver statistics enabled
  o Proc tool API enabled
  o Rx desc: 128
  o Tx desc: 276
  o Loading network interface 'egiga0' 
Warning: Giga 1 is Powered Off

Network Fast Processing Disabled
mvFpRuleDb (df8d0000): 16384 entries, 65536 bytes
e100: Intel(R) PRO/100 Network Driver, 3.5.17-k4-NAPI
e100: Copyright(c) 1999-2006 Intel Corporation
Linux video capture interface: v2.00
Marvell M88ALP01 'CAFE' Camera Controller version 4
OmniVision ov7670 sensor driver, at your service
cafe1000-ccic 0000:01:08.2: SMBUS write (42/12/80) timed out
OmniVision ov7680 sensor driver, at your service
cafe1000-ccic 0000:01:08.2: SMBUS write (42/12/80) timed out
Intergrated Sata device found
scsi0 : Marvell SCSI to SATA adapter
scsi1 : Marvell SCSI to SATA adapter
NFTL driver: nftlcore.c $Revision: 1.98 $, nftlmount.c $Revision: 1.41 $
NAND device: Manufacturer ID: 0x20, Chip ID: 0xf1 (ST Micro NAND 128MiB 3,3V 8-bit)
create_bbt:Scanning device for bad blocks
enter parse_mtd_partitions
parse_mtd_partitions: parser = c049e68c, type = cmdlinepart
Using static partition definition
Creating 3 MTD partitions on "nand_mtd":
0x00000000-0x100000 : "u-boot"
add_mtd_partitions:position = 17, size = 8 (100000), eraseSize = 1 (20000)
0x00100000-0x300000 : "uImage"
add_mtd_partitions:position = 17, size = 10 (200000), eraseSize = 1 (20000)
0x00300000-0x8000000 : "root"
add_mtd_partitions:position = 17, size = 3e8 (7d00000), eraseSize = 1 (20000)
CAF.. NAND 0000:01:08.0: Timing registers unset; using most conservative defaults
NAND device: Manufacturer ID: 0xec, Chip ID: 0xd5 (Samsung NAND 2GiB 3,3V 8-bit)
cafe->nand.ecc.mode = 3, mtd->writesize = 800
cafe_nand_probe:Timing registers already set (ffffffff ffffffff ffffffff)
        Register 0: 64000000
        Register 4: 28000000
        Register 8: 40000000
        Register c: 40000000
        Register 10: 00000000
        Register 14: ffffffff
        Register 18: 00000840
        Register 1c: 00000000
        Register 20: 000fff80
        Register 24: ffffffff
        Register 28: ffffffff
        Register 2c: ffffffff
        Register 30: 00000000
        Register 34: 00000000
        Register 38: 005ece4c
        Register 3c: 00020000
        Register 40: a0000840
        Register 44: 1f916000
        Register 48: 00000000
        Register 4c: 00000000
        Register 50: 00000000
        Register 54: 00000000
        Register 58: 00000000
        Register 5c: 00000000
        Register 60: 00000000
        Register 64: 0000000f
calling parse_mtd_partitions
enter parse_mtd_partitions
parse_mtd_partitions: parser = c049e68c, type = cmdlinepart
parse_mtd_partitions: parser = 00000000, type = RedBoot
RedBoot partition parsing not available
cafe_nand_probe: nr_parts = -22
UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    258048 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd3 to ubi0
UBI: MTD device name:            "cafe_nand"
UBI: MTD device size:            2048 MiB
UBI: number of good PEBs:        8186
UBI: number of bad PEBs:         6
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             380
UBI: total number of reserved PEBs: 7806
UBI: number of PEBs reserved for bad PEB handling: 81
UBI: max/mean erase counter: 2/0
UBI: background thread "ubi_bgt0d" started, PID 330
ehci_marvell ehci_marvell.70059: Marvell Orion EHCI
ehci_marvell ehci_marvell.70059: new USB bus registered, assigned bus number 1
ehci_marvell ehci_marvell.70059: irq 19, io base 0xf1050100
ehci_marvell ehci_marvell.70059: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
USB Universal Host Controller Interface driver v3.0
usb 1-1: new high speed USB device using ehci_marvell and address 2
usb 1-1: configuration #1 chosen from 1 choice
hub 1-1:1.0: USB hub found
hub 1-1:1.0: 4 ports detected
usb 1-1.2: new low speed USB device using ehci_marvell and address 3
usb 1-1.2: configuration #1 chosen from 1 choice
usb 1-1.3: new low speed USB device using ehci_marvell and address 4
usb 1-1.3: configuration #1 chosen from 1 choice
usbcore: registered new interface driver usblp
drivers/usb/class/usblp.c: v0.13: USB Printer Device Class driver
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
mice: PS/2 mouse device common for all mice
i2c /dev entries driver
Linux telephony interface: v1.00
Marvell Telephony Driver:

Warning Tdm is Powered Off
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
raid6: int32x1    101 MB/s
raid6: int32x2    146 MB/s
raid6: int32x4    127 MB/s
raid6: int32x8    112 MB/s
raid6: using algorithm int32x2 (146 MB/s)
md: raid6 personality registered for level 6
md: raid5 personality registered for level 5
md: raid4 personality registered for level 4
raid5: measuring checksumming speed
   arm4regs  :   978.000 MB/sec
   8regs     :   632.000 MB/sec
   32regs    :   845.200 MB/sec
raid5: using function: arm4regs (978.000 MB/sec)
device-mapper: ioctl: 4.11.0-ioctl (2006-10-12) initialised: dm-devel@redhat.com
dm_crypt using the OCF package.
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
sdhci: SDHCI controller found at 0000:01:08.1 [11ab:4101] (rev 10)
sdhci: Invalid iomem size. You may experience problems.
sdhci_set_clock: clock=0
mmc0: SDHCI at 0xe8a04000 irq 9 DMA
sdhci_set_clock: clock=0
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
input: Dell Dell USB Keyboard as /class/input/input0
input: USB HID v1.10 Keyboard [Dell Dell USB Keyboard] on usb-ehci_marvell.70059-1.2
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
input: Logitech Optical USB Mouse as /class/input/input1
input: USB HID v1.10 Mouse [Logitech Optical USB Mouse] on usb-ehci_marvell.70059-1.3
usbcore: registered new interface driver usbhid
drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver
Advanced Linux Sound Architecture Driver Version 1.0.14 (Thu May 31 09:03:25 2007 UTC).
sdhci_set_clock: clock=0
ALSA device list:
  No soundcards found.
oprofile: using timer interrupt.
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
ieee80211: 802.11 data/management/control stack, git-1.1.13
ieee80211: Copyright (C) 2004-2005 Intel Corporation <jketreno@linux.intel.com>
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0x4813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0x4813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0x4813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0x4813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
egiga0: link down
egiga0: started
sdhci_set_clock: clock=0
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=48000000
sdhci_set_clock: clock=48000000
mmc0: new high speed SDHC card at address dffd
mmcblk0: mmc0:dffd SD08G 7782400KiB 
mmcblk0: p1
Sending DHCP requests .<5>egiga0: link up, full duplex, speed 1 Gbps
., OK
IP-Config: Got DHCP answer from 0.0.0.0, my address is 10.81.40.132
IP-Config: Complete:
      device=egiga0, addr=10.81.40.132, mask=255.255.252.0, gw=10.81.40.1,
     host=10.81.40.132, domain=marvell.com, nis-domain=(none),
     bootserver=0.0.0.0, rootserver=0.0.0.0, rootpath=
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
VFS: Cannot open root device "ubi0" or unknown-block(0,0)
Please append a correct "root=" boot option; here are the available partitions:
1f00       1024 mtdblock0 (driver?)
1f01       2048 mtdblock1 (driver?)
1f02     128000 mtdblock2 (driver?)
1f03    2097152 mtdblock3 (driver?)
1f04    1945692 mtdblock4 (driver?)
b300    7782400 mmcblk0 driver: mmcblk
  b301    7782392 mmcblk0p1
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)


      

Output from Manually mounting the disk !
========================================

foxes-linux:~# ubiattach /dev/ubi_ctrl -m 3
UBI
device number 0, total 8186 LEBs (2112380928 bytes, 2.0 GiB), available
380 LEBs (98058240 bytes, 93.5 MiB), LEB size 258048 bytes (252.0 KiB)

foxes-linux:~# cat /proc/mtd 
dev:    size       erasesize  name
mtd0: 000000100000 00020000 "u-boot"
mtd1: 000000200000 00020000 "uImage"
mtd2: 000007d00000 00020000 "root"
mtd3: 000080000000 00040000 "cafe_nand"
mtd4: 000076c17000 0003f000 "rootfs"

foxes-linux:~# ubinfo /dev/ubi
ubi0      ubi0_0    ubi_ctrl  
foxes-linux:~# ubinfo /dev/ubi0_0
Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        7721 LEBs (1992388608 bytes, 1.9 GiB)
State:       OK
Name:        rootfs
Character device major/minor: 253:1
foxes-linux:~# ubinfo /dev/ubi0_0 -a
Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        7721 LEBs (1992388608 bytes, 1.9 GiB)
State:       OK
Name:        rootfs
Character device major/minor: 253:1

foxes-linux:~# mount -t ubifs ubi0 /mnt/root
foxes-linux:~# cd /mnt/root/
foxes-linux:/mnt/root# ls
apps  boot  etc   lib         media  opt   root  selinux  sys  usr
bin   dev   home  lost+found  mnt    proc  sbin  srv      tmp  var

=============
boot output
===========

Uncompressing
Linux........................................................................................................................................................
done.
Linux version 2.6.22.18 (ap85@MSI-BBU-S1) (gcc version 3.4.4
(release) (CodeSourcery ARM 2005q3-2)) #26 Wed Dec 10 15:57:41 PST 2008
CPU: ARM926EJ-S [56251311] revision 1 (ARMv5TE), cr=00053977
Machine: Feroceon-KW
Using UBoot passing parameters structure
Memory policy: ECC disabled, Data cache writeback
CPU0: D VIVT write-back cache
CPU0: I cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
CPU0: D cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
Built 1 zonelists.  Total pages: 130048
Kernel command line: console=ttyS0,115200 ubi.mtd=3 root=ubi0 rootfstype=ubifs ip=dhcp
PID hash table entries: 2048 (order: 11, 8192 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 256MB 256MB 0MB 0MB = 512MB total
Memory: 514816KB available (4444K code, 313K data, 128K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16

CPU Interface
-------------
SDRAM_CS0 ....base 00000000, size 256MB 
SDRAM_CS1 ....base 10000000, size 256MB 
SDRAM_CS2 ....disable
SDRAM_CS3 ....disable
PEX0_MEM ....base e8000000, size 128MB 
PEX0_IO ....base f2000000, size   1MB 
INTER_REGS ....base f1000000, size   1MB 
NFLASH_CS ....base fa000000, size   2MB 
SPI_CS ....base f4000000, size  16MB 
BOOT_ROM_CS ....no such
DEV_BOOTCS ....no such
CRYPT_ENGSAGE_UNIT ....base f0000000, size   2MB 

  Marvell Development Board (LSP Version KW_LSP_4.1.4)-- DB-88F6281-BP  Soc: 88F6281 Z0 LE

Detected Tclk 166666667 and SysClk 400000000 
MV Buttons Device Load
MV SPI Device Load
Marvell USB EHCI Host controller #0: c095e600
PCI: bus0: Fast back to back transfers disabled
PCI: bus1: Fast back to back transfers disabled
PCI: Bridge: 0000:00:01.0
  IO window: disabled.
  MEM window: e8000000-e8bfffff
  PREFETCH window: disabled.
pci 0000:00:01.0: Error creating sysfs bridge symlink, continuing...
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
Time: kw_clocksource clocksource has been installed.
IP route cache hash table entries: 16384 (order: 4, 65536 bytes)
TCP established hash table entries: 65536 (order: 7, 524288 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 65536 bind 65536)
TCP reno registered
RTC registered
Use the XOR engines (acceleration) for enhancing the following functions:
  o RAID 5 Xor calculation
  o kernel memcpy
  o kenrel memzero
  o copy user to/from kernel buffers
Number of XOR engines to use: 4
cesadev_init(c000cf1c)
mvCesaInit: sessions=640, queue=64, pSram=f0000000
MV Buttons Driver Load
JFFS2 version 2.2. (NAND) (SUMMARY)  .... 2001-2006 Red Hat, Inc.
JFS: nTxBlock = 4022, nTxLock = 32179
io scheduler noop registered
io scheduler anticipatory registered (default)
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
serial8250.0: ttyS0 at MMIO 0xf1012000 (irq = 33) is a 16550A
serial8250.0: ttyS1 at MMIO 0xf1012100 (irq = 34) is a 16550A
sm501 0000:01:07.0: SM501 At e0c00000: Version 050100c0, 0 Mb, IRQ 9
sm501 0000:01:07.0: SM502 is detected.
sm501 0000:01:07.0: clock 2a1a0209, mode 00000000
sm501 0000:01:07.0: clock 2a1a0201, mode 00000000
sm501-fb[0] flags 00000200: e8880000..e888ffff
sm501-fb[1] flags 00000200: e8900000..e894ffff
sm501-fb[2] flags 00000200: e8000000..e87fffff
sm501-fb[3] flags 00000400: 00000009..00000009
sm501-fb sm501-fb.88: fb sm501fb-crt disabled at start
sm501-fb sm501-fb.88: fb sm501fb-panel disabled at start
sm501 0000:01:07.0: clock 401a0201, mode 00000000
sm501 0000:01:07.0: clock 401a0201, mode 00000000
Console: switching to colour frame buffer device 128x75
Intel(R) PRO/1000 Network Driver - version 7.3.20-k2-NAPI
Copyright (c) 1999-2006 Intel Corporation.
Marvell Ethernet Driver egiga:
  o Cached descriptors in DRAM
  o DRAM SW cache-coherency
  o TCP segmentation offload enabled
  o Checksum offload enabled
  o Network Fast Processing (Routing) supported
  o Driver statistics enabled
  o Proc tool API enabled
  o Rx desc: 128
  o Tx desc: 276
  o Loading network interface 'egiga0' 
Warning: Giga 1 is Powered Off

Network Fast Processing Disabled
mvFpRuleDb (df8d0000): 16384 entries, 65536 bytes
e100: Intel(R) PRO/100 Network Driver, 3.5.17-k4-NAPI
e100: Copyright(c) 1999-2006 Intel Corporation
Linux video capture interface: v2.00
Marvell M88ALP01 'CAFE' Camera Controller version 4
OmniVision ov7670 sensor driver, at your service
cafe1000-ccic 0000:01:08.2: SMBUS write (42/12/80) timed out
OmniVision ov7680 sensor driver, at your service
cafe1000-ccic 0000:01:08.2: SMBUS write (42/12/80) timed out
Intergrated Sata device found
scsi0 : Marvell SCSI to SATA adapter
scsi1 : Marvell SCSI to SATA adapter
NFTL driver: nftlcore.c $Revision: 1.98 $, nftlmount.c $Revision: 1.41 $
NAND device: Manufacturer ID: 0x20, Chip ID: 0xf1 (ST Micro NAND 128MiB 3,3V 8-bit)
create_bbt:Scanning device for bad blocks
enter parse_mtd_partitions
parse_mtd_partitions: parser = c049e68c, type = cmdlinepart
Using static partition definition
Creating 3 MTD partitions on "nand_mtd":
0x00000000-0x100000 : "u-boot"
add_mtd_partitions:position = 17, size = 8 (100000), eraseSize = 1 (20000)
0x00100000-0x300000 : "uImage"
add_mtd_partitions:position = 17, size = 10 (200000), eraseSize = 1 (20000)
0x00300000-0x8000000 : "root"
add_mtd_partitions:position = 17, size = 3e8 (7d00000), eraseSize = 1 (20000)
CAF.. NAND 0000:01:08.0: Timing registers unset; using most conservative defaults
NAND device: Manufacturer ID: 0xec, Chip ID: 0xd5 (Samsung NAND 2GiB 3,3V 8-bit)
cafe->nand.ecc.mode = 3, mtd->writesize = 800
cafe_nand_probe:Timing registers already set (ffffffff ffffffff ffffffff)
        Register 0: 64000000
        Register 4: 28000000
        Register 8: 40000000
        Register c: 40000000
        Register 10: 00000000
        Register 14: ffffffff
        Register 18: 00000840
        Register 1c: 00000000
        Register 20: 000fff80
        Register 24: ffffffff
        Register 28: ffffffff
        Register 2c: ffffffff
        Register 30: 00000000
        Register 34: 00000000
        Register 38: 005ece4c
        Register 3c: 00020000
        Register 40: a0000840
        Register 44: 1f916000
        Register 48: 00000000
        Register 4c: 00000000
        Register 50: 00000000
        Register 54: 00000000
        Register 58: 00000000
        Register 5c: 00000000
        Register 60: 00000000
        Register 64: 0000000f
calling parse_mtd_partitions
enter parse_mtd_partitions
parse_mtd_partitions: parser = c049e68c, type = cmdlinepart
parse_mtd_partitions: parser = 00000000, type = RedBoot
RedBoot partition parsing not available
cafe_nand_probe: nr_parts = -22
UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    258048 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: attached mtd3 to ubi0
UBI: MTD device name:            "cafe_nand"
UBI: MTD device size:            2048 MiB
UBI: number of good PEBs:        8186
UBI: number of bad PEBs:         6
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             380
UBI: total number of reserved PEBs: 7806
UBI: number of PEBs reserved for bad PEB handling: 81
UBI: max/mean erase counter: 2/0
UBI: background thread "ubi_bgt0d" started, PID 330
ehci_marvell ehci_marvell.70059: Marvell Orion EHCI
ehci_marvell ehci_marvell.70059: new USB bus registered, assigned bus number 1
ehci_marvell ehci_marvell.70059: irq 19, io base 0xf1050100
ehci_marvell ehci_marvell.70059: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
USB Universal Host Controller Interface driver v3.0
usb 1-1: new high speed USB device using ehci_marvell and address 2
usb 1-1: configuration #1 chosen from 1 choice
hub 1-1:1.0: USB hub found
hub 1-1:1.0: 4 ports detected
usb 1-1.2: new low speed USB device using ehci_marvell and address 3
usb 1-1.2: configuration #1 chosen from 1 choice
usb 1-1.3: new low speed USB device using ehci_marvell and address 4
usb 1-1.3: configuration #1 chosen from 1 choice
usbcore: registered new interface driver usblp
drivers/usb/class/usblp.c: v0.13: USB Printer Device Class driver
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
mice: PS/2 mouse device common for all mice
i2c /dev entries driver
Linux telephony interface: v1.00
Marvell Telephony Driver:

Warning Tdm is Powered Off
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
raid6: int32x1    101 MB/s
raid6: int32x2    146 MB/s
raid6: int32x4    127 MB/s
raid6: int32x8    112 MB/s
raid6: using algorithm int32x2 (146 MB/s)
md: raid6 personality registered for level 6
md: raid5 personality registered for level 5
md: raid4 personality registered for level 4
raid5: measuring checksumming speed
   arm4regs  :   978.000 MB/sec
   8regs     :   632.000 MB/sec
   32regs    :   845.200 MB/sec
raid5: using function: arm4regs (978.000 MB/sec)
device-mapper: ioctl: 4.11.0-ioctl (2006-10-12) initialised: dm-devel@redhat.com
dm_crypt using the OCF package.
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
sdhci: SDHCI controller found at 0000:01:08.1 [11ab:4101] (rev 10)
sdhci: Invalid iomem size. You may experience problems.
sdhci_set_clock: clock=0
mmc0: SDHCI at 0xe8a04000 irq 9 DMA
sdhci_set_clock: clock=0
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
input: Dell Dell USB Keyboard as /class/input/input0
input: USB HID v1.10 Keyboard [Dell Dell USB Keyboard] on usb-ehci_marvell.70059-1.2
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
input: Logitech Optical USB Mouse as /class/input/input1
input: USB HID v1.10 Mouse [Logitech Optical USB Mouse] on usb-ehci_marvell.70059-1.3
usbcore: registered new interface driver usbhid
drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver
Advanced Linux Sound Architecture Driver Version 1.0.14 (Thu May 31 09:03:25 2007 UTC).
sdhci_set_clock: clock=0
ALSA device list:
  No soundcards found.
oprofile: using timer interrupt.
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
ieee80211: 802.11 data/management/control stack, git-1.1.13
ieee80211: Copyright (C) 2004-2005 Intel Corporation <jketreno@linux.intel.com>
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0x4813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0x4813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0x4813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0xc813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
mvsdmmc: SDIO_NOR_INTR_STATUS(0x60)=0x4813
mvsdmmc_irq: mvsdmmc_check_error returned error -71
mvsdmmc: command,data error 
egiga0: link down
egiga0: started
sdhci_set_clock: clock=0
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=187500
sdhci_set_clock: clock=48000000
sdhci_set_clock: clock=48000000
mmc0: new high speed SDHC card at address dffd
mmcblk0: mmc0:dffd SD08G 7782400KiB 
mmcblk0: p1
Sending DHCP requests .<5>egiga0: link up, full duplex, speed 1 Gbps
., OK
IP-Config: Got DHCP answer from 0.0.0.0, my address is 10.81.40.132
IP-Config: Complete:
      device=egiga0, addr=10.81.40.132, mask=255.255.252.0, gw=10.81.40.1,
     host=10.81.40.132, domain=marvell.com, nis-domain=(none),
     bootserver=0.0.0.0, rootserver=0.0.0.0, rootpath=
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
VFS: Cannot open root device "ubi0" or unknown-block(0,0)
Please append a correct "root=" boot option; here are the available partitions:
1f00       1024 mtdblock0 (driver?)
1f01       2048 mtdblock1 (driver?)
1f02     128000 mtdblock2 (driver?)
1f03    2097152 mtdblock3 (driver?)
1f04    1945692 mtdblock4 (driver?)
b300    7782400 mmcblk0 driver: mmcblk
  b301    7782392 mmcblk0p1
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)


      
