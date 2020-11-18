Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4490C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 21:35:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F5A246CF
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 21:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x7Yi66/s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F5A246CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qpYpFe/EuRR6KKLZh5QMBIuDxHIWaz/oCM5NXxSPQhM=; b=x7Yi66/s6XHAlrWrCahsaRfNU
	BHWDxIgLHoOJK0Hm3HMCGwx3kNcTcyxmlplA6zJcFisYMFvoAh16d3HZjLw+wdvkBkX0VQ/mcusKI
	9QAcrnZvmstzGWNHbwwaRLhVYs1ntFZwpYaDcHU9lT/QCjWentpTw5dTRyrTkhRMkBDGzsslZ3KeG
	k7NxseTIoY5Plh+OBFXa+vrVuXSiqZOibPZ7Vk2zIiaiYrTXih1jJ+ZWZXL5JXSm5MAVLyx99LZWj
	y+7dTr97PQ1c/LWs0hLjnL720mb0QUTwsrpEwlyyk5Mo3OHbszWFoE51EggzPUZN3cHyTtZ9QA8Hq
	xVIZq0Ulw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfV5x-0003CC-UQ; Wed, 18 Nov 2020 21:34:29 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfV5u-00039I-HX
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 21:34:27 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05AD8B004;
 Wed, 18 Nov 2020 21:34:23 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 4F52B1E1325; Wed, 18 Nov 2020 15:37:47 +0100 (CET)
Date: Wed, 18 Nov 2020 15:37:47 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/20] init: refactor name_to_dev_t
Message-ID: <20201118143747.GL1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-8-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_163426_985526_00397030 
X-CRM114-Status: GOOD (  18.50  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed 18-11-20 09:47:47, Christoph Hellwig wrote:
> Split each case into a self-contained helper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/genhd.h |   7 +-
>  init/do_mounts.c      | 183 +++++++++++++++++++++---------------------
>  2 files changed, 91 insertions(+), 99 deletions(-)
> 
> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index 22f5b9fd96f8bf..ca5e356084c353 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -388,18 +388,13 @@ static inline void bd_unlink_disk_holder(struct block_device *bdev,
>  }
>  #endif /* CONFIG_SYSFS */
>  
> +dev_t blk_lookup_devt(const char *name, int partno);
>  #ifdef CONFIG_BLOCK
>  void printk_all_partitions(void);
> -dev_t blk_lookup_devt(const char *name, int partno);
>  #else /* CONFIG_BLOCK */
>  static inline void printk_all_partitions(void)
>  {
>  }
> -static inline dev_t blk_lookup_devt(const char *name, int partno)
> -{
> -	dev_t devt = MKDEV(0, 0);
> -	return devt;
> -}
>  #endif /* CONFIG_BLOCK */

This hunk looks unrelated to the change? Also why you move the declaration
outside the CONFIG_BLOCK ifdef? AFAICS blk_lookup_devt() still exists only
when CONFIG_BLOCK is defined? Otherwise the patch looks good to me.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
