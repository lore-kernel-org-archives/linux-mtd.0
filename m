Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3EDC2BBD1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 10:05:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 733B8206A1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 10:05:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ik9Lujmf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 733B8206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WxBXL+E9FcYkF+ayjREc43kNNPpub+hhSbrlLFS1hTk=; b=Ik9LujmfpuuCXWvIfUoasC4SG
	MA0R6nPrJHG09af+PASIX4R5VSlksr6qBv7kvlKMrWztILI0iTBnxEFsLNTcwND3JBd3FG+z0DYHm
	fbDrciH8/MznHOUMlH8emxQMQN7+2KRh88hX4NcrrmJBDkH6rvqegiRRb5BZgNEYHO8YsaDfEHQoO
	Qjv4njs65MCEh2QplvhRQ89xGKXW7/aUCkpFbXUbhSMbOP+/GEz3WbtS3Q6LQMFoVmLGzK/kNv+OM
	bg0PgPLXfmhUTLCpltaJjpmF1SN0UUkJnkaXFIY9t04OClM15CWN2LSisWBzyImxKd9JThoTZJhpZ
	NOOZ15MNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIqml-0007zs-Je; Thu, 17 Sep 2020 10:05:03 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIqmj-0007z5-CR
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 10:05:02 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DEFB0AD03;
 Thu, 17 Sep 2020 10:05:33 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id ADFA01E12E1; Thu, 17 Sep 2020 12:04:59 +0200 (CEST)
Date: Thu, 17 Sep 2020 12:04:59 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/12] bdi: initialize ->ra_pages and ->io_pages in
 bdi_init
Message-ID: <20200917100459.GK7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-5-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_060501_546191_5BCADA91 
X-CRM114-Status: GOOD (  16.43  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, David Sterba <dsterba@suse.com>, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 10-09-20 16:48:24, Christoph Hellwig wrote:
> Set up a readahead size by default, as very few users have a good
> reason to change it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: David Sterba <dsterba@suse.com> [btrfs]
> Acked-by: Richard Weinberger <richard@nod.at> [ubifs, mtd]

Looks good but what about coda, ecryptfs, and orangefs? Currenly they have
readahead disabled and this patch would seem to enable it?

> diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> index 8e8b00627bb2d8..2dac3be6127127 100644
> --- a/mm/backing-dev.c
> +++ b/mm/backing-dev.c
> @@ -746,6 +746,8 @@ struct backing_dev_info *bdi_alloc(int node_id)
>  		kfree(bdi);
>  		return NULL;
>  	}
> +	bdi->ra_pages = VM_READAHEAD_PAGES;
> +	bdi->io_pages = VM_READAHEAD_PAGES;

Won't this be more logical in bdi_init() than in bdi_alloc()?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
