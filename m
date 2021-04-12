Return-Path: <SRS0=MywH=JJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18029C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 18:06:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A67861357
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 18:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A67861357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CuktnHGiC02fVJDhMY2ojkmlNYwK+PAZCVGWBFz/fnQ=; b=Q8oKhpW0gGshhGeK6kf3cIeF6
	a25rDMGXA/BwMUDAWj8kIXpOuhC8TPPSg6Yc/XZlkTcBSzKlaFPI0nOPIeWCvK+uLJ9+DiJz03Vjh
	euqR0HlNiI01X9rCHAWKc835s+SQWPpzqjzS3xx2pWMa1j+64YzvT5co8tvkyHCWVV3Iyj1BOdArR
	vkQsQBZulLlIfJBbbMAQZ7aIgsdvidPd4cDNXyjFyOC2dXCE+0iJigImL54/Y8VUqe09+fikX8+/X
	7K5rFXBbesKjHfNFnstNt2SpC1V7QvfNxIRKItxocfkZJvkZX/03bDTUOdMiL9frqmmIPk1CmVTBc
	8ZxdSCMYQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lW0wR-007POr-0X; Mon, 12 Apr 2021 18:05:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW0wN-007POh-1D
 for linux-mtd@desiato.infradead.org; Mon, 12 Apr 2021 18:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OqZmcyYZ+DJ3LZHsIPN+J3H8cdBsSZuMfZWBS7D8qy0=; b=MFvGisY7NRz7CR4Yc4kKVlcYrL
 jYhB0+/tQocAsJrKwu08nfvHudk8aoj6wrZ+6+WwlkJrN2GzuSyiwH18mo3Ww3mzd2DlTE0+5B1YG
 Pf6fI28f4FhlfHYH14azY5ERsUZ8rZ3j1PDwHuy342wiWuzJzFKwJZWpWRueY9muoeNSvQAuTioOz
 HjKX4rOk7DhPYh2CyYz3qrDvUkuBBv1LTPcHUwvpqj1OHtTCfu/s++ET5Dzzi8W/+wFWAQ/ruH2dY
 owbvHGF40EI2jtbgkSGERdAy3sev8czKaAQZd6vS2oZE2LeCN8F6r8kNhX3z+bq2uP/tXOX+rGzsO
 hqe7d6Ow==;
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW0wJ-006TJi-Mj
 for linux-mtd@lists.infradead.org; Mon, 12 Apr 2021 18:05:37 +0000
Received: by mail-il1-x129.google.com with SMTP id c3so5711807ils.5
 for <linux-mtd@lists.infradead.org>; Mon, 12 Apr 2021 11:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OqZmcyYZ+DJ3LZHsIPN+J3H8cdBsSZuMfZWBS7D8qy0=;
 b=mt6vFxEeEGTmLJLHqJOH0pyA0pMk5YoO9/GNabzSJ7qqxVQMDG8RIoTfFXrCkxkBlt
 MkUtTjxfGoTAuYMmhZNjn68M3Hppdff9k6/GBcgpf2NnUfxvRfCwqGqb38seZou95TuS
 jLi27Rv1lYLzBwfpe+zj+ocdnAGuT61Xm7njGL0ZFlM1WEE85jYKSXgKXf5Bs1RIyf3L
 i7qmlXbWf67+yLbBGX6HIq5Lx2j8rOiDdzMTBg4NwWBmcZC6SlrU7Q0mDaB4RVi8jS+v
 xuwlS2OUgegLPw5nWB2TOyLV2M4+r7qPhC5hUlCNyP9V+cQZKD1VDL5aVYmdYkdhbaTD
 Hqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OqZmcyYZ+DJ3LZHsIPN+J3H8cdBsSZuMfZWBS7D8qy0=;
 b=ZO3RqLTQrJ/WBinZO41uNgIzC5JHemE/E1Sl2gfUMns3lpQ7d1ij0Cz/B36u8BniTb
 aGzMuQy+9CIyyKwvDXPg+k56Wf46JVOibrkQhJVpudykEP0IWS2WAgs+j00jOn4TFB20
 RbJ7r49aQC1+LmsuZ7GFMZFWNOhKrxPYGWrvHNEY/JwVTXkE48NKcq1jbjdTif50vzsk
 mvFlHIGEo3Xf1HWxRopPqJEUOCz8ExceZDsPTTpAaORQ1aVtNhK6OYaj6VpTDgoRr9F5
 0my5urgmB51LU8uQ/aH8QuwwQI6+H6SGQdRhNL5+LBnvrR8+pv/jvbhJlrKRL8OgGVC9
 XM7w==
