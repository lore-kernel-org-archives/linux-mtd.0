Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DDFC38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 07:54:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28A542075E
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 07:54:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tPxSKz4g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28A542075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J6kU1bJFmAOWSm0TIiMc/Z+BOhlc+PHAiGNanRVcexc=; b=tPxSKz4gNIHa8IOpvsqDf1FKw
	8eKjYcGoQsEnJiijxpv5pGiLDGbZAWqVPHO5BQ5tZV8GEr0SCG9SQ+IxkNGtbcEN0+G398iPf+5ZO
	O2iExcbsYN9FnpeK+kil9U1aZhVBw0Es1tEqBcGZil3xRaj7lQIXEtCi8RvLJCrbySr8LYg57xGnF
	BWvTZP9WHZGhd75UTHUS/IhmuKQQ1llOkFK43B5i+UBOahFNr0Tp4DKP7+1xLTxhu6eWQc5LB23tY
	Kbs+2dl/QWfxnfUzwLf99e2oT3VsXVn2O7cA4Q+L1IBntzdz0ROEPVz7HogFwnzn3cyoYFikDtxhy
	sWflLGUaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWbM0-0007dM-77; Thu, 07 May 2020 07:54:00 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWbLw-0007cj-JA
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 07:53:58 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1481E6579506A334BFF2;
 Thu,  7 May 2020 15:53:44 +0800 (CST)
Received: from [127.0.0.1] (10.67.102.197) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 15:53:38 +0800
Subject: ping; [PATCH v4] mtd: clear cache_state to avoid writing to bad
 blocks repeatedly
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
References: <1585618319-119741-1-git-send-email-nixiaoming@huawei.com>
From: Xiaoming Ni <nixiaoming@huawei.com>
Message-ID: <528b61f3-bddb-d508-8f18-37cebec9e5eb@huawei.com>
Date: Thu, 7 May 2020 15:53:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1585618319-119741-1-git-send-email-nixiaoming@huawei.com>
X-Originating-IP: [10.67.102.197]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_005356_797993_77F2DD77 
X-CRM114-Status: GOOD (  18.59  )
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
Cc: wangle6@huawei.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, zhangweimin12@huawei.com, houtao1@huawei.com,
 yebin10@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ping

On 2020/3/31 9:31, Xiaoming Ni wrote:
> The function call process is as follows:
> 	mtd_blktrans_work()
> 	  while (1)
> 	    do_blktrans_request()
> 	      mtdblock_writesect()
> 	        do_cached_write()
> 	          write_cached_data() /*if cache_state is STATE_DIRTY*/
> 	            erase_write()
> 
> write_cached_data() returns failure without modifying cache_state
> and cache_offset. So when do_cached_write() is called again,
> write_cached_data() will be called again to perform erase_write()
> on the same cache_offset.
> 
> But if this cache_offset points to a bad block, erase_write() will
> always return -EIO. Writing to this mtdblk is equivalent to losing
> the current data, and repeatedly writing to the bad block.
> 
> Repeatedly writing a bad block has no real benefits,
> but brings some negative effects:
> 1 Lost subsequent data
> 2 Loss of flash device life
> 3 erase_write() bad blocks are very time-consuming. For example:
> 	the function do_erase_oneblock() in chips/cfi_cmdset_0020.c or
> 	chips/cfi_cmdset_0002.c may take more than 20 seconds to return
> 
> Therefore, when erase_write() returns -EIO in write_cached_data(),
> clear cache_state to avoid writing to bad blocks repeatedly.
> 
> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   drivers/mtd/mtdblock.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
> index 078e0f6..32e52d8 100644
> --- a/drivers/mtd/mtdblock.c
> +++ b/drivers/mtd/mtdblock.c
> @@ -89,8 +89,6 @@ static int write_cached_data (struct mtdblk_dev *mtdblk)
>   
>   	ret = erase_write (mtd, mtdblk->cache_offset,
>   			   mtdblk->cache_size, mtdblk->cache_data);
> -	if (ret)
> -		return ret;
>   
>   	/*
>   	 * Here we could arguably set the cache state to STATE_CLEAN.
> @@ -98,9 +96,14 @@ static int write_cached_data (struct mtdblk_dev *mtdblk)
>   	 * be notified if this content is altered on the flash by other
>   	 * means.  Let's declare it empty and leave buffering tasks to
>   	 * the buffer cache instead.
> +	 *
> +	 * If this cache_offset points to a bad block, data cannot be
> +	 * written to the device. Clear cache_state to avoid writing to
> +	 * bad blocks repeatedly.
>   	 */
> -	mtdblk->cache_state = STATE_EMPTY;
> -	return 0;
> +	if (ret == 0 || ret == -EIO)
> +		mtdblk->cache_state = STATE_EMPTY;
> +	return ret;
>   }
>   
>   
> 



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
