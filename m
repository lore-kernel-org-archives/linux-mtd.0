Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8ACCDE001
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jun 2026 12:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCcIUfGLlk65VQgmNomaQdPdU8oW6c/hTM6MlwiSj0w=; b=tUlHbR3YKRRfPv
	I6mYhX5xBEXx3VhgmGCkoUw2htmTzfZhzwFqsM0+YBb6h0vF14VsVW086SdrHFhzvl989C3t1V5bK
	L5ny/+YctXFWTRlWT+NyL/SZb2cg3e0Y0MsVk3GTO4gIg2aYiMBCinIm/mXl6uUZx9eNEG8ng7kMM
	+DFsvWFkT9dAN6P/HoVIiGhzd8U3OdBt/Z3s4j+zMeoRedIOWk+24fqRKPIfhqfRWqd/kb2UqJltW
	oViXeIQGCyLqDxGgQ134WV/Kq1+FMHolG6gS2Yx2TSNmL2W74VTegCpllZruGQRzP+g0VbWbeSkIc
	CMOHZdi7/vgRNFfqpq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcisk-000000099lu-2VVe;
	Thu, 25 Jun 2026 12:08:34 +0000
Received: from omr-01.pc5.atmailcloud.com ([103.150.252.236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcisd-000000099jX-374v
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jun 2026 12:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=westnet.com.au; s=202309; h=Content-Type:From:To:Subject:MIME-Version:Date:
	Message-ID; bh=e+PIk+O4rHlHF2NbSeeY/XhTt4M1wzTZ7x5xk7qadZA=; b=pGM9UuEUPAkLRA
	mJQlySdg44zWHWJItpz58o2akdr/SXkO3v7bmssXxd7XiDry83HduKyIyOU1Rw/pOhtGwY0FL31fs
	AxSm8Cbw+SPvboDjiUopfby0TzsoDhY4ScLexJMRj77RkkTK2svgFcINLP40Xs48ITj/SfMDLbZ2R
	9qBhTY8xBXQrSUX8G1+5bEwtgPqPq0h7bkI2ZLq5DFmZOH7mLPnVkkc0s/lDK5aWPKV4rRerFnDYQ
	GVbwUZFzh6JbLSvTnleP0bKeJst5OJ4hBGC1vQgtn+8PekP9Tb1jINvv/09tEiz0kbqbz3Ot2GVuE
	izQ1zTrBPKmYv61Wv8jA==;
Received: from cmr-kakadu04.internal.pc5.atmailcloud.com (cmr-kakadu04.internal.pc5.atmailcloud.com [192.168.1.6]) 
	by omr-01.pc5.atmailcloud.com (Exim/cmr-kakadu04.i-0c20fa12ae284b9bc) with ESMTPS
	(envelope-from <gregungerer@westnet.com.au>)
	id 1wcisN-00000005dSo-45tT ;
	Thu, 25 Jun 2026 12:08:11 +0000
Received: from [115.130.81.87] (helo=[192.168.0.22])
	 by cmr-kakadu04.i-0c20fa12ae284b9bc with esmtpsa
	(envelope-from <gregungerer@westnet.com.au>)
	id 1wcisE-000000014x2-0SzC;
	Thu, 25 Jun 2026 12:08:09 +0000
Message-ID: <b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
Date: Thu, 25 Jun 2026 22:07:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
To: Arnd Bergmann <arnd@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
References: <20260526103227.3152003-1-arnd@kernel.org>
 <20260526103227.3152003-2-arnd@kernel.org>
Content-Language: en-US
From: Greg Ungerer <gregungerer@westnet.com.au>
In-Reply-To: <20260526103227.3152003-2-arnd@kernel.org>
X-Atmail-Id: gregungerer@westnet.com.au
X-atmailcloud-spam-action: 
X-AVAS-Report: RCVD_TLS_ALL(0.00) FROM_HAS_DN(0.00) FROM_EQ_ENVFROM(0.00) BAYES_HAM(-0.21) CLOUDMARK_NOT_SPAM(-5.00) TO_MATCH_ENVRCPT_ALL(0.00) KNOWN_SENDER(-1.00) MIME_GOOD(-0.10) MID_RHS_MATCH_FROM(0.00) RCPT_COUNT_SEVEN(0.00) RCVD_VIA_SMTP_AUTH(0.00) ARC_NA(0.00) CYREN_UNKNOWN(0.00) RCVD_COUNT_ONE(0.00) MIME_TRACE(0.00) ASN_FAIL(0.00) FREEMAIL_FROM(0.00) TO_DN_SOME(0.00) FREEMAIL_ENVFROM(0.00) 
X-atmailcloud-route: unknown
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_050828_358105_1089B799 
X-CRM114-Status: GOOD (  28.40  )
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

Hi Arnd,

On 26/5/26 20:32, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Rather than using platform data or DT properties, the configuration
> for this mtd map driver used to be passed through the global
> uclinux_ram_map structure, but the last instance was removed in
> commit 4ba66a976072 ("arch: remove blackfin port") in 2018.
> 
> After commit 251f26c9e828 ("mtd: maps: Make uclinux_ram_map static"),
> it became impossible to configure it at all, even with out-of-tree
> platform code.
> 
> Clearly nobody is using it, so remove it.

It is used on some ColdFire platforms, and was working all the way up
to being removed in the current merge window.

The ColdFire platform startup code (arch/m68k/coldfire/head.S) has a
somewhat unusual setup that can copy an attached filesystem blob to
_bss_stop, and this is one of the places the uclinux.c map driver can
use as the filesystem memory address. From uclinux.c

     static int __init uclinux_mtd_init(void)
     {
         struct mtd_info *mtd;
         struct map_info *mapp;

         mapp = &uclinux_ram_map;

         if (physaddr == -1)
                 mapp->phys = (resource_size_t)__bss_stop;
         else
                 mapp->phys = physaddr;

No out of tree code is required. Most of the ColdFire defconfigs have
CONFIG_MTD_UCLINUX enabled, since it is commonly used.

Can we get this reverted?

Regards
Greg



> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/mtd/maps/Kconfig   |   6 --
>   drivers/mtd/maps/Makefile  |   1 -
>   drivers/mtd/maps/uclinux.c | 118 -------------------------------------
>   3 files changed, 125 deletions(-)
>   delete mode 100644 drivers/mtd/maps/uclinux.c
> 
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index 784dba14e908..1e8f2b518ddd 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -284,12 +284,6 @@ config MTD_PCMCIA_ANONYMOUS
>   
>   	  If unsure, say N.
>   
> -config MTD_UCLINUX
> -	bool "Generic uClinux RAM/ROM filesystem support"
> -	depends on (MTD_RAM=y || MTD_ROM=y) && (!MMU || COLDFIRE)
> -	help
> -	  Map driver to support image based filesystems for uClinux.
> -
>   config MTD_PLATRAM
>   	tristate "Map driver for platform device RAM (mtd-ram)"
>   	select MTD_RAM
> diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
> index 157f911f86d8..eff28fc0b60e 100644
> --- a/drivers/mtd/maps/Makefile
> +++ b/drivers/mtd/maps/Makefile
> @@ -31,7 +31,6 @@ obj-$(CONFIG_MTD_SCx200_DOCFLASH)+= scx200_docflash.o
>   obj-$(CONFIG_MTD_SOLUTIONENGINE)+= solutionengine.o
>   obj-$(CONFIG_MTD_PCI)		+= pci.o
>   obj-$(CONFIG_MTD_IMPA7)		+= impa7.o
> -obj-$(CONFIG_MTD_UCLINUX)	+= uclinux.o
>   obj-$(CONFIG_MTD_SCB2_FLASH)	+= scb2_flash.o
>   obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
>   obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
> deleted file mode 100644
> index de4c46318abb..000000000000
> --- a/drivers/mtd/maps/uclinux.c
> +++ /dev/null
> @@ -1,118 +0,0 @@
> -/****************************************************************************/
> -
> -/*
> - *	uclinux.c -- generic memory mapped MTD driver for uclinux
> - *
> - *	(C) Copyright 2002, Greg Ungerer (gerg@snapgear.com)
> - *
> - *      License: GPL
> - */
> -
> -/****************************************************************************/
> -
> -#include <linux/moduleparam.h>
> -#include <linux/types.h>
> -#include <linux/init.h>
> -#include <linux/kernel.h>
> -#include <linux/fs.h>
> -#include <linux/mm.h>
> -#include <linux/major.h>
> -#include <linux/mtd/mtd.h>
> -#include <linux/mtd/map.h>
> -#include <linux/mtd/partitions.h>
> -#include <asm/io.h>
> -#include <asm/sections.h>
> -
> -/****************************************************************************/
> -
> -#ifdef CONFIG_MTD_ROM
> -#define MAP_NAME "rom"
> -#else
> -#define MAP_NAME "ram"
> -#endif
> -
> -static struct map_info uclinux_ram_map = {
> -	.name = MAP_NAME,
> -	.size = 0,
> -};
> -
> -static unsigned long physaddr = -1;
> -module_param(physaddr, ulong, S_IRUGO);
> -
> -static struct mtd_info *uclinux_ram_mtdinfo;
> -
> -/****************************************************************************/
> -
> -static const struct mtd_partition uclinux_romfs[] = {
> -	{ .name = "ROMfs" }
> -};
> -
> -#define	NUM_PARTITIONS	ARRAY_SIZE(uclinux_romfs)
> -
> -/****************************************************************************/
> -
> -static int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
> -	size_t *retlen, void **virt, resource_size_t *phys)
> -{
> -	struct map_info *map = mtd->priv;
> -	*virt = map->virt + from;
> -	if (phys)
> -		*phys = map->phys + from;
> -	*retlen = len;
> -	return(0);
> -}
> -
> -/****************************************************************************/
> -
> -static int __init uclinux_mtd_init(void)
> -{
> -	struct mtd_info *mtd;
> -	struct map_info *mapp;
> -
> -	mapp = &uclinux_ram_map;
> -
> -	if (physaddr == -1)
> -		mapp->phys = (resource_size_t)__bss_stop;
> -	else
> -		mapp->phys = physaddr;
> -
> -	if (!mapp->size)
> -		mapp->size = PAGE_ALIGN(ntohl(*((unsigned long *)(mapp->phys + 8))));
> -	mapp->bankwidth = 4;
> -
> -	printk("uclinux[mtd]: probe address=0x%x size=0x%x\n",
> -	       	(int) mapp->phys, (int) mapp->size);
> -
> -	/*
> -	 * The filesystem is guaranteed to be in direct mapped memory. It is
> -	 * directly following the kernels own bss region. Following the same
> -	 * mechanism used by architectures setting up traditional initrds we
> -	 * use phys_to_virt to get the virtual address of its start.
> -	 */
> -	mapp->virt = phys_to_virt(mapp->phys);
> -
> -	if (mapp->virt == 0) {
> -		printk("uclinux[mtd]: no virtual mapping?\n");
> -		return(-EIO);
> -	}
> -
> -	simple_map_init(mapp);
> -
> -	mtd = do_map_probe("map_" MAP_NAME, mapp);
> -	if (!mtd) {
> -		printk("uclinux[mtd]: failed to find a mapping?\n");
> -		return(-ENXIO);
> -	}
> -
> -	mtd->owner = THIS_MODULE;
> -	mtd->_point = uclinux_point;
> -	mtd->priv = mapp;
> -
> -	uclinux_ram_mtdinfo = mtd;
> -	mtd_device_register(mtd, uclinux_romfs, NUM_PARTITIONS);
> -
> -	return(0);
> -}
> -device_initcall(uclinux_mtd_init);
> -
> -/****************************************************************************/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
