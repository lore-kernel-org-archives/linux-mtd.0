Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJoQI-00023h-0w
 for linux-mtd@lists.infradead.org; Tue, 19 Aug 2014 18:46:22 +0000
Received: by mail-ig0-f175.google.com with SMTP id uq10so10525961igb.2
 for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2014 11:45:59 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 19 Aug 2014 20:45:59 +0200
Message-ID: <CACna6rwb1whM51=wOSWy-60+TogjB+wesMpO6y=pt7q0t4jfFg@mail.gmail.com>
Subject: NAND flashes in Broadcom routers: bad blocks, ECC
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: OpenWrt Development List <openwrt-devel@lists.openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[cross-list e-mail to openwrt-devel and linux-mtd]

Hi,

I wanted to finally switch from NAND_ECC_NONE to NAND_ECC_SOFT (there
is no hw ECC) but it appears it won't be that straightforward. The
problem is NAND implementation in Broadcom's CFE bootloader.

It appears that all the bootloader cares about is if block is good or
bad. I think it doesn't even use BBT. It simply checks for oob[0x0]
(or oob[0x5] for small flashes) being 0xff. Then it writes to the
block or skips it. The bootloader doesn't seem to even calculate ECC
when writing! So after installing firmware using bootloader all OOB
content is 0xFF. Of course enableing NAND_ECC_SOFT results in
uncorrectable errors:
bcm47xxnflash: NAND_CMD_RNDOUT len:0x0F
bcm47xxnflash: NAND_CMD_RNDOUT data FF FF FF FF FF FF FF FF FF FF FF
FF FF FF FF FF
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
mtd_read error while reading (offset: 0x60000)!

So I wonder how we could deal with that. Should I somehow detect if
this is first boot after installation and calculate ECCs on my own?
Hoping nothing wrong will happen of the first read?


In case you wonder how Broadcom's firmware handles that. Well,
horribly. They use two drivers: "nflash" and "brcmnand".
The first one (bcm_nflash.c) is a plain MTD driver that follows poor
bootloader logic. It's responsible for "kernel" and "rootfs"
partitions. It does not care about BBT or ECC. It assumes reading
always success and it may mark blocks as bad after failed erase or
write.
The second one (brcmnand_47xx.c) is a nice NAND driver. It uses (in a
bit hacky way, but still) NAND subsystem, handles ECC, etc. Broadcom
uses it for "brcmnand" partition located after "kernel" and "rootfs".

--=20
Rafa=C5=82
