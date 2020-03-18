Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560D9C10F29
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 18:57:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2686220724
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 18:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jjTs76BS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nBCJyLGC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2686220724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r79CR4k9rPaUa9wyoJ4wezMFlHFQHhyquMYLhLypxyE=; b=jjTs76BSabkufp
	0fzajR4HCC31YdpLmVu2WLLXj6zhNIvWA9diLk+jKcrLtYNFCtOaqLDATX3h6wG7PiL5NAmyiM1j8
	07y11NUfxrkh/+4NS1+PqxJrh8ybc2G1vVHy4YQH7wRQOtWGg5rOJ/lGkPHyjCzQDOG9lSmSLNnAm
	rISfhnJOmQDb+4QvhTE7cDFvtaIcaJNsTheMx3sIrMj5i3Pica88TcWZPbnsJyx/WI7CKOeB3cRMf
	sWaRasPQH4+9VpLVfo6ffujSmOA1iCR1VWsfnZKldspnY7y+IBCaasByWr2Mey7DB2hPTTU0IF8JV
	aLqeL3RNm11hzjUg6wng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEdsR-0003ir-Gh; Wed, 18 Mar 2020 18:57:15 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEdsN-0003hd-3r
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 18:57:13 +0000
Received: by mail-pj1-x1044.google.com with SMTP id np9so1725444pjb.4
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2020 11:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wDnuUdk8XlpspG3EO2VVFXSCJgdWiMqfc3nwlgWxfss=;
 b=nBCJyLGCTfChXYP6fGVqAmquhMPD+nDtazaP7SAlEsl8GX+p0jOUU2MF1j4pfsMNrz
 E2vUS6Np3QbWn28JOg0D9sZ0ZmIbNnMGiA8w//nUKbXJq79PBPQORAvWQXl50dw+TNX3
 p/srkSiyiiHjKuzddksBPMui+dyQea/+NszSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wDnuUdk8XlpspG3EO2VVFXSCJgdWiMqfc3nwlgWxfss=;
 b=sdjQGGWzFA1+h/BhFPW2AFAOGOOwGOYep/IHs0MwEiV/JyyAtqsT8qLY20My9SLtfL
 aH2Epoxj/FhOOOc2EnCKmMQLZXpB0pcvwv3QpN9jmWIpRDI3xJcvWAJrwXd0vSQHB6QL
 mb0lTkymgPlizKx4PPpYG/8pNqGWDf6OoM1YGlY2GZwzwlpfcYPmG08Cau/o71/2w9y/
 UojPAfwkOUJFiyMh5dGZt1N6fG1APQDRtWujw3fVfNdOLSrPm0TyBxQOPjw6nd48iZIw
 RqGAo0IY1iKqkqgVMRHA3Uu4sVpWLXeKGngeXc3ucMJhqeqqKduRDeaeblWLjBSVrmM2
 mcZg==
X-Gm-Message-State: ANhLgQ2tsEkwSM/YWhzMIUpBkrdIc9AvZy+pl/1iheeC3Q6CC6teAPTN
 0HaH4iNPjGreYPACDnwCZJAjMg==
X-Google-Smtp-Source: ADFU+vtG6XdAAaEXCjlbxO0CppaD+ZxMJsdLIgpCCSMg9/dAAUU3Sp0cKhpNwQRTateUymVBUKf3uQ==
X-Received: by 2002:a17:90b:238e:: with SMTP id
 mr14mr6049290pjb.146.1584557829792; 
 Wed, 18 Mar 2020 11:57:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id g19sm7532414pfh.141.2020.03.18.11.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 11:57:08 -0700 (PDT)
