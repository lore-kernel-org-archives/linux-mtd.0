Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459FBC43334
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jul 2022 09:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lY+aWa5fE1QdHnkYC+Xv9Aj0H5mJdgCGyG42jLyxkZE=; b=JkWAEwUsbFhiKnXlqw02H+PuHL
	Ogbm6fjreTPIwCQSUK0cpf3XImVIEjWjy3V7sf1gXF2PmLOMH+pdHyrvVrh8b4V7lV3Lqs3xtoKUP
	/R1EsjmSC9PwPBMWu7MjlWzr75qJHUjJ8lVX9tJsg3qmlBXR/Gh3bw+qfaWhdQmzLZbYoxoPMuNk9
	juBiqg2ONaFWxFmX6oEdmMCQ9y4Y+dkQ1nWnSg0F5Zm8Nl077/dMJeivbPUkbxFCOwUrY0UQWC2Sg
	ZaMBqTJ1Ii0vDyeF0+ubtv1P+6kHy/3JlhD5aqlGXxv17CE9QReMCXCHEZl6a1VCnhWGkNeIs1/I0
	O1VoMx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jtb-002kXr-FT; Fri, 08 Jul 2022 09:03:31 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jtV-002kU4-OZ
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2022 09:03:28 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LfS2K1qvwzhZ2S
	for <linux-mtd@lists.infradead.org>; Fri,  8 Jul 2022 17:01:45 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 17:03:14 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 17:03:13 +0800
Subject: Re: [PATCH] ubifs: sequence each shrink task
To: <linux-mtd@lists.infradead.org>
References: <20220707123033.29042-1-duguoweisz@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <bb53d0af-492b-ddef-0b53-26509d8fa9eb@huawei.com>
Date: Fri, 8 Jul 2022 17:03:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20220707123033.29042-1-duguoweisz@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_020326_187288_CA99E4C8 
X-CRM114-Status: GOOD (  29.46  )
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

Hi,
> From: duguowei <duguowei@xiaomi.com>
> 
> Because of 'list_move_tail', if two or more tasks are shrinking, there
> will be different results for them.
> 
> For example:
> After the first round, if shrink_run_no of entry equals run_no of task,
> task will break directly at the beginning of next round; if they are
> not equal, task will continue to shrink until encounter one entry
> which has the same number.
> 
> It is difficult to confirm the real results of all tasks, so add a lock
> to only allow one task to shrink at the same time.
> 
Which situation we need to confirm the exact results for shrinker tasks? 
ubifs_shrink_scan() provides a rough reclaiming method to make sure that 
ubifs can iterate all filesystem entries, it looks that skipping one or 
two entries occasionally not occurs any problems.

BTW, could you please provide a reproducer that can trigger 
'c->shrinker_run_no == run_no' to skip fs entry. 'shrinker_run_no' is an 
'unsigned int' type value, it looks that the skipping condition is 
seldomly statisfied even with many ubifs filesystem entries.
> Signed-off-by: duguowei <duguowei@xiaomi.com>
> ---
>   fs/ubifs/shrinker.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/ubifs/shrinker.c b/fs/ubifs/shrinker.c
> index d00a6f20ac7b..900644ef432d 100644
> --- a/fs/ubifs/shrinker.c
> +++ b/fs/ubifs/shrinker.c
> @@ -42,6 +42,9 @@ static unsigned int shrinker_run_no;
>   /* Protects 'ubifs_infos' list */
>   DEFINE_SPINLOCK(ubifs_infos_lock);
>   
> +/* Sequence each shrink task*/
> +DEFINE_SPINLOCK(ubifs_shrink_lock);
> +
>   /* Global clean znode counter (for all mounted UBIFS instances) */
>   atomic_long_t ubifs_clean_zn_cnt;
>   
> @@ -145,13 +148,12 @@ static int shrink_tnc_trees(int nr, int age, int *contention)
>   {
>   	struct ubifs_info *c;
>   	struct list_head *p;
> -	unsigned int run_no;
>   	int freed = 0;
>   
>   	spin_lock(&ubifs_infos_lock);
> -	do {
> -		run_no = ++shrinker_run_no;
> -	} while (run_no == 0);
> +	shrinker_run_no++;
> +	if (shrinker_run_no == 0)
> +		shrinker_run_no = 1;
>   	/* Iterate over all mounted UBIFS file-systems and try to shrink them */
>   	p = ubifs_infos.next;
>   	while (p != &ubifs_infos) {
> @@ -160,7 +162,7 @@ static int shrink_tnc_trees(int nr, int age, int *contention)
>   		 * We move the ones we do to the end of the list, so we stop
>   		 * when we see one we have already done.
>   		 */
> -		if (c->shrinker_run_no == run_no)
> +		if (c->shrinker_run_no == shrinker_run_no)
>   			break;
>   		if (!mutex_trylock(&c->umount_mutex)) {
>   			/* Some un-mount is in progress, try next FS */
> @@ -183,7 +185,7 @@ static int shrink_tnc_trees(int nr, int age, int *contention)
>   		 * OK, now we have TNC locked, the file-system cannot go away -
>   		 * it is safe to reap the cache.
>   		 */
> -		c->shrinker_run_no = run_no;
> +		c->shrinker_run_no = shrinker_run_no;
>   		freed += shrink_tnc(c, nr, age, contention);
>   		mutex_unlock(&c->tnc_mutex);
>   		spin_lock(&ubifs_infos_lock);
> @@ -283,7 +285,9 @@ unsigned long ubifs_shrink_scan(struct shrinker *shrink,
>   	int contention = 0;
>   	unsigned long freed;
>   	long clean_zn_cnt = atomic_long_read(&ubifs_clean_zn_cnt);
> +	int ret = 0;
>   
> +	spin_lock(&ubifs_shrink_lock);
>   	if (!clean_zn_cnt) {
>   		/*
>   		 * No clean znodes, nothing to reap. All we can do in this case
> @@ -293,7 +297,9 @@ unsigned long ubifs_shrink_scan(struct shrinker *shrink,
>   		 * later.
>   		 */
>   		dbg_tnc("no clean znodes, kick a thread");
> -		return kick_a_thread();
> +		ret = kick_a_thread();
> +		spin_unlock(&ubifs_shrink_lock);
> +		return ret;
>   	}
>   
>   	freed = shrink_tnc_trees(nr, OLD_ZNODE_AGE, &contention);
> @@ -310,10 +316,12 @@ unsigned long ubifs_shrink_scan(struct shrinker *shrink,
>   
>   	if (!freed && contention) {
>   		dbg_tnc("freed nothing, but contention");
> +		spin_unlock(&ubifs_shrink_lock);
>   		return SHRINK_STOP;
>   	}
>   
>   out:
>   	dbg_tnc("%lu znodes were freed, requested %lu", freed, nr);
> +	spin_unlock(&ubifs_shrink_lock);
>   	return freed;
>   }
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
