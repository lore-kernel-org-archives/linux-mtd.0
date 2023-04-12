Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E27C7619A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 01:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzU1nVgrM0B+8174OqsZ/DXx5NSZlopBX1GTcoUjD+I=; b=V52E/FKPwkQnm0s6Ve5M8Si3i4
	/5F0LrJimzcKGxbIZ3hHawnfUr6XxPIDH9j2pH8wiposl/5T1zjJ7kKLIvePQLzTog6d7PpP45Q3y
	9ZRCBlben2iCwwfvY6ELGehG+X7Ams40IWwpbaHTfru5w1gt7aHpUNMHcjKaB2/JOAnSeHsd1AwxD
	7U4Gb9gOHNXZ0M/Zu678N0dunCR2RkVnHVYbUGFCsfrgcjFHXIe1n0m98cleFaH6Bsp3ZFNrtLiQQ
	JeHqyX5FUbX9+YGpnw5M3lwd2rUq2lBa6DwM9zSZi0RngITfzUT3eulQNgoDvdwWhSYql1my8VzQ7
	q1VCUhaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmPg6-001ZeN-03;
	Wed, 12 Apr 2023 01:53:42 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmPfz-001Zbw-2I;
	Wed, 12 Apr 2023 01:53:39 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Px5Lw0DbCzDsg4;
	Wed, 12 Apr 2023 09:52:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 09:53:22 +0800
Subject: Re: [PATCH] ubi: fastmap: Reserve PEBs and init fm_work when fastmap
 is used.
To: Xiaobing Luo <luoxiaobing0926@gmail.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-kernel@vger.kernel.org>
References: <20230411154634.149350-1-luoxiaobing0926@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <cc9f9239-22b8-a00b-c46f-1b9ea8cd7395@huawei.com>
Date: Wed, 12 Apr 2023 09:53:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230411154634.149350-1-luoxiaobing0926@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_185336_099284_AC152767 
X-CRM114-Status: GOOD (  18.66  )
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

Hi Xiaobing
> Don't reserve the two fastmap PEBs when fastmap is disabled, then we can
> use the two PEBs in small ubi device.
> And don't init the fm_work when fastmap is disabled.
> 
> Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
> ---
>   drivers/mtd/ubi/build.c      | 3 ++-
>   drivers/mtd/ubi/fastmap-wl.c | 2 +-
>   drivers/mtd/ubi/wl.c         | 6 +++++-
>   3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index ad025b2ee417..a98a717b0e66 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1120,7 +1120,8 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
>   		kthread_stop(ubi->bgt_thread);
>   
>   #ifdef CONFIG_MTD_UBI_FASTMAP
> -	cancel_work_sync(&ubi->fm_work);
> +	if (!ubi->fm_disabled)
> +		cancel_work_sync(&ubi->fm_work);
>   #endif
>   	ubi_debugfs_exit_dev(ubi);
>   	uif_close(ubi);
> diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
> index 863f571f1adb..b3df17a782c7 100644
> --- a/drivers/mtd/ubi/fastmap-wl.c
> +++ b/drivers/mtd/ubi/fastmap-wl.c
> @@ -344,7 +344,7 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
>   		/* We cannot update the fastmap here because this
>   		 * function is called in atomic context.
>   		 * Let's fail here and refill/update it as soon as possible. */
> -		if (!ubi->fm_work_scheduled) {
> +		if (!ubi->fm_work_scheduled && !ubi->fm_disabled) {
>   			ubi->fm_work_scheduled = 1;
>   			schedule_work(&ubi->fm_work);
>   		}

I think we should keep the fm_work even fm_disabled is true. UBI is 
running with fastmap scheme as long as CONFIG_MTD_UBI_FASTMAP is 
enabled, 'ubi->fm_disabled' is just used to control whether to 
persistence fastmap metadata on flash. Free wear-leveling pebs 
consuming/producing model still depend on following process:
Consuming: get_peb_for_wl -> pool->pebs[pool->used++]
Producing: ubi->fm_work -> update_fastmap_work_fn -> ubi_refill_pools -> 
wl_pool->used = 0
If we disable 'ubi->fm_work' when ubi->fm_disabled becomes true, 
wear-leveing work will fail to get free wl peb until someone try to get 
free peb by ubi_wl_get_peb().

> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 26a214f016c1..8906db89808f 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1908,7 +1908,11 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
>   	ubi_assert(ubi->good_peb_count == found_pebs);
>   
>   	reserved_pebs = WL_RESERVED_PEBS;
> -	ubi_fastmap_init(ubi, &reserved_pebs);
> +
> +#ifdef CONFIG_MTD_UBI_FASTMAP
> +	if (!ubi->fm_disabled)
> +		ubi_fastmap_init(ubi, &reserved_pebs);
> +#endif
>   
>   	if (ubi->avail_pebs < reserved_pebs) {
>   		ubi_err(ubi, "no enough physical eraseblocks (%d, need %d)",
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