Date: Wed, 18 Mar 2020 11:57:07 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v2 11/11] mtd: new support oops logger based on pstore/blk
Message-ID: <202003181149.90B22E24@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-12-git-send-email-liaoweixiong@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1581078355-19647-12-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_115711_192320_FEB7C091 
X-CRM114-Status: GOOD (  38.22  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>,
 linux-mtd@lists.infradead.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 07, 2020 at 08:25:55PM +0800, WeiXiong Liao wrote:
> It's the last one of a series of patches for adaptive to MTD device.
> 
> The mtdpstore is similar to mtdoops but more powerful. It bases on
> pstore/blk, aims to store panic and oops logs to a flash partition,
> where it can be read back as files after mounting pstore filesystem.
> 
> The pstore/blk and blkoops, a wrapper for pstore/blk, are designed for
> block device at the very beginning, but now, compatible to not only
> block device. After this series of patches, pstore/blk can also work
> for MTD device. To make it work, 'blkdev' on kconfig or module
> parameter of blkoops should be set as mtd device name or mtd number.
> See more about pstore/blk and blkoops on:
>     Documentation/admin-guide/pstore-block.rst
> 
> Why do we need mtdpstore?
> 1. repetitive jobs between pstore and mtdoops
>    Both of pstore and mtdoops do the same jobs that store panic/oops log.
>    They have much similar logic that register to kmsg dumper and store
>    log to several chunks one by one.
> 2. do what a driver should do
>    To me, a driver should provide methods instead of policies. What MTD
>    should do is to provide read/write/erase operations, geting rid of codes
>    about chunk management, kmsg dumper and configuration.
> 3. enhanced feature
>    Not only store log, but also show it as files.
>    Not only log, but also trigger time and trigger count.
>    Not only panic/oops log, but also log recorder for pmsg, console and
>    ftrace in the future.

I wonder if it's possible to make this device driver "invisible", in the
sense that it could be entirely user-configured via blkoops. I don't
think that's needed right now, especially since it's MOSTLY configured
by blkoops.param, etc, but I'll keep thinking about it.

Modulo various naming convention adjustments outlined in the other
patches, this looks fine to me (I can't really speak to the mtd driver
bits itself, but the pstore and blkoops interaction looks good).

-Kees

> 
> Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
> ---
>  Documentation/admin-guide/pstore-block.rst |  10 +-
>  drivers/mtd/Kconfig                        |  10 +
>  drivers/mtd/Makefile                       |   1 +
>  drivers/mtd/mtdpstore.c                    | 564 +++++++++++++++++++++++++++++
>  4 files changed, 583 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/mtd/mtdpstore.c
> 
> diff --git a/Documentation/admin-guide/pstore-block.rst b/Documentation/admin-guide/pstore-block.rst
> index 1735476621df..823fe2b4b84f 100644
> --- a/Documentation/admin-guide/pstore-block.rst
> +++ b/Documentation/admin-guide/pstore-block.rst
> @@ -54,9 +54,10 @@ blkdev
>  ~~~~~~
>  
>  The block device to use. Most of the time, it is a partition of block device.
> -It's fine to ignore it if you are not using a block device.
> +It is also used for MTD device. It's fine to ignore it if you are not using
> +a block device or a MTD device.
>  
> -It accepts the following variants:
> +It accepts the following variants for block device:
>  
>  1. <hex_major><hex_minor> device number in hexadecimal represents itself; no
>     leading 0x, for example b302.
> @@ -75,6 +76,11 @@ It accepts the following variants:
>     partition with a known unique id.
>  #. <major>:<minor> major and minor number of the device separated by a colon.
>  
> +It accepts the following variants for MTD device:
> +
> +1. <device name> MTD device name. "pstore" is recommended.
> +#. <device number> MTD device number.
> +
>  dmesg_size
>  ~~~~~~~~~~
>  
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 42d401ea60ee..5d53d5cd2998 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -170,6 +170,16 @@ config MTD_OOPS
>  	  buffer in a flash partition where it can be read back at some
>  	  later point.
>  
> +config MTD_PSTORE
> +	tristate "Log panic/oops to an MTD buffer based on pstore"
> +	depends on PSTORE_BLKOOPS
> +	help
> +	  This enables panic and oops messages to be logged to a circular
> +	  buffer in a flash partition where it can be read back as files after
> +	  mounting pstore filesystem.
> +
> +	  If unsure, say N.
> +
>  config MTD_SWAP
>  	tristate "Swap on MTD device support"
>  	depends on MTD && SWAP
> diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
> index 56cc60ccc477..593d0593a038 100644
> --- a/drivers/mtd/Makefile
> +++ b/drivers/mtd/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_RFD_FTL)		+= rfd_ftl.o
>  obj-$(CONFIG_SSFDC)		+= ssfdc.o
>  obj-$(CONFIG_SM_FTL)		+= sm_ftl.o
>  obj-$(CONFIG_MTD_OOPS)		+= mtdoops.o
> +obj-$(CONFIG_MTD_PSTORE)	+= mtdpstore.o
>  obj-$(CONFIG_MTD_SWAP)		+= mtdswap.o
>  
>  nftl-objs		:= nftlcore.o nftlmount.o
> diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
> new file mode 100644
> index 000000000000..58b9e10ef675
> --- /dev/null
> +++ b/drivers/mtd/mtdpstore.c
> @@ -0,0 +1,564 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#define dev_fmt(fmt) "mtdoops-pstore: " fmt
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/blkoops.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/bitops.h>
> +
> +static struct mtdpstore_context {
> +	int index;
> +	struct blkoops_info bo_info;
> +	struct blkoops_device bo_dev;
> +	struct mtd_info *mtd;
> +	unsigned long *rmmap;		/* removed bit map */
> +	unsigned long *usedmap;		/* used bit map */
> +	/*
> +	 * used for panic write
> +	 * As there are no block_isbad for panic case, we should keep this
> +	 * status before panic to ensure panic_write not failed.
> +	 */
> +	unsigned long *badmap;		/* bad block bit map */
> +} oops_cxt;
> +
> +static int mtdpstore_block_isbad(struct mtdpstore_context *cxt, loff_t off)
> +{
> +	int ret;
> +	struct mtd_info *mtd = cxt->mtd;
> +	u64 blknum = div_u64(off, mtd->erasesize);
> +
> +	if (test_bit(blknum, cxt->badmap))
> +		return true;
> +	ret = mtd_block_isbad(mtd, off);
> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "mtd_block_isbad failed, aborting\n");
> +		return ret;
> +	} else if (ret > 0) {
> +		set_bit(blknum, cxt->badmap);
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static inline int mtdpstore_panic_block_isbad(struct mtdpstore_context *cxt,
> +		loff_t off)
> +{
> +	struct mtd_info *mtd = cxt->mtd;
> +	u64 blknum = div_u64(off, mtd->erasesize);
> +
> +	return test_bit(blknum, cxt->badmap);
> +}
> +
> +static inline void mtdpstore_mark_used(struct mtdpstore_context *cxt,
> +		loff_t off)
> +{
> +	struct mtd_info *mtd = cxt->mtd;
> +	u64 zonenum = div_u64(off, cxt->bo_info.dmesg_size);
> +
> +	dev_dbg(&mtd->dev, "mark zone %llu used\n", zonenum);
> +	set_bit(zonenum, cxt->usedmap);
> +}
> +
> +static inline void mtdpstore_mark_unused(struct mtdpstore_context *cxt,
> +		loff_t off)
> +{
> +	struct mtd_info *mtd = cxt->mtd;
> +	u64 zonenum = div_u64(off, cxt->bo_info.dmesg_size);
> +
> +	dev_dbg(&mtd->dev, "mark zone %llu unused\n", zonenum);
> +	clear_bit(zonenum, cxt->usedmap);
> +}
> +
> +static inline void mtdpstore_block_mark_unused(struct mtdpstore_context *cxt,
> +		loff_t off)
> +{
> +	struct mtd_info *mtd = cxt->mtd;
> +	u64 zonenum = div_u64(off, cxt->bo_info.dmesg_size);
> +	u32 zonecnt = cxt->mtd->erasesize / cxt->bo_info.dmesg_size;
> +
> +	while (zonecnt > 0) {
> +		dev_dbg(&mtd->dev, "mark zone %llu unused\n", zonenum);
> +		clear_bit(zonenum, cxt->usedmap);
> +		zonenum++;
> +		zonecnt--;
> +	}
> +}
> +
> +static inline int mtdpstore_is_used(struct mtdpstore_context *cxt, loff_t off)
> +{
> +	u64 zonenum = div_u64(off, cxt->bo_info.dmesg_size);
> +	u64 blknum = div_u64(off, cxt->mtd->erasesize);
> +
> +	if (test_bit(blknum, cxt->badmap))
> +		return true;
> +	return test_bit(zonenum, cxt->usedmap);
> +}
> +
> +static int mtdpstore_block_is_used(struct mtdpstore_context *cxt,
> +		loff_t off)
> +{
> +	u64 zonenum = div_u64(off, cxt->bo_info.dmesg_size);
> +	u32 zonecnt = cxt->mtd->erasesize / cxt->bo_info.dmesg_size;
> +
> +	while (zonecnt > 0) {
> +		if (test_bit(zonenum, cxt->usedmap))
> +			return true;
> +		zonenum++;
> +		zonecnt--;
> +	}
> +	return false;
> +}
> +
> +static int mtdpstore_is_empty(struct mtdpstore_context *cxt, char *buf,
> +		size_t size)
> +{
> +	struct mtd_info *mtd = cxt->mtd;
> +	size_t sz;
> +	int i;
> +
> +	sz = min_t(uint32_t, size, mtd->writesize / 4);
> +	for (i = 0; i < sz; i++) {
> +		if (buf[i] != (char)0xFF)
> +			return false;
> +	}
> +	return true;
> +}
> +
> +static void mtdpstore_mark_removed(struct mtdpstore_context *cxt, loff_t off)
> +{
> +	struct mtd_info *mtd = cxt->mtd;
> +	u64 zonenum = div_u64(off, cxt->bo_info.dmesg_size);
> +
> +	dev_dbg(&mtd->dev, "mark zone %llu removed\n", zonenum);
> +	set_bit(zonenum, cxt->rmmap);
> +}
> +
> +static void mtdpstore_block_clear_removed(struct mtdpstore_context *cxt,
> +		loff_t off)
> +{
> +	u64 zonenum = div_u64(off, cxt->bo_info.dmesg_size);
> +	u32 zonecnt = cxt->mtd->erasesize / cxt->bo_info.dmesg_size;
> +
> +	while (zonecnt > 0) {
> +		clear_bit(zonenum, cxt->rmmap);
> +		zonenum++;
> +		zonecnt--;
> +	}
> +}
> +
> +static int mtdpstore_block_is_removed(struct mtdpstore_context *cxt,
> +		loff_t off)
> +{
> +	u64 zonenum = div_u64(off, cxt->bo_info.dmesg_size);
> +	u32 zonecnt = cxt->mtd->erasesize / cxt->bo_info.dmesg_size;
> +
> +	while (zonecnt > 0) {
> +		if (test_bit(zonenum, cxt->rmmap))
> +			return true;
> +		zonenum++;
> +		zonecnt--;
> +	}
> +	return false;
> +}
> +
> +static int mtdpstore_erase_do(struct mtdpstore_context *cxt, loff_t off)
> +{
> +	struct mtd_info *mtd = cxt->mtd;
> +	struct erase_info erase;
> +	int ret;
> +
> +	dev_dbg(&mtd->dev, "try to erase off 0x%llx\n", off);
> +	erase.len = cxt->mtd->erasesize;
> +	erase.addr = off;
> +	ret = mtd_erase(cxt->mtd, &erase);
> +	if (!ret)
> +		mtdpstore_block_clear_removed(cxt, off);
> +	else
> +		dev_err(&mtd->dev, "erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
> +		       (unsigned long long)erase.addr,
> +		       (unsigned long long)erase.len, cxt->bo_info.device);
> +	return ret;
> +}
> +
> +/*
> + * called while removing file
> + *
> + * Avoiding over erasing, do erase block only when the whole block is unused.
> + * If the block contains valid log, do erase lazily on flush_removed() when
> + * unregister.
> + */
> +static ssize_t mtdpstore_erase(size_t size, loff_t off)
> +{
> +	struct mtdpstore_context *cxt = &oops_cxt;
> +
> +	if (mtdpstore_block_isbad(cxt, off))
> +		return -EIO;
> +
> +	mtdpstore_mark_unused(cxt, off);
> +
> +	/* If the block still has valid data, mtdpstore do erase lazily */
> +	if (likely(mtdpstore_block_is_used(cxt, off))) {
> +		mtdpstore_mark_removed(cxt, off);
> +		return 0;
> +	}
> +
> +	/* all zones are unused, erase it */
> +	off = ALIGN_DOWN(off, cxt->mtd->erasesize);
> +	return mtdpstore_erase_do(cxt, off);
> +}
> +
> +/*
> + * What is security for mtdpstore?
> + * As there is no erase for panic case, we should ensure at least one zone
> + * is writable. Otherwise, panic write will fail.
> + * If zone is used, write operation will return -ENEXT, which means that
> + * pstore/blk will try one by one until gets an empty zone. So, it is not
> + * needed to ensure the next zone is empty, but at least one.
> + */
> +static int mtdpstore_security(struct mtdpstore_context *cxt, loff_t off)
> +{
> +	int ret = 0, i;
> +	struct mtd_info *mtd = cxt->mtd;
> +	u32 zonenum = (u32)div_u64(off, cxt->bo_info.dmesg_size);
> +	u32 zonecnt = (u32)div_u64(cxt->mtd->size, cxt->bo_info.dmesg_size);
> +	u32 blkcnt = (u32)div_u64(cxt->mtd->size, cxt->mtd->erasesize);
> +	u32 erasesize = cxt->mtd->erasesize;
> +
> +	for (i = 0; i < zonecnt; i++) {
> +		u32 num = (zonenum + i) % zonecnt;
> +
> +		/* found empty zone */
> +		if (!test_bit(num, cxt->usedmap))
> +			return 0;
> +	}
> +
> +	/* If there is no any empty zone, we have no way but to do erase */
> +	off = ALIGN_DOWN(off, erasesize);
> +	while (blkcnt--) {
> +		div64_u64_rem(off + erasesize, cxt->mtd->size, (u64 *)&off);
> +
> +		if (mtdpstore_block_isbad(cxt, off))
> +			continue;
> +
> +		ret = mtdpstore_erase_do(cxt, off);
> +		if (!ret) {
> +			mtdpstore_block_mark_unused(cxt, off);
> +			break;
> +		}
> +	}
> +
> +	if (ret)
> +		dev_err(&mtd->dev, "all blocks bad!\n");
> +	dev_dbg(&mtd->dev, "end security\n");
> +	return ret;
> +}
> +
> +static ssize_t mtdpstore_write(const char *buf, size_t size, loff_t off)
> +{
> +	struct mtdpstore_context *cxt = &oops_cxt;
> +	struct mtd_info *mtd = cxt->mtd;
> +	size_t retlen;
> +	int ret;
> +
> +	if (mtdpstore_block_isbad(cxt, off))
> +		return -ENEXT;
> +
> +	/* zone is used, please try next one */
> +	if (mtdpstore_is_used(cxt, off))
> +		return -ENEXT;
> +
> +	dev_dbg(&mtd->dev, "try to write off 0x%llx size %zu\n", off, size);
> +	ret = mtd_write(cxt->mtd, off, size, &retlen, (u_char *)buf);
> +	if (ret < 0 || retlen != size) {
> +		dev_err(&mtd->dev, "write failure at %lld (%zu of %zu written), err %d\n",
> +				off, retlen, size, ret);
> +		return -EIO;
> +	}
> +	mtdpstore_mark_used(cxt, off);
> +
> +	mtdpstore_security(cxt, off);
> +	return retlen;
> +}
> +
> +static inline bool mtdpstore_is_io_error(int ret)
> +{
> +	return ret < 0 && !mtd_is_bitflip(ret) && !mtd_is_eccerr(ret);
> +}
> +
> +/*
> + * All zones will be read as pstore/blk will read zone one by one when do
> + * recover.
> + */
> +static ssize_t mtdpstore_read(char *buf, size_t size, loff_t off)
> +{
> +	struct mtdpstore_context *cxt = &oops_cxt;
> +	struct mtd_info *mtd = cxt->mtd;
> +	size_t retlen, done;
> +	int ret;
> +
> +	if (mtdpstore_block_isbad(cxt, off))
> +		return -ENEXT;
> +
> +	dev_dbg(&mtd->dev, "try to read off 0x%llx size %zu\n", off, size);
> +	for (done = 0, retlen = 0; done < size; done += retlen) {
> +		retlen = 0;
> +
> +		ret = mtd_read(cxt->mtd, off + done, size - done, &retlen,
> +				(u_char *)buf + done);
> +		if (mtdpstore_is_io_error(ret)) {
> +			dev_err(&mtd->dev, "read failure at %lld (%zu of %zu read), err %d\n",
> +					off + done, retlen, size - done, ret);
> +			/* the zone may be broken, try next one */
> +			return -ENEXT;
> +		}
> +
> +		/*
> +		 * ECC error. The impact on log data is so small. Maybe we can
> +		 * still read it and try to understand. So mtdpstore just hands
> +		 * over what it gets and user can judge whether the data is
> +		 * valid or not.
> +		 */
> +		if (mtd_is_eccerr(ret)) {
> +			dev_err(&mtd->dev, "ecc error at %lld (%zu of %zu read), err %d\n",
> +					off + done, retlen, size - done, ret);
> +			/* driver may not set retlen when ecc error */
> +			retlen = retlen == 0 ? size - done : retlen;
> +		}
> +	}
> +
> +	if (mtdpstore_is_empty(cxt, buf, size))
> +		mtdpstore_mark_unused(cxt, off);
> +	else
> +		mtdpstore_mark_used(cxt, off);
> +
> +	mtdpstore_security(cxt, off);
> +	return retlen;
> +}
> +
> +static ssize_t mtdpstore_panic_write(const char *buf, size_t size, loff_t off)
> +{
> +	struct mtdpstore_context *cxt = &oops_cxt;
> +	struct mtd_info *mtd = cxt->mtd;
> +	size_t retlen;
> +	int ret;
> +
> +	if (mtdpstore_panic_block_isbad(cxt, off))
> +		return -ENEXT;
> +
> +	/* zone is used, please try next one */
> +	if (mtdpstore_is_used(cxt, off))
> +		return -ENEXT;
> +
> +	ret = mtd_panic_write(cxt->mtd, off, size, &retlen, (u_char *)buf);
> +	if (ret < 0 || size != retlen) {
> +		dev_err(&mtd->dev, "panic write failure at %lld (%zu of %zu read), err %d\n",
> +				off, retlen, size, ret);
> +		return -EIO;
> +	}
> +	mtdpstore_mark_used(cxt, off);
> +
> +	return retlen;
> +}
> +
> +static void mtdpstore_notify_add(struct mtd_info *mtd)
> +{
> +	int ret;
> +	struct mtdpstore_context *cxt = &oops_cxt;
> +	struct blkoops_info *info = &cxt->bo_info;
> +	unsigned long longcnt;
> +
> +	if (!strcmp(mtd->name, info->device))
> +		cxt->index = mtd->index;
> +
> +	if (mtd->index != cxt->index || cxt->index < 0)
> +		return;
> +
> +	dev_dbg(&mtd->dev, "found matching MTD device %s\n", mtd->name);
> +
> +	if (mtd->size < info->dmesg_size * 2) {
> +		dev_err(&mtd->dev, "MTD partition %d not big enough\n",
> +				mtd->index);
> +		return;
> +	}
> +	/*
> +	 * dmesg_size must be aligned to 4096 Bytes, which is limited by
> +	 * blkoops. The default value of dmesg_size is 64KB. If dmesg_size
> +	 * is larger than erasesize, some errors will occur since mtdpsotre
> +	 * is designed on it.
> +	 */
> +	if (mtd->erasesize < info->dmesg_size) {
> +		dev_err(&mtd->dev, "eraseblock size of MTD partition %d too small\n",
> +				mtd->index);
> +		return;
> +	}
> +	if (unlikely(info->dmesg_size % mtd->writesize)) {
> +		dev_err(&mtd->dev, "record size %lu KB must align to write size %d KB\n",
> +				info->dmesg_size / 1024,
> +				mtd->writesize / 1024);
> +		return;
> +	}
> +
> +	longcnt = BITS_TO_LONGS(div_u64(mtd->size, info->dmesg_size));
> +	cxt->rmmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
> +	cxt->usedmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
> +
> +	longcnt = BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
> +	cxt->badmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
> +
> +	cxt->bo_dev.total_size = mtd->size;
> +	/* just support dmesg right now */
> +	cxt->bo_dev.flags = BLKOOPS_DEV_SUPPORT_DMESG;
> +	cxt->bo_dev.read = mtdpstore_read;
> +	cxt->bo_dev.write = mtdpstore_write;
> +	cxt->bo_dev.erase = mtdpstore_erase;
> +	cxt->bo_dev.panic_write = mtdpstore_panic_write;
> +
> +	ret = blkoops_register_device(&cxt->bo_dev);
> +	if (ret) {
> +		dev_err(&mtd->dev, "mtd%d register to blkoops failed\n",
> +				mtd->index);
> +		return;
> +	}
> +	cxt->mtd = mtd;
> +	dev_info(&mtd->dev, "Attached to MTD device %d\n", mtd->index);
> +}
> +
> +static int mtdpstore_flush_removed_do(struct mtdpstore_context *cxt,
> +		loff_t off, size_t size)
> +{
> +	struct mtd_info *mtd = cxt->mtd;
> +	u_char *buf;
> +	int ret;
> +	size_t retlen;
> +	struct erase_info erase;
> +
> +	buf = kmalloc(mtd->erasesize, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	/* 1st. read to cache */
> +	ret = mtd_read(mtd, off, mtd->erasesize, &retlen, buf);
> +	if (mtdpstore_is_io_error(ret))
> +		goto free;
> +
> +	/* 2nd. erase block */
> +	erase.len = mtd->erasesize;
> +	erase.addr = off;
> +	ret = mtd_erase(mtd, &erase);
> +	if (ret)
> +		goto free;
> +
> +	/* 3rd. write back */
> +	while (size) {
> +		unsigned int zonesize = cxt->bo_info.dmesg_size;
> +
> +		/* there is valid data on block, write back */
> +		if (mtdpstore_is_used(cxt, off)) {
> +			ret = mtd_write(mtd, off, zonesize, &retlen, buf);
> +			if (ret)
> +				dev_err(&mtd->dev, "write failure at %lld (%zu of %u written), err %d\n",
> +						off, retlen, zonesize, ret);
> +		}
> +
> +		off += zonesize;
> +		size -= min_t(unsigned int, zonesize, size);
> +	}
> +
> +free:
> +	kfree(buf);
> +	return ret;
> +}
> +
> +/*
> + * What does mtdpstore_flush_removed() do?
> + * When user remove any log file on pstore filesystem, mtdpstore should do
> + * something to ensure log file removed. If the whole block is no longer used,
> + * it's nice to erase the block. However if the block still contains valid log,
> + * what mtdpstore can do is to erase and write the valid log back.
> + */
> +static int mtdpstore_flush_removed(struct mtdpstore_context *cxt)
> +{
> +	struct mtd_info *mtd = cxt->mtd;
> +	int ret;
> +	loff_t off;
> +	u32 blkcnt = (u32)div_u64(mtd->size, mtd->erasesize);
> +
> +	for (off = 0; blkcnt > 0; blkcnt--, off += mtd->erasesize) {
> +		ret = mtdpstore_block_isbad(cxt, off);
> +		if (ret)
> +			continue;
> +
> +		ret = mtdpstore_block_is_removed(cxt, off);
> +		if (!ret)
> +			continue;
> +
> +		ret = mtdpstore_flush_removed_do(cxt, off, mtd->erasesize);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static void mtdpstore_notify_remove(struct mtd_info *mtd)
> +{
> +	struct mtdpstore_context *cxt = &oops_cxt;
> +
> +	if (mtd->index != cxt->index || cxt->index < 0)
> +		return;
> +
> +	mtdpstore_flush_removed(cxt);
> +
> +	blkoops_unregister_device(&cxt->bo_dev);
> +	kfree(cxt->badmap);
> +	kfree(cxt->usedmap);
> +	kfree(cxt->rmmap);
> +	cxt->mtd = NULL;
> +	cxt->index = -1;
> +}
> +
> +static struct mtd_notifier mtdpstore_notifier = {
> +	.add	= mtdpstore_notify_add,
> +	.remove	= mtdpstore_notify_remove,
> +};
> +
> +static int __init mtdpstore_init(void)
> +{
> +	int ret;
> +	struct mtdpstore_context *cxt = &oops_cxt;
> +	struct mtd_info *mtd = cxt->mtd;
> +	struct blkoops_info *info = &cxt->bo_info;
> +
> +	ret = blkoops_info(info);
> +	if (unlikely(ret))
> +		return ret;
> +
> +	if (strlen(info->device) == 0) {
> +		dev_err(&mtd->dev, "mtd device must be supplied\n");
> +		return -EINVAL;
> +	}
> +	if (!info->dmesg_size) {
> +		dev_err(&mtd->dev, "no recorder enabled\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Setup the MTD device to use */
> +	ret = kstrtoint((char *)info->device, 0, &cxt->index);
> +	if (ret)
> +		cxt->index = -1;
> +
> +	register_mtd_user(&mtdpstore_notifier);
> +	return 0;
> +}
> +module_init(mtdpstore_init);
> +
> +static void __exit mtdpstore_exit(void)
> +{
> +	unregister_mtd_user(&mtdpstore_notifier);
> +}
> +module_exit(mtdpstore_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("WeiXiong Liao <liaoweixiong@allwinnertech.com>");
> +MODULE_DESCRIPTION("MTD Oops/Panic console logger/driver");
> -- 
> 1.9.1
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
