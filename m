Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6925FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Mar 2022 18:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kJ4pW1h0VcGwFH0qv6+0tVUIeZPz0ABeTiFEX2LOBXg=; b=zvzPkBVyy9i6u809i/hlGBbhuy
	OJ+Onh/D7+dmIjsdrFy7VERBSgjND2x8hoBl8JWx+FmgczhHwc0TJrgiFRpFgcu1dv8T5qzkZRPgp
	CRiMfq7FKax7Lh0/kFtNeZW+0Kwgx8JNqlvs0iDC7CFZE2stBFwz8uVow87jy6Vxdv+ziNd2+8v/U
	L1Z6EXD07xvV6UsFk0ifaceynk0hb9I/4FEXQ9xU+XM5y5aS8kbtaqup9HKvvGpTCGUtnubgBr5RF
	LGGVNq+HSN9kxR/vqulQNPeKtBV8RKZmWRrUTUGuJ0ChATEhecLv8sW2l2ii/7G6Ni7ftrB7ztXGB
	p5QIkwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVGvp-002ZGg-T6; Fri, 18 Mar 2022 18:02:33 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVGvh-002ZFJ-Tm
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2022 18:02:31 +0000
Received: by mail-lj1-x22c.google.com with SMTP id s25so12285145lji.5
 for <linux-mtd@lists.infradead.org>; Fri, 18 Mar 2022 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:cc:from:subject
 :content-transfer-encoding;
 bh=DpACz1j/xvTya2ZeJ5LSrIfGPMaACA5LNUoxJD06lhU=;
 b=dlAZNIHib1Ut4zE8rnl0aGxK0V8CZHzlBwVvLFvrosXzAtkSEbfHKsjsJ5uYEkU9ur
 ktDJNaQjZFP3GiD5cvVe1rwBeCj0fEPeRendGlvRRmuYN1tCXNQ2ps9+tUEvHTSY0/Hp
 jISlTGR6hlfOM2frtgcQnH4BGzlJ88xtLRul4OsIKL6MD3alf2kq65IrCkzNkrk7mPUJ
 +3BIjAQdnlHjTbaYM4EfY0WUTG0qSLJGWeDNyAX/9AcD91zjjO/rhwhswJPQbR7XkqpS
 PsP6Kz+5c5HXhHaksqYVlEKd79aFEpMR86Vmh/cLYdFFrfH0XqeBs6tMN8GEdF/6Co7c
 stCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
 :from:subject:content-transfer-encoding;
 bh=DpACz1j/xvTya2ZeJ5LSrIfGPMaACA5LNUoxJD06lhU=;
 b=awpOszV/oj3qtR/DCgR8qLyQr6BVBm9wtJsC7lR+WUpfDO4tBy7Yx06cPMNPxVEg4E
 UG9I6N8lzyIMJ4UcccGCn7bjJvkT3zfAfOwMWbIn1SEXPU5+wBvJH+j19Q35yaAQ7ChL
 XfcZg/8XiTdg4IASiMypApX3yU8jp9im0DjFLAoPmVQtRedCsksc7ZkGarzrqaUIyjyj
 eA4bOuZkXJyZIe0VmuTRdPkBqf/cLj9fl4CYHuXDl/yCmhNuyA2ZRm18rhuHsAu2jIyf
 EdUXKrt7v9MWL5geDjvAHZ5X9/nh+jQwrZqtPWUGPipwOOJkuuqgdgWWj2CbZzY3pX0K
 qnxA==
X-Gm-Message-State: AOAM5302/qcYW7QEsx/a4F++rDDHb0f2obXe8dCj+T3oJLtQ7tLVevu0
 60b1WwvDv2D5L38eXPU0bpaLCj3tWzY=
X-Google-Smtp-Source: ABdhPJwEqvfeM2Wrzad6gkG/uglZzvEMIly+cQIcRw31nJ/cNj0CbKJXmOfTktOV9EJxj4osOdISrg==
X-Received: by 2002:a2e:a54b:0:b0:249:5889:70bb with SMTP id
 e11-20020a2ea54b000000b00249588970bbmr5156717ljn.73.1647626542448; 
 Fri, 18 Mar 2022 11:02:22 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 t2-20020a05651c204200b00249324dd50bsm1101013ljo.71.2022.03.18.11.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 11:02:21 -0700 (PDT)
Message-ID: <d8a2fc04-b05a-bec9-cd56-ef7d73d904a9@gmail.com>
Date: Fri, 18 Mar 2022 19:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: ECC errors after UBI writes with brcmnand (Northstar with v6.1
 controller)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_110226_054162_3D57E525 
X-CRM114-Status: GOOD (  18.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I recently developed initial Buildroot support for Northstar:
[PATCH V2] board/broadcom: add support for Northstar platform devices
https://patchwork.ozlabs.org/project/buildroot/patch/20220310121229.18284-1-zajec5@gmail.com/

My problem is that ubifs complains about ECC errors. I spent some time
debugging it and it seems that:
1. Initially all blocks written by bootloader can be read fine
2. Few blocks written by ubifs -> ubi -> brcmnand can't be read back

ubi0 error: ubi_io_write: Read back 90 FAILED from "ubi" at offset 0x61800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 92 FAILED from "ubi" at offset 0x81800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 97 FAILED from "ubi" at offset 0xa1800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 756 FAILED from "ubi" at offset 0xee4800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 840 FAILED from "ubi" at offset 0xee5000 of length 2048: -74
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:21944, read only 68 bytes, retry (addr:0xee55b8)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:21944, read only 68 bytes, retry (addr:0xee55b8)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:21944, read only 68 bytes, retry (addr:0xee55b8)
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:21944, read 68 bytes

It's pretty surprising as Northstar is supported for years by OpenWrt
and I've never seen such problems (for testing I switched both to the
same kernel 5.10.100). It also happens with 5.15. Can OpenWrt use ubifs
in a different way that doesn't trigger some issue?

I verified this problem on two devices:
1. Luxul XWR-1200 (bcm47081-luxul-xwr-1200.dts) - BCM47081
2. Luxul XWR-3150 (bcm47094-luxul-xwr-3150-v1.dts) - BCM47094

Below you can find patched kernel output & diff I used.

I'd appreciate any help in understanding of what may be going on. Is
that some problem with brcmnand driver? All UBI seems to do is calling
mtd_write() after all.



nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xf1
nand: Macronix MX30LF1G18AC
nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
iproc_nand 18028000.nand: detected 128MiB total, 128KiB blocks, 2KiB pages, 16B OOB, 8-bit, BCH-4
Scanning device for bad blocks
random: fast init done
random: crng init done
1 bcm47xxpart partitions found on MTD device brcmnand.0
Creating 1 MTD partitions on "brcmnand.0":
0x000000000000-0x000008000000 : "firmware"
2 trx partitions found on MTD device firmware
Creating 2 MTD partitions on "firmware":
0x00000000001c-0x000000360000 : "linux"
mtd: partition "linux" doesn't start on an erase/write block boundary -- force read-only
0x000000360000-0x000008000000 : "ubi"
bcm_iproc 18029200.spi: using bspi-mspi mode
spi-nor spi0.0: mx25l12805d (16384 Kbytes)
2 bcm47xxpart partitions found on MTD device spi0.0
Creating 2 MTD partitions on "spi0.0":
0x000000000000-0x000000ff0000 : "boot"
0x000000ff0000-0x000001000000 : "nvram"
iproc-mdio 18003000.mdio: Broadcom iProc MDIO bus registered
b53-srab-switch 18007000.srab: found switch: BCM53011, rev 5
bgmac_bcma: Broadcom 47xx GBit MAC driver loaded
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-pci: EHCI PCI platform driver
ehci-platform: EHCI generic platform driver
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-platform: OHCI generic platform driver
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
bcma-host-soc 18000000.axi: bus0: Found chip with id 53010, rev 0x00 and package 0x02
bcma-host-soc 18000000.axi: bus0: Core 0 found: ChipCommon (manuf 0x4BF, id 0x800, rev 0x2A, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 1 found: Chipcommon B (manuf 0x4BF, id 0x50B, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 2 found: DMA (manuf 0x4BF, id 0x502, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 3 found: GBit MAC (manuf 0x4BF, id 0x82D, rev 0x05, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 4 found: GBit MAC (manuf 0x4BF, id 0x82D, rev 0x05, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 5 found: GBit MAC (manuf 0x4BF, id 0x82D, rev 0x05, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 6 found: GBit MAC (manuf 0x4BF, id 0x82D, rev 0x05, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 7 found: PCIe Gen 2 (manuf 0x4BF, id 0x501, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 8 found: PCIe Gen 2 (manuf 0x4BF, id 0x501, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 9 found: PCIe Gen 2 (manuf 0x4BF, id 0x501, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 10 found: ARM Cortex A9 core (ihost) (manuf 0x4BF, id 0x510, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 11 found: USB 2.0 (manuf 0x4BF, id 0x504, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 12 found: USB 3.0 (manuf 0x4BF, id 0x505, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 13 found: SDIO3 (manuf 0x4BF, id 0x503, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 14 found: ARM Cortex A9 JTAG (manuf 0x4BF, id 0x506, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 15 found: Denali DDR2/DDR3 memory controller (manuf 0x4BF, id 0x507, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 16 found: ROM (manuf 0x4BF, id 0x508, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 17 found: NAND flash controller (manuf 0x4BF, id 0x509, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Core 18 found: SPI flash controller (manuf 0x4BF, id 0x50A, rev 0x01, class 0x0)
bcma-host-soc 18000000.axi: bus0: Flash type not supported
bgmac_bcma bcma0:3: Found PHY addr: 30 (NOREGS)
bgmac_bcma bcma0:3: Support for Roboswitch not implemented
bgmac_bcma bcma0:4: Found PHY addr: 0
bgmac_bcma bcma0:4: Support for Roboswitch not implemented
bgmac_bcma bcma0:4: Invalid MAC addr: 00:00:00:00:00:00
bgmac_bcma bcma0:4: Using random MAC: 8e:60:ac:30:e3:73
bgmac_bcma bcma0:5: Found PHY addr: 0
bgmac_bcma bcma0:5: Support for Roboswitch not implemented
bgmac_bcma bcma0:5: Invalid MAC addr: 00:00:00:00:00:00
bgmac_bcma bcma0:5: Using random MAC: 16:ff:10:dd:b3:97
bgmac_bcma bcma0:6: Unsupported core_unit 3
bgmac_bcma: probe of bcma0:6 failed with error -524
pcie_iproc_bcma bcma0:7: host bridge /axi@18000000/pcie@12000 ranges:
pcie_iproc_bcma bcma0:7:   No bus range found for /axi@18000000/pcie@12000, using [bus 00-ff]
OF: /axi@18000000/pcie@12000: Missing device_type
pcie_iproc_bcma bcma0:7: non-prefetchable memory resource required
pcie_iproc_bcma bcma0:7: link: UP
pcie_iproc_bcma bcma0:7: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: root bus resource [mem 0x08000000-0x0fffffff]
pci 0000:00:00.0: [14e4:8011] type 01 class 0x060400
pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x4 may corrupt adjacent RW1C bits
pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x4 may corrupt adjacent RW1C bits
pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x1c may corrupt adjacent RW1C bits
pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x1c may corrupt adjacent RW1C bits
pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x3e may corrupt adjacent RW1C bits
pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x4c may corrupt adjacent RW1C bits
pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x3e may corrupt adjacent RW1C bits
pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x4 may corrupt adjacent RW1C bits
pci_bus 0000:00: 1-byte config write to 0000:00:00.0 offset 0xc may corrupt adjacent RW1C bits
PCI: bus0: Fast back to back transfers disabled
pci 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x3e may corrupt adjacent RW1C bits
pci 0000:01:00.0: [14e4:4360] type 00 class 0x028000
pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00007fff 64bit]
pci 0000:01:00.0: supports D1 D2
PCI: bus1: Fast back to back transfers disabled
pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
pci 0000:00:00.0: BAR 8: assigned [mem 0x08000000-0x080fffff]
pci 0000:01:00.0: BAR 0: assigned [mem 0x08000000-0x08007fff 64bit]
pci 0000:00:00.0: PCI bridge to [bus 01]
pci 0000:00:00.0:   bridge window [mem 0x08000000-0x080fffff]
pcie_iproc_bcma bcma0:8: host bridge /axi@18000000/pcie@13000 ranges:
pcie_iproc_bcma bcma0:8:   No bus range found for /axi@18000000/pcie@13000, using [bus 00-ff]
pcie_iproc_bcma bcma0:8: non-prefetchable memory resource required
pcie_iproc_bcma bcma0:8: link: UP
pcie_iproc_bcma bcma0:8: PCI host bridge to bus 0001:00
pci_bus 0001:00: root bus resource [bus 00-ff]
pci_bus 0001:00: root bus resource [mem 0x40000000-0x47ffffff]
pci 0001:00:00.0: [14e4:8011] type 01 class 0x060400
pci 0001:00:00.0: PME# supported from D0 D3hot D3cold
PCI: bus0: Fast back to back transfers disabled
pci 0001:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
pci 0001:01:00.0: [14e4:a8db] type 00 class 0x028000
pci 0001:01:00.0: reg 0x10: [mem 0x00000000-0x00007fff 64bit]
pci 0001:01:00.0: enabling Extended Tags
pci 0001:01:00.0: supports D1 D2
PCI: bus1: Fast back to back transfers disabled
pci_bus 0001:01: busn_res: [bus 01-ff] end is updated to 01
pci 0001:00:00.0: BAR 8: assigned [mem 0x40000000-0x400fffff]
pci 0001:01:00.0: BAR 0: assigned [mem 0x40000000-0x40007fff 64bit]
pci 0001:00:00.0: PCI bridge to [bus 01]
pci 0001:00:00.0:   bridge window [mem 0x40000000-0x400fffff]
pcie_iproc_bcma bcma0:9: host bridge /axi@18000000/pcie@14000 ranges:
pcie_iproc_bcma bcma0:9:   No bus range found for /axi@18000000/pcie@14000, using [bus 00-ff]
pcie_iproc_bcma bcma0:9: non-prefetchable memory resource required
pcie_iproc_bcma bcma0:9: PHY or data link is INACTIVE!
pcie_iproc_bcma bcma0:9: no PCIe EP device detected
ehci-platform 18021000.ehci: EHCI Host Controller
ehci-platform 18021000.ehci: new USB bus registered, assigned bus number 1
ehci-platform 18021000.ehci: irq 45, io mem 0x18021000
ehci-platform 18021000.ehci: USB 2.0 started, EHCI 1.00
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
ohci-platform 18022000.ohci: Generic Platform OHCI controller
ohci-platform 18022000.ohci: new USB bus registered, assigned bus number 2
ohci-platform 18022000.ohci: irq 45, io mem 0x18022000
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
xhci-hcd 18023000.xhci: xHCI Host Controller
xhci-hcd 18023000.xhci: new USB bus registered, assigned bus number 3
xhci-hcd 18023000.xhci: hcc params 0x02501164 hci version 0x100 quirks 0x0000000000010010
xhci-hcd 18023000.xhci: irq 46, io mem 0x18023000
hub 3-0:1.0: USB hub found
hub 3-0:1.0: config failed, hub doesn't have any ports! (err -19)
xhci-hcd 18023000.xhci: xHCI Host Controller
xhci-hcd 18023000.xhci: new USB bus registered, assigned bus number 4
xhci-hcd 18023000.xhci: Host supports USB 3.0 SuperSpeed
usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 1 port detected
bcm47xx-wdt bcm47xx-wdt.0: BCM47xx Watchdog Timer enabled (30 seconds, Software Timer)
bcma-host-soc 18000000.axi: bus0: Bus registered
pci 0000:00:00.0: enabling device (0140 -> 0142)
bcma-pci-bridge 0000:01:00.0: enabling device (0140 -> 0142)
bcma-pci-bridge 0000:01:00.0: bus1: Found chip with id 0x4352, rev 0x03 and package 0x01
bcma-pci-bridge 0000:01:00.0: bus1: Core 0 found: ChipCommon (manuf 0x4BF, id 0x800, rev 0x2B, class 0x0)
bcma-pci-bridge 0000:01:00.0: bus1: Core 1 found: IEEE 802.11 (manuf 0x4BF, id 0x812, rev 0x2A, class 0x0)
bcma-pci-bridge 0000:01:00.0: bus1: Core 2 found: ARM CR4 (manuf 0x4BF, id 0x83E, rev 0x02, class 0x0)
bcma-pci-bridge 0000:01:00.0: bus1: Core 3 found: PCIe Gen2 (manuf 0x4BF, id 0x83C, rev 0x01, class 0x0)
bcma-pci-bridge 0000:01:00.0: bus1: Core 4 found: USB 2.0 Device (manuf 0x4BF, id 0x81A, rev 0x11, class 0x0)
bcma-pci-bridge 0000:01:00.0: bus1: Bus registered
pci 0001:00:00.0: enabling device (0140 -> 0142)
bcma-pci-bridge 0001:01:00.0: enabling device (0140 -> 0142)
bcma-pci-bridge 0001:01:00.0: bus2: Found chip with id 43217, rev 0x00 and package 0x08
bcma-pci-bridge 0001:01:00.0: bus2: Core 0 found: ChipCommon (manuf 0x4BF, id 0x800, rev 0x27, class 0x0)
bcma-pci-bridge 0001:01:00.0: bus2: Core 1 found: IEEE 802.11 (manuf 0x4BF, id 0x812, rev 0x1E, class 0x0)
bcma-pci-bridge 0001:01:00.0: bus2: Core 2 found: PCIe (manuf 0x4BF, id 0x820, rev 0x14, class 0x0)
can not parse nvram name 0:ag2(null) with value 0xff got -34
can not parse nvram name 0:ag3(null) with value 0xff got -34
bcma-pci-bridge 0001:01:00.0: bus2: Bus registered
NET: Registered protocol family 10
Segment Routing with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered protocol family 17
8021q: 802.1Q VLAN Support v1.8
Registering SWP/SWPB emulation handler
b53-srab-switch 18007000.srab: found switch: BCM53011, rev 5
b53-srab-switch 18007000.srab lan4 (uninitialized): PHY [dsa-0.0:00] driver [Generic PHY] (irq=POLL)
b53-srab-switch 18007000.srab lan3 (uninitialized): PHY [dsa-0.0:01] driver [Generic PHY] (irq=POLL)
b53-srab-switch 18007000.srab lan2 (uninitialized): PHY [dsa-0.0:02] driver [Generic PHY] (irq=POLL)
b53-srab-switch 18007000.srab lan1 (uninitialized): PHY [dsa-0.0:03] driver [Generic PHY] (irq=POLL)
b53-srab-switch 18007000.srab wan (uninitialized): PHY [dsa-0.0:04] driver [Generic PHY] (irq=POLL)
b53-srab-switch 18007000.srab: Using legacy PHYLIB callbacks. Please migrate to PHYLINK!
DSA: tree 0 setup
ubi0: attaching mtd2
ubi0: scanning is finished
ubi0: volume 0 ("rootfs") re-sized from 121 to 973 LEBs
ubi0: attached mtd2 (name "ubi", size 124 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 997, bad PEBs: 0, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image sequence number: 1445369134
ubi0: available PEBs: 0, total reserved PEBs: 997, PEBs reserved for bad PEB handling: 20
ubi0: background thread "ubi_bgt0d" started, PID 28
UBIFS (ubi0:0): Mounting in unauthenticated mode
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs", R/O mode
UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
UBIFS (ubi0:0): FS size: 122150912 bytes (116 MiB, 962 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi0:0): media format: w4/r0 (latest is w5/r0), UUID E1C24062-82C9-401D-908E-33139700AAD7, small LPT model
VFS: Mounted root (ubifs filesystem) readonly on device 0:11.
devtmpfs: mounted
Freeing unused kernel memory: 1024K
Run /sbin/init as init process
ubi0 error: ubi_io_write: Read back 90 FAILED from "ubi" at offset 0x61800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 92 FAILED from "ubi" at offset 0x81800 of length 2048: -74
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 31
ubi0 error: ubi_io_write: Read back 97 FAILED from "ubi" at offset 0xa1800 of length 2048: -74
tmpfs: Unknown parameter 'mode'
mount: mounting tmpfs otmpfs: Unknown parameter 'mode'
n /dev/tmpfs: Unknown parameter 'mode'
shm failed: Invalid argument
mount: mounting tmpfs on /tmp failed: Invalid argument
mount: mounting tmpfs on /run failed: Invalid argument
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Starting mdev... OK
modprobe: can't change directory to '5.10.100-geb4d6c39094a-dirty': No such file or directory
Saving random seed: OK
ubi0 error: ubi_io_write: Read back 756 FAILED from "ubi" at offset 0xee4800 of length 2048: -74
Starting iptables: OK
Starting network:
ubi0 error: ubi_io_write: Read back 840 FAILED from "ubi" at offset 0xee5000 of length 2048: -74
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:21944, read only 68 bytes, retry (addr:0xee55b8)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:21944, read only 68 bytes, retry (addr:0xee55b8)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:21944, read only 68 bytes, retry (addr:0xee55b8)
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:21944, read 68 bytes
CPU: 0 PID: 84 Comm: ifup Not tainted 5.10.100-geb4d6c39094a-dirty #28
Hardware name: BCM5301X
[<c0107540>] (unwind_backtrace) from [<c01045dc>] (show_stack+0x10/0x14)
[<c01045dc>] (show_stack) from [<c061f40c>] (dump_stack+0x94/0xa8)
[<c061f40c>] (dump_stack) from [<c03d6630>] (ubi_io_read+0x160/0x374)
[<c03d6630>] (ubi_io_read) from [<c03d4294>] (ubi_eba_read_leb+0x9c/0x434)
[<c03d4294>] (ubi_eba_read_leb) from [<c03d3498>] (ubi_leb_read+0x70/0xb0)
[<c03d3498>] (ubi_leb_read) from [<c02868e0>] (ubifs_leb_read+0x2c/0x78)
[<c02868e0>] (ubifs_leb_read) from [<c0288220>] (ubifs_read_node+0x94/0x244)
[<c0288220>] (ubifs_read_node) from [<c02a3d00>] (ubifs_tnc_read_node+0x4c/0xcc)
[<c02a3d00>] (ubifs_tnc_read_node) from [<c0288c38>] (matches_name+0x90/0xcc)
[<c0288c38>] (matches_name) from [<c02895ac>] (resolve_collision+0x4c/0x2c8)
[<c02895ac>] (resolve_collision) from [<c028c4e8>] (ubifs_tnc_remove_nm+0xb0/0x134)
[<c028c4e8>] (ubifs_tnc_remove_nm) from [<c027bf2c>] (ubifs_jnl_rename+0x720/0x95c)
[<c027bf2c>] (ubifs_jnl_rename) from [<c02817e0>] (do_rename+0x418/0x83c)
[<c02817e0>] (do_rename) from [<c0201a60>] (vfs_rename+0x3b0/0x7f4)
[<c0201a60>] (vfs_rename) from [<c02021a8>] (do_renameat2+0x304/0x4a0)
[<c02021a8>] (do_renameat2) from [<c0100040>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xc1a81fa8 to 0xc1a81ff0)
1fa0:                   00000000 00538207 ffffff9c 005383de ffffff9c 00538207
1fc0: 00000000 00538207 00000000 0000017e 0055ac10 00538fad 000000c1 004a3518
1fe0: 00557c40 be807cc4 004893e8 b6f47a68
bgmac_bcma bcma0:3 eth0: Link is Up - 1Gbps/Full - flow control off
IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:22336, read only 64 bytes, retry (addr:0xee5740)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:22336, read only 64 bytes, retry (addr:0xee5740)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:22336, read only 64 bytes, retry (addr:0xee5740)
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:22336, read 64 bytes
CPU: 0 PID: 84 Comm: ifup Not tainted 5.10.100-geb4d6c39094a-dirty #28
Hardware name: BCM5301X
[<c0107540>] (unwind_backtrace) from [<c01045dc>] (show_stack+0x10/0x14)
[<c01045dc>] (show_stack) from [<c061f40c>] (dump_stack+0x94/0xa8)
[<c061f40c>] (dump_stack) from [<c03d6630>] (ubi_io_read+0x160/0x374)
[<c03d6630>] (ubi_io_read) from [<c03d4294>] (ubi_eba_read_leb+0x9c/0x434)
[<c03d4294>] (ubi_eba_read_leb) from [<c03d3498>] (ubi_leb_read+0x70/0xb0)
[<c03d3498>] (ubi_leb_read) from [<c02868e0>] (ubifs_leb_read+0x2c/0x78)
[<c02868e0>] (ubifs_leb_read) from [<c0288220>] (ubifs_read_node+0x94/0x244)
[<c0288220>] (ubifs_read_node) from [<c02a3d00>] (ubifs_tnc_read_node+0x4c/0xcc)
[<c02a3d00>] (ubifs_tnc_read_node) from [<c0288c38>] (matches_name+0x90/0xcc)
[<c0288c38>] (matches_name) from [<c02895ac>] (resolve_collision+0x4c/0x2c8)
[<c02895ac>] (resolve_collision) from [<c028c630>] (ubifs_tnc_add_nm+0xc4/0x250)
[<c028c630>] (ubifs_tnc_add_nm) from [<c027bc0c>] (ubifs_jnl_rename+0x400/0x95c)
[<c027bc0c>] (ubifs_jnl_rename) from [<c02817e0>] (do_rename+0x418/0x83c)
[<c02817e0>] (do_rename) from [<c0201a60>] (vfs_rename+0x3b0/0x7f4)
[<c0201a60>] (vfs_rename) from [<c02021a8>] (do_renameat2+0x304/0x4a0)
[<c02021a8>] (do_renameat2) from [<c0100040>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xc1a81fa8 to 0xc1a81ff0)
1fa0:                   00000000 00538207 ffffff9c 005383de ffffff9c 00538207
1fc0: 00000000 00538207 00000000 0000017e 00559028 00538fad 000000c1 004a3518
1fe0: 00557c40 be807cc4 004893e8 b6f47a68
b53-srab-switch 18007000.srab wan: configuring for phy/gmii link mode
8021q: adding VLAN 0 to HW filter on device wan
b53-srab-switch 18007000.srab lan1: configuring for phy/gmii link mode
8021q: adding VLAN 0 to HW filter on device lan1
ubi0 error: ubi_io_write: Read back 892 FAILED from "ubi" at offset 0xee5800 of length 2048: -74
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:23872, read only 64 bytes, retry (addr:0xee5d40)
b53-srab-switch 18007000.srab lan1: Link is Up - 1Gbps/Full - flow control rx/tx
IPv6: ADDRCONF(NETDEV_CHANGE): lan1: link becomes ready
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:23872, read only 64 bytes, retry (addr:0xee5d40)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:23872, read only 64 bytes, retry (addr:0xee5d40)
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:23872, read 64 bytes
CPU: 0 PID: 84 Comm: ifup Not tainted 5.10.100-geb4d6c39094a-dirty #28
Hardware name: BCM5301X
[<c0107540>] (unwind_backtrace) from [<c01045dc>] (show_stack+0x10/0x14)
[<c01045dc>] (show_stack) from [<c061f40c>] (dump_stack+0x94/0xa8)
[<c061f40c>] (dump_stack) from [<c03d6630>] (ubi_io_read+0x160/0x374)
[<c03d6630>] (ubi_io_read) from [<c03d4294>] (ubi_eba_read_leb+0x9c/0x434)
[<c03d4294>] (ubi_eba_read_leb) from [<c03d3498>] (ubi_leb_read+0x70/0xb0)
[<c03d3498>] (ubi_leb_read) from [<c02868e0>] (ubifs_leb_read+0x2c/0x78)
[<c02868e0>] (ubifs_leb_read) from [<c0288220>] (ubifs_read_node+0x94/0x244)
[<c0288220>] (ubifs_read_node) from [<c02a3d00>] (ubifs_tnc_read_node+0x4c/0xcc)
[<c02a3d00>] (ubifs_tnc_read_node) from [<c0288c38>] (matches_name+0x90/0xcc)
[<c0288c38>] (matches_name) from [<c02895ac>] (resolve_collision+0x4c/0x2c8)
[<c02895ac>] (resolve_collision) from [<c028c630>] (ubifs_tnc_add_nm+0xc4/0x250)
[<c028c630>] (ubifs_tnc_add_nm) from [<c027bc0c>] (ubifs_jnl_rename+0x400/0x95c)
[<c027bc0c>] (ubifs_jnl_rename) from [<c02817e0>] (do_rename+0x418/0x83c)
[<c02817e0>] (do_rename) from [<c0201a60>] (vfs_rename+0x3b0/0x7f4)
[<c0201a60>] (vfs_rename) from [<c02021a8>] (do_renameat2+0x304/0x4a0)
[<c02021a8>] (do_renameat2) from [<c0100040>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xc1a81fa8 to 0xc1a81ff0)
1fa0:                   00000000 00538207 ffffff9c 005383de ffffff9c 00538207
1fc0: 00000000 00538207 00000000 0000017e 00559028 00538fad 000000c1 004a3518
1fe0: 00557c40 be807cc4 004893e8 b6f47a68
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:24328, read only 68 bytes, retry (addr:0xee5f08)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:24328, read only 68 bytes, retry (addr:0xee5f08)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:24328, read only 68 bytes, retry (addr:0xee5f08)
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:24328, read 68 bytes
CPU: 0 PID: 84 Comm: ifup Not tainted 5.10.100-geb4d6c39094a-dirty #28
Hardware name: BCM5301X
[<c0107540>] (unwind_backtrace) from [<c01045dc>] (show_stack+0x10/0x14)
[<c01045dc>] (show_stack) from [<c061f40c>] (dump_stack+0x94/0xa8)
[<c061f40c>] (dump_stack) from [<c03d6630>] (ubi_io_read+0x160/0x374)
[<c03d6630>] (ubi_io_read) from [<c03d4294>] (ubi_eba_read_leb+0x9c/0x434)
[<c03d4294>] (ubi_eba_read_leb) from [<c03d3498>] (ubi_leb_read+0x70/0xb0)
[<c03d3498>] (ubi_leb_read) from [<c02868e0>] (ubifs_leb_read+0x2c/0x78)
[<c02868e0>] (ubifs_leb_read) from [<c0288220>] (ubifs_read_node+0x94/0x244)
[<c0288220>] (ubifs_read_node) from [<c02a3d00>] (ubifs_tnc_read_node+0x4c/0xcc)
[<c02a3d00>] (ubifs_tnc_read_node) from [<c0288c38>] (matches_name+0x90/0xcc)
[<c0288c38>] (matches_name) from [<c02895ac>] (resolve_collision+0x4c/0x2c8)
[<c02895ac>] (resolve_collision) from [<c028c4e8>] (ubifs_tnc_remove_nm+0xb0/0x134)
[<c028c4e8>] (ubifs_tnc_remove_nm) from [<c027bf2c>] (ubifs_jnl_rename+0x720/0x95c)
[<c027bf2c>] (ubifs_jnl_rename) from [<c02817e0>] (do_rename+0x418/0x83c)
[<c02817e0>] (do_rename) from [<c0201a60>] (vfs_rename+0x3b0/0x7f4)
[<c0201a60>] (vfs_rename) from [<c02021a8>] (do_renameat2+0x304/0x4a0)
[<c02021a8>] (do_renameat2) from [<c0100040>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xc1a81fa8 to 0xc1a81ff0)
1fa0:                   00000000 00538207 ffffff9c 005383de ffffff9c 00538207
1fc0: 00000000 00538207 00000000 0000017e 00559028 00538fad 000000c1 004a3518
1fe0: 00557c40 be807cc4 004893e8 b6f47a68
b53-srab-switch 18007000.srab lan2: configuring for phy/gmii link mode
8021q: adding VLAN 0 to HW filter on device lan2
b53-srab-switch 18007000.srab lan3: configuring for phy/gmii link mode
8021q: adding VLAN 0 to HW filter on device lan3
ubi0 error: ubi_io_write: Read back 893 FAILED from "ubi" at offset 0xee6000 of length 2048: -74
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:25568, read only 64 bytes, retry (addr:0xee63e0)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:25568, read only 64 bytes, retry (addr:0xee63e0)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:25568, read only 64 bytes, retry (addr:0xee63e0)
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:25568, read 64 bytes
CPU: 0 PID: 84 Comm: ifup Not tainted 5.10.100-geb4d6c39094a-dirty #28
Hardware name: BCM5301X
[<c0107540>] (unwind_backtrace) from [<c01045dc>] (show_stack+0x10/0x14)
[<c01045dc>] (show_stack) from [<c061f40c>] (dump_stack+0x94/0xa8)
[<c061f40c>] (dump_stack) from [<c03d6630>] (ubi_io_read+0x160/0x374)
[<c03d6630>] (ubi_io_read) from [<c03d4294>] (ubi_eba_read_leb+0x9c/0x434)
[<c03d4294>] (ubi_eba_read_leb) from [<c03d3498>] (ubi_leb_read+0x70/0xb0)
[<c03d3498>] (ubi_leb_read) from [<c02868e0>] (ubifs_leb_read+0x2c/0x78)
[<c02868e0>] (ubifs_leb_read) from [<c0288220>] (ubifs_read_node+0x94/0x244)
[<c0288220>] (ubifs_read_node) from [<c02a3d00>] (ubifs_tnc_read_node+0x4c/0xcc)
[<c02a3d00>] (ubifs_tnc_read_node) from [<c0288c38>] (matches_name+0x90/0xcc)
[<c0288c38>] (matches_name) from [<c02895ac>] (resolve_collision+0x4c/0x2c8)
[<c02895ac>] (resolve_collision) from [<c028c630>] (ubifs_tnc_add_nm+0xc4/0x250)
[<c028c630>] (ubifs_tnc_add_nm) from [<c027bc0c>] (ubifs_jnl_rename+0x400/0x95c)
[<c027bc0c>] (ubifs_jnl_rename) from [<c02817e0>] (do_rename+0x418/0x83c)
[<c02817e0>] (do_rename) from [<c0201a60>] (vfs_rename+0x3b0/0x7f4)
[<c0201a60>] (vfs_rename) from [<c02021a8>] (do_renameat2+0x304/0x4a0)
[<c02021a8>] (do_renameat2) from [<c0100040>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xc1a81fa8 to 0xc1a81ff0)
1fa0:                   00000000 00538207 ffffff9c 005383de ffffff9c 00538207
1fc0: 00000000 00538207 00000000 0000017e 00559028 00538fad 000000c1 004a3518
1fe0: 00557c40 be807cc4 004893e8 b6f47a68
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:26024, read only 68 bytes, retry (addr:0xee65a8)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:26024, read only 68 bytes, retry (addr:0xee65a8)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:26024, read only 68 bytes, retry (addr:0xee65a8)
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 68 bytes from PEB 119:26024, read 68 bytes
CPU: 0 PID: 84 Comm: ifup Not tainted 5.10.100-geb4d6c39094a-dirty #28
Hardware name: BCM5301X
[<c0107540>] (unwind_backtrace) from [<c01045dc>] (show_stack+0x10/0x14)
[<c01045dc>] (show_stack) from [<c061f40c>] (dump_stack+0x94/0xa8)
[<c061f40c>] (dump_stack) from [<c03d6630>] (ubi_io_read+0x160/0x374)
[<c03d6630>] (ubi_io_read) from [<c03d4294>] (ubi_eba_read_leb+0x9c/0x434)
[<c03d4294>] (ubi_eba_read_leb) from [<c03d3498>] (ubi_leb_read+0x70/0xb0)
[<c03d3498>] (ubi_leb_read) from [<c02868e0>] (ubifs_leb_read+0x2c/0x78)
[<c02868e0>] (ubifs_leb_read) from [<c0288220>] (ubifs_read_node+0x94/0x244)
[<c0288220>] (ubifs_read_node) from [<c02a3d00>] (ubifs_tnc_read_node+0x4c/0xcc)
[<c02a3d00>] (ubifs_tnc_read_node) from [<c0288c38>] (matches_name+0x90/0xcc)
[<c0288c38>] (matches_name) from [<c02895ac>] (resolve_collision+0x4c/0x2c8)
[<c02895ac>] (resolve_collision) from [<c028c4e8>] (ubifs_tnc_remove_nm+0xb0/0x134)
[<c028c4e8>] (ubifs_tnc_remove_nm) from [<c027bf2c>] (ubifs_jnl_rename+0x720/0x95c)
[<c027bf2c>] (ubifs_jnl_rename) from [<c02817e0>] (do_rename+0x418/0x83c)
[<c02817e0>] (do_rename) from [<c0201a60>] (vfs_rename+0x3b0/0x7f4)
[<c0201a60>] (vfs_rename) from [<c02021a8>] (do_renameat2+0x304/0x4a0)
[<c02021a8>] (do_renameat2) from [<c0100040>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xc1a81fa8 to 0xc1a81ff0)
1fa0:                   00000000 00538207 ffffff9c 005383de ffffff9c 00538207
1fc0: 00000000 00538207 00000000 0000017e 00559028 00538fad 000000c1 004a3518
1fe0: 00557c40 be807cc4 004893e8 b6f47a68
b53-srab-switch 18007000.srab lan4: configuring for phy/gmii link mode
8021q: adding VLAN 0 to HW filter on device lan4
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:26416, read only 64 bytes, retry (addr:0xee6730)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:26416, read only 64 bytes, retry (addr:0xee6730)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:26416, read only 64 bytes, retry (addr:0xee6730)
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:26416, read 64 bytes
CPU: 0 PID: 84 Comm: ifup Not tainted 5.10.100-geb4d6c39094a-dirty #28
Hardware name: BCM5301X
[<c0107540>] (unwind_backtrace) from [<c01045dc>] (show_stack+0x10/0x14)
[<c01045dc>] (show_stack) from [<c061f40c>] (dump_stack+0x94/0xa8)
[<c061f40c>] (dump_stack) from [<c03d6630>] (ubi_io_read+0x160/0x374)
[<c03d6630>] (ubi_io_read) from [<c03d4294>] (ubi_eba_read_leb+0x9c/0x434)
[<c03d4294>] (ubi_eba_read_leb) from [<c03d3498>] (ubi_leb_read+0x70/0xb0)
[<c03d3498>] (ubi_leb_read) from [<c02868e0>] (ubifs_leb_read+0x2c/0x78)
[<c02868e0>] (ubifs_leb_read) from [<c0288220>] (ubifs_read_node+0x94/0x244)
[<c0288220>] (ubifs_read_node) from [<c02a3d00>] (ubifs_tnc_read_node+0x4c/0xcc)
[<c02a3d00>] (ubifs_tnc_read_node) from [<c0288c38>] (matches_name+0x90/0xcc)
[<c0288c38>] (matches_name) from [<c02895ac>] (resolve_collision+0x4c/0x2c8)
[<c02895ac>] (resolve_collision) from [<c028c630>] (ubifs_tnc_add_nm+0xc4/0x250)
[<c028c630>] (ubifs_tnc_add_nm) from [<c027bc0c>] (ubifs_jnl_rename+0x400/0x95c)
[<c027bc0c>] (ubifs_jnl_rename) from [<c02817e0>] (do_rename+0x418/0x83c)
[<c02817e0>] (do_rename) from [<c0201a60>] (vfs_rename+0x3b0/0x7f4)
[<c0201a60>] (vfs_rename) from [<c02021a8>] (do_renameat2+0x304/0x4a0)
[<c02021a8>] (do_renameat2) from [<c0100040>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xc1a81fa8 to 0xc1a81ff0)
1fa0:                   00000000 00538207 ffffff9c 005383de ffffff9c 00538207
1fc0: 00000000 00538207 00000000 0000017e 0055ac10 00538fad 000000c1 004a3518
1fe0: 00557c40 be807cc4 004893e8 b6f47a68
br-wan: port 1(wan) entered blocking state
br-wan: port 1(wan) entered disabled state
device wan entered promiscuous mode
device eth0 entered promiscuous mode
udhcpc: started, v1.35.0
ubi0 error: ubi_io_write: Read back 894 FAILED from "ubi" at offset 0xee6800 of length 2048: -74
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 67 bytes from PEB 119:28512, read only 67 bytes, retry (addr:0xee6f60)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 67 bytes from PEB 119:28512, read only 67 bytes, retry (addr:0xee6f60)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 67 bytes from PEB 119:28512, read only 67 bytes, retry (addr:0xee6f60)
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 67 bytes from PEB 119:28512, read 67 bytes
CPU: 0 PID: 133 Comm: rm Not tainted 5.10.100-geb4d6c39094a-dirty #28
Hardware name: BCM5301X
[<c0107540>] (unwind_backtrace) from [<c01045dc>] (show_stack+0x10/0x14)
[<c01045dc>] (show_stack) from [<c061f40c>] (dump_stack+0x94/0xa8)
[<c061f40c>] (dump_stack) from [<c03d6630>] (ubi_io_read+0x160/0x374)
[<c03d6630>] (ubi_io_read) from [<c03d4294>] (ubi_eba_read_leb+0x9c/0x434)
[<c03d4294>] (ubi_eba_read_leb) from [<c03d3498>] (ubi_leb_read+0x70/0xb0)
[<c03d3498>] (ubi_leb_read) from [<c02868e0>] (ubifs_leb_read+0x2c/0x78)
[<c02868e0>] (ubifs_leb_read) from [<c0288220>] (ubifs_read_node+0x94/0x244)
[<c0288220>] (ubifs_read_node) from [<c02a3d00>] (ubifs_tnc_read_node+0x4c/0xcc)
[<c02a3d00>] (ubifs_tnc_read_node) from [<c0288c38>] (matches_name+0x90/0xcc)
[<c0288c38>] (matches_name) from [<c02895ac>] (resolve_collision+0x4c/0x2c8)
[<c02895ac>] (resolve_collision) from [<c028c4e8>] (ubifs_tnc_remove_nm+0xb0/0x134)
[<c028c4e8>] (ubifs_tnc_remove_nm) from [<c027a590>] (ubifs_jnl_update+0x2a0/0x6a4)
[<c027a590>] (ubifs_jnl_update) from [<c027fb44>] (ubifs_unlink+0x1c0/0x2ac)
[<c027fb44>] (ubifs_unlink) from [<c0200a8c>] (vfs_unlink+0x108/0x28c)
[<c0200a8c>] (vfs_unlink) from [<c0200d78>] (do_unlinkat+0x168/0x28c)
[<c0200d78>] (do_unlinkat) from [<c0100040>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xc23e3fa8 to 0xc23e3ff0)
3fa0:                   befa2f64 00000008 befa2f64 00000000 00000000 00008000
3fc0: befa2f64 00000008 00000008 0000000a 00547a04 00000000 00547a04 00000000
3fe0: 00547d10 befa2c50 0050cd9c b6eb3670
udhcpc: broadcasting discover
ubi0 error: ubi_io_write: Read back 896 FAILED from "ubi" at offset 0xa2000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 907 FAILED from "ubi" at offset 0xee7000 of length 2048: -74
udhcpc: broadcasting discover
udhcpc: broadcasting discover
ubi0 error: ubi_io_write: Read back 908 FAILED from "ubi" at offset 0xee7800 of length 2048: -74
udhcpc: no lease, forking to background
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:27264, read only 64 bytes, retry (addr:0xee6a80)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:27264, read only 64 bytes, retry (addr:0xee6a80)
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:27264, read only 64 bytes, retry (addr:0xee6a80)
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 119:27264, read 64 bytes
CPU: 0 PID: 84 Comm: ifup Not tainted 5.10.100-geb4d6c39094a-dirty #28
Hardware name: BCM5301X
[<c0107540>] (unwind_backtrace) from [<c01045dc>] (show_stack+0x10/0x14)
[<c01045dc>] (show_stack) from [<c061f40c>] (dump_stack+0x94/0xa8)
[<c061f40c>] (dump_stack) from [<c03d6630>] (ubi_io_read+0x160/0x374)
[<c03d6630>] (ubi_io_read) from [<c03d4294>] (ubi_eba_read_leb+0x9c/0x434)
[<c03d4294>] (ubi_eba_read_leb) from [<c03d3498>] (ubi_leb_read+0x70/0xb0)
[<c03d3498>] (ubi_leb_read) from [<c02868e0>] (ubifs_leb_read+0x2c/0x78)
[<c02868e0>] (ubifs_leb_read) from [<c0288220>] (ubifs_read_node+0x94/0x244)
[<c0288220>] (ubifs_read_node) from [<c02a3d00>] (ubifs_tnc_read_node+0x4c/0xcc)
[<c02a3d00>] (ubifs_tnc_read_node) from [<c0288c38>] (matches_name+0x90/0xcc)
[<c0288c38>] (matches_name) from [<c02895ac>] (resolve_collision+0x4c/0x2c8)
[<c02895ac>] (resolve_collision) from [<c028c630>] (ubifs_tnc_add_nm+0xc4/0x250)
[<c028c630>] (ubifs_tnc_add_nm) from [<c027bc0c>] (ubifs_jnl_rename+0x400/0x95c)
[<c027bc0c>] (ubifs_jnl_rename) from [<c02817e0>] (do_rename+0x418/0x83c)
[<c02817e0>] (do_rename) from [<c0201a60>] (vfs_rename+0x3b0/0x7f4)
[<c0201a60>] (vfs_rename) from [<c02021a8>] (do_renameat2+0x304/0x4a0)
[<c02021a8>] (do_renameat2) from [<c0100040>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xc1a81fa8 to 0xc1a81ff0)
1fa0:                   00000000 00538207 ffffff9c 005383de ffffff9c 00538207
1fc0: 00000000 00538207 00000000 0000017e 00559028 00538fad 000000c1 004a3518
1fe0: 00557c40 be807cc4 004893e8 b6f47a68
br-lan: port 1(lan1) entered blocking state
br-lan: port 1(lan1) entered disabled state
device lan1 entered promiscuous mode
br-lan: port 2(lan2) entered blocking state
br-lan: port 2(lan2) entered disabled state
device lan2 entered promiscuous mode
br-lan: port 3(lan3) entered blocking state
br-lan: port 3(lan3) entered disabled state
device lan3 entered promiscuous mode
br-lan: port 4(lan4) entered blocking state
br-lan: port 4(lan4) entered disabled state
device lan4 entered promiscuous mode
br-lan: port 1(lan1) entered blocking state
br-lan: port 1(lan1) entered forwarding state
OK
ubi0 error: ubi_io_write: Read back 910 FAILED from "ubi" at offset 0xee8000 of length 2048: -74
Starting dropbear sshd: OK
Welcome to Buildroot
buildroot login: IPv6: ADDRCONF(NETDEV_CHANGE): br-lan: link becomes ready
ubi0 error: ubi_io_write: Read back 911 FAILED from "ubi" at offset 0xee8800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 913 FAILED from "ubi" at offset 0xee9000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 915 FAILED from "ubi" at offset 0xee9800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 917 FAILED from "ubi" at offset 0xeea000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 919 FAILED from "ubi" at offset 0xeea800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 921 FAILED from "ubi" at offset 0xeeb000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 923 FAILED from "ubi" at offset 0xeeb800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 925 FAILED from "ubi" at offset 0xeec000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 927 FAILED from "ubi" at offset 0xeec800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 929 FAILED from "ubi" at offset 0xeed000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 931 FAILED from "ubi" at offset 0xeed800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 933 FAILED from "ubi" at offset 0xeee000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 935 FAILED from "ubi" at offset 0xeee800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 937 FAILED from "ubi" at offset 0xeef000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 939 FAILED from "ubi" at offset 0xeef800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 941 FAILED from "ubi" at offset 0xef0000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 943 FAILED from "ubi" at offset 0xef0800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 945 FAILED from "ubi" at offset 0xef1000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 947 FAILED from "ubi" at offset 0xef1800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 949 FAILED from "ubi" at offset 0xef2000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 951 FAILED from "ubi" at offset 0xef2800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 953 FAILED from "ubi" at offset 0xef3000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 955 FAILED from "ubi" at offset 0xef3800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 957 FAILED from "ubi" at offset 0xef4000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 959 FAILED from "ubi" at offset 0xef4800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 961 FAILED from "ubi" at offset 0xef5000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 963 FAILED from "ubi" at offset 0xef5800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 965 FAILED from "ubi" at offset 0xef6000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 967 FAILED from "ubi" at offset 0xef6800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 969 FAILED from "ubi" at offset 0xef7000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 971 FAILED from "ubi" at offset 0xef7800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 973 FAILED from "ubi" at offset 0xef8000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 975 FAILED from "ubi" at offset 0xef8800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 977 FAILED from "ubi" at offset 0xef9000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 979 FAILED from "ubi" at offset 0xef9800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 981 FAILED from "ubi" at offset 0xefa000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 983 FAILED from "ubi" at offset 0xefa800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 985 FAILED from "ubi" at offset 0xefb000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 987 FAILED from "ubi" at offset 0xefb800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 989 FAILED from "ubi" at offset 0xefc000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 991 FAILED from "ubi" at offset 0xefc800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 993 FAILED from "ubi" at offset 0xefd000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 995 FAILED from "ubi" at offset 0xefd800 of length 2048: -74
ubi0 error: ubi_io_write: Read back 997 FAILED from "ubi" at offset 0xefe000 of length 2048: -74
ubi0 error: ubi_io_write: Read back 999 FAILED from "ubi" at offset 0xefe800 of length 2048: -74



Finally a diff:

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 14d890b00..6507044ed 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -171,8 +171,8 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
  		}

  		if (retries++ < UBI_IO_RETRIES) {
-			ubi_warn(ubi, "error %d%s while reading %d bytes from PEB %d:%d, read only %zd bytes, retry",
-				 err, errstr, len, pnum, offset, read);
+			ubi_warn(ubi, "error %d%s while reading %d bytes from PEB %d:%d, read only %zd bytes, retry (addr:0x%llx)",
+				 err, errstr, len, pnum, offset, read, addr);
  			yield();
  			goto retry;
  		}
@@ -219,6 +219,8 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
   * Note, in case of an error, it is possible that something was still written
   * to the flash media, but may be some garbage.
   */
+static int ubi_io_write_counter;
+
  int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
  		 int len)
  {
@@ -226,6 +228,8 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
  	size_t written;
  	loff_t addr;

+	ubi_io_write_counter++;
+
  	dbg_io("write %d bytes to PEB %d:%d", len, pnum, offset);

  	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
@@ -268,6 +272,23 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
  	}

  	addr = (loff_t)pnum * ubi->peb_size + offset;
+
+	/* Make sure block is stil fine - just in case */
+	{
+		uint8_t *buf = kzalloc(len, GFP_KERNEL);
+
+		if (buf) {
+			size_t bytes_read;
+			int ret;
+
+			ret = mtd_read(ubi->mtd, addr, len, &bytes_read, buf);
+			if (ret && !mtd_is_bitflip(ret))
+				ubi_err(ubi, "Failed to read from \"%s\" at offset 0x%llx of length %d: %d", ubi->mtd->name, addr, len, ret);
+
+			kfree(buf);
+		}
+	}
+
  	err = mtd_write(ubi->mtd, addr, len, &written, buf);
  	if (err) {
  		ubi_err(ubi, "error %d while writing %d bytes to PEB %d:%d, written %zd bytes",
@@ -277,6 +298,22 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
  	} else
  		ubi_assert(written == len);

+	if (!err) {
+		uint8_t *buf = kzalloc(len, GFP_KERNEL);
+
+		if (buf) {
+			size_t bytes_read;
+			int ret;
+
+			ret = mtd_read(ubi->mtd, addr, len, &bytes_read, buf);
+			if (ret && !mtd_is_bitflip(ret))
+				ubi_err(ubi, "Read back %d FAILED from \"%s\" at offset 0x%llx of length %d: %d",
+					ubi_io_write_counter, ubi->mtd->name, addr, len, ret);
+
+			kfree(buf);
+		}
+	}
+
  	if (!err) {
  		err = self_check_write(ubi, buf, pnum, offset, len);
  		if (err)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
