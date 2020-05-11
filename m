Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA987C47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 09:01:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A119B207DD
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 09:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SLMaImnM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A119B207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMMop2oQybgz9n9f6yPs+z1XCZ7VdUnJmgM4SFv4X9Y=; b=SLMaImnMCZZTQj
	xWLrQ4Zy1tRjEVMMEtdgfy83YZIOT2Utevh9LRvtTXWE1/f4N+PefwE6J0Tnhj3M0B2rU4leSFoIL
	86AqmqDGB+fpIuT1xVXZs7CfSHXPCD2idIn0J4ArtylYad1EqYmGLlXHm3aP2k8yxyOLR2DeAHwFc
	L/metDlLh+W5gljMRLi2O/F6hvjZomC2Nmr7en3NsC53VZEPzCgHJpJuGZOiBsnoQH/uoxLBv1pd9
	cc54WDcLVH3snm+CZNvcEHc81VzyyXFuI1Y8n+91+wUPbwAlIYdyhR3GMD1NUmj172/+2+r6S2ae7
	cBVWRUVD2KdYr9XvhT5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY4JS-0005Wg-Lp; Mon, 11 May 2020 09:01:26 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY4JO-0005VU-IF
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 09:01:25 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.00693051-0.00184614-0.991223;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03305; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=16; RT=16; SR=0; TI=SMTPD_---.HWoBb8y_1589187676; 
Received: from 172.16.10.102(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.HWoBb8y_1589187676)
 by smtp.aliyun-inc.com(10.147.41.138);
 Mon, 11 May 2020 17:01:17 +0800
Subject: Re: [PATCH v7 17/18] mtd: Support kmsg dumper based on pstore/blk
To: Kees Cook <keescook@chromium.org>
References: <20200510202436.63222-1-keescook@chromium.org>
 <20200510202436.63222-18-keescook@chromium.org>
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Message-ID: <59ef2812-93ad-9f8c-81cc-458128a6fb46@allwinnertech.com>
Date: Mon, 11 May 2020 17:01:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200510202436.63222-18-keescook@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_020122_956567_C88E6BD8 
X-CRM114-Status: GOOD (  32.64  )
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

hi Kees Cook,

