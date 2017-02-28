Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciZCV-0005eu-Sr
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 04:15:51 +0000
Received: by mail-lf0-x22c.google.com with SMTP id y193so276502lfd.3
 for <linux-mtd@lists.infradead.org>; Mon, 27 Feb 2017 20:15:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAPDE7Z8=Xo=Ko4CKRNL=EsGZ+bLoU1CCgebNv-aqXrtnihX2wA@mail.gmail.com>
References: <CAPDE7Z8=Xo=Ko4CKRNL=EsGZ+bLoU1CCgebNv-aqXrtnihX2wA@mail.gmail.com>
From: Pankaj <getpankaj.joshi@gmail.com>
Date: Tue, 28 Feb 2017 09:45:03 +0530
Message-ID: <CAPDE7Z9-ZF7s=RMHbqM-KZD7m+Zh5m+orFi4F6zDKOzPWbzDeg@mail.gmail.com>
Subject: Re: Why UBIFS mount partition showing already mounted on reboot?
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am having kernel version: 3.3.8-2.5. I have one ubifs volume.
Everytime i do clean/unclean reboot, i do a ubiattach and then mount
using below commands.

ubiattach /dev/ubi_ctrl -m 14
mount -t ubifs ubi1:app0 /mnt/fsm0/

Sometimes, mount is failed saying
mount: ubi1:app0 already mounted or /mnt/fsm0 busy

I keep writing some data on /mnt/fsm0. I have no idea why it is
showing already mounted on reboot. Pl. help. Do i need to sync after
mounting?

dmesg output is below:

