Return-Path: <SRS0=yNtI=5H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A8EC4332E
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 11:42:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 000CD20719
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 11:42:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RGrI6s6H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 000CD20719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Iznvo3cUfTxiKiZAO0BQzqJ7YrMaBBe2178ecxy86g=; b=RGrI6s6HafwlGM
	7wb4NMGyMV/SuOABrX+s2GyX4dMWI6HZLgR6yAMxrWi+x+6IRX53BQW9HqWbIpCco8w+lT+Ca+5id
	tePZy9CQj3Ohy6fY81yq7tMKfMJlcyMrZq0iIgdY+Ek10o5+WEb4DpSXXtv/FBG2MdEB2fY00wD2N
	AsE3z+BSj/jE6VVos7ikSNu2iImWxMRiTpy6B866rl3xMRKhU2/QkS3kO0HKQEpL7bYypa4t2Jk+B
	rKUAiINP6wu1CtmfxI7+1ipwsw/RBThuIpjJ2zXr30TJ9lnVx/S5qTeUr9RxsaKKHKsDfxbXsXwG/
	D4fgOYzsn8SToljkMikw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyzX-0004wg-9K; Sun, 22 Mar 2020 11:42:07 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFyzT-0004wM-NK
 for linux-mtd@lists.infradead.org; Sun, 22 Mar 2020 11:42:05 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.0966192-0.00042761-0.902953;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03297; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=16; RT=16; SR=0; TI=SMTPD_---.H3QKLuS_1584877317; 
Received: from 172.16.10.102(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.H3QKLuS_1584877317)
 by smtp.aliyun-inc.com(10.147.43.230);
 Sun, 22 Mar 2020 19:41:58 +0800
Subject: Re: [PATCH v2 05/11] pstore/blk: blkoops: support ftrace recorder
To: Kees Cook <keescook@chromium.org>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-6-git-send-email-liaoweixiong@allwinnertech.com>
 <202003181117.6EA5486@keescook>
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Message-ID: <42205dc0-f001-bbf0-00b6-85aca0cdb1f8@allwinnertech.com>
Date: Sun, 22 Mar 2020 19:42:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <202003181117.6EA5486@keescook>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_044203_937787_80DB0D8D 
X-CRM114-Status: GOOD (  22.36  )
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

hi Kees Cook,

On 2020/3/19 AM 2:19, Kees Cook wrote:
> On Fri, Feb 07, 2020 at 08:25:49PM +0800, WeiXiong Liao wrote:
>> Support recorder for ftrace. To enable ftrace recorder, just make
>> ftrace_size be greater than 0 and a multiple of 4096.
>>
>> Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
>> ---
>>  fs/pstore/Kconfig          | 12 ++++++++
>>  fs/pstore/blkoops.c        | 11 +++++++
>>  fs/pstore/blkzone.c        | 75 ++++++++++++++++++++++++++++++++++++++++++++--
>>  include/linux/pstore_blk.h |  4 +++
>>  4 files changed, 99 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
>> index 5f0a42823028..308a0a4c5ee5 100644
>> --- a/fs/pstore/Kconfig
>> +++ b/fs/pstore/Kconfig
>> @@ -210,6 +210,18 @@ config PSTORE_BLKOOPS_CONSOLE_SIZE
>>  	  NOTE that, both kconfig and module parameters can configure blkoops,
>>  	  but module parameters have priority over kconfig.
>>  
>> +config PSTORE_BLKOOPS_FTRACE_SIZE
>> +	int "ftrace size in kbytes for blkoops"
>> +	depends on PSTORE_BLKOOPS
>> +	depends on PSTORE_FTRACE
>> +	default 64
> 
> Same tricks. :)
> 

Sure. We can discuss on patch 2 and I will fix it to all over the series
patches.