On 2020/5/11 AM 4:24, Kees Cook wrote:
> From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
> 
> This introduces mtdpstore, which is similar to mtdoops but more
> powerful. It uses pstore/blk, and aims to store panic and oops logs to
> a flash partition, where pstore can later read back and present as files
> in the mounted pstore filesystem.
> 
> To make mtdpstore work, the "blkdev" of pstore/blk should be set
> as MTD device name or MTD device number. For more details, see
> Documentation/admin-guide/pstore-blk.rst
> 
> This solves a number of issues:
> - Work duplication: both of pstore and mtdoops do the same job storing
>   panic/oops log. They have very similar logic, registering to kmsg
>   dumper and storing logs to several chunks one by one.
> - Layer violations: drivers should provides methods instead of polices.
>   MTD should provide read/write/erase operations, and allow a higher
>   level drivers to provide the chunk management, kmsg dump
>   configuration, etc.
> - Missing features: pstore provides many additional features, including
>   presenting the logs as files, logging dump time and count, and
>   supporting other frontends like pmsg, console, etc.
> 
> Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
> Link: https://lore.kernel.org/r/1585126506-18635-12-git-send-email-liaoweixiong@allwinnertech.com
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  Documentation/admin-guide/pstore-blk.rst |   9 +-
>  drivers/mtd/Kconfig                      |  10 +
>  drivers/mtd/Makefile                     |   1 +
>  drivers/mtd/mtdpstore.c                  | 564 +++++++++++++++++++++++
>  4 files changed, 582 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/mtd/mtdpstore.c
> 
> diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
> index d45341e55e82..296d5027787a 100644
> --- a/Documentation/admin-guide/pstore-blk.rst
> +++ b/Documentation/admin-guide/pstore-blk.rst
> @@ -43,9 +43,9 @@ blkdev
>  ~~~~~~
>  
>  The block device to use. Most of the time, it is a partition of block device.
> -It's required for pstore/blk.
> +It's required for pstore/blk. It is also used for MTD device.
>  
> -It accepts the following variants:
> +It accepts the following variants for block device:
>  
>  1. <hex_major><hex_minor> device number in hexadecimal represents itself; no
>     leading 0x, for example b302.
> @@ -64,6 +64,11 @@ It accepts the following variants:
>     partition with a known unique id.
>  #. <major>:<minor> major and minor number of the device separated by a colon.
>  
> +It accepts the following variants for MTD device:
> +
> +1. <device name> MTD device name. "pstore" is recommended.
> +#. <device number> MTD device number.
> +
>  kmsg_size
>  ~~~~~~~~~
>  
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 42d401ea60ee..6ddab796216d 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -170,6 +170,16 @@ config MTD_OOPS
>  	  buffer in a flash partition where it can be read back at some
>  	  later point.
>  
> +config MTD_PSTORE
> +	tristate "Log panic/oops to an MTD buffer based on pstore"
> +	depends on PSTORE_BLK
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
> index 000000000000..ce6da4d04864
> --- /dev/null
> +++ b/drivers/mtd/mtdpstore.c
> @@ -0,0 +1,564 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#define dev_fmt(fmt) "mtdoops-pstore: " fmt
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pstore_blk.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/bitops.h>
> +
> +static struct mtdpstore_context {
> +	int index;
> +	struct pstore_blk_config info;
> +	struct pstore_device_info dev;
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
> +	u64 zonenum = div_u64(off, cxt->info.kmsg_size);
> +
> +	dev_dbg(&mtd->dev, "mark zone %llu used\n", zonenum);
> +	set_bit(zonenum, cxt->usedmap);
> +}
> +
> +static inline void mtdpstore_mark_unused(struct mtdpstore_context *cxt,
> +		loff_t off)
> +{
> +	struct mtd_info *mtd = cxt->mtd;
> +	u64 zonenum = div_u64(off, cxt->info.kmsg_size);
> +
> +	dev_dbg(&mtd->dev, "mark zone %llu unused\n", zonenum);
> +	clear_bit(zonenum, cxt->usedmap);
> +}
> +
> +static inline void mtdpstore_block_mark_unused(struct mtdpstore_context *cxt,
> +		loff_t off)
> +{
> +	struct mtd_info *mtd = cxt->mtd;
> +	u64 zonenum = div_u64(off, cxt->info.kmsg_size);
> +	u32 zonecnt = cxt->mtd->erasesize / cxt->info.kmsg_size;
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
> +	u64 zonenum = div_u64(off, cxt->info.kmsg_size);
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
> +	u64 zonenum = div_u64(off, cxt->info.kmsg_size);
> +	u32 zonecnt = cxt->mtd->erasesize / cxt->info.kmsg_size;
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
> +	u64 zonenum = div_u64(off, cxt->info.kmsg_size);
> +
> +	dev_dbg(&mtd->dev, "mark zone %llu removed\n", zonenum);
> +	set_bit(zonenum, cxt->rmmap);
> +}
> +
> +static void mtdpstore_block_clear_removed(struct mtdpstore_context *cxt,
> +		loff_t off)
> +{
> +	u64 zonenum = div_u64(off, cxt->info.kmsg_size);
> +	u32 zonecnt = cxt->mtd->erasesize / cxt->info.kmsg_size;
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
> +	u64 zonenum = div_u64(off, cxt->info.kmsg_size);
> +	u32 zonecnt = cxt->mtd->erasesize / cxt->info.kmsg_size;
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
> +		       (unsigned long long)erase.len, cxt->info.device);
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
> + * If zone is used, write operation will return -ENOMSG, which means that
> + * pstore/blk will try one by one until gets an empty zone. So, it is not
> + * needed to ensure the next zone is empty, but at least one.
> + */
> +static int mtdpstore_security(struct mtdpstore_context *cxt, loff_t off)
> +{
> +	int ret = 0, i;
> +	struct mtd_info *mtd = cxt->mtd;
> +	u32 zonenum = (u32)div_u64(off, cxt->info.kmsg_size);
> +	u32 zonecnt = (u32)div_u64(cxt->mtd->size, cxt->info.kmsg_size);
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
> +		return -ENOMSG;
> +
> +	/* zone is used, please try next one */
> +	if (mtdpstore_is_used(cxt, off))
> +		return -ENOMSG;
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
> +		return -ENOMSG;
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
> +			return -ENOMSG;
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
> +		return -ENOMSG;
> +
> +	/* zone is used, please try next one */
> +	if (mtdpstore_is_used(cxt, off))
> +		return -ENOMSG;
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
> +	struct pstore_blk_config *info = &cxt->info;
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
> +	if (mtd->size < info->kmsg_size * 2) {
> +		dev_err(&mtd->dev, "MTD partition %d not big enough\n",
> +				mtd->index);
> +		return;
> +	}
> +	/*
> +	 * kmsg_size must be aligned to 4096 Bytes, which is limited by
> +	 * psblk. The default value of kmsg_size is 64KB. If kmsg_size
> +	 * is larger than erasesize, some errors will occur since mtdpsotre
> +	 * is designed on it.
> +	 */
> +	if (mtd->erasesize < info->kmsg_size) {
> +		dev_err(&mtd->dev, "eraseblock size of MTD partition %d too small\n",
> +				mtd->index);
> +		return;
> +	}
> +	if (unlikely(info->kmsg_size % mtd->writesize)) {
> +		dev_err(&mtd->dev, "record size %lu KB must align to write size %d KB\n",
> +				info->kmsg_size / 1024,
> +				mtd->writesize / 1024);
> +		return;
> +	}
> +
> +	longcnt = BITS_TO_LONGS(div_u64(mtd->size, info->kmsg_size));
> +	cxt->rmmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
> +	cxt->usedmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
> +
> +	longcnt = BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
> +	cxt->badmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
> +
> +	cxt->dev.total_size = mtd->size;
> +	/* just support dmesg right now */
> +	cxt->dev.flags = PSTORE_FLAGS_DMESG;
> +	cxt->dev.read = mtdpstore_read;
> +	cxt->dev.write = mtdpstore_write;
> +	cxt->dev.erase = mtdpstore_erase;
> +	cxt->dev.panic_write = mtdpstore_panic_write;
> +
> +	ret = register_pstore_device(&cxt->dev);
> +	if (ret) {
> +		dev_err(&mtd->dev, "mtd%d register to psblk failed\n",
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
> +		unsigned int zonesize = cxt->info.kmsg_size;
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
> +	unregister_pstore_device(&cxt->dev);
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
> +	struct pstore_blk_config *info = &cxt->info;
> +
> +	ret = pstore_blk_get_config(info);
> +	if (unlikely(ret))
> +		return ret;
> +
> +	if (strlen(info->device) == 0) {
> +		dev_err(&mtd->dev, "mtd device must be supplied\n");

mtd is NULL here, "mtd->dev" leads to error.

> +		return -EINVAL;
> +	}
> +	if (!info->kmsg_size) {
> +		dev_err(&mtd->dev, "no backend enabled\n");

Also here.

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
> +MODULE_DESCRIPTION("MTD backend for pstore/blk");
> 

-- 
WeiXiong Liao

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
