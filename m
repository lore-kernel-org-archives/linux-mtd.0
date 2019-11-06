Return-Path: <SRS0=BbO6=Y6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03BAC5DF62
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 10:05:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD23C2173B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 10:05:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SCOMxUzU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD23C2173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92a9y0Ce/eqg2qRPp66bEpS94dnA72xtdFYwWdGJow8=; b=SCOMxUzUHOHSWx
	YqDj4FkR00aenySoL+QzSpy9//taPF8m1ZSznrCa/xDWRUODX43MowCsM8Chi6Th00MvhAjJqEQOS
	clz7G5X8NgQs5nQ6VRpYqRmPieFUXJikcnKkvTZmxZE/4ALzPTQEG+kW5bRfr8qIRVP/ivO1rPFRA
	bsH9AaHh2c+KJop595eMZIRmdQnED6XYJGPMV3zBp5YjZvBj6dnJJqRDJvvVZFg7I/ovhywkepa5b
	GroU46eG2q2/7hduQ47TYvIi4osO5mOkx6/e60HsQq5n9/Y4k3CEFns0FD6ziYeJ7glJzU0wPvOCS
	6dZnxdRcqmlcNnKoya2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSIBm-0008GI-5p; Wed, 06 Nov 2019 10:05:22 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSIBi-0008FW-SX
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2019 10:05:21 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 903CDB35D;
 Wed,  6 Nov 2019 10:05:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 469741E47E5; Wed,  6 Nov 2019 11:05:15 +0100 (CET)
Date: Wed, 6 Nov 2019 11:05:15 +0100
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/7] quota: Allow to pass mount path to quotactl
Message-ID: <20191106100515.GC16085@quack2.suse.cz>
References: <20191106091537.32480-1-s.hauer@pengutronix.de>
 <20191106091537.32480-2-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106091537.32480-2-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_020519_259998_84BF3F30 
X-CRM114-Status: GOOD (  23.09  )
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

On Wed 06-11-19 10:15:31, Sascha Hauer wrote:
> This patch introduces the Q_PATH flag to the quotactl cmd argument.
> When given, the path given in the special argument to quotactl will
> be the mount path where the filesystem is mounted, instead of a path
> to the block device.
> This is necessary for filesystems which do not have a block device as
> backing store. Particularly this is done for upcoming UBIFS support.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

It seems you forgot to implement changes I've asked for in [1]?

[1] https://lore.kernel.org/linux-fsdevel/20191101160706.GA23441@quack2.suse.cz

								Honza
> ---
>  fs/quota/quota.c           | 37 ++++++++++++++++++++++++++++---------
>  include/uapi/linux/quota.h |  1 +
>  2 files changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/quota/quota.c b/fs/quota/quota.c
> index cb13fb76dbee..035cdd1b022b 100644
> --- a/fs/quota/quota.c
> +++ b/fs/quota/quota.c
> @@ -19,6 +19,7 @@
>  #include <linux/types.h>
>  #include <linux/writeback.h>
>  #include <linux/nospec.h>
> +#include <linux/mount.h>
>  
>  static int check_quotactl_permission(struct super_block *sb, int type, int cmd,
>  				     qid_t id)
> @@ -825,12 +826,16 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
>  {
>  	uint cmds, type;
>  	struct super_block *sb = NULL;
> -	struct path path, *pathp = NULL;
> +	struct path path, *pathp = NULL, qpath;
>  	int ret;
> +	bool q_path;
>  
>  	cmds = cmd >> SUBCMDSHIFT;
>  	type = cmd & SUBCMDMASK;
>  
> +	q_path = cmds & Q_PATH;
> +	cmds &= ~Q_PATH;
> +
>  	/*
>  	 * As a special case Q_SYNC can be called without a specific device.
>  	 * It will iterate all superblocks that have quota enabled and call
> @@ -855,19 +860,33 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
>  			pathp = &path;
>  	}
>  
> -	sb = quotactl_block(special, cmds);
> -	if (IS_ERR(sb)) {
> -		ret = PTR_ERR(sb);
> -		goto out;
> +	if (q_path) {
> +		ret = user_path_at(AT_FDCWD, special, LOOKUP_FOLLOW|LOOKUP_AUTOMOUNT,
> +				   &qpath);
> +		if (ret)
> +			goto out1;
> +
> +		sb = qpath.mnt->mnt_sb;
> +	} else {
> +		sb = quotactl_block(special, cmds);
> +		if (IS_ERR(sb)) {
> +			ret = PTR_ERR(sb);
> +			goto out;
> +		}
>  	}
>  
>  	ret = do_quotactl(sb, type, cmds, id, addr, pathp);
>  
> -	if (!quotactl_cmd_onoff(cmds))
> -		drop_super(sb);
> -	else
> -		drop_super_exclusive(sb);
> +	if (!q_path) {
> +		if (!quotactl_cmd_onoff(cmds))
> +			drop_super(sb);
> +		else
> +			drop_super_exclusive(sb);
> +	}
>  out:
> +	if (q_path)
> +		path_put(&qpath);
> +out1:
>  	if (pathp && !IS_ERR(pathp))
>  		path_put(pathp);
>  	return ret;
> diff --git a/include/uapi/linux/quota.h b/include/uapi/linux/quota.h
> index f17c9636a859..e1787c0df601 100644
> --- a/include/uapi/linux/quota.h
> +++ b/include/uapi/linux/quota.h
> @@ -71,6 +71,7 @@
>  #define Q_GETQUOTA 0x800007	/* get user quota structure */
>  #define Q_SETQUOTA 0x800008	/* set user quota structure */
>  #define Q_GETNEXTQUOTA 0x800009	/* get disk limits and usage >= ID */
> +#define Q_PATH     0x400000	/* quotactl special arg contains mount path */
>  
>  /* Quota format type IDs */
>  #define	QFMT_VFS_OLD 1
> -- 
> 2.24.0.rc1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
