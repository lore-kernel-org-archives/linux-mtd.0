Received: from mail-pz0-f197.google.com ([209.85.222.197])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mb8OG-0007Bt-IN
	for linux-mtd@lists.infradead.org; Wed, 12 Aug 2009 07:37:01 +0000
Received: by pzk35 with SMTP id 35so4280168pzk.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Aug 2009 00:36:54 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 12 Aug 2009 13:06:53 +0530
Message-ID: <967093cd0908120036q51283790se400dc08219daed@mail.gmail.com>
Subject: Problem with nand flash while booting 2.6.30
From: Saurabh Kadekodi <saurabhkadekodi@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am working on a board with pxa320 processor. It has a micron 128 mb
flash. It boots well with kernel 2.6.25, but when booting with 2.6.30,
it somehow cannot detect the nand chip properly.

It shows following messages:

NAND device: Manufacturer ID: 0x00, Chip ID: 0xa1 (Unknown NAND 128MiB
1,8V 8-bit)

While with 2.6.25 it properly detects as a micron flash.

Then later it gives a lot of ECC errors and prints the following messages:


Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
> empty_blocks 0, bad_blocks 208, c->nr_blocks 438
> VFS: Cannot open root device "mtdblock2" or unknown-block(31,2)
> Please append a correct "root=" boot option; here are the available partitions:
> 1f00             256 mtdblock0 (driver?)
> 1f01            2048 mtdblock1 (driver?)
> 1f02          112128 mtdblock2 (driver?)
> 1f03             512 mtdblock3 (driver?)
> b300         2008064 mmcblk0 driver: mmcblk
>   b301           31288 mmcblk0p1
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(31,2)
> Backtrace:
> [<c0028a34>] (dump_backtrace+0x0/0x110) from [<c0028b78>] (dump_stack+0x18/0x1c)
>  r6:c03af144 r5:c001d884 r4:cf81df54
> [<c0028b60>] (dump_stack+0x0/0x1c) from [<c003ca9c>] (panic+0x60/0x13c)
> [<c003ca3c>] (panic+0x0/0x13c) from [<c0008dac>] (mount_block_root+0x104/0x234)
>  r3:00000000 r2:20000013 r1:cf81df54 r0:c0330e50
> [<c0008ca8>] (mount_block_root+0x0/0x234) from [<c0008fb8>] (mount_root+0xdc/0x100)
> [<c0008edc>] (mount_root+0x0/0x100) from [<c0009024>] (prepare_namespace+0x48/0x190)
>  r7:00000000 r6:c001d840 r5:c001d83c r4:c03ae0c4
> [<c0008fdc>] (prepare_namespace+0x0/0x190) from [<c00087dc>] (kernel_init+0xc8/0xf4)
>  r6:c001cdec r5:c001cb58 r4:c03ae0b8
> [<c0008714>] (kernel_init+0x0/0xf4) from [<c003fc90>] (do_exit+0x0/0x6c8)
>  r6:00000000 r5:00000000 r4:00000000
>
>
Please can someone guide me as to what maybe wrong. The flash cannot
be corrupt as
2.6.25 boots correctly. Then where am I going wrong?

Thanks in advance,

Saurabh
