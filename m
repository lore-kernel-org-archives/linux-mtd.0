Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F01BC352A4
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 19:00:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B67E2073C
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 19:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3izAolU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fM2ceHAI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B67E2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OEdcR+vVx0wdnK4HgECKsCdhm4nXTeOOI/EPCz809ns=; b=d3i
	zAolUvLBD9QMrN+SfC6YFYrr29pURgQA5jSetwTnQ9zJdUENB0QLjycQEUS8TsdsVKDNBYYRGv+gB
	PqQ3B+VSBXorUSOfiD4H1qUho3TFFQnp5EFCL3uB6G7VemJ6XUY7HnyCKlMuKaX7CxCFmv6vjsrVH
	AogdADC+GOtZig0UVlObRE31tWa9m7fufKsL9X9KDVkFu7zzyoBNKmCgK8sU5j+EJxhRWGWjf3Cbs
	cQcX9yeHRO7iE4IJch2yEmxfOoOgTei1Af7iAaorZaomBfopDrxbRH9CUxQibT1xa/RBvL3Vr6UOJ
	Y/gUrv2vdsqeMU1IFnsARkTsO5A7PJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1xFR-0006Em-K9; Wed, 12 Feb 2020 19:00:33 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1xFN-0006Do-98
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2020 19:00:32 +0000
Received: by mail-lj1-x234.google.com with SMTP id q8so3556935ljj.11
 for <linux-mtd@lists.infradead.org>; Wed, 12 Feb 2020 11:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MSCY/8G7DKaRQKLckVth0fsLbzk3yk8OxQdxeZSMq2s=;
 b=fM2ceHAILuygszBCS/QtKPQzFLmmqOR9IU0bJe2/zx1dMdfyPnFYGlNiA9SxO4B0tI
 m4dvGNW4S9ikmwlzYRysW2MMf8nidI4YYZeSuc4OSZeSg1FdHjt02Or76qCTeVzTZIpX
 /Oq02bY9HCEcAcCxmHDGb4/0FOiQg+4Hq7yARvW8pLAf/tWRIxgkvD8HVMx8nx17QgAf
 HYzGtOF9mhSuo3BUmPjbEqb0ojndnxW0y86KBHc30O1Hl0yRGedaQeaOHlG24kPvFSAF
 9vteH5WfO2NA0K1u4J4AyWkS7Lo3PcFcMakoK5sdbdPC+CUhR1RXW8K1j2kIxvmQfQ3h
 iclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MSCY/8G7DKaRQKLckVth0fsLbzk3yk8OxQdxeZSMq2s=;
 b=oa54JETlg0s+tocHEf2o9i8MuXtZrmPbEwlErd6wkbG9LUXkx8mbH5BSs6uKs/TDxW
 rJHcNhK8zLuoVzqcgH3dZh++lY8cf5OTTYRBVDJDPgJiDb8lrjq+f1Dq0i5D0D8p9uU3
 tFDbmZamVlZdx9Z6EkOmICBFvB+YotT62O9RQcrNkVFuQaHwunDJv2aY1HeMj0RgDsNM
 qqMapVGOLxx2fr3CdLeCYxztXDzyFR8HJ9V4wFsV777CajTS1YDPh4hEiKjAns3U4Stl
 ILQBUNl9vkRAQqu4UejVVpzgyUya7spak2+A78kr0JM5sAX+WLd4MgO/0s4+W76rPiSi
 mHSg==
X-Gm-Message-State: APjAAAV0h2pk+Z8RKfStkTjCc8wkg9sGN+eajfMj+qaOXKTXhZCL1IOC
 gxpVFTCh7rMdBIeAkTovnOo/LozDyhL2g+2f0f+vMxav
X-Google-Smtp-Source: APXvYqx1xP5d7rDI46FsvKgKOiU0w/oMP3kvkCrICAA4AkhG0192qbpojna3S0T5DLu4RX25Rytlqr/EJfgWB1t7aPA=
X-Received: by 2002:a2e:8755:: with SMTP id q21mr8853160ljj.156.1581534025641; 
 Wed, 12 Feb 2020 11:00:25 -0800 (PST)
