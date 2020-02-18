Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F639C34026
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 18:05:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F6B12070B
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 18:05:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D5XOlzON";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oh7PpvpV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F6B12070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Qe9mFWQ8VhWn+xgvOwzQMXhM3ODH8G/KIE9auP0m/vk=; b=D5X
	OlzONLtK+utjEgrv7ewc4qvPSUGQht/84oiFp/Is+noL+P9jJ2d8rAjwnU9hp3wzkUzEdk6HNcpo4
	sYn7kjGjUMeKrqcv8d4oq3sOlcoS+9VUKqTF+mOjUlBzhSC4vz6rDp0CY+TdeO62FmNGXUY+FFcjQ
	pAT+ZRgl97gLk47IOz3kP61hlfIbEprHEXCdV5xkwMPpxPDOoReq2/KRcKHQ25imQWGX5CxSZSJEw
	aHFXboOGf8mAxvL9Aeopp2dqOe0kRVOSYnsPsiAMLQEp3gCK4FwqWBwAiVnd0jxBAJg4cYkJBq5dg
	ge91jmpkfyZLSkuemrwDgFjpZZXfxlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j47Fc-0004ew-0r; Tue, 18 Feb 2020 18:05:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j47FX-0004Y0-0I
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 18:05:37 +0000
Received: by mail-lf1-x12f.google.com with SMTP id y19so15192395lfl.9
 for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2020 10:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cT6xBjIZvHhmaPSfDB4cfhWPR/fQwiMlJdTIuvpvWes=;
 b=oh7PpvpVFuSaQ7vwF1e2bB8XfTmPJ2cDukIEgfB+9lfCv7keSHEKEz2ZlhfJMZrX29
 BRD5vTMlcjHYh080GdIZMM5JMaSzN1IlRMFnCR+53b70tQ5qxMr7yGMXVGb3k55HjZui
 fTekLrOSiuEwNB/kfxfvKO/XBhqIy2jgqFF7aQB5EFl9GVmic8TaemmMK4OYVQACOAca
 YyDZCKaqU5V7XOTpBQdnd3sgbWT7nPnpepQozPEMw37ft4uEAOq8YhGQ0Y0j+cq/Ys1o
 4Gd1NZA0DNrUd1w3u2FgOSZ9djYDIjF9GGKvGco/G6iUYxFlDER42BbLP52R03jYCmXK
 oKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cT6xBjIZvHhmaPSfDB4cfhWPR/fQwiMlJdTIuvpvWes=;
 b=hAkKaHiU92yn8EyjUM/FzeIFdtfIhpy2CmtuHDVb9eJSZQ+2x4Xrde1O763xVnlmJM
 1TX+6LbLiS6jKGf5R7IOe7mq5YHURPllQSUQt8z3AneIn9DzhPYdcKVTnTmm8X/djPQT
 0Q7m96yduHJk1BxDpj4l74vNNyHtmXtqxz7ySnxnSXsxtglJwi+WO7Xhe217shNrFTXy
 v40ojGXUvMKxjm8DOEjLjGSsPJ5SdRXwtyy3yU0kHoAOYCjnxMH+yqzBoR1nS1ato0AU
 J13JSja6Aj09gFxUdPgdttkASgoDvuYGw8ay16gRIYcd5+F2yM2Ht+jnOxkBlkfyaPh7
 PjHQ==
X-Gm-Message-State: APjAAAWqaP30jyvIXo/9RL/uWZkMczAjuPcuw3KWNtyGdZlDYi5CIsiS
 Rqc+ISUrzfzdn6If+yVKWFEkKwG+IQWtGXe3OQ5XNFQC
X-Google-Smtp-Source: APXvYqyESfEtE1hkto01eHebONlE2WxZH80U0BW5quNrCNHibjDqUR6FqcwwRMK++nMMsva//LwRLOxpPX3T5zKr+rk=
X-Received: by 2002:a19:7711:: with SMTP id s17mr10975649lfc.164.1582049131830; 
 Tue, 18 Feb 2020 10:05:31 -0800 (PST)
MIME-Version: 1.0
From: Ben Schroeder <klowd92@gmail.com>
Date: Tue, 18 Feb 2020 20:05:20 +0200
Message-ID: <CAMk-x8Ny+-hisP3VZSAoGi5jTV0GZaX6Q62of1Uuh1D=wrfgfw@mail.gmail.com>
Subject: Empty space corruption
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_100535_055694_FFD1DDDC 
X-CRM114-Status: GOOD (  11.53  )
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

I have a UBIFS error of empty space corrupted.
UBIFS tries to recover but fails again because of the corruption.
How can i recover from this situation?

I do not see any inodes as indicated for an error.
Should i copy the files and truncate the partition?
Is there a solution that does not require formatting the partition?

I am attaching the system log.

