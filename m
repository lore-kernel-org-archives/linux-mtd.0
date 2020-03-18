Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80063C10DCE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 18:19:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FE2520409
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 18:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BVhAKF4O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cmTApGZz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FE2520409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6tRvCUtzFG7e2BP5lXBKUeqJhxGErDOK+TY+z1nseg=; b=BVhAKF4OPQJnBe
	fxgxDLFqz7w1G6cxSZ2Q9WLongrQBqQt/3vUI26QsBp1ECytFweiumVgX5rccp75LwtmrGCCs+TkH
	3U0ZUaifZyPyM0Z9aGVAx6134c4d1lXt9YoXIeQmfJMOcEHzXID4TIt8Dv9YnFzigeRGe+qv7XF+k
	BrmB8sJ9zWQd40qulM0OTOliadOATeL25Rrd96j869fwsHYBfyf6exwjANB+rt2ktvKh+/QEhc+EO
	cnMbHJUo/x/s1PkKWd7YsjFgLVq8A2dEhqGJrI47+lX4v2CLapN02jt5WQ71S6As0gdLX1qk42Dwj
	qCThIRCFmhcYmb30BqQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEdHo-00054z-8x; Wed, 18 Mar 2020 18:19:24 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEdHk-00054Q-Iv
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 18:19:22 +0000
Received: by mail-pj1-x1044.google.com with SMTP id bo3so1547724pjb.5
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2020 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CTr2t0c2xa7jdH96iaMDViqNbjQLWV33fu7YxVMDuJw=;
 b=cmTApGZzQ1hj04rjJHaidyHnnN9o4KQxb1899XKFbPf/0Z3/QkBacVuE0XBx/U9TEL
 KWRfgK62vbE9eX5dnLEnAT7wLWe3f0jXdOt4SUZ1HXte1RSluiwiFZ2UMAnkWEuacLFC
 hsiGxQWEo1+Wc1wFgWlkX4vRoXEm3KWKewOJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CTr2t0c2xa7jdH96iaMDViqNbjQLWV33fu7YxVMDuJw=;
 b=sHFQiSUlVFujk5zu/tvwsjwJvzCo2B/PXAHJkX4XxD3G5IJPZd+6QXCM8/JdWAdX5n
 j70NDQMm7A0OU+nAsAIE9QaXfQVJa4jbJDaNJ/OvDN8lB9GO5y6P+auPt2cXwPkbdmb0
 ByE7DGQs0AzTI5BXTJyNxu/ajo6gzLbnWy+h05PYWBhaACjCIWZDiDAmGecSldJbKFdH
 IXti6bZUGRElxcDpqAQymyEDfNAwPv9ifCx5CeCUPeCOvLDB1QSLIjFvDJg5e9Q6Hu81
 9/e18u5UxxYAd4rqiSoi7FV4gYKJ0Hn4M9F1wg0MJV3gPoJ+R4caGuCeohxCwyzImgF4
 CR1A==
X-Gm-Message-State: ANhLgQ1gGmekcGPrvT+kA46Piw+TvzRc++njhqdhCOvlzCdXYzZe+ACx
 MRDbba0FzKTUfCjmyJtPEjfE8w==
X-Google-Smtp-Source: ADFU+vtC4l8TwFrl7VoIbtaimEbJ1GrcLt70uEBuvEhZACWiGQHejlkfIupUeNx83OYmaV7WFh6usQ==
X-Received: by 2002:a17:90a:a511:: with SMTP id
 a17mr5835102pjq.178.1584555559742; 
 Wed, 18 Mar 2020 11:19:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d5sm6946372pga.36.2020.03.18.11.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 11:19:18 -0700 (PDT)
Date: Wed, 18 Mar 2020 11:19:17 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v2 05/11] pstore/blk: blkoops: support ftrace recorder
Message-ID: <202003181117.6EA5486@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-6-git-send-email-liaoweixiong@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1581078355-19647-6-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_111920_651204_98CC67BF 
X-CRM114-Status: GOOD (  26.78  )
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