MIME-Version: 1.0
From: Ben Schroeder <klowd92@gmail.com>
Date: Wed, 12 Feb 2020 21:00:13 +0200
Message-ID: <CAMk-x8MURQ1b-4su2S0pqsGZkX9Mi_GWBNKZE-dobqrGz9ZdVA@mail.gmail.com>
Subject: Flash corruption after power cut
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_110029_330890_7B815D74 
X-CRM114-Status: GOOD (  12.81  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi everyone,

I encounter an issue for a very small percentage of my boards get a
flash corruption after a power cut. This system is a 64mb SPI Nor
flash with UBI volume divided into thee partitions.

After the power cut, the partition with the corruption (/data) is mounted in RO.
I tried to remount the partition in RW in order to remove the
corrupted file, but it is not possible, as the partition will again be
switched into RO.

I have seen old threads about this. With suggestions to run mtd-tests,
and perhaps add a patch to the UBI driver to ignore corrupted flash.
The mtd-tests run successfully.
I have not seen a way to force a switch of the UBI partition to RW, or
to repair the corruption somehow.

My question are:
1. How can i recover the flash partition from a board in the field right now?
2. What would be the best solution for future issue with power-cut corruptions?
(I read that UBIFS is supposed to be resilient to power cut
corruptions, but with a few 100k boards we do encounter corruptions on
power cuts)
3. How can i identify the corrupted files? The UBIFS log shows:
UBIFS error (ubi0:2 pid 816): ubifs_check_node: bad CRC: calculated
0x35112843, read 0xa41fc682
UBIFS error (ubi0:2 pid 816): ubifs_check_node: bad node at LEB 51:11704
        magic          0x6101831
        crc            0xa41fc682
        node_type      9 (indexing node)
        group_type     0 (no node group)
        sqnum          1764588
        len            148
        child_cnt      6
        level          3
        Branches:
        0: LEB 28:1992 len 108 key (1, inode)
        1: LEB 51:11592 len 108 key (84, data, 14)
        2: LEB 56:21792 len 188 key (122, data, 10)
        3: LEB 51:10016 len 108 key (122, data, 522)
        4: LEB 111:7120 len 68 key (123, inode)
        5: LEB 56:23920 len 188 key (128, data, 26)
Are all the inodes listed corrupted?

Currently, my solution is to copy the entire partition into ram,
truncate the partition with ubiupdate -t, and then remount the
partition and copy back the files.

Thanks everyone,
Ben S.

================================================================

I am going to attach some info about the MTD layout, UBIFS partitions,
and system log:
/proc/mtd:
dev:    size   erasesize  name
mtd0: 00010000 00010000 "at91bootstrap"
mtd1: 00010000 00010000 "bootloaderenv"
mtd2: 00060000 00010000 "uboot"
mtd3: 00010000 00010000 "dtb1"
mtd4: 00010000 00010000 "dtb2"
mtd5: 00430000 00010000 "kernel1"
mtd6: 00430000 00010000 "kernel2"
mtd7: 03700000 00010000 "rootfs"
mtd8: 01604f80 0000ff80 "rootfs1"
mtd9: 01604f80 0000ff80 "rootfs2"
mtd10: 00a9ab00 0000ff80 "data"

================================================================

mtdinfo:
...
mtd7
Name:                           rootfs
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          880 (57671680 bytes, 55.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:14
Bad blocks are allowed:         false
Device is writable:             true

mtd8
Name:                           rootfs1
Type:                           ubi
Eraseblock size:                65408 bytes, 63.9 KiB
Amount of eraseblocks:          353 (23089024 bytes, 22.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:16
Bad blocks are allowed:         false
Device is writable:             true

mtd9
Name:                           rootfs2
Type:                           ubi
Eraseblock size:                65408 bytes, 63.9 KiB
Amount of eraseblocks:          353 (23089024 bytes, 22.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:18
Bad blocks are allowed:         false
Device is writable:             true

mtd10
Name:                           data
Type:                           ubi
Eraseblock size:                65408 bytes, 63.9 KiB
Amount of eraseblocks:          170 (11119360 bytes, 10.6 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:20
Bad blocks are allowed:         false
Device is writable:             true

================================================================
Booting Linux on physical CPU 0x0
Linux version 4.9.52-linux4sam_5.7
(devbox@runner-tsAuNK1_-project-15-concurrent-0) (gcc version 4.9.3
(Buildroot 2016.05-00957-g5754a58-dirty) ) #1 Wed Aug 14 12:40:57 UTC
2019
CPU: ARMv7 Processor [410fc051] revision 1 (ARMv7), cr=10c53c7d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
OF: fdt:Machine model: Atmel SAMA5D2 Xplained
cma: Failed to reserve 64 MiB
Memory policy: Data cache writeback
On node 0 totalpages: 32768
free_area_init_node: node 0, pgdat c092b104, node_mem_map c7efb000
  Normal zone: 256 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 32768 pages, LIFO batch:7
CPU: All CPU(s) started in SVC mode.
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 32512
Kernel command line: console=ttyS0,115200
mtdparts=spi32766.0:64k(at91bootstrap)ro,64k(bootloaderenv),384k(uboot)ro,64k(dtb1),64k(dtb2),4288k(kernel1),4288k(kernel2),-(rootfs)
rootfstype=ubifs ubi.mtd=7 w
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 121208K/131072K available (5120K kernel code, 175K rwdata,
1324K rodata, 1024K init, 159K bss, 9864K reserved, 0K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0xc8800000 - 0xff800000   ( 880 MB)
    lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .text : 0xc0008000 - 0xc0600000   (6112 kB)
      .init : 0xc0800000 - 0xc0900000   (1024 kB)
      .data : 0xc0900000 - 0xc092bf10   ( 176 kB)
       .bss : 0xc092bf10 - 0xc0953ea8   ( 160 kB)
NR_IRQS:16 nr_irqs:16 16
L2C-310 ID prefetch enabled, offset 2 lines
L2C-310 dynamic clock gating enabled, standby mode enabled
L2C-310 cache controller enabled, 8 ways, 128 kB
L2C-310: CACHE_ID 0x410000c9, AUX_CTRL 0x36020000
clocksource: pit: mask: 0x7ffffff max_cycles: 0x7ffffff, max_idle_ns:
11513617062 ns
sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every
21474836475000000ns
Console: colour dummy device 80x30
Calibrating delay loop... 329.31 BogoMIPS (lpj=1646592)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
Setting up static identity map for 0x20100000 - 0x20100058
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 2 part 30 variant 5 rev 1
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 19112604462750000 ns
futex hash table entries: 256 (order: -1, 3072 bytes)
pinctrl core: initialized pinctrl subsystem
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor ladder
AT91: PM: standby: standby, suspend: ulp0
AT91: mode = 0x20401, ploarity = 0400
tcb_clksrc: tc0 at 10.875 MHz
clocksource: tcb_clksrc: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 184217874325 ns
at_xdmac f0010000.dma-controller: 16 channels, mapped at 0xc8883000
at_xdmac f0004000.dma-controller: 16 channels, mapped at 0xc8885000
AT91: Could not find matching SoC description
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
clocksource: Switched to clocksource tcb_clksrc
NET: Registered protocol family 2
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
workingset: timestamp_bits=30 max_order=15 bucket_order=0
io scheduler noop registered (default)
pinctrl-at91-pio4 fc038000.pinctrl: atmel pinctrl initialized
f8020000.serial: ttyS0 at MMIO 0xf8020000 (irq = 33, base_baud =
5187500) is a ATMEL_SERIAL
console [ttyS0] enabled
fc00c000.serial: ttyS5 at MMIO 0xfc00c000 (irq = 38, base_baud =
5187500) is a ATMEL_SERIAL
[drm] Initialized
brd: module loaded
loop: module loaded
atmel_usart f8034200.serial: Using FIFO (32 data)
f8034200.serial: ttyS2 at MMIO 0xf8034200 (irq = 176, base_baud =
5187500) is a ATMEL_SERIAL
atmel_usart f8038200.serial: Using FIFO (32 data)
f8038200.serial: ttyS1 at MMIO 0xf8038200 (irq = 177, base_baud =
5187500) is a ATMEL_SERIAL
atmel_usart fc010200.serial: Using FIFO (32 data)
fc010200.serial: ttyS4 at MMIO 0xfc010200 (irq = 178, base_baud =
5187500) is a ATMEL_SERIAL
atmel_usart fc014200.serial: Using FIFO (32 data)
fc014200.serial: ttyS6 at MMIO 0xfc014200 (irq = 179, base_baud =
5187500) is a ATMEL_SERIAL
atmel_usart fc018200.serial: Using FIFO (32 data)
fc018200.serial: ttyS3 at MMIO 0xfc018200 (irq = 180, base_baud =
5187500) is a ATMEL_SERIAL
atmel_spi f8000000.spi: Using dma0chan0 (tx) and dma0chan1 (rx) for
DMA transfers
atmel_spi f8000000.spi: Using FIFO (16 data)
m25p80 spi32766.0: found mx66l51235l, expected at25df321a
m25p80 spi32766.0: mx66l51235l (65536 Kbytes)
8 cmdlinepart partitions found on MTD device spi32766.0
Creating 8 MTD partitions on "spi32766.0":
0x000000000000-0x000000010000 : "at91bootstrap"
0x000000010000-0x000000020000 : "bootloaderenv"
0x000000020000-0x000000080000 : "uboot"
0x000000080000-0x000000090000 : "dtb1"
0x000000090000-0x0000000a0000 : "dtb2"
0x0000000a0000-0x0000004d0000 : "kernel1"
0x0000004d0000-0x000000900000 : "kernel2"
0x000000900000-0x000004000000 : "rootfs"
atmel_spi f8000000.spi: Atmel SPI Controller version 0x311 at
0xf8000000 (irq 27)
libphy: Fixed MDIO Bus: probed
libphy: MACB_mii_bus: probed
Generic PHY f8008000.etherne:09: attached PHY driver [Generic PHY]
(mii_bus:phy_addr=f8008000.etherne:09, irq=-1)
macb f8008000.ethernet eth0: Cadence GEM rev 0x00020203 at 0xf8008000
irq 28 (00:27:02:11:a7:6c)
PPP generic driver version 2.4.2
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-atmel: EHCI Atmel driver
atmel-ehci 500000.ehci: EHCI Host Controller
atmel-ehci 500000.ehci: new USB bus registered, assigned bus number 1
atmel-ehci 500000.ehci: irq 18, io mem 0x00500000
atmel-ehci 500000.ehci: USB 2.0 started, EHCI 1.00
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 4.9.52-linux4sam_5.7 ehci_hcd
usb usb1: SerialNumber: 500000.ehci
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-atmel: OHCI Atmel driver
usbcore: registered new interface driver cdc_acm
cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
usbcore: registered new interface driver usb-storage
usbcore: registered new interface driver usbserial
usbcore: registered new interface driver usbserial_generic
usbserial: USB Serial support registered for generic
usbcore: registered new interface driver ftdi_sio
usbserial: USB Serial support registered for FTDI USB Serial Device
usbcore: registered new interface driver option
usbserial: USB Serial support registered for GSM modem (1-port)
usbcore: registered new interface driver pl2303
usbserial: USB Serial support registered for pl2303
RRCR: Initializing the RRCR
rtc rtc0: alarm rollover not handled
rtc rtc0: invalid alarm value: 1900-1-1 0:0:0
at91_rtc f80480b0.rtc: rtc core: registered f80480b0.rtc as rtc0
at91_rtc f80480b0.rtc: AT91 Real Time Clock driver.
i2c /dev entries driver
AT91: Starting after wakeup
sama5d4_wdt f8048040.watchdog: initialized (timeout = 16 sec, nowayout = 0)
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
sdhci-pltfm: SDHCI platform and OF driver helper
sdhci-at91 a0000000.sdio-host: update clk mul to 39 as gck rate is 480000000 Hz
mmc0: SDHCI controller on a0000000.sdio-host [a0000000.sdio-host] using ADMA
sdhci-at91 b0000000.sdio-host: update clk mul to 39 as gck rate is 480000000 Hz
mmc0: new high speed SDIO card at address 0001
mmc1: SDHCI controller on b0000000.sdio-host [b0000000.sdio-host] using ADMA
ledtrig-cpu: registered to indicate activity on CPUs
atmel_aes f002c000.aes: version: 0x500
atmel_aes f002c000.aes: Atmel AES - Using dma0chan2, dma0chan3 for DMA transfers
atmel_sha f0028000.sha: version: 0x510
atmel_sha f0028000.sha: using dma0chan4 for DMA transfers
atmel_sha f0028000.sha: Atmel SHA1/SHA256/SHA224/SHA384/SHA512
atmel_tdes fc044000.tdes: version: 0x703
atmel_tdes fc044000.tdes: using dma0chan5, dma0chan6 for DMA transfers
atmel_tdes fc044000.tdes: Atmel DES/TDES
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
wifi_pm : 0
wilc_sdio mmc0:0001:1: failed to get Reset GPIO, try default
wifi_pm : 1
wilc_sdio mmc0:0001:1: failed to get Reset GPIO, try default
wilc_sdio mmc0:0001:1: Driver Initializing success
EX_WD: Initializing the EX_WD
fc030000.adc supply vddana not found, using dummy regulator
fc030000.adc supply vref not found, using dummy regulator
EX_WD: Thread has started running
at91-sama5d2_adc fc030000.adc: setting up trigger as external_rising
at91-sama5d2_adc fc030000.adc: version: 800
NET: Registered protocol family 10
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered protocol family 17
ubi0: attaching mtd7
random: fast init done
ubi0: scanning is finished
ubi0: attached mtd7 (name "rootfs", size 55 MiB)
ubi0: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
ubi0: VID header offset: 64 (aligned 64), data offset: 128
ubi0: good PEBs: 880, bad PEBs: 0, corrupted PEBs: 0
ubi0: user volume: 3, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 1516/238, WL threshold: 4096, image
sequence number: 1579069867
ubi0: available PEBs: 0, total reserved PEBs: 880, PEBs reserved for
bad PEB handling: 0
ubi0: background thread "ubi_bgt0d" started, PID 709
input: gpio_keys as /devices/platform/gpio_keys/input/input0
at91_rtc f80480b0.rtc: setting system clock to 2020-02-12 17:50:45 UTC
(1581529845)
atmel_usart f8020000.serial: using dma0chan7 for rx DMA transfers
atmel_usart f8020000.serial: using dma0chan8 for tx DMA transfers
UBIFS (ubi0:1): background thread "ubifs_bgt0_1" started, PID 729
UBIFS (ubi0:1): UBIFS: mounted UBI device 0, volume 1, name "rootfs2"
UBIFS (ubi0:1): LEB size: 65408 bytes (63 KiB), min./max. I/O unit
sizes: 8 bytes/256 bytes
UBIFS (ubi0:1): FS size: 22434944 bytes (21 MiB, 343 LEBs), journal
size 8568448 bytes (8 MiB, 131 LEBs)
UBIFS (ubi0:1): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi0:1): media format: w4/r0 (latest is w4/r0), UUID
5FB13FF6-1AF2-4647-B2A3-E689F7017F0B, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:12.
devtmpfs: mounted
Freeing unused kernel memory: 1024K
UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, PID 735
UBIFS (ubi0:2): recovery needed
random: crng init done
UBIFS (ubi0:2): recovery completed
UBIFS (ubi0:2): UBIFS: mounted UBI device 0, volume 2, name "data"
UBIFS (ubi0:2): LEB size: 65408 bytes (63 KiB), min./max. I/O unit
sizes: 8 bytes/256 bytes
UBIFS (ubi0:2): FS size: 10465280 bytes (9 MiB, 160 LEBs), journal
size 8568448 bytes (8 MiB, 131 LEBs)
UBIFS (ubi0:2): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi0:2): media format: w4/r0 (latest is w4/r0), UUID
C4DB6285-8B4B-418C-8B6C-273F0AE43738, small LPT model
Interface is neither WLAN0 nor P2P0
IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
macb f8008000.ethernet eth0: link up (100/Full)
IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
UBIFS error (ubi0:2 pid 816): ubifs_check_node: bad CRC: calculated
0x35112843, read 0xa41fc682
UBIFS error (ubi0:2 pid 816): ubifs_check_node: bad node at LEB 51:11704
        magic          0x6101831
        crc            0xa41fc682
        node_type      9 (indexing node)
        group_type     0 (no node group)
        sqnum          1764588
        len            148
        child_cnt      6
        level          3
        Branches:
        0: LEB 28:1992 len 108 key (1, inode)
        1: LEB 51:11592 len 108 key (84, data, 14)
        2: LEB 56:21792 len 188 key (122, data, 10)
        3: LEB 51:10016 len 108 key (122, data, 522)
        4: LEB 111:7120 len 68 key (123, inode)
        5: LEB 56:23920 len 188 key (128, data, 26)
CPU: 0 PID: 816 Comm: rs:main Q:Reg Not tainted 4.9.52-linux4sam_5.7 #1
Hardware name: Atmel SAMA5
[<c010ce54>] (unwind_backtrace) from [<c010ab24>] (show_stack+0x10/0x14)
[<c010ab24>] (show_stack) from [<c025f0b0>] (ubifs_check_node+0xc8/0x238)
[<c025f0b0>] (ubifs_check_node) from [<c0265d94>] (ubifs_scan_a_node+0xbc/0x184)
[<c0265d94>] (ubifs_scan_a_node) from [<c026619c>] (ubifs_scan+0x58/0x2bc)
[<c026619c>] (ubifs_scan) from [<c0269970>]
(ubifs_garbage_collect_leb+0x70/0x778)
[<c0269970>] (ubifs_garbage_collect_leb) from [<c026a18c>]
(ubifs_garbage_collect+0x114/0x3d4)
[<c026a18c>] (ubifs_garbage_collect) from [<c0252cd0>]
(make_reservation+0x100/0x408)
[<c0252cd0>] (make_reservation) from [<c0253abc>]
(ubifs_jnl_write_inode+0x70/0x1e8)
[<c0253abc>] (ubifs_jnl_write_inode) from [<c025b384>]
(ubifs_write_inode+0xc0/0x114)
[<c025b384>] (ubifs_write_inode) from [<c02573bc>] (ubifs_writepage+0x124/0x1d0)
[<c02573bc>] (ubifs_writepage) from [<c016d554>] (__writepage+0x14/0x5c)
[<c016d554>] (__writepage) from [<c016ce80>] (write_cache_pages+0x170/0x3d0)
[<c016ce80>] (write_cache_pages) from [<c016d120>]
(generic_writepages+0x40/0x60)
[<c016d120>] (generic_writepages) from [<c0163f30>]
(__filemap_fdatawrite_range+0x78/0x9c)
[<c0163f30>] (__filemap_fdatawrite_range) from [<c0164070>]
(filemap_write_and_wait_range+0x34/0x74)
[<c0164070>] (filemap_write_and_wait_range) from [<c02563b4>]
(ubifs_fsync+0x40/0xb4)
[<c02563b4>] (ubifs_fsync) from [<c0164588>]
(generic_file_write_iter+0x19c/0x1fc)
[<c0164588>] (generic_file_write_iter) from [<c0257854>]
(ubifs_write_iter+0xe8/0x178)
[<c0257854>] (ubifs_write_iter) from [<c019c50c>] (__vfs_write+0xc0/0x118)
[<c019c50c>] (__vfs_write) from [<c019d17c>] (vfs_write+0xa4/0x164)
[<c019d17c>] (vfs_write) from [<c019df0c>] (SyS_write+0x44/0x9c)
[<c019df0c>] (SyS_write) from [<c01075a0>] (ret_fast_syscall+0x0/0x3c)
UBIFS error (ubi0:2 pid 816): ubifs_scan: bad node
UBIFS error (ubi0:2 pid 816): ubifs_scanned_corruption: corruption at
LEB 51:11704
UBIFS error (ubi0:2 pid 816): ubifs_scanned_corruption: first 8192
bytes from LEB 51:11704
00000000: 06101831 a41fc682 001aecec 00000000 00000094 00000009
00030006 0000001c  1...............................
00000020: 000007c8 0000006c 00000001 00000000 00000033 00002d48
0000006c 00000054  ....l...........3...H-..l...T...
00000040: 2000000e 00000038 00005520 000000bc 0000007a 2000000a
00000033 00002720  ... 8... U......z...... 3... '..
00000060: 0000006c 0000007a 2000020a 0000006f 00001bd0 00000044
0000007b 00000000  l...z...... o.......D...{.......
00000080: 00000038 00005d70 000000bc 00000080 2000001a 00000033
06101831 8bb7eeab  8...p]............. 3...1.......
000000a0: 001aecf4 00000000 0000006c 00000009 00000004 00000046
000089c0 0000003c  ........l...........F.......<...
000000c0: 00000057 20000000 0000001e 00009dc8 000000a0 00000058
00000000 0000009f  W...... ............X...........
000000e0: 0000be20 0000003c 00000058 20000000 00000086 00008c00
000000a0 00000059   ...<...X...... ............Y...
00000100: 00000000 00000000 06101831 0cc8279b 001aecf5 00000000
0000006c 00000009  ........1....'..........l.......
00000120: 00010004 00000033 00002bf8 0000006c 00000055 20000000
00000033 00002e50  ....3....+..l...U...... 3...P...
00000140: 0000006c 00000057 20000000 00000033 00000810 0000006c
00000059 20000000  l...W...... 3.......l...Y......
00000160: 00000033 00002a10 0000006c 0000005b 20000000 0000006c
06101831 9451134c  3....*..l...[...... l...1...L.Q.
00000180: 001aecf6 00000000 0000006c 00000009 00020004 00000084
000004b0 0000006c  ........l...................l...
000001a0: 00000054 2000000e 00000033 00002ec0 0000006c 00000055
20000000 00000033  T...... 3.......l...U...... 3...
000001c0: 000019f0 0000006c 0000005d 20000000 00000033 000024c0
0000006c 00000066  ....l...]...... 3....$..l...f...
000001e0: 20000000 00000033 06101831 46cb60af 001aecf7 00000000
00000094 00000009  ... 3...1....`.F................
00000200: 00030006 0000001d 000007c8 0000006c 00000001 00000000
00000033 00002f30  ............l...........3...0/..
00000220: 0000006c 00000054 2000000e 00000038 00005520 000000bc
0000007a 2000000a  l...T...... 8... U......z......
00000240: 00000033 00002720 0000006c 0000007a 2000020a 0000006f
00001bd0 00000044  3... '..l...z...... o.......D...
00000260: 0000007b 00000000 00000038 00005d70 000000bc 00000080
2000001a 00000018  {.......8...p]............. ....
00000280: 06101831 3dabccd2 001aed00 00000000 0000006c 00000009
00000004 00000046  1......=........l...........F...
000002a0: 000089c0 0000003c 00000057 20000000 0000001e 00009dc8
000000a0 00000058  ....<...W...... ............X...
000002c0: 00000000 0000009f 0000be20 0000003c 00000058 20000000
00000086 00009100  ........ ...<...X...... ........
000002e0: 000000a0 00000059 00000000 0000006c 06101831 c00a1146
001aed01 00000000  ....Y.......l...1...F...........
00000300: 0000006c 00000009 00000004 00000046 00008a00 0000003c
00000059 20000000  l...........F.......<...Y......
00000320: 0000001e 00009f08 000000a0 0000005a 00000000 0000009f
0000be60 0000003c  ............Z...........`...<...
00000340: 0000005a 20000000 0000001e 00009fa8 000000a0 0000005b
00000000 000000bc  Z...... ............[...........
00000360: 06101831 c32bdfcd 001aed02 00000000 0000006c 00000009
00010004 00000033  1.....+.........l...........3...
00000380: 00002bf8 0000006c 00000055 20000000 00000033 00003038
0000006c 00000057  .+..l...U...... 3...80..l...W...
..... REMOVED TO REDUCE TEXT ....
..... REMOVED TO REDUCE TEXT ....
00001a80: 20000212 00000084 00000d40 000000bc 0000007a 2000021a
0000006f 00000b40  ... ....@.......z...... o...@...
00001aa0: 000000bc 0000007a 20000222 0000001d 00000950 000000bc
0000007a 2000022a  ....z...".. ....P.......z...*..
00001ac0: 00000084 000008d0 000000bc 0000007a 20000232 00000018
00000210 000000bc  ............z...2.. ............
00001ae0: 0000007a 2000023a 00000033 00004738 000000bc 0000007a
20000242 0000ba10  z...:.. 3...8G......z...B.. ....
00001b00: 06101831 ec4e165c 001aed6a 00000000 0000006c 00000009
00020004 00000033  1...\.N.j.......l...........3...
00001b20: 000047f8 000000bc 0000007a 2000020a 00000045 00006740
000000bc 0000007a  .G......z...... E...@g......z...
00001b40: 2000024a 000000a8 00003ad0 000000bc 0000007a 2000028a
00000018 00001330  J.. .....:......z...... ....0...
00001b60: 0000006c 0000007a 200002ca 0000001d 06101831 aa280795
001aed6b 00000000  l...z...... ....1.....(.k.......
00001b80: 00000094 00000009 00030006 0000001d 000007c8 0000006c
00000001 00000000  ....................l...........
00001ba0: 00000033 000046c8 0000006c 00000054 2000000e 00000038
00005520 000000bc  3....F..l...T...... 8... U......
00001bc0: 0000007a 2000000a 00000033 000048b8 0000006c 0000007a
2000020a 0000006f  z...... 3....H..l...z...... o...
UBIFS error (ubi0:2 pid 10): make_reservation: cannot reserve 160
bytes in jhead 1, error -30
UBIFS error (ubi0:2 pid 10): ubifs_write_inode: can't write inode 134, error -30
00001be0: 00001bd0 00000044 0000007b 00000000 00000038 00005d70
000000bc 00000080  ....D...{.......8...p]..........
00001c00: 2000001a 000000a8 06101831 6bda0070 001aed73 00000000
000000bc 00000009  ... ....1...p..ks...............
00001c20: 00000008 0000004c 00006a80 000009a0 0000007a 20000242
0000001b 00002d08  ....L....j......z...B.. .....-..
00001c40: 0000096c 0000007a 20000243 0000001b 0000d930 00000946
0000007a 20000244  l...z...C.. ....0...F...z...D..
00001c60: 0000008a 000083e8 0000097f 0000007a 20000245 00000060
000044f0 00000984  ............z...E.. `....D......
00001c80: 0000007a 20000246 00000060 0000f510 00000989 0000007a
20000247 00000046  z...F.. `...........z...G.. F...
00001ca0: 00001348 00000a2b 0000007a 20000248 00000046 0000b748
000008a2 0000007a  H...+...z...H.. F...H.......z...
00001cc0: 20000249 00000000 06101831 e1f7f7d1 001aed74 00000000
000000bc 00000009  I.. ....1.......t...............
00001ce0: 00010008 00000038 000055e0 000000bc 0000007a 2000020a
00000038 000056a0  ....8....U......z...... 8....V..
00001d00: 000000bc 0000007a 20000212 00000084 00000d40 000000bc
0000007a 2000021a  ....z...... ....@.......z......
00001d20: 0000006f 00000b40 000000bc 0000007a 20000222 0000001d
00000950 000000bc  o...@.......z...".. ....P.......
00001d40: 0000007a 2000022a 00000084 000008d0 000000bc 0000007a
20000232 00000018  z...*.. ............z...2.. ....
00001d60: 00000210 000000bc 0000007a 2000023a 00000033 000049c0
000000bc 0000007a  ........z...:.. 3....I......z...
00001d80: 20000242 00000000 06101831 c582d040 001aed75 00000000
0000006c 00000009  B.. ....1...@...u.......l.......
00001da0: 00020004 00000033 00004a80 000000bc 0000007a 2000020a
00000045 00006740  ....3....J......z...... E...@g..
00001dc0: 000000bc 0000007a 2000024a 000000a8 00003ad0 000000bc
0000007a 2000028a  ....z...J.. .....:......z......
00001de0: 00000018 00001330 0000006c 0000007a 200002ca 0000001d
06101831 8dbb5d61  ....0...l...z...... ....1...a]..
00001e00: 001aed76 00000000 00000094 00000009 00030006 0000001d
000007c8 0000006c  v...........................l...
00001e20: 00000001 00000000 00000033 000046c8 0000006c 00000054
2000000e 00000038  ........3....F..l...T...... 8...
00001e40: 00005520 000000bc 0000007a 2000000a 00000033 00004b40
0000006c 0000007a   U......z...... 3...@K..l...z...
00001e60: 2000020a 0000006f 00001bd0 00000044 0000007b 00000000
00000038 00005d70  ... o.......D...{.......8...p]..
00001e80: 000000bc 00000080 2000001a 000000bc 06101831 fe9eac7c
001aed7f 00000000  ........... ....1...|...........
00001ea0: 0000006c 00000009 00000004 0000009f 0000c498 000001b3
00000079 20000000  l.......................y......
00001ec0: 00000086 00009420 000000a0 0000007a 00000000 0000006d
00001590 0000056c  .... .......z.......m.......l...
00001ee0: 0000007a 20000000 0000006d 00006428 0000046b 0000007a
20000001 0000001d  z...... m...(d..k...z...... ....
00001f00: 06101831 97cf15e7 001aed80 00000000 0000006c 00000009
00010004 00000084  1...............l...............
00001f20: 00000a38 00000058 00000066 20000000 00000084 00000a90
0000006c 00000072  8...X...f...... ........l...r...
00001f40: 00000000 00000033 00004c48 0000006c 00000079 20000000
0000006f 00000230  ....3...HL..l...y...... o...0...
00001f60: 000000bc 0000007a 20000002 0000006f 06101831 ad9212cb
001aed81 00000000  ....z...... o...1...............
00001f80: 0000006c 00000009 00020004 00000084 000004b0 0000006c
00000054 2000000e  l...................l...T......
00001fa0: 00000033 000041a8 0000006c 00000055 20000000 00000033
00004470 0000006c  3....A..l...U...... 3...pD..l...
00001fc0: 0000005d 20000000 00000033 00004cb8 0000006c 00000066
20000000 00000084  ]...... 3....L..l...f...... ....
00001fe0: 06101831 a4c4ad3e 001aed82 00000000 000000bc 00000009
00000008 0000004c  1...>.......................L...
UBIFS error (ubi0:2 pid 816): ubifs_scan: LEB 51 scanning failed
UBIFS warning (ubi0:2 pid 816): ubifs_ro_mode.part.0: switched to
read-only mode, error -117
CPU: 0 PID: 816 Comm: rs:main Q:Reg Not tainted 4.9.52-linux4sam_5.7 #1
Hardware name: Atmel SAMA5
[<c010ce54>] (unwind_backtrace) from [<c010ab24>] (show_stack+0x10/0x14)
[<c010ab24>] (show_stack) from [<c026a248>] (ubifs_garbage_collect+0x1d0/0x3d4)
[<c026a248>] (ubifs_garbage_collect) from [<c0252cd0>]
(make_reservation+0x100/0x408)
[<c0252cd0>] (make_reservation) from [<c0253abc>]
(ubifs_jnl_write_inode+0x70/0x1e8)
[<c0253abc>] (ubifs_jnl_write_inode) from [<c025b384>]
(ubifs_write_inode+0xc0/0x114)
[<c025b384>] (ubifs_write_inode) from [<c02573bc>] (ubifs_writepage+0x124/0x1d0)
[<c02573bc>] (ubifs_writepage) from [<c016d554>] (__writepage+0x14/0x5c)
[<c016d554>] (__writepage) from [<c016ce80>] (write_cache_pages+0x170/0x3d0)
[<c016ce80>] (write_cache_pages) from [<c016d120>]
(generic_writepages+0x40/0x60)
[<c016d120>] (generic_writepages) from [<c0163f30>]
(__filemap_fdatawrite_range+0x78/0x9c)
[<c0163f30>] (__filemap_fdatawrite_range) from [<c0164070>]
(filemap_write_and_wait_range+0x34/0x74)
[<c0164070>] (filemap_write_and_wait_range) from [<c02563b4>]
(ubifs_fsync+0x40/0xb4)
[<c02563b4>] (ubifs_fsync) from [<c0164588>]
(generic_file_write_iter+0x19c/0x1fc)
[<c0164588>] (generic_file_write_iter) from [<c0257854>]
(ubifs_write_iter+0xe8/0x178)
[<c0257854>] (ubifs_write_iter) from [<c019c50c>] (__vfs_write+0xc0/0x118)
[<c019c50c>] (__vfs_write) from [<c019d17c>] (vfs_write+0xa4/0x164)
[<c019d17c>] (vfs_write) from [<c019df0c>] (SyS_write+0x44/0x9c)
[<c019df0c>] (SyS_write) from [<c01075a0>] (ret_fast_syscall+0x0/0x3c)
UBIFS error (ubi0:2 pid 816): make_reservation: cannot reserve 160
bytes in jhead 1, error -117
UBIFS error (ubi0:2 pid 816): ubifs_write_inode: can't write inode
134, error -117
WILC POWER UP
wilc_sdio mmc0:0001:1: SDIO speed: 50000000
wilc_sdio mmc0:0001:1: chipid 001003a0
wilc_sdio mmc0:0001:1: failed to get IRQ GPIO, load default
Interface is neither WLAN0 nor P2P0
Interface is neither WLAN0 nor P2P0
Interface is neither WLAN0 nor P2P0
UBIFS error (ubi0:2 pid 10): make_reservation: cannot reserve 160
bytes in jhead 1, error -30
UBIFS error (ubi0:2 pid 10): ubifs_write_inode: can't write inode 134, error -30

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