>> +	help
>> +	  This just sets size of ftrace (ftrace_size) for pstore/blk. The
>> +	  size is in KB and must be a multiple of 4.
>> +
>> +	  NOTE that, both kconfig and module parameters can configure blkoops,
>> +	  but module parameters have priority over kconfig.
>> +
>>  config PSTORE_BLKOOPS_BLKDEV
>>  	string "block device for blkoops"
>>  	depends on PSTORE_BLKOOPS
>> diff --git a/fs/pstore/blkoops.c b/fs/pstore/blkoops.c
>> index 05990bc3b168..c76bab671b0b 100644
>> --- a/fs/pstore/blkoops.c
>> +++ b/fs/pstore/blkoops.c
>> @@ -24,6 +24,10 @@
>>  module_param(console_size, long, 0400);
>>  MODULE_PARM_DESC(console_size, "console size in kbytes");
>>  
>> +static long ftrace_size = -1;
>> +module_param(ftrace_size, long, 0400);
>> +MODULE_PARM_DESC(ftrace_size, "ftrace size in kbytes");
>> +
>>  static int dump_oops = -1;
>>  module_param(dump_oops, int, 0400);
>>  MODULE_PARM_DESC(total_size, "whether dump oops");
>> @@ -80,6 +84,12 @@
>>  #define DEFAULT_CONSOLE_SIZE 0
>>  #endif
>>  
>> +#ifdef CONFIG_PSTORE_BLKOOPS_FTRACE_SIZE
>> +#define DEFAULT_FTRACE_SIZE CONFIG_PSTORE_BLKOOPS_FTRACE_SIZE
>> +#else
>> +#define DEFAULT_FTRACE_SIZE 0
>> +#endif
>> +
>>  #ifdef CONFIG_PSTORE_BLKOOPS_DUMP_OOPS
>>  #define DEFAULT_DUMP_OOPS CONFIG_PSTORE_BLKOOPS_DUMP_OOPS
>>  #else
>> @@ -135,6 +145,7 @@ int blkoops_register_device(struct blkoops_device *bo_dev)
>>  	verify_size(dmesg_size, DEFAULT_DMESG_SIZE, 4096);
>>  	verify_size(pmsg_size, DEFAULT_PMSG_SIZE, 4096);
>>  	verify_size(console_size, DEFAULT_CONSOLE_SIZE, 4096);
>> +	verify_size(ftrace_size, DEFAULT_FTRACE_SIZE, 4096);
>>  #undef verify_size
>>  	dump_oops = !!(dump_oops < 0 ? DEFAULT_DUMP_OOPS : dump_oops);
>>  
>> diff --git a/fs/pstore/blkzone.c b/fs/pstore/blkzone.c
>> index 9a7e9b06ccf7..442e5a5bbfda 100644
>> --- a/fs/pstore/blkzone.c
>> +++ b/fs/pstore/blkzone.c
>> @@ -89,10 +89,13 @@ struct blkz_context {
>>  	struct blkz_zone **dbzs;	/* dmesg block zones */
>>  	struct blkz_zone *pbz;		/* Pmsg block zone */
>>  	struct blkz_zone *cbz;		/* console block zone */
>> +	struct blkz_zone **fbzs;	/* Ftrace zones */
>>  	unsigned int dmesg_max_cnt;
>>  	unsigned int dmesg_read_cnt;
>>  	unsigned int pmsg_read_cnt;
>>  	unsigned int console_read_cnt;
>> +	unsigned int ftrace_max_cnt;
>> +	unsigned int ftrace_read_cnt;
>>  	unsigned int dmesg_write_cnt;
>>  	/*
>>  	 * the counter should be recovered when recover.
>> @@ -281,6 +284,7 @@ static void blkz_flush_all_dirty_zones(struct work_struct *work)
>>  	blkz_flush_dirty_zone(cxt->pbz);
>>  	blkz_flush_dirty_zone(cxt->cbz);
>>  	blkz_flush_dirty_zones(cxt->dbzs, cxt->dmesg_max_cnt);
>> +	blkz_flush_dirty_zones(cxt->fbzs, cxt->ftrace_max_cnt);
>>  }
>>  
>>  static int blkz_recover_dmesg_data(struct blkz_context *cxt)
>> @@ -497,6 +501,31 @@ static int blkz_recover_zone(struct blkz_context *cxt, struct blkz_zone *zone)
>>  	return ret;
>>  }
>>  
>> +static int blkz_recover_zones(struct blkz_context *cxt,
>> +		struct blkz_zone **zones, unsigned int cnt)
>> +{
>> +	int ret;
>> +	unsigned int i;
>> +	struct blkz_zone *zone;
>> +
>> +	if (!zones)
>> +		return 0;
>> +
>> +	for (i = 0; i < cnt; i++) {
>> +		zone = zones[i];
>> +		if (unlikely(!zone))
>> +			continue;
>> +		ret = blkz_recover_zone(cxt, zone);
>> +		if (ret)
>> +			goto recover_fail;
>> +	}
>> +
>> +	return 0;
>> +recover_fail:
>> +	pr_debug("recover %s[%u] failed\n", zone->name, i);
>> +	return ret;
>> +}
> 
> Why is this introduced here? Shouldn't this be earlier in the series?
> 

blkz_recover_zones() is used to recover a array of zones. Only ftrace
recorder
need it, so it's introduced here.

>> +
>>  static inline int blkz_recovery(struct blkz_context *cxt)
>>  {
>>  	int ret = -EBUSY;
>> @@ -516,6 +545,10 @@ static inline int blkz_recovery(struct blkz_context *cxt)
>>  	if (ret)
>>  		goto recover_fail;
>>  
>> +	ret = blkz_recover_zones(cxt, cxt->fbzs, cxt->ftrace_max_cnt);
>> +	if (ret)
>> +		goto recover_fail;
>> +
>>  	pr_debug("recover end!\n");
>>  	atomic_set(&cxt->recovered, 1);
>>  	return 0;
>> @@ -532,6 +565,7 @@ static int blkz_pstore_open(struct pstore_info *psi)
>>  	cxt->dmesg_read_cnt = 0;
>>  	cxt->pmsg_read_cnt = 0;
>>  	cxt->console_read_cnt = 0;
>> +	cxt->ftrace_read_cnt = 0;
>>  	return 0;
>>  }
>>  
>> @@ -589,6 +623,8 @@ static int blkz_pstore_erase(struct pstore_record *record)
>>  		return blkz_record_erase(cxt, cxt->pbz);
>>  	case PSTORE_TYPE_CONSOLE:
>>  		return blkz_record_erase(cxt, cxt->cbz);
>> +	case PSTORE_TYPE_FTRACE:
>> +		return blkz_record_erase(cxt, cxt->fbzs[record->id]);
>>  	default: return -EINVAL;
>>  	}
>>  }
>> @@ -743,6 +779,13 @@ static int notrace blkz_pstore_write(struct pstore_record *record)
>>  		return blkz_record_write(cxt, cxt->cbz, record);
>>  	case PSTORE_TYPE_PMSG:
>>  		return blkz_record_write(cxt, cxt->pbz, record);
>> +	case PSTORE_TYPE_FTRACE: {
>> +		int zonenum = smp_processor_id();
>> +
>> +		if (!cxt->fbzs)
>> +			return -ENOSPC;
>> +		return blkz_record_write(cxt, cxt->fbzs[zonenum], record);
>> +	}
>>  	default:
>>  		return -EINVAL;
>>  	}
>> @@ -759,6 +802,12 @@ static struct blkz_zone *blkz_read_next_zone(struct blkz_context *cxt)
>>  			return zone;
>>  	}
>>  
>> +	while (cxt->ftrace_read_cnt < cxt->ftrace_max_cnt) {
>> +		zone = cxt->fbzs[cxt->ftrace_read_cnt++];
>> +		if (blkz_old_ok(zone))
>> +			return zone;
>> +	}
>> +
>>  	if (cxt->pmsg_read_cnt == 0) {
>>  		cxt->pmsg_read_cnt++;
>>  		zone = cxt->pbz;
>> @@ -881,6 +930,9 @@ static ssize_t blkz_pstore_read(struct pstore_record *record)
>>  		readop = blkz_dmesg_read;
>>  		record->id = cxt->dmesg_read_cnt - 1;
>>  		break;
>> +	case PSTORE_TYPE_FTRACE:
>> +		record->id = cxt->ftrace_read_cnt - 1;
>> +		/* fallthrough */
> 
> Please mark with "fallthrough;".
> https://www.kernel.org/doc/html/latest/process/deprecated.html#implicit-switch-case-fall-through
> 

Fixed.

>>  	case PSTORE_TYPE_CONSOLE:
>>  		/* fallthrough */
>>  	case PSTORE_TYPE_PMSG:
>> @@ -1046,15 +1098,27 @@ static int blkz_cut_zones(struct blkz_context *cxt)
>>  		goto free_pmsg;
>>  	}
>>  
>> +	off_size += info->ftrace_size;
>> +	cxt->fbzs = blkz_init_zones(PSTORE_TYPE_FTRACE, &off,
>> +			info->ftrace_size,
>> +			info->ftrace_size / nr_cpu_ids,
>> +			&cxt->ftrace_max_cnt);
>> +	if (IS_ERR(cxt->fbzs)) {
>> +		err = PTR_ERR(cxt->fbzs);
>> +		goto free_console;
>> +	}
>> +
>>  	cxt->dbzs = blkz_init_zones(PSTORE_TYPE_DMESG, &off,
>>  			info->total_size - off_size,
>>  			info->dmesg_size, &cxt->dmesg_max_cnt);
>>  	if (IS_ERR(cxt->dbzs)) {
>>  		err = PTR_ERR(cxt->dbzs);
>> -		goto free_console;
>> +		goto free_ftrace;
>>  	}
>>  
>>  	return 0;
>> +free_ftrace:
>> +	blkz_free_zones(&cxt->fbzs, &cxt->ftrace_max_cnt);
>>  free_console:
>>  	blkz_free_zone(&cxt->cbz);
>>  free_pmsg:
>> @@ -1103,6 +1167,7 @@ int blkz_register(struct blkz_info *info)
>>  	check_size(dmesg_size, SECTOR_SIZE);
>>  	check_size(pmsg_size, SECTOR_SIZE);
>>  	check_size(console_size, SECTOR_SIZE);
>> +	check_size(ftrace_size, SECTOR_SIZE);
>>  
>>  #undef check_size
>>  
>> @@ -1136,6 +1201,7 @@ int blkz_register(struct blkz_info *info)
>>  	pr_debug("\tdmesg size : %ld Bytes\n", info->dmesg_size);
>>  	pr_debug("\tpmsg size : %ld Bytes\n", info->pmsg_size);
>>  	pr_debug("\tconsole size : %ld Bytes\n", info->console_size);
>> +	pr_debug("\tftrace size : %ld Bytes\n", info->ftrace_size);
>>  
>>  	err = blkz_cut_zones(cxt);
>>  	if (err) {
>> @@ -1159,13 +1225,16 @@ int blkz_register(struct blkz_info *info)
>>  		cxt->pstore.flags |= PSTORE_FLAGS_PMSG;
>>  	if (info->console_size)
>>  		cxt->pstore.flags |= PSTORE_FLAGS_CONSOLE;
>> +	if (info->ftrace_size)
>> +		cxt->pstore.flags |= PSTORE_FLAGS_FTRACE;
>>  
>> -	pr_info("Registered %s as blkzone backend for %s%s%s%s\n",
>> +	pr_info("Registered %s as blkzone backend for %s%s%s%s%s\n",
>>  			info->name,
>>  			cxt->dbzs && cxt->bzinfo->dump_oops ? "Oops " : "",
>>  			cxt->dbzs && cxt->bzinfo->panic_write ? "Panic " : "",
>>  			cxt->pbz ? "Pmsg " : "",
>> -			cxt->cbz ? "Console" : "");
>> +			cxt->cbz ? "Console " : "",
>> +			cxt->fbzs ? "Ftrace" : "");
>>  
>>  	err = pstore_register(&cxt->pstore);
>>  	if (err) {
>> diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
>> index 546375e04419..77704c1b404a 100644
>> --- a/include/linux/pstore_blk.h
>> +++ b/include/linux/pstore_blk.h
>> @@ -25,6 +25,9 @@
>>   * @console_size:
>>   *	The size of zone for console. Zero means disabled, othewise, it must
>>   *	be multiple of SECTOR_SIZE(512).
>> + * @ftrace_size:
>> + *	The size of zone for ftrace. Zero means disabled, othewise, it must
>> + *	be multiple of SECTOR_SIZE(512).
>>   * @dump_oops:
>>   *	Dump oops and panic log or only panic.
>>   * @read, @write:
>> @@ -60,6 +63,7 @@ struct blkz_info {
>>  	unsigned long dmesg_size;
>>  	unsigned long pmsg_size;
>>  	unsigned long console_size;
>> +	unsigned long ftrace_size;
>>  	int dump_oops;
>>  	blkz_read_op read;
>>  	blkz_write_op write;
>> -- 
>> 1.9.1
>>
> 

-- 
WeiXiong Liao

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
