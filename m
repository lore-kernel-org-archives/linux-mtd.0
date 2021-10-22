Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A744C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 08:51:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 249FA60EB8
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 08:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 249FA60EB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDu8Vu8Yy2uFkIGNWB54sIMKkZBi8J+69vLGr5on7tk=; b=Bv70YwNX/jzcgf
	gWkBCHYRK9Wzq/Wf10+hKT0RBHySPE1VCo4cNl+AeQb6NBiNRN9JJ4sqscwlVahovhBb3k28dWSbK
	pwy+8WDjQr1dEIRZ4NI89XOKPzoDY1ZJ5NUcDovQpUNsSUxDwdvjMolKR3mZohDVSFeU1m+bbWDLk
	0WDvd5O+U3nsGYEb0ZaTvrQXWyZq4dbMUT8zhW2R2hGS0I8i9KUfk8atEcUAmKL2q7IFaa6EUiDG9
	xVVJf6vNm1o2xVfgcrpnA7UpGhrl+X7Kv9wKUyt2sra1MHh9p0lgcmLreUJUKSNlEjifxZ2gpjNWe
	lsqwalTSY1eKAcVLVjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqGe-00AF7h-TU; Fri, 22 Oct 2021 08:51:12 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqGa-00AF5U-Uy
 for linux-mtd@lists.infradead.org; Fri, 22 Oct 2021 08:51:10 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9B89D21983;
 Fri, 22 Oct 2021 08:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634892667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ksDUVgqu2ftprEqG94t5YEqIhESu4luf8I6VL1DNaI=;
 b=CQcAvWNESWel7EWMMd6TsJoRUGnMm2kiFiobu0/FbxUPn2c1igWXUdRQEsysDf/Y98CAMJ
 Z/GoDzTkg0iXlPPQVBq6M9LYaF8fG/gzSrfJQQhKNlvXkTw31Qum7yoZicJZWBYE7wOLrL
 uSEx4p0+zkP9feR/ttBHn+5DNbLniwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634892667;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ksDUVgqu2ftprEqG94t5YEqIhESu4luf8I6VL1DNaI=;
 b=0mAIE+x7gXvCG2AbrrlMVUmzDJdK4g0TNfeujizgWuIqKH/rrFsTdZj6Wjc1agzQMCBi1F
 dDBoPS9/BzjnWRBQ==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id 86A6AA3B83;
 Fri, 22 Oct 2021 08:51:07 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 45DFD1E11B6; Fri, 22 Oct 2021 10:51:07 +0200 (CEST)
Date: Fri, 22 Oct 2021 10:51:07 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jan Kara <jack@suse.cz>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 4/5] mm: don't automatically unregister bdis
Message-ID: <20211022085107.GE1026@quack2.suse.cz>
References: <20211021124441.668816-1-hch@lst.de>
 <20211021124441.668816-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021124441.668816-5-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_015109_197539_A88BED39 
X-CRM114-Status: GOOD (  15.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 21-10-21 14:44:40, Christoph Hellwig wrote:
> All BDI users now unregister explicitly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  mm/backing-dev.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> index 8a46a0a4b72fa..768e9ae489f66 100644
> --- a/mm/backing-dev.c
> +++ b/mm/backing-dev.c
> @@ -965,8 +965,7 @@ static void release_bdi(struct kref *ref)
>  	struct backing_dev_info *bdi =
>  			container_of(ref, struct backing_dev_info, refcnt);
>  
> -	if (test_bit(WB_registered, &bdi->wb.state))
> -		bdi_unregister(bdi);
> +	WARN_ON_ONCE(test_bit(WB_registered, &bdi->wb.state));
>  	WARN_ON_ONCE(bdi->dev);
>  	wb_exit(&bdi->wb);
>  	kfree(bdi);
> -- 
> 2.30.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
