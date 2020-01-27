Return-Path: <SRS0=6ixN=3Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596C4C32771
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 10:45:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC13207FD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 10:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lwdaXyyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC13207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ha1YO6oaOvnEGq7ds68YzbjOKKarotELOy5CTvjZhmM=; b=lwdaXyyiheGpar
	o0+vmWkWSsqfw8bMyBdRD0UPAYwiHLed6z5do2KWbNujz4A2lg1c+mkmOAA421SL13bxPZKji/FiW
	CezQuNuSTLJEGkncqhtyTR1oZn+2R5tIt0kRAILFod1Z9M4Rl91PBll/h1rMyTctVhh7QswtgdttC
	B+uwbT3lrfIvNu7UXbDBB7mgnzWzWUg2DNH0YHM03+ov6o3cYb/Ep3XHXd2v1ehVvarK9n9K7yw5l
	ifodip6ijB7+6T7IcKfleaCRzKJCxF5eNP0qBpZw+/pWmUTLQKbUI6z8iA0mIpc8lDmGQzCoywu+G
	Fz3NFxOtzpaosrYHZS5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw1tb-00067C-W3; Mon, 27 Jan 2020 10:45:31 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw1tY-000669-Rr
 for linux-mtd@lists.infradead.org; Mon, 27 Jan 2020 10:45:30 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AF506ADE0;
 Mon, 27 Jan 2020 10:45:18 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 492081E0E4E; Mon, 27 Jan 2020 11:45:18 +0100 (CET)
Date: Mon, 27 Jan 2020 11:45:18 +0100
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20200127104518.GC19414@quack2.suse.cz>
References: <20200124131323.23885-1-s.hauer@pengutronix.de>
 <20200124131323.23885-2-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124131323.23885-2-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_024529_184287_0C358B5C 
X-CRM114-Status: GOOD (  20.99  )
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

On Fri 24-01-20 14:13:16, Sascha Hauer wrote:
> This patch introduces the Q_PATH flag to the quotactl cmd argument.
> When given, the path given in the special argument to quotactl will
> be the mount path where the filesystem is mounted, instead of a path
> to the block device.
> This is necessary for filesystems which do not have a block device as
> backing store. Particularly this is done for upcoming UBIFS support.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Thanks for the patch. Some comments are below.

> @@ -821,15 +822,20 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
>  {
>  	uint cmds, type;
>  	struct super_block *sb = NULL;
> -	struct path path, *pathp = NULL;
> +	struct path file_path, *file_pathp = NULL, sb_path;
>  	int ret;
> +	bool q_path;
>  
>  	cmds = cmd >> SUBCMDSHIFT;
>  	type = cmd & SUBCMDMASK;
>  
> +

Unnecessary empty line added...

>  	if (type >= MAXQUOTAS)
>  		return -EINVAL;
>  
> +	q_path = cmds & Q_PATH;
> +	cmds &= ~Q_PATH;
> +
>  	/*
>  	 * As a special case Q_SYNC can be called without a specific device.
>  	 * It will iterate all superblocks that have quota enabled and call
> @@ -847,28 +853,45 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
>  	 * resolution (think about autofs) and thus deadlocks could arise.
>  	 */
>  	if (cmds == Q_QUOTAON) {
> -		ret = user_path_at(AT_FDCWD, addr, LOOKUP_FOLLOW|LOOKUP_AUTOMOUNT, &path);
> +		ret = user_path_at(AT_FDCWD, addr,
> +				   LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
> +				   &file_path);
>  		if (ret)
> -			pathp = ERR_PTR(ret);
> +			file_pathp = ERR_PTR(ret);
>  		else
> -			pathp = &path;
> +			file_pathp = &file_path;
>  	}
>  
> -	sb = quotactl_block(special, cmds);
> -	if (IS_ERR(sb)) {
> -		ret = PTR_ERR(sb);
> -		goto out;
> +	if (q_path) {
> +		ret = user_path_at(AT_FDCWD, special,
> +				   LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
> +				   &sb_path);
> +		if (ret)
> +			goto out;
> +
> +		sb = sb_path.mnt->mnt_sb;

So I've realized that just looking up superblock with user_path_at() is not
enough. Quota code also expects that the superblock will be locked
(sb->s_umount) and filesystem will not be frozen (in case the quota
operation is going to modify the filesystem). This is needed to serialize
e.g. remount and quota operations or quota operations among themselves.
So you still need something like following to get superblock from the path:

static int quotactl_path(const char __user *special, int cmd, struct path *path)
{
	struct super_block *sb;

	ret = user_path_at(AT_FDCWD, special, LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
			   path);
	if (ret)
		return ret;
	sb = sb_path.mnt->mnt_sb;
restart:
	if (quotactl_cmd_onoff(cmd))
		down_write(&sb->s_umount);
	else
		down_read(&sb->s_umount);

	if (quotactl_cmd_write(cmd) && sb->s_writers.frozen != SB_UNFROZEN) {
		if (quotactl_cmd_onoff(cmd))
			up_write(&sb->s_umount);
		else
			up_read(&sb->s_umount);
		wait_event(sb->s_writers.wait_unfrozen,
			   sb->s_writers.frozen == SB_UNFROZEN);
		goto restart;

	}
	return sb;
}

And then appropriate counterparts when releasing the superblock.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
