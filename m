Return-Path: <SRS0=cBb+=FT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E8AC2BB48
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 10:16:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDAD322202
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 10:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDAD322202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r8ABoJWZPmT7RUe3iDWwJ1fmbl1BSeWnLX53Sapoq9c=; b=Vm07VYoaQeyqCz9FwLpH126jm
	TJv4dMKBmWFfO+kcSEociv3ztxmNsGzeSG8LH8SuTtns850LAMCXqEo2a5ArbAmssIUGAun6+yHCt
	wgN7nZF/gba1EgKJ+k9dv+Tb80ccDQYQge6wNnOfhqF8fZwx9k7opmNLs12Um2ySxNmL+w8Pj2Cy8
	H/vFTV1d30Ou2lk44IzZ9HxU0sve2b5PF1tbZn2Ui5CH8QLiz4lbdjW+EhlcAEzV1Lq8KLJfXTs+c
	nr0U6UBqhE8DP5Onkyo760GukTOyWzgTGrmdnV8DgfgER8SzJH3ZREQfK29ieWwBr8uXOwlbtN9+h
	rp8EHna3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kp7M2-0007Uz-7B; Tue, 15 Dec 2020 10:14:50 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kp7Ly-0007Tz-JR
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2020 10:14:48 +0000
Received: by mail-io1-xd2b.google.com with SMTP id d9so19937485iob.6
 for <linux-mtd@lists.infradead.org>; Tue, 15 Dec 2020 02:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDhQOsKrjTaCUv75G8cPeRVaONcjLVIBaibHEU0W478=;
 b=XJ1D6oyf4qAK9GkbVwUplBbfCjod1/Cl8iqTXvPSXlTWm11ZGlC84kF/PwI/sGGVBT
 F8Aq5AOh+bp3AEYTJm8/giXt4mAsYJicUnEr4qk7snwAQIYM4jjvnKOytoTHFzyVdXmU
 sywaPWJaxxXPaF4PPK8DiqbvGuTGqHuo/E1/JespOZBTZa2+DbpL0oOBoI7zNhY353nN
 0ZmycMumSbpNl9I84PeudXmWiihBawabbtxHU83A5WRTn+dwet05IeNa/b7CpuQ4Bjfr
 L5YOnQQUG7SujGRKJDtlKjwpez6Py7hpsHwaw93/XjqImgINkMW1JMB0i/0aPknznj/h
 +dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDhQOsKrjTaCUv75G8cPeRVaONcjLVIBaibHEU0W478=;
 b=lO86wLgr9IQnnPA6xaaQHEDpn1V7PrMnthI8V8crp+fXZ6HN45UBdBqt9+wUiiO74u
 WLEKdJoqfV3ICTfRYlPdbNpVQVphvDsBkyOkqGLkhJQOcntIgY0WyhQK7uSH2pOzknLS
 CzxPEJRBvuHmfwng++LsAkvTMGtMlyzaajveyLuE2Kmw5BYoC7+yUd9e+nGsOgnx73tI
 ACBcuTlRs+VN6luDb3ocY6NGDAWkWlXy4o3ygpwN45A5Wr6OqB4si86uRAv9vEtHIV7m
 E/YSTAsH3U8KZq6viJmwsWIpKgjUIApKYHJz0w4APyswg+rxSfE9DtJVDqadhz/aXdN8
 3G/A==
X-Gm-Message-State: AOAM530jSkV25Ygw4GbvCpsGwRpMUrt7qWclzm/xpCRVfEfay/37fh1E
 859OFLzvyv8WmMcu00RxSkIdjqRqDbivDCQBo6I=
X-Google-Smtp-Source: ABdhPJy9yt1G+hngQ/zyoadADNWZj0LdFipEvOL21ZFJ1geFBX0/iFTMd/fhTPHyuFn4DePhmYQXJ+Q5G8g/iN2RVJE=
X-Received: by 2002:a02:c608:: with SMTP id i8mr38097973jan.125.1608027282000; 
 Tue, 15 Dec 2020 02:14:42 -0800 (PST)
