Return-Path: <SRS0=cBb+=FT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4025C4361B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 16:36:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 405152255F
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 16:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 405152255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4PArgxilAvfpf+fjlUB7fQDwrpMFfcytotmrPAV2XAE=; b=WolWk+dyhGR1Ah1IEpOdCcghG
	tLX/1VBcRhcX2B4vOwsn+jwqK4uavLSa3wcxIXEk5ZkY/7PhkFELAYGODRs941fRJ5b9YBiUsQYUj
	ytmiTPaMKeX18cAuhGi/KZx7/McSpPvraUAjmD38aYiRdm/D3fF57kJkrQvq0XOmUVeFEhkUOBxu2
	8Cd8IHrFu983DPCTD1hCR04NmB3/4zf6Dv24lgryyYOhAPAWT4dbHDWKWp366cl30vuBMBXiuijzR
	y9jGJdwTp1rkaxhsnGN6jQv/GlWUrpLjf+CFctLy0tXdRD3drHi2xwXD9jbt484nwhz1XP/zI2mt3
	s8gbSFyPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpDHx-0003dZ-J8; Tue, 15 Dec 2020 16:35:01 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpDHu-0003cT-HM
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2020 16:35:00 +0000
Received: by mail-il1-x130.google.com with SMTP id p5so19774823iln.8
 for <linux-mtd@lists.infradead.org>; Tue, 15 Dec 2020 08:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iu5ZoidOT52fHOSDhn5lMyoPBVVKiZrmA2+ZAavK+j0=;
 b=Fsnz+GSEZatk1zPOGvEJJMcAYDzri1UDIjScMbeGKNGSFkdG8Ht1hHc96v7NTrrUk4
 FbCRpqI6qBXDXCUPH2g3W2rSZHaTSX4Ed/zhxpxR0+fdKNXvcl81fkVOnA1Yg3kutCpl
 dn1JhaD9qNngOtn11tBK6/Bq15zyz+RE/Bx2quzGasGHr9JnlPmr5+HWznxskd8FEcl3
 YUgM/163eH/1b+mCLE+VM8VJru6XeZXkSWLjEaYCh2zeqBD+dyPzpgIpVbje0APzv1fz
 3pxkdlp6Let4HQaBD0DAzyR2Sd60ev+Jln8gX9kSS8W7zSEvUU92DBq7OSE0To0R1CB5
 vBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iu5ZoidOT52fHOSDhn5lMyoPBVVKiZrmA2+ZAavK+j0=;
 b=ML2YylUVDskz7TC78SC2mcROuw7DV8o2FRqydt4y0WoSN0tzbeFtJNAk353kXWXYra
 nsAL695+8y5qyQkdZ3qfjtIO6Oz4pxBE1KyRakZnEcEcpZskQTmxEbPLDNmYHWtN9/u6
 807Odfvu1rAmn2dUaYajSftOzfOKqWi0Pr0QS+cGOwf6MdX3TaSxUMbDNZ/Jzaq1ja4U
 xvMCr8Xof3kP+8Whgd0g4VUNe1ZFvq0RoZtlK6rGodnhJplgVZ2mugXdU5ZKbgoNpXOQ
 yimjFfVbAiRQ6gd7qBxscdAn/apI2jsfcTxlrQmmBZShGYTE0yBZBmcae6PaO0Upefuw
 lsHg==
X-Gm-Message-State: AOAM5300XQJBu001NcD4qpdLBks+IboT00GX3JEZYoVW+FkeIHLds6KC
 t78uMLuXnxJ5Uvly+cXpJGfaEiuweHafcC+BjlQ=
X-Google-Smtp-Source: ABdhPJyxX6iobVraSc597wMu6u4HW5NkXp7yWnbL3iImd2BsxvZCCA7l9tTRxRvKHphxCfhqGOjS3XkVoeCnwLEjI4w=
X-Received: by 2002:a92:d11:: with SMTP id 17mr42216525iln.84.1608050096018;
 Tue, 15 Dec 2020 08:34:56 -0800 (PST)
