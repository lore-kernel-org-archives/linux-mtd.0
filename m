Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E42C33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 11:42:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10FCA24684
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 11:42:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BkboSTKL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10FCA24684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWG/Ak8uUmEV9a4+yY7X1SLBSavOBNjBNA/sZIQOLtc=; b=BkboSTKLmdVIW3
	0S61HPUekkBkQW49iqK5wKt874ZNvN7ibSUC224+OkvhBq3V8WPgz0uVBE6OwJqPqTDSUCewlk4Iy
	1RIKQH0cCYQlesATkxZzDmelCoPfWJoavIhnpmRpFvIm82SeQKioNrDL590CBAIyXc1pXp7KddEQ9
	+lyZXtmxWJ1yMl+xK2iNeDPMbdGxVyvL4u5JFVhyzdKDvlX/SyGA0SCEDCvYgBopIrCtDZt/0LNu/
	/3gl4asOI6cp/pa3lLGy2Wpi6ClXtbk14bNSSoxfHID1j5uuU7Fj4H4nQETIN9R1BMQQh6YV1MwN+
	bljKtDC+y+uNIV8ik57w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwPFv-0006IJ-8t; Tue, 28 Jan 2020 11:42:07 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwPFr-0006HU-MK
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 11:42:05 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A052AD45;
 Tue, 28 Jan 2020 11:42:00 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 680001E0E4B; Tue, 28 Jan 2020 12:41:59 +0100 (CET)
Date: Tue, 28 Jan 2020 12:41:59 +0100
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20200128114159.GA8930@quack2.suse.cz>
References: <20200124131323.23885-1-s.hauer@pengutronix.de>
 <20200124131323.23885-2-s.hauer@pengutronix.de>
 <20200127104518.GC19414@quack2.suse.cz>
 <20200128100631.zv7cn726twylcmb7@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128100631.zv7cn726twylcmb7@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_034204_022135_1ECA3480 
X-CRM114-Status: GOOD (  32.98  )
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
Cc: Jan Kara <jack@suse.cz>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue 28-01-20 11:06:31, Sascha Hauer wrote:
> Hi Jan,
> 
> On Mon, Jan 27, 2020 at 11:45:18AM +0100, Jan Kara wrote:
> > >  	cmds = cmd >> SUBCMDSHIFT;
> > >  	type = cmd & SUBCMDMASK;
> > >  
> > > +
> > 
> > Unnecessary empty line added...
> 
> Fixed
> 
> > > +	if (q_path) {
> > > +		ret = user_path_at(AT_FDCWD, special,
> > > +				   LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
> > > +				   &sb_path);
> > > +		if (ret)
> > > +			goto out;
> > > +
> > > +		sb = sb_path.mnt->mnt_sb;
> > 
> > So I've realized that just looking up superblock with user_path_at() is not
> > enough. Quota code also expects that the superblock will be locked
> > (sb->s_umount) and filesystem will not be frozen (in case the quota
> > operation is going to modify the filesystem). This is needed to serialize
> > e.g. remount and quota operations or quota operations among themselves.
> > So you still need something like following to get superblock from the path:
> 
> Ok, here's an updated version. I'll send an update for the whole series
> when Richard had a look over it.
> 
> Sascha
> 
> ----------------------------8<-----------------------------
> 
> From 9c91395f2667c8a48f52a80896e559daf16f4a4c Mon Sep 17 00:00:00 2001
> From: Sascha Hauer <s.hauer@pengutronix.de>
> Date: Wed, 30 Oct 2019 08:35:11 +0100
> Subject: [PATCH] quota: Allow to pass mount path to quotactl
> 
> This patch introduces the Q_PATH flag to the quotactl cmd argument.
> When given, the path given in the special argument to quotactl will
> be the mount path where the filesystem is mounted, instead of a path
> to the block device.
> This is necessary for filesystems which do not have a block device as
> backing store. Particularly this is done for upcoming UBIFS support.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Thanks. The patch looks good to me now. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/quota/quota.c           | 75 ++++++++++++++++++++++++++++++++------
>  include/uapi/linux/quota.h |  1 +
>  2 files changed, 64 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/quota/quota.c b/fs/quota/quota.c
> index 5444d3c4d93f..712b71760f9d 100644
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
> @@ -810,6 +811,36 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
>  #endif
>  }
>  
> +static struct super_block *quotactl_path(const char __user *special, int cmd,
> +					 struct path *path)
> +{
> +	struct super_block *sb;
> +	int ret;
> +
> +	ret = user_path_at(AT_FDCWD, special, LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
> +			   path);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	sb = path->mnt->mnt_sb;
> +restart:
> +	if (quotactl_cmd_onoff(cmd))
> +		down_write(&sb->s_umount);
> +	else
> +		down_read(&sb->s_umount);
> +
> +	if (quotactl_cmd_write(cmd) && sb->s_writers.frozen != SB_UNFROZEN) {
> +		if (quotactl_cmd_onoff(cmd))
> +			up_write(&sb->s_umount);
> +		else
> +			up_read(&sb->s_umount);
> +		wait_event(sb->s_writers.wait_unfrozen,
> +			   sb->s_writers.frozen == SB_UNFROZEN);
> +		goto restart;
> +	}
> +
> +	return sb;
> +}
>  /*
>   * This is the system call interface. This communicates with
>   * the user-level programs. Currently this only supports diskquota
> @@ -821,8 +852,9 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
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
> @@ -830,6 +862,9 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
>  	if (type >= MAXQUOTAS)
>  		return -EINVAL;
>  
> +	q_path = cmds & Q_PATH;
> +	cmds &= ~Q_PATH;
> +
>  	/*
>  	 * As a special case Q_SYNC can be called without a specific device.
>  	 * It will iterate all superblocks that have quota enabled and call
> @@ -847,28 +882,44 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
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
> +	if (q_path)
> +		sb = quotactl_path(special, cmds, &sb_path);
> +	else
> +		sb = quotactl_block(special, cmds);
> +
>  	if (IS_ERR(sb)) {
>  		ret = PTR_ERR(sb);
>  		goto out;
>  	}
>  
> -	ret = do_quotactl(sb, type, cmds, id, addr, pathp);
> +	ret = do_quotactl(sb, type, cmds, id, addr, file_pathp);
> +
> +	if (q_path) {
> +		if (quotactl_cmd_onoff(cmd))
> +			up_write(&sb->s_umount);
> +		else
> +			up_read(&sb->s_umount);
> +
> +		path_put(&sb_path);
> +	} else {
> +		if (!quotactl_cmd_onoff(cmds))
> +			drop_super(sb);
> +		else
> +			drop_super_exclusive(sb);
> +	}
>  
> -	if (!quotactl_cmd_onoff(cmds))
> -		drop_super(sb);
> -	else
> -		drop_super_exclusive(sb);
>  out:
> -	if (pathp && !IS_ERR(pathp))
> -		path_put(pathp);
> +	if (file_pathp && !IS_ERR(file_pathp))
> +		path_put(file_pathp);
>  	return ret;
>  }
>  
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
> 2.25.0
> 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