X-Gm-Message-State: AOAM533437BzrRzhr5R2O9acvYxg/88WjHnMvE1FLNNEKXhdufWPbxjw
 ZMcQLzkITpK+dUV8IlRDvR7fTgVhaLk=
X-Google-Smtp-Source: ABdhPJyYOkukYs+qF3sj0AoiiOyNp6DI1fpueU0n81XVrsCZVuTYyjTK1neEOhzzDA/fPtCo9JDRkg==
X-Received: by 2002:a92:c5c1:: with SMTP id s1mr14741429ilt.295.1618250734325; 
 Mon, 12 Apr 2021 11:05:34 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
 by smtp.gmail.com with ESMTPSA id 23sm6128918iog.45.2021.04.12.11.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 11:05:33 -0700 (PDT)
Date: Mon, 12 Apr 2021 14:05:31 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBI issues with lpc32xx  Was: UBI issues with 5.11.11
Message-ID: <20210412180531.GA27730@localhost>
References: <20210407190302.GA12280@localhost>
 <20210407202356.GA31407@localhost>
 <20210412022946.GA38534@localhost> <20210412180233.3c7148d0@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412180233.3c7148d0@xps13>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_110535_797688_B3EA03D6 
X-CRM114-Status: GOOD (  26.32  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Hi Miquel,

On Mon 2021-04-12 @ 06:02:33 PM, Miquel Raynal wrote:
> I assumed I understood this trace well enough to write a patch. Can you
> please give this change a try?
> 
> If it does not fix your issue, would you mind tracing down the issue to
> the root dereference that produces this panic?

It looks, to me, that your patch solves the NULL dereference problem. But it
reveals a new one "Driver must set ecc.strength when using hardware ECC". Is
that something I should be setting in my device tree, or is that a driver
issue too?

> Also please share your entire boot log in case there is anything else
> interesting (and perhaps your NAND DT node as well).

New boot log:
	Booting Linux on physical CPU 0x0
	Linux version 5.10.0-rc6-yocto-standard (oe-user@oe-host) (arm-oe-linux-gnueabi-gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.36.1.20210209) #1 PREEMPT Mon Apr 12 17:49:12 UTC 2021
	CPU: ARM926EJ-S [41069264] revision 4 (ARMv5TEJ), cr=0005317f
	CPU: VIVT data cache, VIVT instruction cache
	OF: fdt: Machine model: NAUTEL nape83 board based on NXP LPC3240
	Memory policy: Data cache writeback
	Zone ranges:
	  Normal   [mem 0x0000000080000000-0x0000000083ffffff]
	Movable zone start for each node
	Early memory node ranges
	  node   0: [mem 0x0000000080000000-0x0000000083ffffff]
	Initmem setup node 0 [mem 0x0000000080000000-0x0000000083ffffff]
	Built 1 zonelists, mobility grouping on.  Total pages: 16240
	Kernel command line: ubi.mtd=7,512 rootfstype=ubifs root=ubi0 rootwait rw console=ttyS0,115200n81
	Dentry cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
	Inode-cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
	mem auto-init: stack:off, heap alloc:off, heap free:off
	Memory: 57312K/65536K available (5341K kernel code, 432K rwdata, 1108K rodata, 196K init, 206K bss, 8224K reserved, 0K cma-reserved)
	rcu: Preemptible hierarchical RCU implementation.
		Trampoline variant of Tasks RCU enabled.
	rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
	NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
	random: get_random_bytes called from start_kernel+0x2bc/0x4d4 with crng_init=0
	clk_pll_recalc_rate: hclk_pll: PLL clocks are not in valid ranges: 0/0/0
	clocksource: lpc3220 timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 147020034397 ns
	Switching to timer-based delay loop, resolution 76ns
	sched_clock: 32 bits at 13MHz, resolution 76ns, wraps every 165191050201ns
	Console: colour dummy device 80x30
	Calibrating delay loop (skipped), value calculated using timer frequency.. 26.00 BogoMIPS (lpj=130000)
	pid_max: default: 32768 minimum: 301
	Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
	Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
	CPU: Testing write buffer coherency: ok
	Setting up static identity map for 0x80008400 - 0x8000843c
	rcu: Hierarchical SRCU implementation.
	devtmpfs: initialized
	VFP support v0.3: implementor 41 architecture 1 part 10 variant 9 rev 1
	clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
	futex hash table entries: 256 (order: -1, 3072 bytes, linear)
	NET: Registered protocol family 16
	DMA: preallocated 256 KiB pool for atomic coherent allocations
	cpuidle: using governor menu
	LPC32XX unique ID: 5565d99a09d8905d38df4d6190bb7480
	pl08xdmac pl08xdmac: initialized 8 virtual memcpy channels
	pl08xdmac pl08xdmac: initialized 2 virtual slave channels
	pl08xdmac pl08xdmac: DMA: PL080 rev0 at 0x31000000 irq 21
	SCSI subsystem initialized
	usbcore: registered new interface driver usbfs
	usbcore: registered new interface driver hub
	usbcore: registered new device driver usb
	Advanced Linux Sound Architecture Driver Initialized.
	clocksource: Switched to clocksource lpc3220 timer
	NET: Registered protocol family 2
	tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
	TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
	TCP bind hash table entries: 1024 (order: 0, 4096 bytes, linear)
	TCP: Hash tables configured (established 1024 bind 1024)
	UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
	UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
	NET: Registered protocol family 1
	RPC: Registered named UNIX socket transport module.
	RPC: Registered udp transport module.
	RPC: Registered tcp transport module.
	RPC: Registered tcp NFSv4.1 backchannel transport module.
	workingset: timestamp_bits=14 max_order=14 bucket_order=0
	NET: Registered protocol family 38
	io scheduler mq-deadline registered
	io scheduler kyber registered
	Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
	printk: console [ttyS0] disabled
	40090000.serial: ttyS0 at MMIO 0x40090000 (irq = 24, base_baud = 812500) is a LPC3220
	printk: console [ttyS0] enabled
	40080000.serial: ttyS1 at MMIO 0x40080000 (irq = 25, base_baud = 812500) is a LPC3220
	40088000.serial: ttyS2 at MMIO 0x40088000 (irq = 26, base_baud = 812500) is a LPC3220
	40098000.serial: ttyS3 at MMIO 0x40098000 (irq = 27, base_baud = 812500) is a LPC3220
	40014000.serial: ttyTX0 at MMIO 0x40014000 (irq = 30, base_baud = 812500) is a lpc32xx_hsuart
	40018000.serial: ttyTX1 at MMIO 0x40018000 (irq = 31, base_baud = 812500) is a lpc32xx_hsuart
	4001c000.serial: ttyTX2 at MMIO 0x4001c000 (irq = 32, base_baud = 812500) is a lpc32xx_hsuart
	brd: module loaded
	loop: module loaded
	nand: device found, Manufacturer ID: 0x01, Chip ID: 0xdc
	nand: AMD/Spansion S34ML04G1
	nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
	------------[ cut here ]------------
	WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/raw/nand_base.c:5781 nand_scan_with_ids+0xbf8/0x136c
	Driver must set ecc.strength when using hardware ECC
	CPU: 0 PID: 1 Comm: swapper Not tainted 5.10.0-rc6-yocto-standard #1
	Hardware name: LPC32XX SoC (Flattened Device Tree)
	[<c0011978>] (unwind_backtrace) from [<c00108a8>] (show_stack+0x10/0x14)
	[<c00108a8>] (show_stack) from [<c0531950>] (__warn+0xa8/0xd0)
	[<c0531950>] (__warn) from [<c05319f0>] (warn_slowpath_fmt+0x78/0xac)
	[<c05319f0>] (warn_slowpath_fmt) from [<c02d9fbc>] (nand_scan_with_ids+0xbf8/0x136c)
	[<c02d9fbc>] (nand_scan_with_ids) from [<c02e0bd4>] (lpc32xx_nand_probe+0x530/0x600)
	[<c02e0bd4>] (lpc32xx_nand_probe) from [<c02a0b98>] (platform_drv_probe+0x38/0x6c)
	[<c02a0b98>] (platform_drv_probe) from [<c029f614>] (really_probe+0x208/0x35c)
	[<c029f614>] (really_probe) from [<c029fbb4>] (device_driver_attach+0x44/0x5c)
	[<c029fbb4>] (device_driver_attach) from [<c029fc78>] (__driver_attach+0xac/0xb4)
	[<c029fc78>] (__driver_attach) from [<c029dde0>] (bus_for_each_dev+0x64/0xa4)
	[<c029dde0>] (bus_for_each_dev) from [<c029e52c>] (bus_add_driver+0x144/0x1a4)
	[<c029e52c>] (bus_add_driver) from [<c02a02a4>] (driver_register+0xac/0xf0)
	[<c02a02a4>] (driver_register) from [<c0683efc>] (do_one_initcall+0x74/0x194)
	[<c0683efc>] (do_one_initcall) from [<c06841d8>] (kernel_init_freeable+0x168/0x1b4)
	[<c06841d8>] (kernel_init_freeable) from [<c053b864>] (kernel_init+0x8/0xf8)
	[<c053b864>] (kernel_init) from [<c0008520>] (ret_from_fork+0x14/0x34)
	Exception stack(0xc0827fb0 to 0xc0827ff8)
	7fa0:                                     00000000 00000000 00000000 00000000
	7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
	7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
	---[ end trace 81018977b459f36a ]---
	lpc32xx-nand: probe of 20020000.flash failed with error -22
	libphy: Fixed MDIO Bus: probed
	ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
	ohci-nxp: OHCI NXP driver
	ISP1301 Vendor ID  : 0x0483
	ISP1301 Product ID : 0xa0c4
	ISP1301 Version ID : 0x4747
	usb-ohci 31020000.ohci: at 0x(ptrval), irq 0
	random: fast init done
	usb-ohci 31020000.ohci: OHCI Host Controller
	usb-ohci 31020000.ohci: new USB bus registered, assigned bus number 1
	usb-ohci 31020000.ohci: irq 22, io mem 0x31020000
	hub 1-0:1.0: USB hub found
	hub 1-0:1.0: 2 ports detected
	usbcore: registered new interface driver usb-storage
	udc-core: couldn't find an available UDC - added [g_ether] to list of pending drivers
	rtc-lpc32xx 40024000.rtc: registered as rtc0
	rtc-lpc32xx 40024000.rtc: setting system clock to 2021-04-12T17:50:29 UTC (1618249829)
	i2c /dev entries driver
	pnx4008-watchdog 4003c000.watchdog: heartbeat 19 sec
	usbcore: registered new interface driver usbhid
	usbhid: USB HID core driver
	IPVS: Registered protocols ()
	IPVS: Connection hash table configured (size=4096, memory=32Kbytes)
	IPVS: ipvs loaded.
	ipt_CLUSTERIP: ClusterIP Version 0.8 loaded successfully
	NET: Registered protocol family 10
	Segment Routing with IPv6
	sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
	NET: Registered protocol family 17
	Bridge firewalling registered
	UBI error: cannot open mtd 7, error -19
	ALSA device list:
	  No soundcards found.
	VFS: Cannot open root device "ubi0" or unknown-block(0,0): error -19
	Please append a correct "root=" boot option; here are the available partitions:
	0100           16384 ram0
	 (driver?)
	Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
	CPU: 0 PID: 1 Comm: swapper Tainted: G        W         5.10.0-rc6-yocto-standard #1
	Hardware name: LPC32XX SoC (Flattened Device Tree)
	[<c0011978>] (unwind_backtrace) from [<c00108a8>] (show_stack+0x10/0x14)
	[<c00108a8>] (show_stack) from [<c05316a8>] (panic+0x100/0x300)
	[<c05316a8>] (panic) from [<c0684688>] (mount_block_root+0x1dc/0x26c)
	[<c0684688>] (mount_block_root) from [<c06848f4>] (prepare_namespace+0x84/0x17c)
	[<c06848f4>] (prepare_namespace) from [<c053b864>] (kernel_init+0x8/0xf8)
	[<c053b864>] (kernel_init) from [<c0008520>] (ret_from_fork+0x14/0x34)
	Exception stack(0xc0827fb0 to 0xc0827ff8)
	7fa0:                                     00000000 00000000 00000000 00000000
	7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
	7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
	---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0) ]---