Booting Linux on physical CPU 0x0
Linux version 4.9.52-linux4sam_5.7
(devbox@runner-tsAuNK1_-project-15-concurrent-0) (gcc version 4.9.3
(Buildroot 2016.05-01368-g9d68f5b-dirty) ) #1 Wed Oct 23 19:04:33 UTC
2019
CPU: ARMv7 Processor [410fc051] revision 1 (ARMv7), cr=10c53c7d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
OF: fdt:Machine model: Atmel SAMA5D2 Xplained
cma: Failed to reserve 64 MiB
Memory policy: Data cache writeback
On node 0 totalpages: 32768
free_area_init_node: node 0, pgdat c092b744, node_mem_map c7efb000
  Normal zone: 256 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 32768 pages, LIFO batch:7
CPU: All CPU(s) started in SVC mode.
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 32512
Kernel command line: console=ttyS0,115200
mtdparts=spi32766.0:64k(at91bootstrap)ro,64k(bootloaderenv),384k(uboot)ro,64k(dtb1),64k(dtb2),4288k(kernel1),4288k(kernel2),-(rootfs)
rootfstype=ubifs ubi.mtd=7 root=ubi0:rootfs2 rw
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 121200K/131072K available (5120K kernel code, 177K rwdata,
1332K rodata, 1024K init, 162K bss, 9872K reserved, 0K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0xc8800000 - 0xff800000   ( 880 MB)
    lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .text : 0xc0008000 - 0xc0600000   (6112 kB)
      .init : 0xc0800000 - 0xc0900000   (1024 kB)
      .data : 0xc0900000 - 0xc092c6a8   ( 178 kB)
       .bss : 0xc092c6a8 - 0xc0955200   ( 163 kB)
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
SEDG_SERIAL:  6driver init
rtc rtc0: alarm rollover not handled
rtc rtc0: invalid alarm value: 1900-1-1 0:0:0
at91_rtc f80480b0.rtc: rtc core: registered f80480b0.rtc as rtc0
at91_rtc f80480b0.rtc: AT91 Real Time Clock driver.
i2c /dev entries driver
AT91: Starting after software reset
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
ip_tables: (C) 2000-2006 Netfilter Core Team
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
ubi0: max/mean erase counter: 22/4, WL threshold: 4096, image sequence
number: 866278825
ubi0: available PEBs: 0, total reserved PEBs: 880, PEBs reserved for
bad PEB handling: 0
ubi0: background thread "ubi_bgt0d" started, PID 707
input: gpio_keys as /devices/platform/gpio_keys/input/input0
at91_rtc f80480b0.rtc: setting system clock to 2020-02-17 21:10:31 UTC
(1581973831)
atmel_usart f8020000.serial: using dma0chan7 for rx DMA transfers
atmel_usart f8020000.serial: using dma0chan8 for tx DMA transfers
UBIFS (ubi0:1): background thread "ubifs_bgt0_1" started, PID 727
UBIFS (ubi0:1): UBIFS: mounted UBI device 0, volume 1, name "rootfs2"
UBIFS (ubi0:1): LEB size: 65408 bytes (63 KiB), min./max. I/O unit
sizes: 8 bytes/256 bytes
UBIFS (ubi0:1): FS size: 22434944 bytes (21 MiB, 343 LEBs), journal
size 8568448 bytes (8 MiB, 131 LEBs)
UBIFS (ubi0:1): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi0:1): media format: w4/r0 (latest is w4/r0), UUID
AE877148-6500-448D-837C-00634E2F8C29, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:12.
devtmpfs: mounted
Freeing unused kernel memory: 1024K
UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, PID 732
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
Interface is neither WLAN0 nor P2P0
UBIFS error (ubi0:2 pid 827): ubifs_scan: corrupt empty space at LEB 57:22272
UBIFS error (ubi0:2 pid 827): ubifs_scanned_corruption: corruption at
LEB 57:22272
UBIFS error (ubi0:2 pid 827): ubifs_scanned_corruption: first 8192
bytes from LEB 57:22272
00000000: 4effd793 00000000 5dd7d6be 00000000 5dd7d6be 00000000
00000000 00000000  ...N.......].......]............
00000020: 00000000 00000001 00000000 00000000 00008180 00000001
00000000 00000000  ................................
00000040: 00000000 00000000 00000000 00000001 00000000 00000000
00000000 00000000  ................................
00000060: 00000000 00000000 06101831 d6c6af91 0000abbb 00000000
00000038 00000204  ........1...............8.......
00000080: 00000074 00000000 00000000 00000000 00000030 00000000
00000000 00000000  t...............0...............
000000a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff  ................................
000000c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff  ................................
000000e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff  ................................
00000100: 00000000 00000000 000081a4 00000001 00000000 00000000
00000000 00000000  ................................
....

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
