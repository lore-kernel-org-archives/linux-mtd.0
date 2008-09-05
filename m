Received: from n1.cetrtapot.si ([89.212.80.162])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KbVwu-0005oa-Fx
	for linux-mtd@lists.infradead.org; Fri, 05 Sep 2008 07:41:44 +0000
Message-ID: <48C0DD22.1090402@cetrtapot.si>
Date: Fri, 05 Sep 2008 09:17:54 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Brian Szmyd <brian.szmyd@quantum.com>
Subject: Re: Partitioning NAND flash
References: <1220554162.4879.64.camel@lethargic>
In-Reply-To: <1220554162.4879.64.camel@lethargic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Szmyd wrote:
> I am having trouble determining where the partitioning information is
> coming from when I boot into linux 2.6.26 for my haleakala reference
> board from amcc. When linux boots I receive the following output from
> the MTD driver:
> 
> fc000000.nor_flash: Found 1 x16 devices at 0x0 in 16-bit bank
>  Amd/Fujitsu Extended Query Table at 0x0040
> fc000000.nor_flash: CFI does not contain boot bank location. Assuming
> top.
> number of CFI chips: 1
> cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
> RedBoot partition parsing not available
> Creating 5 MTD partitions on "fc000000.nor_flash":
> 0x00000000-0x001e0000 : "kernel"
> 0x001e0000-0x00200000 : "dtb"
> 0x00200000-0x00f60000 : "root"
> 0x03f60000-0x03fa0000 : "env"
> 0x03fa0000-0x04000000 : "u-boot"
> NDFC NAND Driver initialized. Chip-Rev: 0x00000111
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB
> 3,3V 8-bit)
> Scanning device for bad blocks
> Number of partitions 3
> Creating 3 MTD partitions on "NAND 64MiB 3,3V 8-bit":
> 0x00000000-0x00060000 : "u-boot"
> 0x00060000-0x00068000 : "env"
> 0x00068000-0x04000000 : "content"
> 
> My problem is that I want to repartition the NAND flash, but am not sure
> where the current partitioning scheme is coming from. My bootargs to the
> kernel does not contain an mtdparts section and i don't see any
> reference to a "u-boot", "env", "content" partition in the mtd driver
> code itself.

The NOR flash maps are located in drivers/mtd/maps and NAND maps are in 
drivers/mtd/nand. Map defines how flash is partitioned. The information 
can be static or from kernel cmdline or from redboot partition. Parsing
of cmdline and reboot part. must be enabled in kernel before using.

> 
> I have setup my NOR partitioning by modifying the DTS provided by the
> linux source, but there is nothing in there that refers to the NAND
> chip. I have tried providing an mtdparts argument to the kernel but this
> appears to be a no-op even though the appropriate option in the kernel
> is configured.

It is possible that parsing of cmdline for MTD is disabled. Do you 
have /proc/config.gz on your system? Grep for 'MTD_'.

> 
> I'm kind of at a loss after monkeying with this for the last couple
> days. Any help or direction to a good source of information would be
> greatly appreciated!
> 

Look at the boards in drivers/mtd/maps, there a lot of examples on how to
make a mtd map.

HTH,
Hinko


-- 
ČETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
