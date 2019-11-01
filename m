Return-Path: <SRS0=gsLZ=YZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB6ECA9ECF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Nov 2019 18:07:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E6F21855
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Nov 2019 18:07:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CqHXQ8MW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E6F21855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p++wkdQdXi4s+1XaSIm5Vdz+ObS8wpM9veKo6bTj9As=; b=CqHXQ8MWOiBu1x
	uHMqH6SyR6600tDoo8M0DOqBqF3pgtQLqj2ihuoXx0CbS0cq+gKQ4hKw76soYnSWVLS4iXMMS3CT7
	HcgxTRpVeHnU8GHBprf8l1P0dDUbEpacRA8Julw23EwVzuESc8jLJlko2g7UwIZUuU09qmc9Mxee0
	Y2eO1Bdti7nkm6oV27Xnxhzvbpya7enznnzTk8aiY3300idYblLih/2D2Btv+TW/6NRDSToiTdbcU
	tjGT2045l8kNWBB0uVZYKKz4Hvs/lZHSimvN7M6Rtz9XfmoDjnWmQhEymqpMH8BuhYMAD3AEyZaQ2
	ckUawWokTdmYlToK9tPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQbKY-000625-RJ; Fri, 01 Nov 2019 18:07:26 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQbKV-000619-AZ
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2019 18:07:25 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8235CB4C3;
 Fri,  1 Nov 2019 18:07:21 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 27A751E482F; Fri,  1 Nov 2019 19:07:21 +0100 (CET)
Date: Fri, 1 Nov 2019 19:07:21 +0100
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 01/10] quota: Make inode optional
Message-ID: <20191101180721.GB23441@quack2.suse.cz>
References: <20191030152702.14269-1-s.hauer@pengutronix.de>
 <20191030152702.14269-2-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030152702.14269-2-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191101_110723_658737_3C304BDD 
X-CRM114-Status: GOOD (  18.53  )
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
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed 30-10-19 16:26:53, Sascha Hauer wrote:
> To add support for filesystems which do not store quota informations in
> an inode make the inode optional.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Umm, I don't quite like how the first three patches work out. I have
somewhat refactored quota code to make things nicer and allow enabling of
quotas only with superblock at hand. I'll post the patches once they pass
some testing early next week.

								Honza

> ---
>  fs/quota/dquot.c | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
> index 6e826b454082..59f31735fe79 100644
> --- a/fs/quota/dquot.c
> +++ b/fs/quota/dquot.c
> @@ -2313,11 +2313,11 @@ static int vfs_load_quota_inode(struct inode *inode, int type, int format_id,
>  
>  	if (!fmt)
>  		return -ESRCH;
> -	if (!S_ISREG(inode->i_mode)) {
> +	if (inode && !S_ISREG(inode->i_mode)) {
>  		error = -EACCES;
>  		goto out_fmt;
>  	}
> -	if (IS_RDONLY(inode)) {
> +	if (inode && IS_RDONLY(inode)) {
>  		error = -EROFS;
>  		goto out_fmt;
>  	}
> @@ -2352,7 +2352,7 @@ static int vfs_load_quota_inode(struct inode *inode, int type, int format_id,
>  		invalidate_bdev(sb->s_bdev);
>  	}
>  
> -	if (!(dqopt->flags & DQUOT_QUOTA_SYS_FILE)) {
> +	if (inode && !(dqopt->flags & DQUOT_QUOTA_SYS_FILE)) {
>  		/* We don't want quota and atime on quota files (deadlocks
>  		 * possible) Also nobody should write to the file - we use
>  		 * special IO operations which ignore the immutable bit. */
> @@ -2367,9 +2367,13 @@ static int vfs_load_quota_inode(struct inode *inode, int type, int format_id,
>  	}
>  
>  	error = -EIO;
> -	dqopt->files[type] = igrab(inode);
> -	if (!dqopt->files[type])
> -		goto out_file_flags;
> +
> +	if (inode) {
> +		dqopt->files[type] = igrab(inode);
> +		if (!dqopt->files[type])
> +			goto out_file_flags;
> +	}
> +
>  	error = -EINVAL;
>  	if (!fmt->qf_ops->check_quota_file(sb, type))
>  		goto out_file_init;
> @@ -2397,11 +2401,14 @@ static int vfs_load_quota_inode(struct inode *inode, int type, int format_id,
>  	return error;
>  out_file_init:
>  	dqopt->files[type] = NULL;
> -	iput(inode);
> +	if (inode)
> +		iput(inode);
>  out_file_flags:
> -	inode_lock(inode);
> -	inode->i_flags &= ~S_NOQUOTA;
> -	inode_unlock(inode);
> +	if (inode) {
> +		inode_lock(inode);
> +		inode->i_flags &= ~S_NOQUOTA;
> +		inode_unlock(inode);
> +	}
>  out_fmt:
>  	put_quota_format(fmt);
>  
> @@ -2800,8 +2807,10 @@ int dquot_get_state(struct super_block *sb, struct qc_state *state)
>  			tstate->flags |= QCI_LIMITS_ENFORCED;
>  		tstate->spc_timelimit = mi->dqi_bgrace;
>  		tstate->ino_timelimit = mi->dqi_igrace;
> -		tstate->ino = dqopt->files[type]->i_ino;
> -		tstate->blocks = dqopt->files[type]->i_blocks;
> +		if (dqopt->files[type]) {
> +			tstate->ino = dqopt->files[type]->i_ino;
> +			tstate->blocks = dqopt->files[type]->i_blocks;
> +		}
>  		tstate->nextents = 1;	/* We don't know... */
>  		spin_unlock(&dq_data_lock);
>  	}
> -- 
> 2.24.0.rc1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
