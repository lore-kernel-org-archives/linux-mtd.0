Received: from [74.213.171.136] (helo=hi.ry.ca)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nc4gH-0004bW-8X
	for linux-mtd@lists.infradead.org; Mon, 01 Feb 2010 22:23:45 +0000
Received: from mail-yx0-f175.google.com (mail-yx0-f175.google.com
	[209.85.210.175]) by hi.ry.ca (Postfix) with ESMTPSA id 33787170BA0
	for <linux-mtd@lists.infradead.org>;
	Mon,  1 Feb 2010 17:22:46 -0500 (EST)
Received: by yxe5 with SMTP id 5so4849272yxe.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Feb 2010 14:15:50 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 1 Feb 2010 16:15:50 -0600
Message-ID: <56a87efc1002011415v19439bfq6e459070533b745d@mail.gmail.com>
Subject: Partitions not created following 2.6.28 -> 2.6.31 update
From: Ryan Thompson <i@ry.ca>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm in the process of updating my kernel to 2.6.31 from 2.6.28. I am
running custom PowerPC 4xx hardware with CFI NOR flash. Flash itself
works, but after the kernel update, my partitions are no longer being
created. Detailed info below:

My device tree (dts) is set up roughly like this:

 FLASH: flash@f0000000 {
     /* ...snip hw params... */
     uboot@0 {
         reg = <0x0 0xE0000>;
         label = "uboot";
     };

     ubootenv@e0000 {
         reg = <0xE0000 0x20000>;
         label = "ubootenv";
     };

     /* Other similar partitions */
 };

Under 2.6.28, this would give me the following kernel messages on boot:

 f0000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 erase region 0: offset=0x0,size=0x20000,blocks=1024
 cmdlinepart partition parsing not available
 RedBoot partition parsing not available
 Creating 10 MTD partitions on "f0000000.flash":
 0x00000000-0x000e0000 : "uboot"
 0x000e0000-0x00100000 : "ubootenv"
 .
 .

And there would be corresponding mtd(block)? devices for each partition.

Under 2.6.31, the flash itself is still probed, but the output is
slightly different, and the partitions are not created:

 f0000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank
  Intel/Sharp Extended Query Table at 0x010A
  Intel/Sharp Extended Query Table at 0x010A
  Intel/Sharp Extended Query Table at 0x010A
  Intel/Sharp Extended Query Table at 0x010A
  Intel/Sharp Extended Query Table at 0x010A
 Using buffer write method
 Using auto-unlock on power-up/resume
 cfi_cmdset_0001: Erase suspend on write enabled
 erase region 0: offset=0x0,size=0x20000,blocks=1024
 cmdlinepart partition parsing not available
 RedBoot partition parsing not available

I have not changed the device tree.

In my kernel .config, I have (still) enabled CONFIG_MTD_{PARTITIONS,
PHYSMAP, PHYSMAP_OF, OF_PARTS, CHAR, BLOCK}, and have not changed
these options. The only MTD or flash options that make config changed
when I ran it on 2.6.31 were the new MTD_TESTS, and MTD_LPDDR, both of
which are disabled.

mtd_debug used to say:
  mtd.type = MTD_NORFLASH
  mtd.flags = MTD_WRITEABLE | MTD_BIT_WRITEABLE
  mtd.size = 917504 (896K)
  mtd.erasesize = 131072 (128K)
  mtd.writesize = 1
  mtd.oobsize = 0
  mtd.ecctype = (unknown ECC type - new MTD API maybe?)
  regions = 0

Now it outputs:
  mtd.type = MTD_NORFLASH
  mtd.flags = MTD_WRITEABLE | MTD_BIT_WRITEABLE
  mtd.size = 134217728 (128M)
  mtd.erasesize = 131072 (128K)
  mtd.writesize = 1
  mtd.oobsize = 0
  mtd.ecctype = (unknown ECC type - new MTD API maybe?)
  regions = 1

  region[0].offset = 0x00000000
  region[0].erasesize = 131072 (128K)
  region[0].numblocks = 1024
  region[0].regionindex = 0

If I read from /dev/mtdblock0, I see my u-boot image, so flash itself
still works. The problem is, the kernel isn't splitting it into
separate mtd devices per the DTB like it did before the update.

The char/block device nodes 1..n all return ENODEV on open(), which is
no great surprise given the above information.

Any advice on how to get my partitions back would be appreciated!
Hopefully I'm missing something obvious.

Thanks,
- R
