Received: from [83.150.126.237] (helo=hermes.nextfour.com)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OTZnX-0005uQ-AT
	for linux-mtd@lists.infradead.org; Tue, 29 Jun 2010 12:20:20 +0000
Received: from hermes.nextfour.com (hermes.nextfour.com [127.0.1.1])
	by hermes.nextfour.com (Postfix) with ESMTP id 9B5C8614290
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Jun 2010 14:29:00 +0300 (EEST)
Date: Tue, 29 Jun 2010 14:29:00 +0300 (EEST)
From: Teemu Peltola <teemu.peltola@nextfour.com>
To: linux-mtd@lists.infradead.org
Message-ID: <482801.4861277810940495.JavaMail.root@hermes>
In-Reply-To: <30032862.4841277810798847.JavaMail.root@hermes>
Subject: mxc_nand: write problem with i.MX-27L + ST NAND512R3A2DZA6E flash
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a device based on i.MX-27L and I am updating kernel from 2.6.24 with a custom set of patches to vanilla 2.6.34. I am having problems using mxc_nand driver with ST NAND512R3A2DZA6E flash chip (64MB, 8-bit, 512 byte page size). I am using arch/arm/mach-mx2/mach-mx27ads.c based board file.

I am using physmap to create three partitions (mxc_nand:1M(factset),2M(opt),-(root)) on NAND and they are created successfully with correct sizes. In my mxc_nand_platform_data I have the following values: .width=1, .hw_ecc=1, .flash_bbt=0. The chip is probed successfully at device startup: NAND device: Manufacturer ID: 0x20, Chip ID: 0x36 (ST Micro NAND 64MiB 1,8V 8-bit).

I added some debug outputs to mxcnd_probe (mxc_nand.c):
mxcnd_probe: pdata->width: 1, mtd->writesize: 512, mtd->size: 67108864, mtd->erasesize: 16384, mtd->oobsize: 16, mtd->oobavail: 9, mtd->numeraseregions: 0, mtd->usecount: 0

The problem is that write operations fail. If I have CONFIG_MTD_NAND_VERIFY_WRITE=y, CONFIG_MTD_DEBUG=y, CONFIG_MTD_DEBUG_VERBOSE=0 enabled in my kernel config and use mtd_pagetest module I see the following output:

$> modprobe mtd_pagetest dev=4
=================================================
mtd_pagetest: MTD device: 4
mtd_pagetest: MTD device size 1048576, eraseblock size 16384, page size 512, count of eraseblocks 64, pages per eraseblock 32, OOB size 16
mtd_pagetest: scanning for bad eraseblocks
mtd_pagetest: scanned 64 eraseblocks, 0 are bad
mtd_pagetest: erasing whole device
mtd_pagetest: erased 64 eraseblocks
mtd_pagetest: writing whole device
mtd_pagetest: error: write failed at 0x0
mtd_pagetest: error -5 occurred
=================================================
$> cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 00040000 00010000 "uboot"
mtd1: 00010000 00010000 "ubootenv"
mtd2: 001b0000 00010000 "kernel"
mtd3: 00200000 00010000 "norroot"
mtd4: 00100000 00004000 "factset"
mtd5: 00200000 00004000 "opt"
mtd6: 03d00000 00004000 "root"

I tried to apply this patch: http://patchwork.ozlabs.org/patch/53870/ but it did not help.

Any ideas what could be wrong?

--
Teemu