MIME-Version: 1.0
References: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
 <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
 <CAK+FTGjg1sMtE0Vk=mztO6_HP0VJ=mYy1b0nAEXDw6Dtx6AtUw@mail.gmail.com>
 <2020191742.126461.1607959229137.JavaMail.zimbra@nod.at>
 <CAK+FTGirwvd5Sdww4kkYCy0BMmnZsP=Tq=cAePxraXa3AcGbiQ@mail.gmail.com>
 <CAFLxGvx4eZ3ZrciBLpF6qiQ7Srev=jGtyf50sC-qN9Q=z+xDQQ@mail.gmail.com>
 <20201215000355.760d3a95@xps13>
In-Reply-To: <20201215000355.760d3a95@xps13>
From: David Schaefer <david.tillmann.schaefer@gmail.com>
Date: Tue, 15 Dec 2020 11:14:31 +0100
Message-ID: <CAK+FTGi0bXdPsJiWQYkxotkM+E1DXchgQG-VfCNKJSiQrbHBxA@mail.gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_051446_693305_B18F6E51 
X-CRM114-Status: GOOD (  23.97  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

Am Di., 15. Dez. 2020 um 00:03 Uhr schrieb Miquel Raynal
<miquel.raynal@bootlin.com>:
> > > If this is a regression, how can we continue here? Can I give hardware
> > > specs and logs? I have soldered on the board to access UART. I can
> > > provide e.g. boot logs.
> >
> > No need to worry. Let's wait for Miquel, I'm sure he has an idea.
> > In the absolute worst case we reconstruct the old driver.
> >
>
> Yes indeed, this looks like a regression but I bet we already fixed it.
> Perhaps there has been a backporting issue and we did not spot it.
> Can you please try the following fixes (in this order):
> f6997bec6af4 mtd: rawnand: marvell: fix the chip-select DT parsing logic
> b76401fc4ba7 mtd: rawnand: marvell: pass ms delay to wait_op
> a2ee41fd953e mtd: rawnand: marvell: fix command xtype in BCH write hook
> 90d617633368 mtd: rawnand: marvell: Fix read logic for layouts with ->nchunks > 2
> 7fd130f7416f mtd: rawnand: marvell: support 8b/512B strength for 2kiB pages layout
> 53c83b59759c mtd: rawnand: marvell: fix the IRQ handler complete() condition
> cafb56dd741e mtd: rawnand: marvell: prevent timeouts on a loaded machine
> c27075772d1f mtd: rawnand: marvell: Fix the condition on a return code

Thank you for your suggested commits. I guess you are right and the
issue already
has been fixed. I am not sure which commit is working for production
so I have attached
the boot logs for all kernels that I obtained by cherry-picking your
suggested commits from
top to bottom, one by one. Please note that there was a merge conflict
when merging
7fd130f7416f that I solved by '-X theirs'.

Kind regards
David

------------- cherry-pick f6997bec6af4
nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
nand: Hynix H27U2G8F2CTR-BC
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
Bad block table not found for chip 0
Bad block table not found for chip 0
Scanning device for bad blocks
Bad eraseblock 1854 at 0x00000e7c0000
-> does not continue booting

------------- cherry-pick b76401fc4ba7
nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
nand: Hynix H27U2G8F2CTR-BC
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
Bad block table not found for chip 0
Bad block table not found for chip 0
Scanning device for bad blocks
Bad eraseblock 1854 at 0x00000e7c0000
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error while writing BBT block -110
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error -110 while marking block 2047 bad
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error while writing BBT block -110
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
ata1: SATA link down (SStatus 0 SControl F300)
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error -110 while marking block 2046 bad
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error while writing BBT block -110
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error -110 while marking block 2045 bad
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error while writing BBT block -110
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error -110 while marking block 2044 bad
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error while writing BBT block -110
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error -110 while marking block 2043 bad
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error while writing BBT block -110
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error -110 while marking block 2042 bad
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error while writing BBT block -110
ata2: SATA link down (SStatus 0 SControl F300)
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error -110 while marking block 2041 bad
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error while writing BBT block -110
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
marvell-nfc f10d0000.nand: Timeout waiting for RB signal
nand_bbt: error -110 while marking block 2040 bad
No space left to write bad block table
nand_bbt: error while writing bad block table -28
marvell-nfc f10d0000.nand: nand_scan_tail failed: -28
marvell-nfc: probe of f10d0000.nand failed with error -28
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
orion-ehci f1050000.usb: USB 2.0 started, EHCI 1.00
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 4.16.0+ ehci_hcd
usb usb1: SerialNumber: f1050000.usb
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
usbcore: registered new interface driver usb-storage
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
### Press any key to stop and run shell... (2)mdadm: No arrays found
in config file or automatically
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
Sending select for 192.168.178.59...
Lease of 192.168.178.59 obtained, lease time 864000
Setting IP address 192.168.178.59 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
udhcpc (v1.24.1) started
Setting IP address 0.0.0.0 on eth0
Sending discover...
Sending select for 192.168.178.59...
Lease of 192.168.178.59 obtained, lease time 864000
Setting IP address 192.168.178.59 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1

 / # ls /dev/mtd*
ls: /dev/mtd*: No such file or directory

------------- cherry-pick a2ee41fd953e
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
Sending select for 192.168.178.66...
Lease of 192.168.178.66 obtained, lease time 864000
Setting IP address 192.168.178.66 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
udhcpc (v1.24.1) started
Setting IP address 0.0.0.0 on eth0
Sending discover...
Sending select for 192.168.178.66...
Lease of 192.168.178.66 obtained, lease time 864000
Setting IP address 192.168.178.66 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
/ # ls /dev/mtd*
/dev/mtd0       /dev/mtd2ro     /dev/mtd5       /dev/mtdblock1  /dev/mtdblock6
/dev/mtd0ro     /dev/mtd3       /dev/mtd5ro     /dev/mtdblock2
/dev/mtd1       /dev/mtd3ro     /dev/mtd6       /dev/mtdblock3
/dev/mtd1ro     /dev/mtd4       /dev/mtd6ro     /dev/mtdblock4
/dev/mtd2       /dev/mtd4ro     /dev/mtdblock0  /dev/mtdblock5

------------- cherry-pick 90d617633368
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
Sending select for 192.168.178.70...
Lease of 192.168.178.70 obtained, lease time 864000
Setting IP address 192.168.178.70 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
udhcpc (v1.24.1) started
Setting IP address 0.0.0.0 on eth0
Sending discover...
Sending select for 192.168.178.70...
Lease of 192.168.178.70 obtained, lease time 864000
Setting IP address 192.168.178.70 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
/ # ls /dev/mtd*
/dev/mtd0       /dev/mtd2ro     /dev/mtd5       /dev/mtdblock1  /dev/mtdblock6
/dev/mtd0ro     /dev/mtd3       /dev/mtd5ro     /dev/mtdblock2
/dev/mtd1       /dev/mtd3ro     /dev/mtd6       /dev/mtdblock3
/dev/mtd1ro     /dev/mtd4       /dev/mtd6ro     /dev/mtdblock4
/dev/mtd2       /dev/mtd4ro     /dev/mtdblock0  /dev/mtdblock5

------------- cherry-pick 7fd130f7416f -X theirs
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
Sending select for 192.168.178.72...
Lease of 192.168.178.72 obtained, lease time 864000
Setting IP address 192.168.178.72 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
udhcpc (v1.24.1) started
Setting IP address 0.0.0.0 on eth0
Sending discover...
Sending select for 192.168.178.72...
Lease of 192.168.178.72 obtained, lease time 864000
Setting IP address 192.168.178.72 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
/ # ls /dev/mtd*
/dev/mtd0       /dev/mtd2ro     /dev/mtd5       /dev/mtdblock1  /dev/mtdblock6
/dev/mtd0ro     /dev/mtd3       /dev/mtd5ro     /dev/mtdblock2
/dev/mtd1       /dev/mtd3ro     /dev/mtd6       /dev/mtdblock3
/dev/mtd1ro     /dev/mtd4       /dev/mtd6ro     /dev/mtdblock4
/dev/mtd2       /dev/mtd4ro     /dev/mtdblock0  /dev/mtdblock5
------------- cherry-pick 53c83b59759c
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
Sending select for 192.168.178.73...
Lease of 192.168.178.73 obtained, lease time 864000
Setting IP address 192.168.178.73 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
udhcpc (v1.24.1) started
Setting IP address 0.0.0.0 on eth0
Sending discover...
Sending select for 192.168.178.73...
Lease of 192.168.178.73 obtained, lease time 864000
Setting IP address 192.168.178.73 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
/ # ls /dev/mtd*
/dev/mtd0       /dev/mtd2ro     /dev/mtd5       /dev/mtdblock1  /dev/mtdblock6
/dev/mtd0ro     /dev/mtd3       /dev/mtd5ro     /dev/mtdblock2
/dev/mtd1       /dev/mtd3ro     /dev/mtd6       /dev/mtdblock3
/dev/mtd1ro     /dev/mtd4       /dev/mtd6ro     /dev/mtdblock4
/dev/mtd2       /dev/mtd4ro     /dev/mtdblock0  /dev/mtdblock5

------------- cherry-pick cafb56dd741e
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
Sending select for 192.168.178.74...
Lease of 192.168.178.74 obtained, lease time 864000
Setting IP address 192.168.178.74 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
udhcpc (v1.24.1) started
Setting IP address 0.0.0.0 on eth0
Sending discover...
Sending select for 192.168.178.74...
Lease of 192.168.178.74 obtained, lease time 864000
Setting IP address 192.168.178.74 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
/ # ls /dev/mtd*
/dev/mtd0       /dev/mtd2ro     /dev/mtd5       /dev/mtdblock1  /dev/mtdblock6
/dev/mtd0ro     /dev/mtd3       /dev/mtd5ro     /dev/mtdblock2
/dev/mtd1       /dev/mtd3ro     /dev/mtd6       /dev/mtdblock3
/dev/mtd1ro     /dev/mtd4       /dev/mtd6ro     /dev/mtdblock4
/dev/mtd2       /dev/mtd4ro     /dev/mtdblock0  /dev/mtdblock5

------------- cherry-pick c27075772d1f
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
Sending select for 192.168.178.75...
Lease of 192.168.178.75 obtained, lease time 864000
Setting IP address 192.168.178.75 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
udhcpc (v1.24.1) started
Setting IP address 0.0.0.0 on eth0
Sending discover...
Sending select for 192.168.178.75...
Lease of 192.168.178.75 obtained, lease time 864000
Setting IP address 192.168.178.75 on eth0
Deleting routers
route: SIOCDELRT: No such process
Adding router 192.168.178.1
Recreating /etc/resolv.conf
 Adding DNS server 192.168.178.1
/ # ls /dev/mtd*
/dev/mtd0       /dev/mtd2ro     /dev/mtd5       /dev/mtdblock1  /dev/mtdblock6
/dev/mtd0ro     /dev/mtd3       /dev/mtd5ro     /dev/mtdblock2
/dev/mtd1       /dev/mtd3ro     /dev/mtd6       /dev/mtdblock3
/dev/mtd1ro     /dev/mtd4       /dev/mtd6ro     /dev/mtdblock4
/dev/mtd2       /dev/mtd4ro     /dev/mtdblock0  /dev/mtdblock5

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
