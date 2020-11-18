Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DB7C63697
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 21:35:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A92246C1
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 21:35:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m5DrXNs3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7A92246C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wSEH1Fum14gcxz8Ea+IeYiUJDhCIimJzPZ8avEkNVRg=; b=m5DrXNs3O8Yztq6qZyCsZj8nw
	8VMAuWqEv2ggJzNQ+dOy738uqcPfjF6pRmCJy/GOJwBy1yoab0k50qMbsfpbLhvXx0F4NCPCZjcV4
	T13nonthWWU60Zlr8oY6lcnBqwsv8SV8CFoLt9PxyaoZpxiLS2fzoM/kg2mbsldnYybAiL9FHQWBW
	27gFWlBWbNl7MV3Jl7DND10x4WqtpX4PyDjFc+qtGZ9Pq/e+I9Ku4K9W5G6KNrroJSdKs9OkNLSXM
	TNEqFMD8mbIg7YLWRnVXMmeCD9qQaPeqAIZ85mfq1a0F/NtcnBZ4FwzUAuxO/l9wMmLLPidnCBDco
	o1dF5nwRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfV62-0003DU-RC; Wed, 18 Nov 2020 21:34:34 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfV5u-00039G-HX
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 21:34:27 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35A12B011;
 Wed, 18 Nov 2020 21:34:24 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id A0C1D1E130B; Wed, 18 Nov 2020 15:10:24 +0100 (CET)
Date: Wed, 18 Nov 2020 15:10:24 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/20] block: remove a duplicate __disk_get_part prototype
Message-ID: <20201118141024.GG1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-3-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_163426_827029_3E33D4EF 
X-CRM114-Status: GOOD (  17.49  )
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

On Wed 18-11-20 09:47:42, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  include/linux/genhd.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index 46553d6d602563..22f5b9fd96f8bf 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -250,7 +250,6 @@ static inline dev_t part_devt(struct hd_struct *part)
>  	return part_to_dev(part)->devt;
>  }
>  
> -extern struct hd_struct *__disk_get_part(struct gendisk *disk, int partno);
>  extern struct hd_struct *disk_get_part(struct gendisk *disk, int partno);
>  
>  static inline void disk_put_part(struct hd_struct *part)
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