The second panic, of course, will be fixed when the first one is resolved.

My NAND device tree:
	#include "lpc32xx.dtsi"

	/* 512MB Flash via SLC NAND controller */
	&slc {
		status = "okay";

		nxp,wdr-clks = <14>;
		nxp,wwidth = <70250000>;
		nxp,whold = <281000000>;
		nxp,wsetup = <100000000>;
		nxp,rdr-clks = <14>;
		nxp,rwidth = <93666666>;
		nxp,rhold = <281000000>;
		nxp,rsetup = <100000000>;
		nand-on-flash-bbt;
		gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */

		partitions {
			compatible = "fixed-partitions";
			#address-cells = <1>;
			#size-cells = <1>;

			mtd0@0       { label = "bootrom";   reg = <0x00000000 0x00020000>; };
			mtd1@20000   { label = "uboot";     reg = <0x00020000 0x00060000>; };
			mtd2@80000   { label = "fbkernel";  reg = <0x00080000 0x003c0000>; };
			mtd3@440000  { label = "fbrootfs";  reg = <0x00440000 0x004e0000>; };
			mtd4@920000  { label = "c_kernel";  reg = <0x00920000 0x003c0000>; };
			mtd5@ce0000  { label = "c__atags";  reg = <0x00ce0000 0x00020000>; };
			mtd6@d00000  { label = "c_rootfs";  reg = <0x00d00000 0x00300000>; };
			mtd7@1000000 { label = "mender";    reg = <0x01000000 0x1f000000>; };
		};
	};

Best regards,
	Trevor

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