On Fri, Feb 07, 2020 at 08:25:49PM +0800, WeiXiong Liao wrote:
> Support recorder for ftrace. To enable ftrace recorder, just make
> ftrace_size be greater than 0 and a multiple of 4096.
> 
> Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
> ---
>  fs/pstore/Kconfig          | 12 ++++++++
>  fs/pstore/blkoops.c        | 11 +++++++
>  fs/pstore/blkzone.c        | 75 ++++++++++++++++++++++++++++++++++++++++++++--
>  include/linux/pstore_blk.h |  4 +++
>  4 files changed, 99 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
> index 5f0a42823028..308a0a4c5ee5 100644
> --- a/fs/pstore/Kconfig
> +++ b/fs/pstore/Kconfig
> @@ -210,6 +210,18 @@ config PSTORE_BLKOOPS_CONSOLE_SIZE
>  	  NOTE that, both kconfig and module parameters can configure blkoops,
>  	  but module parameters have priority over kconfig.
>  
> +config PSTORE_BLKOOPS_FTRACE_SIZE
> +	int "ftrace size in kbytes for blkoops"
> +	depends on PSTORE_BLKOOPS
> +	depends on PSTORE_FTRACE
> +	default 64

Same tricks. :)

> +	help
> +	  This just sets size of ftrace (ftrace_size) for pstore/blk. The
> +	  size is in KB and must be a multiple of 4.
> +
> +	  NOTE that, both kconfig and module parameters can configure blkoops,
> +	  but module parameters have priority over kconfig.
> +
>  config PSTORE_BLKOOPS_BLKDEV
>  	string "block device for blkoops"
>  	depends on PSTORE_BLKOOPS
> diff --git a/fs/pstore/blkoops.c b/fs/pstore/blkoops.c
> index 05990bc3b168..c76bab671b0b 100644
> --- a/fs/pstore/blkoops.c
> +++ b/fs/pstore/blkoops.c
> @@ -24,6 +24,10 @@
>  module_param(console_size, long, 0400);
>  MODULE_PARM_DESC(console_size, "console size in kbytes");
>  
> +static long ftrace_size = -1;
> +module_param(ftrace_size, long, 0400);
> +MODULE_PARM_DESC(ftrace_size, "ftrace size in kbytes");
> +
>  static int dump_oops = -1;
>  module_param(dump_oops, int, 0400);
>  MODULE_PARM_DESC(total_size, "whether dump oops");
> @@ -80,6 +84,12 @@
>  #define DEFAULT_CONSOLE_SIZE 0
>  #endif
>  
> +#ifdef CONFIG_PSTORE_BLKOOPS_FTRACE_SIZE
> +#define DEFAULT_FTRACE_SIZE CONFIG_PSTORE_BLKOOPS_FTRACE_SIZE
> +#else
> +#define DEFAULT_FTRACE_SIZE 0
> +#endif
> +
>  #ifdef CONFIG_PSTORE_BLKOOPS_DUMP_OOPS
>  #define DEFAULT_DUMP_OOPS CONFIG_PSTORE_BLKOOPS_DUMP_OOPS
>  #else
> @@ -135,6 +145,7 @@ int blkoops_register_device(struct blkoops_device *bo_dev)
>  	verify_size(dmesg_size, DEFAULT_DMESG_SIZE, 4096);
>  	verify_size(pmsg_size, DEFAULT_PMSG_SIZE, 4096);
>  	verify_size(console_size, DEFAULT_CONSOLE_SIZE, 4096);
> +	verify_size(ftrace_size, DEFAULT_FTRACE_SIZE, 4096);
>  #undef verify_size
>  	dump_oops = !!(dump_oops < 0 ? DEFAULT_DUMP_OOPS : dump_oops);
>  
> diff --git a/fs/pstore/blkzone.c b/fs/pstore/blkzone.c
> index 9a7e9b06ccf7..442e5a5bbfda 100644
> --- a/fs/pstore/blkzone.c
> +++ b/fs/pstore/blkzone.c
> @@ -89,10 +89,13 @@ struct blkz_context {
>  	struct blkz_zone **dbzs;	/* dmesg block zones */
>  	struct blkz_zone *pbz;		/* Pmsg block zone */
>  	struct blkz_zone *cbz;		/* console block zone */
> +	struct blkz_zone **fbzs;	/* Ftrace zones */
>  	unsigned int dmesg_max_cnt;
>  	unsigned int dmesg_read_cnt;
>  	unsigned int pmsg_read_cnt;
>  	unsigned int console_read_cnt;
> +	unsigned int ftrace_max_cnt;
> +	unsigned int ftrace_read_cnt;
>  	unsigned int dmesg_write_cnt;
>  	/*
>  	 * the counter should be recovered when recover.
> @@ -281,6 +284,7 @@ static void blkz_flush_all_dirty_zones(struct work_struct *work)
>  	blkz_flush_dirty_zone(cxt->pbz);
>  	blkz_flush_dirty_zone(cxt->cbz);
>  	blkz_flush_dirty_zones(cxt->dbzs, cxt->dmesg_max_cnt);
> +	blkz_flush_dirty_zones(cxt->fbzs, cxt->ftrace_max_cnt);
>  }
>  
>  static int blkz_recover_dmesg_data(struct blkz_context *cxt)
> @@ -497,6 +501,31 @@ static int blkz_recover_zone(struct blkz_context *cxt, struct blkz_zone *zone)
>  	return ret;
>  }
>  
> +static int blkz_recover_zones(struct blkz_context *cxt,
> +		struct blkz_zone **zones, unsigned int cnt)
> +{
> +	int ret;
> +	unsigned int i;
> +	struct blkz_zone *zone;
> +
> +	if (!zones)
> +		return 0;
> +
> +	for (i = 0; i < cnt; i++) {
> +		zone = zones[i];
> +		if (unlikely(!zone))
> +			continue;
> +		ret = blkz_recover_zone(cxt, zone);
> +		if (ret)
> +			goto recover_fail;
> +	}
> +
> +	return 0;
> +recover_fail:
> +	pr_debug("recover %s[%u] failed\n", zone->name, i);
> +	return ret;
> +}

Why is this introduced here? Shouldn't this be earlier in the series?

> +
>  static inline int blkz_recovery(struct blkz_context *cxt)
>  {
>  	int ret = -EBUSY;
> @@ -516,6 +545,10 @@ static inline int blkz_recovery(struct blkz_context *cxt)
>  	if (ret)
>  		goto recover_fail;
>  
> +	ret = blkz_recover_zones(cxt, cxt->fbzs, cxt->ftrace_max_cnt);
> +	if (ret)
> +		goto recover_fail;
> +
>  	pr_debug("recover end!\n");
>  	atomic_set(&cxt->recovered, 1);
>  	return 0;
> @@ -532,6 +565,7 @@ static int blkz_pstore_open(struct pstore_info *psi)
>  	cxt->dmesg_read_cnt = 0;
>  	cxt->pmsg_read_cnt = 0;
>  	cxt->console_read_cnt = 0;
> +	cxt->ftrace_read_cnt = 0;
>  	return 0;
>  }
>  
> @@ -589,6 +623,8 @@ static int blkz_pstore_erase(struct pstore_record *record)
>  		return blkz_record_erase(cxt, cxt->pbz);
>  	case PSTORE_TYPE_CONSOLE:
>  		return blkz_record_erase(cxt, cxt->cbz);
> +	case PSTORE_TYPE_FTRACE:
> +		return blkz_record_erase(cxt, cxt->fbzs[record->id]);
>  	default: return -EINVAL;
>  	}
>  }
> @@ -743,6 +779,13 @@ static int notrace blkz_pstore_write(struct pstore_record *record)
>  		return blkz_record_write(cxt, cxt->cbz, record);
>  	case PSTORE_TYPE_PMSG:
>  		return blkz_record_write(cxt, cxt->pbz, record);
> +	case PSTORE_TYPE_FTRACE: {
> +		int zonenum = smp_processor_id();
> +
> +		if (!cxt->fbzs)
> +			return -ENOSPC;
> +		return blkz_record_write(cxt, cxt->fbzs[zonenum], record);
> +	}
>  	default:
>  		return -EINVAL;
>  	}
> @@ -759,6 +802,12 @@ static struct blkz_zone *blkz_read_next_zone(struct blkz_context *cxt)
>  			return zone;
>  	}
>  
> +	while (cxt->ftrace_read_cnt < cxt->ftrace_max_cnt) {
> +		zone = cxt->fbzs[cxt->ftrace_read_cnt++];
> +		if (blkz_old_ok(zone))
> +			return zone;
> +	}
> +
>  	if (cxt->pmsg_read_cnt == 0) {
>  		cxt->pmsg_read_cnt++;
>  		zone = cxt->pbz;
> @@ -881,6 +930,9 @@ static ssize_t blkz_pstore_read(struct pstore_record *record)
>  		readop = blkz_dmesg_read;
>  		record->id = cxt->dmesg_read_cnt - 1;
>  		break;
> +	case PSTORE_TYPE_FTRACE:
> +		record->id = cxt->ftrace_read_cnt - 1;
> +		/* fallthrough */

Please mark with "fallthrough;".
https://www.kernel.org/doc/html/latest/process/deprecated.html#implicit-switch-case-fall-through

>  	case PSTORE_TYPE_CONSOLE:
>  		/* fallthrough */
>  	case PSTORE_TYPE_PMSG:
> @@ -1046,15 +1098,27 @@ static int blkz_cut_zones(struct blkz_context *cxt)
>  		goto free_pmsg;
>  	}
>  
> +	off_size += info->ftrace_size;
> +	cxt->fbzs = blkz_init_zones(PSTORE_TYPE_FTRACE, &off,
> +			info->ftrace_size,
> +			info->ftrace_size / nr_cpu_ids,
> +			&cxt->ftrace_max_cnt);
> +	if (IS_ERR(cxt->fbzs)) {
> +		err = PTR_ERR(cxt->fbzs);
> +		goto free_console;
> +	}
> +
>  	cxt->dbzs = blkz_init_zones(PSTORE_TYPE_DMESG, &off,
>  			info->total_size - off_size,
>  			info->dmesg_size, &cxt->dmesg_max_cnt);
>  	if (IS_ERR(cxt->dbzs)) {
>  		err = PTR_ERR(cxt->dbzs);
> -		goto free_console;
> +		goto free_ftrace;
>  	}
>  
>  	return 0;
> +free_ftrace:
> +	blkz_free_zones(&cxt->fbzs, &cxt->ftrace_max_cnt);
>  free_console:
>  	blkz_free_zone(&cxt->cbz);
>  free_pmsg:
> @@ -1103,6 +1167,7 @@ int blkz_register(struct blkz_info *info)
>  	check_size(dmesg_size, SECTOR_SIZE);
>  	check_size(pmsg_size, SECTOR_SIZE);
>  	check_size(console_size, SECTOR_SIZE);
> +	check_size(ftrace_size, SECTOR_SIZE);
>  
>  #undef check_size
>  
> @@ -1136,6 +1201,7 @@ int blkz_register(struct blkz_info *info)
>  	pr_debug("\tdmesg size : %ld Bytes\n", info->dmesg_size);
>  	pr_debug("\tpmsg size : %ld Bytes\n", info->pmsg_size);
>  	pr_debug("\tconsole size : %ld Bytes\n", info->console_size);
> +	pr_debug("\tftrace size : %ld Bytes\n", info->ftrace_size);
>  
>  	err = blkz_cut_zones(cxt);
>  	if (err) {
> @@ -1159,13 +1225,16 @@ int blkz_register(struct blkz_info *info)
>  		cxt->pstore.flags |= PSTORE_FLAGS_PMSG;
>  	if (info->console_size)
>  		cxt->pstore.flags |= PSTORE_FLAGS_CONSOLE;
> +	if (info->ftrace_size)
> +		cxt->pstore.flags |= PSTORE_FLAGS_FTRACE;
>  
> -	pr_info("Registered %s as blkzone backend for %s%s%s%s\n",
> +	pr_info("Registered %s as blkzone backend for %s%s%s%s%s\n",
>  			info->name,
>  			cxt->dbzs && cxt->bzinfo->dump_oops ? "Oops " : "",
>  			cxt->dbzs && cxt->bzinfo->panic_write ? "Panic " : "",
>  			cxt->pbz ? "Pmsg " : "",
> -			cxt->cbz ? "Console" : "");
> +			cxt->cbz ? "Console " : "",
> +			cxt->fbzs ? "Ftrace" : "");
>  
>  	err = pstore_register(&cxt->pstore);
>  	if (err) {
> diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
> index 546375e04419..77704c1b404a 100644
> --- a/include/linux/pstore_blk.h
> +++ b/include/linux/pstore_blk.h
> @@ -25,6 +25,9 @@
>   * @console_size:
>   *	The size of zone for console. Zero means disabled, othewise, it must
>   *	be multiple of SECTOR_SIZE(512).
> + * @ftrace_size:
> + *	The size of zone for ftrace. Zero means disabled, othewise, it must
> + *	be multiple of SECTOR_SIZE(512).
>   * @dump_oops:
>   *	Dump oops and panic log or only panic.
>   * @read, @write:
> @@ -60,6 +63,7 @@ struct blkz_info {
>  	unsigned long dmesg_size;
>  	unsigned long pmsg_size;
>  	unsigned long console_size;
> +	unsigned long ftrace_size;
>  	int dump_oops;
>  	blkz_read_op read;
>  	blkz_write_op write;
> -- 
> 1.9.1
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