MIME-Version: 1.0
References: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
 <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
 <CAK+FTGjg1sMtE0Vk=mztO6_HP0VJ=mYy1b0nAEXDw6Dtx6AtUw@mail.gmail.com>
 <2020191742.126461.1607959229137.JavaMail.zimbra@nod.at>
 <CAK+FTGirwvd5Sdww4kkYCy0BMmnZsP=Tq=cAePxraXa3AcGbiQ@mail.gmail.com>
 <CAK+FTGhhFCVM4wazP5epp9E9kPf7=iAYRCmwZECXmszBmRERzw@mail.gmail.com>
 <20201215165636.41d69087@xps13>
In-Reply-To: <20201215165636.41d69087@xps13>
From: David Schaefer <david.tillmann.schaefer@gmail.com>
Date: Tue, 15 Dec 2020 17:34:45 +0100
Message-ID: <CAK+FTGin3jY2B6Ym4iZma0xs-YhRU24b90yPgQS9ZNTVi84SDA@mail.gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_113458_669659_93B4CD1B 
X-CRM114-Status: GOOD (  23.87  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,
Am Di., 15. Dez. 2020 um 16:56 Uhr schrieb Miquel Raynal
<miquel.raynal@bootlin.com>:
> > Well, I now was brave enough to try to write to the block devices with
> > the last kernel and it failed, io error.
>
> I saw successful logs in your previous e-mail. Was I misunderstanding
> something?
>
> Also there is absolutely nothing we can do without the logs (including
> boot).

In my last mail I sent 8 non-complete bootlogs from the region that
might be important as
I understand it. Starting with the second commit the system boots up
and the devices
appear but I have several different issues like
- marvell-nfc f10d0000.nand: Timeout waiting for RB signal
- armada-370-pinctrl f1018000.pin-ctrl: unsupported function gpio on pin mpp54
pinctrl core: failed to register map default (0): invalid type given
reg-fixed-voltage: probe of regulators:regulator@2 failed with error -22
- hctosys: unable to open rtc device (rtc0)
- print_req_error: I/O error, dev mtdblock6, sector 0
print_req_error: I/O error, dev mtdblock6, sector 0
print_req_error: I/O error, dev mtdblock6, sector 0
print_req_error: I/O error, dev mtdblock5, sector 0
print_req_error: I/O error, dev mtdblock5, sector 0
print_req_error: I/O error, dev mtdblock5, sector 0
print_req_error: I/O error, dev mtdblock4, sector 0
print_req_error: I/O error, dev mtdblock4, sector 0
print_req_error: I/O error, dev mtdblock4, sector 0
print_req_error: I/O error, dev mtdblock3, sector 0

and dd reports

dd: writing '/dev/mtdblock1': Input/output error

I am not sure which of these messages above are due to the driver
issue. Also I would
like to be clear that eventually I would like to run a recent kernel,
I am running 4.16 only
for debugging the driver issue.

I have attached a complete bootlog for the kernel I obtained by
cherry-picking all the
commits (and solving conflicts with -X theirs) on the v4.16 tag.
Please advice me if I did
anything wrong or you need any more information.

Kind regards
David

Bootlog below:

BootROM 1.08
Booting from NAND flash
High speed PHY - Version: 2.1.2 (COM-PHY-V20)
Update PEX Device ID 0x67100
High speed PHY - Ended Successfully
                                   DDR3 Training Sequence - Ver 4.5.0
DDR3 Training Sequence - Ended Successfully
Status = MV_OK
BootROM: Image checksum verification PASSED

 ** LOADER **


U-Boot 2011.12 (Dec 24 2013 - 20:21:45) Marvell version: v2011.12
2013_Q1.2 (ALPHA U-BOOT : 1.0)

Board: RD-88F6710_ALpha_KingsCanyon
SoC:   MV6710 A1
CPU:   Marvell PJ4B v7 UP (Rev 1) LE
       CPU    @ 1200 [MHz]
       L2     @ 600 [MHz]
       TClock @ 200 [MHz]
       DDR    @ 600 [MHz]
       DDR 16Bit Width, FastPath Memory Access
DRAM:  512 MiB

Map:   Code:            0x1fef5000:0x1ff9faac
       BSS:             0x1ffef784
       Stack:           0x1f9f4ef8
       Heap:            0x1f9f5000:0x1fef5000

NAND:  flash id : daad
256 MiB
MMC:   MRVL_MMC: 0
Bad block table found at page 131008, version 0x01
Bad block table found at page 130944, version 0x01
nand_read_bbt: Bad block at 0x00000e7c0000
PEX 0: Root Complex Interface, Detected Link X1, GEN 2.0
PEX 0.1(1): Detected No Link.
FPU not initialized
USB 0: Host Mode
USB 1: Host Mode
Modules/Interfaces Detected:
       RGMII1 Phy
       PEX0 (Lane 0)
       PEX1 (Lane 1)
       SATA0 (Lane 2)
       SATA1 (Lane 3)
Not Marvell PHY id1 ffff id2 ffff
Enable HD1
Enable HD2
Net:   egiga1
Warning: egiga1 MAC addresses don't match:
Address in SROM is         00:50:43:02:00:00
Address in environment is  00:50:43:02:02:00

Hit any key to stop autoboot:  0
Marvell>> dhcp; setenv serverip 192.168.178.34; tftp 0x2000000
uImage416-patch8; tftp 0x3000000 uRamdisk; bootm 0x2000000 0x3000000
BOOTP broadcast 1
*** Unhandled DHCP Option in OFFER/ACK: 28
*** Unhandled DHCP Option in OFFER/ACK: 42
*** Unhandled DHCP Option in OFFER/ACK: 158
*** Unhandled DHCP Option in OFFER/ACK: 28
*** Unhandled DHCP Option in OFFER/ACK: 42
*** Unhandled DHCP Option in OFFER/ACK: 158
DHCP client bound to address 192.168.178.76
Using egiga1 device
TFTP from server 192.168.178.34; our IP address is 192.168.178.76
Filename 'uImage416-patch8'.
Load address: 0x2000000
Loading: #################################################################
         #################################################################
         #################################################################
         ########################################################
done
Bytes transferred = 3670168 (380098 hex)
Using egiga1 device
TFTP from server 192.168.178.34; our IP address is 192.168.178.76
Filename 'uRamdisk'.
Load address: 0x3000000
Loading: #################################################################
         #################################################################
         #####################################################
done
Bytes transferred = 2679866 (28e43a hex)
## Booting image at 02000000 ...
## Booting kernel from Legacy Image at 02000000 ...
   Image Name:   armada-370-wdmc-mirror-gen1
   Created:      2020-12-15   9:54:58 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3670104 Bytes = 3.5 MiB
   Load Address: 00008000
   Entry Point:  00008000
   Verifying Checksum ... OK
## Loading init Ramdisk from Legacy Image at 03000000 ...
   Image Name:   Ramdisk
   Created:      2017-02-04  18:43:13 UTC
   Image Type:   ARM Linux RAMDisk Image (lzma compressed)
   Data Size:    2679802 Bytes = 2.6 MiB
   Load Address: 00e00000
   Entry Point:  00e00000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Booting Linux on physical CPU 0x0
Linux version 4.16.0+ (david@debian) (gcc version 8.3.0 (Debian
8.3.0-2)) #4 SMP Tue Dec 15 03:44:21 EST 2020
CPU: ARMv7 Processor [561f5811] revision 1 (ARMv7), cr=10c5387d
CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
OF: fdt: Machine model: WD MyCloud Mirror
Memory policy: Data cache writeback
CPU: All CPU(s) started in SVC mode.
percpu: Embedded 15 pages/cpu @(ptrval) s32716 r8192 d20532 u61440
Built 1 zonelists, mobility grouping on.  Total pages: 129920
Kernel command line: root=/dev/ram console=ttyS0,115200 max_loop=32
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 505736K/524288K available (7179K kernel code, 296K rwdata,
1804K rodata, 1024K init, 220K bss, 18552K reserved, 0K cma-reserved,
0K highmem)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0xe0800000 - 0xff800000   ( 496 MB)
    lowmem  : 0xc0000000 - 0xe0000000   ( 512 MB)
    pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
    modules : 0xbf000000 - 0xbfe00000   (  14 MB)
      .text : 0x(ptrval) - 0x(ptrval)   (8172 kB)
      .init : 0x(ptrval) - 0x(ptrval)   (1024 kB)
      .data : 0x(ptrval) - 0x(ptrval)   ( 296 kB)
       .bss : 0x(ptrval) - 0x(ptrval)   ( 221 kB)
Hierarchical RCU implementation.
        RCU restricting CPUs from NR_CPUS=4 to nr_cpu_ids=1.
RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
L2C: DT/platform modifies aux control register: 0x12086302 -> 0x1a086302
Aurora cache controller enabled, 4 ways, 256 kB
Aurora: CACHE_ID 0x00000100, AUX_CTRL 0x1a086302
Switching to timer-based delay loop, resolution 53ns
sched_clock: 32 bits at 18MHz, resolution 53ns, wraps every 114532461029ns
clocksource: armada_370_xp_clocksource: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 101933890472 ns
Console: colour dummy device 80x30
Calibrating delay loop (skipped), value calculated using timer
frequency.. 37.50 BogoMIPS (lpj=187500)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
CPU0: thread -1, cpu 0, socket -1, mpidr 0
Setting up static identity map for 0x100000 - 0x100060
mvebu-soc-id: MVEBU SoC ID=0x6710, Rev=0x1
mvebu-pmsu: Initializing Power Management Service Unit
Hierarchical SRCU implementation.
smp: Bringing up secondary CPUs ...
smp: Brought up 1 node, 1 CPU
SMP: Total of 1 processors activated (37.50 BogoMIPS).
CPU: All CPU(s) started in SVC mode.
devtmpfs: initialized
random: get_random_u32 called from bucket_table_alloc+0x7c/0x194 with
crng_init=0
VFP support v0.3: implementor 56 architecture 2 part 20 variant 9 rev 6
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 19112604462750000 ns
futex hash table entries: 256 (order: 2, 16384 bytes)
xor: measuring software checksum speed
   arm4regs  :  1105.200 MB/sec
   8regs     :   868.800 MB/sec
   32regs    :  1043.200 MB/sec
xor: using function: arm4regs (1105.200 MB/sec)
pinctrl core: initialized pinctrl subsystem
random: fast init done
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor ladder
cryptd: max_cpu_qlen set to 1000
raid6: int32x1  gen()   170 MB/s
raid6: int32x1  xor()   225 MB/s
raid6: int32x2  gen()   254 MB/s
raid6: int32x2  xor()   251 MB/s
raid6: int32x4  gen()   314 MB/s
raid6: int32x4  xor()   243 MB/s
raid6: int32x8  gen()   339 MB/s
raid6: int32x8  xor()   229 MB/s
raid6: using algorithm int32x8 gen() 339 MB/s
raid6: .... xor() 229 MB/s, rmw enabled
raid6: using intx1 recovery algorithm
reg-fixed-voltage regulators:regulator@1: could not find pctldev for
node /soc/internal-regs/pin-ctrl@18000/xhci-pwr-pin, deferring probe
reg-fixed-voltage regulators:regulator@2: could not find pctldev for
node /soc/internal-regs/pin-ctrl@18000/sata-1-pwr-pin, deferring probe
reg-fixed-voltage regulators:regulator@3: could not find pctldev for
node /soc/internal-regs/pin-ctrl@18000/sata-2-pwr-pin, deferring probe
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti
<giometti@linux.it>
PTP clock support registered
Bluetooth: Core ver 2.22
NET: Registered protocol family 31
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
Bluetooth: L2CAP socket layer initialized
Bluetooth: SCO socket layer initialized
clocksource: Switched to clocksource armada_370_xp_clocksource
VFS: Disk quotas dquot_6.6.0
VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
FS-Cache: Loaded
CacheFiles: Loaded
NET: Registered protocol family 2
tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes)
TCP established hash table entries: 4096 (order: 2, 16384 bytes)
TCP bind hash table entries: 4096 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
UDP hash table entries: 256 (order: 1, 8192 bytes)
UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Trying to unpack rootfs image as initramfs...
Freeing initrd memory: 2620K
Initialise system trusted keyrings
workingset: timestamp_bits=14 max_order=17 bucket_order=3
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
FS-Cache: Netfs 'cifs' registered for caching
async_tx: api initialized (async)
Key type asymmetric registered
Asymmetric key parser 'x509' registered
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
io scheduler kyber registered
armada-370-pinctrl f1018000.pin-ctrl: registered pinctrl driver
mvebu-pcie soc:pcie@82000000: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x1000-0xfffff]
pci_bus 0000:00: root bus resource [mem 0xf8000000-0xffdfffff]
pci_bus 0000:00: root bus resource [bus 00-ff]
PCI: bus0: Fast back to back transfers disabled
pci 0000:00:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring
pci 0000:00:02.0: bridge configuration invalid ([bus 00-00]), reconfiguring
PCI: bus1: Fast back to back transfers disabled
PCI: bus2: Fast back to back transfers enabled
pci 0000:00:01.0: BAR 8: assigned [mem 0xf8000000-0xf80fffff]
pci 0000:01:00.0: BAR 0: assigned [mem 0xf8000000-0xf8001fff 64bit]
pci 0000:00:01.0: PCI bridge to [bus 01]
pci 0000:00:01.0:   bridge window [mem 0xf8000000-0xf80fffff]
pci 0000:00:02.0: PCI bridge to [bus 02]
mv_xor f1060800.xor: Marvell shared XOR driver
mv_xor f1060800.xor: Marvell XOR (Registers Mode): ( xor cpy intr )
mv_xor f1060900.xor: Marvell shared XOR driver
mv_xor f1060900.xor: Marvell XOR (Registers Mode): ( xor cpy intr )
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
console [ttyS0] disabled
f1012000.serial: ttyS0 at MMIO 0xf1012000 (irq = 20, base_baud =
12500000) is a 16550A
console [ttyS0] enabled
f1012100.serial: ttyS1 at MMIO 0xf1012100 (irq = 21, base_baud =
12500000) is a 16550A
brd: module loaded
loop: module loaded
sata_mv f10a0000.sata: slots 32 ports 2
scsi host0: sata_mv
scsi host1: sata_mv
ata1: SATA max UDMA/133 irq 29
ata2: SATA max UDMA/133 irq 29
nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
nand: Hynix H27U2G8F2CTR-BC
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
Bad block table not found for chip 0
Bad block table not found for chip 0
Scanning device for bad blocks
Bad eraseblock 1854 at 0x00000e7c0000
Bad block table written to 0x00000ffe0000, version 0x01
Bad block table written to 0x00000ffc0000, version 0x01
7 ofpart partitions found on MTD device pxa3xx_nand-0
Creating 7 MTD partitions on "pxa3xx_nand-0":
0x000000000000-0x000000500000 : "u-Boot"
0x000000500000-0x000000a00000 : "uImage"
0x000000a00000-0x000000f00000 : "ramdisk"
0x000000f00000-0x00000d800000 : "image.cfs"
0x00000dd00000-0x00000ec00000 : "rescue firmware"
0x00000ec00000-0x000010000000 : "config"
0x00000d800000-0x00000dd00000 : "reserve"
Ethernet Channel Bonding Driver: v3.7.1 (April 27, 2011)
libphy: Fixed MDIO Bus: probed
libphy: orion_mdio_bus: probed
mvneta f1074000.ethernet eth0: Using hardware mac address 00:50:43:02:02:00
usbcore: registered new interface driver lan78xx
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-orion: EHCI orion driver
orion-ehci f1050000.usb: EHCI Host Controller
orion-ehci f1050000.usb: new USB bus registered, assigned bus number 1
orion-ehci f1050000.usb: irq 27, io mem 0xf1050000
ata1: SATA link down (SStatus 0 SControl F300)
orion-ehci f1050000.usb: USB 2.0 started, EHCI 1.00
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 4.16.0+ ehci_hcd
usb usb1: SerialNumber: f1050000.usb
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
usbcore: registered new interface driver usb-storage
ata2: SATA link down (SStatus 0 SControl F300)
rtc-mv f1010300.rtc: internal RTC not ticking
i2c /dev entries driver
device-mapper: ioctl: 4.37.0-ioctl (2017-09-20) initialised: dm-devel@redhat.com
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
sdhci-pltfm: SDHCI platform and OF driver helper
ledtrig-cpu: registered to indicate activity on CPUs
marvell-cesa f1090000.crypto: CESA device successfully registered
hidraw: raw HID events driver (C) Jiri Kosina
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
NET: Registered protocol family 10
Segment Routing with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered protocol family 17
Bridge firewalling registered
8021q: 802.1Q VLAN Support v1.8
Key type dns_resolver registered
Registering SWP/SWPB emulation handler
Loading compiled-in X.509 certificates
armada-370-pinctrl f1018000.pin-ctrl: unsupported function gpio on pin mpp54
pinctrl core: failed to register map default (0): invalid type given
reg-fixed-voltage: probe of regulators:regulator@2 failed with error -22
input: gpio-keys as /devices/platform/gpio-keys/input/input0
hctosys: unable to open rtc device (rtc0)
Freeing unused kernel memory: 1024K
# Loading, please wait...
# Mounting filesystems...
# Check disk and init
### Press any key to stop and run shell... (2)print_req_error: I/O
error, dev mtdblock6, sector 0
print_req_error: I/O error, dev mtdblock6, sector 0
print_req_error: I/O error, dev mtdblock6, sector 0
print_req_error: I/O error, dev mtdblock5, sector 0
print_req_error: I/O error, dev mtdblock5, sector 0
print_req_error: I/O error, dev mtdblock5, sector 0
print_req_error: I/O error, dev mtdblock4, sector 0
print_req_error: I/O error, dev mtdblock4, sector 0
print_req_error: I/O error, dev mtdblock4, sector 0
print_req_error: I/O error, dev mtdblock3, sector 0
mdadm: No arrays found in config file or automatically
# /dev/md1 not exist!
# Runing a shell...
mvneta f1074000.ethernet eth0: PHY [f1072004.mdio-mii:00] driver
[Marvell 88E1510]
mvneta f1074000.ethernet eth0: configuring for phy/rgmii-id link mode
IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
udhcpc (v1.24.1) started
Setting IP address 0.0.0.0 on eth0
Sending discover...
Sending discover...
mvneta f1074000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
Sending discover...
Sending select for 192.168.178.78...
Lease of 192.168.178.78 obtained, lease time 864000
Setting IP address 192.168.178.78 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
udhcpc (v1.24.1) started
Setting IP address 0.0.0.0 on eth0
Sending discover...
Sending select for 192.168.178.78...
Lease of 192.168.178.78 obtained, lease time 864000
Setting IP address 192.168.178.78 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
/ # ls /dev/mtd
mtd0       mtd1ro     mtd3       mtd4ro     mtd6       mtdblock1  mtdblock4
mtd0ro     mtd2       mtd3ro     mtd5       mtd6ro     mtdblock2  mtdblock5
mtd1       mtd2ro     mtd4       mtd5ro     mtdblock0  mtdblock3  mtdblock6
/ # ls /dev/mtdblock*
/dev/mtdblock0  /dev/mtdblock2  /dev/mtdblock4  /dev/mtdblock6
/dev/mtdblock1  /dev/mtdblock3  /dev/mtdblock5
/ # dd if=/dev/zero of=/dev/mtdblock1
print_req_error: 9 callbacks suppressed
print_req_error: I/O error, dev mtdblock1, sector 0
dd: writing '/dev/mtdblock1': Input/output error
1+0 records in
0+0 records out
0 bytes (0B) copied, 0.009045 seconds, 0B/s
/ #

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