1.352000] mousedev: PS/2 mouse device common for all mice
[    1.358000] sdhci: Secure Digital Host Controller Interface driver
[    1.364000] sdhci: Copyright(c) Pierre Ossman
[    1.368000] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.374000] sdhci-brcmstb sdhci-brcmstb.0: Enabling controller
[    1.384000] mmc0: SDHCI controller on sdhci-brcmstb.0
[sdhci-brcmstb.0] using ADMA
[    1.391000] sdhci-brcmstb sdhci-brcmstb.1: Disabled by bootloader
[    1.398000] usbcore: registered new interface driver usbhid
[    1.404000] usbhid: USB HID core driver
[    1.408000] GACT probability on
[    1.411000] Mirror/redirect action on
[    1.414000] Simple TC action Loaded
[    1.419000] netem: version 1.3
[    1.422000] u32 classifier
[    1.425000]     Performance counters on
[    1.428000]     input device check on
[    1.432000]     Actions configured
[    1.436000] nf_conntrack version 0.5.0 (8913 buckets, 35652 max)
[    1.446000] ip_tables: (C) 2000-2006 Netfilter Core Team
[    1.452000] arp_tables: (C) 2002 David S. Miller
[    1.456000] TCP cubic registered
[    1.461000] NET: Registered protocol family 10
[    1.466000] Mobile IPv6
[    1.469000] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    1.474000] IPv6 over IPv4 tunneling driver
[    1.480000] NET: Registered protocol family 17
[    1.485000] Bridge firewalling registered
[    1.489000] 8021q: 802.1Q VLAN Support v1.8
[    1.493000] PM: CP0 COUNT/COMPARE frequency does not depend on divisor
[    1.501000] EBI CS0: setting up SPI flash
[    1.505000] NUM_CS : 5
[    1.510000] spi_brcmstb spi_brcmstb.0: 1-lane output, 3-byte address
[    1.519000] m25p80 spi0.0: found mx25l3255e, expected m25p80
[    1.524000] m25p80 spi0.0: mx25l3255e (4096 Kbytes)
[    1.530000] Creating 9 MTD partitions on "spi0.0":
[    1.535000] 0x000000000000-0x000000100000 : "flash0.cfe"
[    1.543000] 0x000000100000-0x000000120000 : "flash0.locked_keys"
[    1.550000] 0x000000120000-0x000000140000 : "flash0.env_p"
[    1.557000] 0x000000140000-0x000000160000 : "flash0.unlocked_keys"
[    1.568000] 0x000000160000-0x000000180000 : "flash0.env_s"
[    1.577000] 0x000000180000-0x0000001c0000 : "flash0.sys_nvram"
[    1.585000] 0x0000001c0000-0x0000001e0000 : "flash0.bseck"
[    1.605000] 0x0000001e0000-0x000000200000 : "flash0.reserved"
[    1.612000] 0x000000200000-0x000000400000 : "flash0.splash"
[    1.619000] EBI CS1: setting up NAND flash
[    1.623000] NUM_CS : 5
[    1.626000] ONFI param page 0 valid
[    1.629000] ONFI flash detected
[    1.633000] NAND device: Manufacturer ID: 0x01, Chip ID: 0xdc
(AMD/Spansion S34ML04G2)
[    1.641000] ONFI param page 0 valid
[    1.644000] ONFI flash detected
[    1.647000] NAND device: Manufacturer ID: 0x01, Chip ID: 0xdc
(AMD/Spansion S34ML04G2)
[    1.655000] brcmnand brcmnand.0: 512MiB total, 128KiB blocks, 2KiB
pages, 32B OOB, 8-bit, BCH-4
[    1.655000]
[    1.666000] Scanning device for bad blocks
[    4.546000] Creating 16 MTD partitions on "brcmnand.0":
[    4.551000] 0x000000000000-0x000000100000 : "nand.bktbl"
[    4.558000] 0x000000100000-0x000000400000 : "nand.reserved1"
[    4.565000] 0x000000400000-0x000001e00000 : "nand.dri0"
[    4.572000] 0x000001e00000-0x000003800000 : "nand.dri1"
[    4.578000] 0x000003800000-0x000004000000 : "nand.reserved2"
[    4.586000] 0x000004000000-0x000008000000 : "nand.ffs"
[    4.592000] 0x000008000000-0x00000fc00000 : "nand.main0"
[    4.599000] 0x00000fc00000-0x00000fe00000 : "PmemData"
[    4.605000] PMEM: Found @ partition 16
[    4.609000] PMEM: Current Cycle Reset Register: 0x403
[    4.614000] PMEM: Clear reset history
[    4.618000] PMEM: This is a power-on reboot
[    4.647000] 0x00000fe00000-0x000010000000 : "nand.sysdata"
[    4.654000] 0x000010000000-0x000017c00000 : "nand.main1"
[    4.661000] 0x000017c00000-0x00001a400000 : "nand.fsa0"
[    4.667000] 0x00001a400000-0x00001cc00000 : "nand.fsa1"
[    4.674000] 0x00001cc00000-0x00001dc00000 : "SysConfig"
[    4.681000] 0x00001dc00000-0x00001f800000 : "nand.appdata"
[    4.688000] 0x00001f800000-0x00001fc00000 : "nand.reserved3"
[    4.695000] 0x00001fc00000-0x000020000000 : "nand.bbt"
[    4.702000] ### of_selftest(): No testcase data in device tree; not
running tests
[    4.710000] RAMDISK: squashfs filesystem found at block 0
[    4.716000] RAMDISK: Loading 28746KiB [1 disk] into ram disk... done.
[    5.489000] VFS: Mounted root (squashfs filesystem) readonly on device 1:0.
[    5.497000] devtmpfs: mounted
[    5.500000] Freeing unused kernel memory: 332k freed
[    5.696000] udev: starting version 154
[    5.701000] udevd (638): /proc/638/oom_adj is deprecated, please
use /proc/638/oom_score_adj instead.
[    6.087000] UBI: attaching mtd21 to ubi0
[    6.092000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    6.099000] UBI: logical eraseblock size:    126976 bytes
[    6.106000] UBI: smallest flash I/O unit:    2048
[    6.112000] UBI: VID header offset:          2048 (aligned 2048)
[    6.120000] UBI: data offset:                4096
[    6.205000] UBI: max. sequence number:       135
[    6.220000] UBI: attached mtd21 to ubi0
[    6.224000] UBI: MTD device name:            "SysConfig"
[    6.229000] UBI: MTD device size:            16 MiB
[    6.234000] UBI: number of good PEBs:        128
[    6.239000] UBI: number of bad PEBs:         0
[    6.243000] UBI: number of corrupted PEBs:   0
[    6.248000] UBI: max. allowed volumes:       128
[    6.252000] UBI: wear-leveling threshold:    4096
[    6.257000] UBI: number of internal volumes: 1
[    6.262000] UBI: number of user volumes:     1
[    6.266000] UBI: available PEBs:             0
[    6.270000] UBI: total number of reserved PEBs: 128
[    6.275000] UBI: number of PEBs reserved for bad PEB handling: 2
[    6.281000] UBI: max/mean erase counter: 2/0
[    6.286000] UBI: image sequence number:  706687216
[    6.291000] UBI: background thread "ubi_bgt0d" started, PID 709
[    6.364000] UBIFS: recovery needed
[    6.505000] UBIFS: recovery completed
[    6.509000] UBIFS: mounted UBI device 0, volume 0, name "SysConfig"
[    6.515000] UBIFS: file system size:   14348288 bytes (14012 KiB,
13 MiB, 113 LEBs)
[    6.523000] UBIFS: journal size:       1015809 bytes (992 KiB, 0 MiB, 6 LEBs)
[    6.530000] UBIFS: media format:       w4/r0 (latest is w4/r0)
[    6.536000] UBIFS: default compressor: lzo
[    6.540000] UBIFS: reserved for root:  677704 bytes (661 KiB)
[    6.731000] ------------[ cut here ]------------
[    6.731000] WARNING: at fs/libfs.c:365 simple_setattr+0xd0/0xdc()
[    6.731000] Modules linked in:
[    6.731000] Call Trace:
[    6.731000] [<80651c60>] dump_stack+0x10/0x40 (stack frame@82137bd0)
[    6.740000] [<80046648>] warn_slowpath_common+0x80/0xb4 (stack
frame@82137c98)
[    6.741000] [<8004669c>] warn_slowpath_null+0x20/0x34 (stack frame@82137cc0)
[    6.741000] [<8014e2c8>] simple_setattr+0xc8/0xdc (stack frame@82137ce0)
[    6.741000] [<801428bc>] notify_change+0x33c/0x39c (stack frame@82137d08)
[    6.741000] [<8011fd38>] do_truncate+0x6c/0xbc (stack frame@82137d48)
[    6.741000] [<80133f64>] do_last.clone.38+0x494/0x8b0 (stack frame@82137da0)
[    6.741000] [<80134494>] path_openat+0xcc/0x448 (stack frame@82137df0)
[    6.741000] [<80134968>] do_filp_open+0x4c/0xc8 (stack frame@82137e50)
[    6.741000] [<80120ea8>] do_sys_open+0x114/0x204 (stack frame@82137ee0)
[    6.741000] [<8002a73c>] stack_done+0x20/0x40 (stack frame@82137f30)
[    6.741000]
[    6.741000] ---[ end trace 7697cbefb715f0f6 ]---
[    6.795000] bcmdriver: module license 'Proprietary' taints kernel.
[    6.795000] Disabling lock debugging due to kernel taint
[    6.796000] BCMDRV: Initializing bcmdriver version $ 54 $
[    6.796000] BCMDRV: Total intc words=3,Total Irqs=97
[    6.797000] BCMDRV: Initialization complete
[    6.801000] __clk_enable: network [1]
[    6.801000] bcm7429_pm_network_enable 00
[    6.801000] __clk_enable: moca_genet [1]
[    6.801000] bcm40nm_pm_genet1_enable 00
[    6.801000] __clk_enable: moca [1]
[    6.801000] bcm40nm_pm_moca_enable 00
[    6.803000] bcmgenet bcmgenet.1: eth1: link up, 1000 Mbps, full duplex
[    6.803000] ADDRCONF(NETDEV_UP): eth1: link is not ready
[    6.804000] ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
[    6.818000] __clk_enable: enet [1]
[    6.818000] bcm40nm_pm_genet_enable 00
[    6.989000] ADDRCONF(NETDEV_UP): eth0: link is not ready
[    7.057000] tmet: tmet_init
[    7.057000] tmet: Tmet_Init
[    7.057000] ttst: ttst_init
[    7.096000] etst: etst_init
[    7.804000] device eth1 entered promiscuous mode
[    7.840000] device eth0 entered promiscuous mode
[    7.870000] pmem: kpmem_Open
[    7.909000] kwdt_open: Module:e019c41c Open Cnt:1 Device:cdfe8100
Task:diagnostics Pid:900 Tid:900
[    7.909000] kwdt_ioctl_RegisterTickle: device:cdfe8100
task:diagnostics pid:900 tid:900 duration:120000
[   16.005000] tmet: tmet_Open
[   16.005000] tmet: tmet_Ioctl  80089d01
[   16.005000] tmet: kTmet_iocRegConsumer 2141161732
[   16.005000] tmet: kTmet_iocRegister: success chan 1128809288
[   16.006000] tmet: tmet_Open
[   16.006000] tmet: tmet_Ioctl  800c9d02
[   16.006000] tmet: kTmet_iocOpenChannel 2141161864
[   16.006000] tmet: kTmet_iocOpenChannel 2141161864
[   16.006000] tmet: kTmet_iocOpenChannel state 1
[   16.006000] tmet: tmet_Release
[   16.006000] tmet: tmet_Release
[   16.006000] tmet: tmet_Open
[   16.006000] tmet: tmet_Ioctl  80089d01
[   16.006000] tmet: kTmet_iocRegConsumer 2141161732
[   16.006000] tmet: kTmet_iocRegister: success chan 1112493908
[   16.009000] tmet: tmet_Open
[   16.009000] tmet: tmet_Ioctl  800c9d02
[   16.009000] tmet: kTmet_iocOpenChannel 2141161864
[   16.009000] tmet: kTmet_iocOpenChannel 2141161864
[   16.009000] tmet: kTmet_iocOpenChannel state 1
[   16.009000] tmet: tmet_Release
[   16.009000] tmet: tmet_Release
[   16.010000] tmet: tmet_Ioctl  800c9d05
[   16.010000] tmet: Tmet_iocSendEvent 1112493908, errno 0
[   16.010000] tmet: kTmet_iocSendEvent 1112493908 0
[   16.010000] tmet: Tmet_PvtSendEvent, event type 0
[   16.010000] tmet: tmet_PvtSendEvent: ChanName found
[   16.059000] kwdt_open: Module:e019c41c Open Cnt:2 Device:cb1e5400
Task:PkTimerThread Pid:1300 Tid:1394
[   16.060000] kwdt_ioctl_RegisterTickle: device:cb1e5400
task:PkTimerThread pid:1300 tid:1394 duration:210000
[   17.026000] eth1: no IPv6 routers present
[  121.446000] UBI: attaching mtd14 to ubi1
[  121.446000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[  121.446000] UBI: logical eraseblock size:    126976 bytes
[  121.446000] UBI: smallest flash I/O unit:    2048
[  121.446000] UBI: VID header offset:          2048 (aligned 2048)
[  121.446000] UBI: data offset:                4096
[  121.770000] UBI: max. sequence number:       27
[  121.781000] UBI: attached mtd14 to ubi1
[  121.781000] UBI: MTD device name:            "nand.ffs"
[  121.781000] UBI: MTD device size:            64 MiB
[  121.781000] UBI: number of good PEBs:        512
[  121.781000] UBI: number of bad PEBs:         0
[  121.781000] UBI: number of corrupted PEBs:   0
[  121.781000] UBI: max. allowed volumes:       128
[  121.781000] UBI: wear-leveling threshold:    4096
[  121.781000] UBI: number of internal volumes: 1
[  121.781000] UBI: number of user volumes:     1
[  121.781000] UBI: available PEBs:             420
[  121.781000] UBI: total number of reserved PEBs: 92
[  121.781000] UBI: number of PEBs reserved for bad PEB handling: 5
[  121.781000] UBI: max/mean erase counter: 7/3
[  121.782000] UBI: image sequence number:  1630273738
[  121.802000] UBI: background thread "ubi_bgt1d" started, PID 2597
[  121.865000] UBIFS: recovery needed
[  121.955000] UBIFS: recovery completed
[  121.955000] UBIFS: mounted UBI device 1, volume 0, name "app0"
[  121.955000] UBIFS: file system size:   9396224 bytes (9176 KiB, 8
MiB, 74 LEBs)
[  121.955000] UBIFS: journal size:       1015809 bytes (992 KiB, 0 MiB, 6 LEBs)
[  121.955000] UBIFS: media format:       w4/r0 (latest is w4/r0)
[  121.955000] UBIFS: default compressor: lzo
[  121.955000] UBIFS: reserved for root:  443806 bytes (433 KiB)
Thanks,
Pankaj Joshi




On Mon, Feb 27, 2017 at 2:21 PM, Pankaj <getpankaj.joshi@gmail.com> wrote:
> Hi,
>
> I am having kernel version: 3.3.8-2.5. I have one ubifs volume. Everytime i
> reboot my box and do a ubiattach and  then mount using below commands.
>
> ubiattach /dev/ubi_ctrl -m 14
> mount -t ubifs ubi1:app0 /mnt/fsm0/
>
> Sometimes, mount is failed saying
> mount: ubi1:app0 already mounted or /mnt/fsm0 busy
>
> I keep writing some data on /mnt/fsm0. I have no idea why it is showing
> already mounted on reboot. Pl. help.
>
> dmesg output is below:
>
> 1.352000] mousedev: PS/2 mouse device common for all mice
> [    1.358000] sdhci: Secure Digital Host Controller Interface driver
> [    1.364000] sdhci: Copyright(c) Pierre Ossman
> [    1.368000] sdhci-pltfm: SDHCI platform and OF driver helper
> [    1.374000] sdhci-brcmstb sdhci-brcmstb.0: Enabling controller
> [    1.384000] mmc0: SDHCI controller on sdhci-brcmstb.0 [sdhci-brcmstb.0]
> using ADMA
> [    1.391000] sdhci-brcmstb sdhci-brcmstb.1: Disabled by bootloader
> [    1.398000] usbcore: registered new interface driver usbhid
> [    1.404000] usbhid: USB HID core driver
> [    1.408000] GACT probability on
> [    1.411000] Mirror/redirect action on
> [    1.414000] Simple TC action Loaded
> [    1.419000] netem: version 1.3
> [    1.422000] u32 classifier
> [    1.425000]     Performance counters on
> [    1.428000]     input device check on
> [    1.432000]     Actions configured
> [    1.436000] nf_conntrack version 0.5.0 (8913 buckets, 35652 max)
> [    1.446000] ip_tables: (C) 2000-2006 Netfilter Core Team
> [    1.452000] arp_tables: (C) 2002 David S. Miller
> [    1.456000] TCP cubic registered
> [    1.461000] NET: Registered protocol family 10
> [    1.466000] Mobile IPv6
> [    1.469000] ip6_tables: (C) 2000-2006 Netfilter Core Team
> [    1.474000] IPv6 over IPv4 tunneling driver
> [    1.480000] NET: Registered protocol family 17
> [    1.485000] Bridge firewalling registered
> [    1.489000] 8021q: 802.1Q VLAN Support v1.8
> [    1.493000] PM: CP0 COUNT/COMPARE frequency does not depend on divisor
> [    1.501000] EBI CS0: setting up SPI flash
> [    1.505000] NUM_CS : 5
> [    1.510000] spi_brcmstb spi_brcmstb.0: 1-lane output, 3-byte address
> [    1.519000] m25p80 spi0.0: found mx25l3255e, expected m25p80
> [    1.524000] m25p80 spi0.0: mx25l3255e (4096 Kbytes)
> [    1.530000] Creating 9 MTD partitions on "spi0.0":
> [    1.535000] 0x000000000000-0x000000100000 : "flash0.cfe"
> [    1.543000] 0x000000100000-0x000000120000 : "flash0.locked_keys"
> [    1.550000] 0x000000120000-0x000000140000 : "flash0.env_p"
> [    1.557000] 0x000000140000-0x000000160000 : "flash0.unlocked_keys"
> [    1.568000] 0x000000160000-0x000000180000 : "flash0.env_s"
> [    1.577000] 0x000000180000-0x0000001c0000 : "flash0.sys_nvram"
> [    1.585000] 0x0000001c0000-0x0000001e0000 : "flash0.bseck"
> [    1.605000] 0x0000001e0000-0x000000200000 : "flash0.reserved"
> [    1.612000] 0x000000200000-0x000000400000 : "flash0.splash"
> [    1.619000] EBI CS1: setting up NAND flash
> [    1.623000] NUM_CS : 5
> [    1.626000] ONFI param page 0 valid
> [    1.629000] ONFI flash detected
> [    1.633000] NAND device: Manufacturer ID: 0x01, Chip ID: 0xdc
> (AMD/Spansion S34ML04G2)
> [    1.641000] ONFI param page 0 valid
> [    1.644000] ONFI flash detected
> [    1.647000] NAND device: Manufacturer ID: 0x01, Chip ID: 0xdc
> (AMD/Spansion S34ML04G2)
> [    1.655000] brcmnand brcmnand.0: 512MiB total, 128KiB blocks, 2KiB pages,
> 32B OOB, 8-bit, BCH-4
> [    1.655000]
> [    1.666000] Scanning device for bad blocks
> [    4.546000] Creating 16 MTD partitions on "brcmnand.0":
> [    4.551000] 0x000000000000-0x000000100000 : "nand.bktbl"
> [    4.558000] 0x000000100000-0x000000400000 : "nand.reserved1"
> [    4.565000] 0x000000400000-0x000001e00000 : "nand.dri0"
> [    4.572000] 0x000001e00000-0x000003800000 : "nand.dri1"
> [    4.578000] 0x000003800000-0x000004000000 : "nand.reserved2"
> [    4.586000] 0x000004000000-0x000008000000 : "nand.ffs"
> [    4.592000] 0x000008000000-0x00000fc00000 : "nand.main0"
> [    4.599000] 0x00000fc00000-0x00000fe00000 : "PmemData"
> [    4.605000] PMEM: Found @ partition 16
> [    4.609000] PMEM: Current Cycle Reset Register: 0x403
> [    4.614000] PMEM: Clear reset history
> [    4.618000] PMEM: This is a power-on reboot
> [    4.647000] 0x00000fe00000-0x000010000000 : "nand.sysdata"
> [    4.654000] 0x000010000000-0x000017c00000 : "nand.main1"
> [    4.661000] 0x000017c00000-0x00001a400000 : "nand.fsa0"
> [    4.667000] 0x00001a400000-0x00001cc00000 : "nand.fsa1"
> [    4.674000] 0x00001cc00000-0x00001dc00000 : "SysConfig"
> [    4.681000] 0x00001dc00000-0x00001f800000 : "nand.appdata"
> [    4.688000] 0x00001f800000-0x00001fc00000 : "nand.reserved3"
> [    4.695000] 0x00001fc00000-0x000020000000 : "nand.bbt"
> [    4.702000] ### of_selftest(): No testcase data in device tree; not
> running tests
> [    4.710000] RAMDISK: squashfs filesystem found at block 0
> [    4.716000] RAMDISK: Loading 28746KiB [1 disk] into ram disk... done.
> [    5.489000] VFS: Mounted root (squashfs filesystem) readonly on device
> 1:0.
> [    5.497000] devtmpfs: mounted
> [    5.500000] Freeing unused kernel memory: 332k freed
> [    5.696000] udev: starting version 154
> [    5.701000] udevd (638): /proc/638/oom_adj is deprecated, please use
> /proc/638/oom_score_adj instead.
> [    6.087000] UBI: attaching mtd21 to ubi0
> [    6.092000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
> [    6.099000] UBI: logical eraseblock size:    126976 bytes
> [    6.106000] UBI: smallest flash I/O unit:    2048
> [    6.112000] UBI: VID header offset:          2048 (aligned 2048)
> [    6.120000] UBI: data offset:                4096
> [    6.205000] UBI: max. sequence number:       135
> [    6.220000] UBI: attached mtd21 to ubi0
> [    6.224000] UBI: MTD device name:            "SysConfig"
> [    6.229000] UBI: MTD device size:            16 MiB
> [    6.234000] UBI: number of good PEBs:        128
> [    6.239000] UBI: number of bad PEBs:         0
> [    6.243000] UBI: number of corrupted PEBs:   0
> [    6.248000] UBI: max. allowed volumes:       128
> [    6.252000] UBI: wear-leveling threshold:    4096
> [    6.257000] UBI: number of internal volumes: 1
> [    6.262000] UBI: number of user volumes:     1
> [    6.266000] UBI: available PEBs:             0
> [    6.270000] UBI: total number of reserved PEBs: 128
> [    6.275000] UBI: number of PEBs reserved for bad PEB handling: 2
> [    6.281000] UBI: max/mean erase counter: 2/0
> [    6.286000] UBI: image sequence number:  706687216
> [    6.291000] UBI: background thread "ubi_bgt0d" started, PID 709
> [    6.364000] UBIFS: recovery needed
> [    6.505000] UBIFS: recovery completed
> [    6.509000] UBIFS: mounted UBI device 0, volume 0, name "SysConfig"
> [    6.515000] UBIFS: file system size:   14348288 bytes (14012 KiB, 13 MiB,
> 113 LEBs)
> [    6.523000] UBIFS: journal size:       1015809 bytes (992 KiB, 0 MiB, 6
> LEBs)
> [    6.530000] UBIFS: media format:       w4/r0 (latest is w4/r0)
> [    6.536000] UBIFS: default compressor: lzo
> [    6.540000] UBIFS: reserved for root:  677704 bytes (661 KiB)
> [    6.731000] ------------[ cut here ]------------
> [    6.731000] WARNING: at fs/libfs.c:365 simple_setattr+0xd0/0xdc()
> [    6.731000] Modules linked in:
> [    6.731000] Call Trace:
> [    6.731000] [<80651c60>] dump_stack+0x10/0x40 (stack frame@82137bd0)
> [    6.740000] [<80046648>] warn_slowpath_common+0x80/0xb4 (stack
> frame@82137c98)
> [    6.741000] [<8004669c>] warn_slowpath_null+0x20/0x34 (stack
> frame@82137cc0)
> [    6.741000] [<8014e2c8>] simple_setattr+0xc8/0xdc (stack frame@82137ce0)
> [    6.741000] [<801428bc>] notify_change+0x33c/0x39c (stack frame@82137d08)
> [    6.741000] [<8011fd38>] do_truncate+0x6c/0xbc (stack frame@82137d48)
> [    6.741000] [<80133f64>] do_last.clone.38+0x494/0x8b0 (stack
> frame@82137da0)
> [    6.741000] [<80134494>] path_openat+0xcc/0x448 (stack frame@82137df0)
> [    6.741000] [<80134968>] do_filp_open+0x4c/0xc8 (stack frame@82137e50)
> [    6.741000] [<80120ea8>] do_sys_open+0x114/0x204 (stack frame@82137ee0)
> [    6.741000] [<8002a73c>] stack_done+0x20/0x40 (stack frame@82137f30)
> [    6.741000]
> [    6.741000] ---[ end trace 7697cbefb715f0f6 ]---
> [    6.795000] bcmdriver: module license 'Proprietary' taints kernel.
> [    6.795000] Disabling lock debugging due to kernel taint
> [    6.796000] BCMDRV: Initializing bcmdriver version $ 54 $
> [    6.796000] BCMDRV: Total intc words=3,Total Irqs=97
> [    6.797000] BCMDRV: Initialization complete
> [    6.801000] __clk_enable: network [1]
> [    6.801000] bcm7429_pm_network_enable 00
> [    6.801000] __clk_enable: moca_genet [1]
> [    6.801000] bcm40nm_pm_genet1_enable 00
> [    6.801000] __clk_enable: moca [1]
> [    6.801000] bcm40nm_pm_moca_enable 00
> [    6.803000] bcmgenet bcmgenet.1: eth1: link up, 1000 Mbps, full duplex
> [    6.803000] ADDRCONF(NETDEV_UP): eth1: link is not ready
> [    6.804000] ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
> [    6.818000] __clk_enable: enet [1]
> [    6.818000] bcm40nm_pm_genet_enable 00
> [    6.989000] ADDRCONF(NETDEV_UP): eth0: link is not ready
> [    7.057000] tmet: tmet_init
> [    7.057000] tmet: Tmet_Init
> [    7.057000] ttst: ttst_init
> [    7.096000] etst: etst_init
> [    7.804000] device eth1 entered promiscuous mode
> [    7.840000] device eth0 entered promiscuous mode
> [    7.870000] pmem: kpmem_Open
> [    7.909000] kwdt_open: Module:e019c41c Open Cnt:1 Device:cdfe8100
> Task:diagnostics Pid:900 Tid:900
> [    7.909000] kwdt_ioctl_RegisterTickle: device:cdfe8100 task:diagnostics
> pid:900 tid:900 duration:120000
> [   16.005000] tmet: tmet_Open
> [   16.005000] tmet: tmet_Ioctl  80089d01
> [   16.005000] tmet: kTmet_iocRegConsumer 2141161732
> [   16.005000] tmet: kTmet_iocRegister: success chan 1128809288
> [   16.006000] tmet: tmet_Open
> [   16.006000] tmet: tmet_Ioctl  800c9d02
> [   16.006000] tmet: kTmet_iocOpenChannel 2141161864
> [   16.006000] tmet: kTmet_iocOpenChannel 2141161864
> [   16.006000] tmet: kTmet_iocOpenChannel state 1
> [   16.006000] tmet: tmet_Release
> [   16.006000] tmet: tmet_Release
> [   16.006000] tmet: tmet_Open
> [   16.006000] tmet: tmet_Ioctl  80089d01
> [   16.006000] tmet: kTmet_iocRegConsumer 2141161732
> [   16.006000] tmet: kTmet_iocRegister: success chan 1112493908
> [   16.009000] tmet: tmet_Open
> [   16.009000] tmet: tmet_Ioctl  800c9d02
> [   16.009000] tmet: kTmet_iocOpenChannel 2141161864
> [   16.009000] tmet: kTmet_iocOpenChannel 2141161864
> [   16.009000] tmet: kTmet_iocOpenChannel state 1
> [   16.009000] tmet: tmet_Release
> [   16.009000] tmet: tmet_Release
> [   16.010000] tmet: tmet_Ioctl  800c9d05
> [   16.010000] tmet: Tmet_iocSendEvent 1112493908, errno 0
> [   16.010000] tmet: kTmet_iocSendEvent 1112493908 0
> [   16.010000] tmet: Tmet_PvtSendEvent, event type 0
> [   16.010000] tmet: tmet_PvtSendEvent: ChanName found
> [   16.059000] kwdt_open: Module:e019c41c Open Cnt:2 Device:cb1e5400
> Task:PkTimerThread Pid:1300 Tid:1394
> [   16.060000] kwdt_ioctl_RegisterTickle: device:cb1e5400 task:PkTimerThread
> pid:1300 tid:1394 duration:210000
> [   17.026000] eth1: no IPv6 routers present
> [  121.446000] UBI: attaching mtd14 to ubi1
> [  121.446000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
> [  121.446000] UBI: logical eraseblock size:    126976 bytes
> [  121.446000] UBI: smallest flash I/O unit:    2048
> [  121.446000] UBI: VID header offset:          2048 (aligned 2048)
> [  121.446000] UBI: data offset:                4096
> [  121.770000] UBI: max. sequence number:       27
> [  121.781000] UBI: attached mtd14 to ubi1
> [  121.781000] UBI: MTD device name:            "nand.ffs"
> [  121.781000] UBI: MTD device size:            64 MiB
> [  121.781000] UBI: number of good PEBs:        512
> [  121.781000] UBI: number of bad PEBs:         0
> [  121.781000] UBI: number of corrupted PEBs:   0
> [  121.781000] UBI: max. allowed volumes:       128
> [  121.781000] UBI: wear-leveling threshold:    4096
> [  121.781000] UBI: number of internal volumes: 1
> [  121.781000] UBI: number of user volumes:     1
> [  121.781000] UBI: available PEBs:             420
> [  121.781000] UBI: total number of reserved PEBs: 92
> [  121.781000] UBI: number of PEBs reserved for bad PEB handling: 5
> [  121.781000] UBI: max/mean erase counter: 7/3
> [  121.782000] UBI: image sequence number:  1630273738
> [  121.802000] UBI: background thread "ubi_bgt1d" started, PID 2597
> [  121.865000] UBIFS: recovery needed
> [  121.955000] UBIFS: recovery completed
> [  121.955000] UBIFS: mounted UBI device 1, volume 0, name "app0"
> [  121.955000] UBIFS: file system size:   9396224 bytes (9176 KiB, 8 MiB, 74
> LEBs)
> [  121.955000] UBIFS: journal size:       1015809 bytes (992 KiB, 0 MiB, 6
> LEBs)
> [  121.955000] UBIFS: media format:       w4/r0 (latest is w4/r0)
> [  121.955000] UBIFS: default compressor: lzo
> [  121.955000] UBIFS: reserved for root:  443806 bytes (433 KiB)
>
> Thanks,
> Pankaj Joshi
>
>
