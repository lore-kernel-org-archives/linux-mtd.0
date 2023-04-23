Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1D8C77B73
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Apr 2023 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBUoNSusNC3hObCHP/UiODhvSfm8QzXlUjCT3UgBkwI=; b=duXoVBWkpnhIFEN5qLzqQthchy
	S/BM9o+6t5Egn4lzXIRyna2GW43Uw5DQu9eLLwZ2jNNdQIi2kJ0lDFi2YTUEjDs8axGgh3w9i0SiG
	jo05fXzKGZHu0EV7XUgVeXCjMA1ljx6FzA/8nOFPBCLI0m4NOKpBKnLWSgsknNx2969GcfqzaZYCe
	mjy8b8YL/pKVL4LX+UJPpqlWfd33+clv0EZvfi8kgytAY6d2OFpPbILRsEF35hbMpI7u3WAbuMHzN
	C68SKinkQ5327OEG4Ar2+daXJsIPdr8+QT4wXOS52GfWGfCrOAJv3QJJfIt1PiFOKTqrO1orVbHzj
	TPGiAVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqVC8-00Duul-39;
	Sun, 23 Apr 2023 08:35:40 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqVC4-00Dutd-0j
	for linux-mtd@lists.infradead.org;
	Sun, 23 Apr 2023 08:35:38 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Q41kq126BzsRJ7;
	Sun, 23 Apr 2023 16:33:55 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 16:35:29 +0800
Subject: Re: [PATCH] mtd: ubi: attach MTD partition from device-tree
To: Daniel Golle <daniel@makrotopia.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <ZEA8hX9UjX9S0NUm@makrotopia.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9c622f92-382d-8b0d-a438-c7eea0e89b80@huawei.com>
Date: Sun, 23 Apr 2023 16:35:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ZEA8hX9UjX9S0NUm@makrotopia.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_013536_595454_9B341F91 
X-CRM114-Status: GOOD (  38.51  )
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

Hi Daniel,
> Split ubi_init() function into early function to be called by
> device_initcall() and keep cmdline attachment in late_initcall().
> (when building ubi as module, both is still done in a single
> module_init() call)
> 
> Register MTD notifier and attach MTD devices which are marked as
> compatible with 'linux,ubi' in OF device-tree when being added, detach
> UBI device from MTD device when it is being removed.
> 
> Keep behavior regarding ubiblock creation and attaching of UBI device
> from kernel or module cmdline unchanged.
> 
> For existing users this should not change anything besides automatic
> removal of (dead) UBI devices when their underlying MTD devices are
> already gone, e.g. in case of MTD driver module or (SPI) bus driver
> module being removed.
> 
> For new users this opens up the option to attach UBI using device-tree
> which then happens early and in parallel with other drivers being
> probed which slightly reduces the total boot time.
> 
> Attachment no longer happening late is also a requirement for other
> drivers to make use of UBI, e.g. drivers/nvmem/u-boot-env.c can now
> be extended to support U-Boot environment stored in UBI volumes.
> 

Let me try to understand this patch, the main purpose is to add a new 
way to load ubi according to device tree, am I right?

> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   drivers/mtd/ubi/block.c |  20 ++---
>   drivers/mtd/ubi/build.c | 163 +++++++++++++++++++++++++++++-----------
>   drivers/mtd/ubi/cdev.c  |   2 +-
>   drivers/mtd/ubi/ubi.h   |   4 +-
>   4 files changed, 132 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index 3711d7f746003..b24b8b8f54b77 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -65,10 +65,10 @@ struct ubiblock_pdu {
>   };
>   
>   /* Numbers of elements set in the @ubiblock_param array */
> -static int ubiblock_devs __initdata;
> +static int ubiblock_devs;
>   
>   /* MTD devices specification parameters */
> -static struct ubiblock_param ubiblock_param[UBIBLOCK_MAX_DEVICES] __initdata;
> +static struct ubiblock_param ubiblock_param[UBIBLOCK_MAX_DEVICES];
>   
>   struct ubiblock {
>   	struct ubi_volume_desc *desc;
> @@ -582,7 +582,7 @@ open_volume_desc(const char *name, int ubi_num, int vol_id)
>   		return ubi_open_volume(ubi_num, vol_id, UBI_READONLY);
>   }
>   
> -static void __init ubiblock_create_from_param(void)
> +void ubiblock_create_from_param(void)
>   {
>   	int i, ret = 0;
>   	struct ubiblock_param *p;
> @@ -611,9 +611,10 @@ static void __init ubiblock_create_from_param(void)
>   
>   		ret = ubiblock_create(&vi);
>   		if (ret) {
> -			pr_err(
> -			       "UBI: block: can't add '%s' volume on ubi%d_%d, err=%d\n",
> -			       vi.name, p->ubi_num, p->vol_id, ret);
> +			if (ret != -EEXIST && ret != -ENOENT)

The EEXIST and ENOENT types of error messages are filtered, why? After 
this patch applied, the user won't be aware of which ubi volume failed 
to create ubiblock.

> +				pr_err(
> +				       "UBI: block: can't add '%s' volume on ubi%d_%d, err=%d\n",
> +				       vi.name, p->ubi_num, p->vol_id, ret);
>   			continue;
>   		}
>   	}
> @@ -644,13 +645,6 @@ int __init ubiblock_init(void)
>   	if (ubiblock_major < 0)
>   		return ubiblock_major;
>   
> -	/*
> -	 * Attach block devices from 'block=' module param.
> -	 * Even if one block device in the param list fails to come up,
> -	 * still allow the module to load and leave any others up.
> -	 */
> -	ubiblock_create_from_param();
> -
>   	/*
>   	 * Block devices are only created upon user requests, so we ignore
>   	 * existing volumes.
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 9cd565daad368..a764f97eee791 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -27,6 +27,7 @@
>   #include <linux/log2.h>
>   #include <linux/kthread.h>
>   #include <linux/kernel.h>
> +#include <linux/of.h>
>   #include <linux/slab.h>
>   #include <linux/major.h>
>   #include "ubi.h"
> @@ -1065,6 +1066,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
>    * ubi_detach_mtd_dev - detach an MTD device.
>    * @ubi_num: UBI device number to detach from
>    * @anyway: detach MTD even if device reference count is not zero
> + * @have_lock: called by MTD notifier holding mtd_table_mutex
>    *
>    * This function destroys an UBI device number @ubi_num and detaches the
>    * underlying MTD device. Returns zero in case of success and %-EBUSY if the
> @@ -1074,7 +1076,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
>    * Note, the invocations of this function has to be serialized by the
>    * @ubi_devices_mutex.
>    */
> -int ubi_detach_mtd_dev(int ubi_num, int anyway)
> +int ubi_detach_mtd_dev(int ubi_num, int anyway, bool have_lock)
>   {
>   	struct ubi_device *ubi;
>   
> @@ -1108,7 +1110,7 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
>   	 * EC updates that have been made since the last written fastmap.
>   	 * In case of fastmap debugging we omit the update to simulate an
>   	 * unclean shutdown. */
> -	if (!ubi_dbg_chk_fastmap(ubi))
> +	if (!have_lock && !ubi_dbg_chk_fastmap(ubi))
>   		ubi_update_fastmap(ubi);

Why do you skip updating fastmap if ubi is detached in mtd notification way?

[...]> +static void ubi_notify_remove(struct mtd_info *mtd)
> +{
> +	int i;
>   
> -	ubi_wl_entry_slab = kmem_cache_create("ubi_wl_entry_slab",
> -					      sizeof(struct ubi_wl_entry),
> -					      0, 0, NULL);
> -	if (!ubi_wl_entry_slab) {
> -		err = -ENOMEM;
> -		goto out_dev_unreg;
> -	}
> +	/* called while holding mtd_table_mutex */
> +	mutex_lock_nested(&ubi_devices_mutex, SINGLE_DEPTH_NESTING);
> +	for (i = 0; i < UBI_MAX_DEVICES; i++)
> +		if (ubi_devices[i] &&
> +		    ubi_devices[i]->mtd->index == mtd->index)
> +			ubi_detach_mtd_dev(ubi_devices[i]->ubi_num, 1, true);

Add a 'break'?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
