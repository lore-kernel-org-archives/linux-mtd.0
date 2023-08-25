Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A967C3DA66
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 21:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NqiU8LW5irkGul4m7mfSSqQp04vDUXF0dwjtRpAVuo=; b=IFNUPFeKMX2k47
	buKz2bm3m5pJ9F/RyZCfCjyg5M1MWOa21d28DWu9UxJWbMdmQfiFCQUNFG0N7dQnAdCmh4ojrScWh
	pDso5XcMy9qGhS0t/24XOjxZQzUJxTRpFS08uR/pGlrvcwD1kaGQOnEz/gtH5EoGxvm8fleL3S22I
	IXSeNIg8alUv3ubQgvBYpMjjsoYqLyycLZwxjSpXLiSPOJxljwViqDhjsckPXKA2+swZyxGnv40n1
	TmS3ZHKaNPLu/WPDZgBNV6zdtBVQ1+v9lmVlt7BBlQUPtTQooNbpt4n/kXnRlcOqWhnD1gx3V/bgd
	H2jwz9XKhpZwPBAjowmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZeou-00654M-36;
	Fri, 25 Aug 2023 21:58:20 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZeos-00653c-24
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 21:58:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bf1935f6c2so10097335ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 25 Aug 2023 14:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1693000697; x=1693605497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KYhyzbAkZA6I0JpkJP7NgCytRvclFoiu9vcGiedxJnM=;
        b=1Wwb4WWQO1nzo+wP8Ym9u7PtaCAogAhPk/wJ6+iajebaGRGH1bh3YUovAHvK7YwsrG
         Altfd+hiFr2QAEewrBlBdQUf12ReGBxFecEF9z4qSWtf7NHhqX4ZJ0Es/Ox5pMQG5qYE
         ON1YhPXjTA4vUUqu5PDmVynp4FbeJjsl/2wr+ltmHseTIEjBJUjWiwUMJkDEEGYrxBj+
         +r63aMykB0LkDPawaZCYLBT8qIm6t5FSY8zRlinkDxCVNHc4Plq432NNO6//LCu4oULp
         7N1QnclU4jSGyRit69XjN/5+++KdNQGagaG79+E8tysnI3S2OzcORxOrDNy4lC1Nj2mx
         DSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693000697; x=1693605497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYhyzbAkZA6I0JpkJP7NgCytRvclFoiu9vcGiedxJnM=;
        b=QoZ4MEygkVjYSiwIrFNobppHqvT1DP2je4OQCb2+l8xY+7JBYm07rrV53tlTwwjU1d
         mn1Op9tXsptO9XcrOWn4ZB7A5QJ4Tyv7KJ29iyeG9O0beE56Ua31C/baDRmAU/u7/+gE
         BU5AQ2AG9zov+PEiwIJj9W+hcsVyBjAyWRq9t9U5hfnu1FklQMr1DUwgHiKWbRWWYXrB
         lgCnH7H9l5sdLVrKx08ESTXWSwJDeMn68aHR3t9fRWzieECVafRz2Q4w9H5P1m4w4j9P
         oAAOZk9eLDIm0QP+JopFWBV9Q2fmqibYCcjd9jCg7FT0lS3+tuzqqThXxe2JHm6Qh5Gj
         zspA==
X-Gm-Message-State: AOJu0Yw5v80xG+oeNYRTaiyTUiJFDwjbjiSmAKIrddureB9n0Ls2y+Nm
	cE9uDwwrntK/e/eyVVqQzP8qxw==
X-Google-Smtp-Source: AGHT+IGbNBRmb5i9MT6K586yDhJt+XUD4xbkK8zWzYl+0zg/QCNqIJVK22pGEJPGpFxCH5bzJj3AjQ==
X-Received: by 2002:a17:902:c454:b0:1b8:6984:f5e5 with SMTP id m20-20020a170902c45400b001b86984f5e5mr20508009plm.12.1693000697391;
        Fri, 25 Aug 2023 14:58:17 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b0019ee045a2b3sm2241969plg.308.2023.08.25.14.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:58:16 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qZeoo-006VLc-08;
	Sat, 26 Aug 2023 07:58:14 +1000
Date: Sat, 26 Aug 2023 07:58:14 +1000
From: Dave Chinner <david@fromorbit.com>
To: Hao Xu <hao.xu@linux.dev>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH 26/29] xfs: return -EAGAIN when nowait meets sync in
 transaction commit
Message-ID: <ZOkj9uTkoHPR/tDV@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-27-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-27-hao.xu@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_145818_675404_21434267 
X-CRM114-Status: GOOD (  18.79  )
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

On Fri, Aug 25, 2023 at 09:54:28PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> if the log transaction is a sync one, let's fail the nowait try and
> return -EAGAIN directly since sync transaction means blocked by IO.
> 
> Signed-off-by: Hao Xu <howeyxu@tencent.com>
> ---
>  fs/xfs/xfs_trans.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
> index 7988b4c7f36e..f1f84a3dd456 100644
> --- a/fs/xfs/xfs_trans.c
> +++ b/fs/xfs/xfs_trans.c
> @@ -968,12 +968,24 @@ __xfs_trans_commit(
>  	xfs_csn_t		commit_seq = 0;
>  	int			error = 0;
>  	int			sync = tp->t_flags & XFS_TRANS_SYNC;
> +	bool			nowait = tp->t_flags & XFS_TRANS_NOWAIT;
> +	bool			perm_log = tp->t_flags & XFS_TRANS_PERM_LOG_RES;
>  
>  	trace_xfs_trans_commit(tp, _RET_IP_);
>  
> +	if (nowait && sync) {
> +		/*
> +		 * Currently nowait is only from xfs_vn_update_time()
> +		 * so perm_log is always false here, but let's make
> +		 * code general.
> +		 */
> +		if (perm_log)
> +			xfs_defer_cancel(tp);
> +		goto out_unreserve;
> +	}

This is fundamentally broken.  We cannot about a transaction commit
with dirty items at this point with shutting down the filesystem.

This points to XFS_TRANS_NOWAIT being completely broken, too,
because we don't call xfs_trans_set_sync() until just before we
commit the transaction. At this point, it is -too late- for
nowait+sync to be handled gracefully, and it will *always* go bad.

IOWs, the whole transaction "nowait" semantics as designed and
implemented is not a workable solution....

-Dave.
-- 
Dave Chinner
david@fromorbit.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
