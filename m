Received: from [83.150.126.237] (helo=hermes.nextfour.com)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OUKRe-0001NY-Sv
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2010 14:08:51 +0000
Received: from hermes.nextfour.com (hermes.nextfour.com [127.0.1.1])
	by hermes.nextfour.com (Postfix) with ESMTP id AAB50614290
	for <linux-mtd@lists.infradead.org>;
	Thu,  1 Jul 2010 16:33:51 +0300 (EEST)
Date: Thu, 1 Jul 2010 16:33:51 +0300 (EEST)
From: Teemu Peltola <teemu.peltola@nextfour.com>
To: linux-mtd@lists.infradead.org
Message-ID: <22169642.5911277991231604.JavaMail.root@hermes>
In-Reply-To: <15264957.5891277991162932.JavaMail.root@hermes>
Subject: Re: mxc_nand: write problem with i.MX-27L + ST NAND512R3A2DZA6E flash
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

> I have a device based on i.MX-27L and I am updating kernel from 2.6.24
> with a custom set of patches to vanilla 2.6.34. I am having problems
> using mxc_nand driver with ST NAND512R3A2DZA6E flash chip (64MB,
> 8-bit, 512 byte page size). I am using
> arch/arm/mach-mx2/mach-mx27ads.c based board file.
>
> The problem is that write operations fail. If I have
> CONFIG_MTD_NAND_VERIFY_WRITE=y, CONFIG_MTD_DEBUG=y,
> CONFIG_MTD_DEBUG_VERBOSE=0 enabled in my kernel config and use
> mtd_pagetest module I see the following output:
> 
> $> modprobe mtd_pagetest dev=4
> =================================================
> mtd_pagetest: MTD device: 4
> mtd_pagetest: MTD device size 1048576, eraseblock size 16384, page
> size 512, count of eraseblocks 64, pages per eraseblock 32, OOB size
> 16
> mtd_pagetest: scanning for bad eraseblocks
> mtd_pagetest: scanned 64 eraseblocks, 0 are bad
> mtd_pagetest: erasing whole device
> mtd_pagetest: erased 64 eraseblocks
> mtd_pagetest: writing whole device
> mtd_pagetest: error: write failed at 0x0
> mtd_pagetest: error -5 occurred
> =================================================

It seems that using CONFIG_MTD_NAND_VERIFY_WRITE option with mxc_nand driver in kernel 2.6.34 causes every MTD write to fail. That is because in nand_base.c, nand_write_page function there is a call to chip->verify_buf(mtd, buf, mtd->writesize), but mxc_nand has registered a function called mxc_nand_verify_buf to it in mxc_nand.c, which always returns -EFAULT, thus failing every mtd_write operation.

I previously had problems when trying to use nandwrite to write JFFS2 root filesystem to NAND partition, but after applying patch "mxc_nand: Fix OOB accesses on i.MX27" (http://lists.infradead.org/pipermail/linux-mtd/2010-May/030366.html) and using nandwrite with -a option, everything works now ok also with 2.6.34.

--
Teemu
