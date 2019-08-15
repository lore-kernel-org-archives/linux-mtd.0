Return-Path: <SRS0=q3Mz=WL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D9CC433FF
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Aug 2019 11:17:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FCD5206C2
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Aug 2019 11:17:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AQIy4nRT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FCD5206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXCGCl8KilIozKEmSMSIdiMvdEuaATaxptXMyoslfnw=; b=AQIy4nRTSU/Qn0
	jzv+T6BnoBz2KO4LZGManR6f8H5CVpaTT6TBOkcwckKiu4LkYHKOAKJPIrFnP+sxUIY4Q+2DL4HJG
	94mK5VY90TxkKRFWXQH6BFjTtW5l+sjzCKPq96x10rfSm1PhCztdefxfZGxKyqJzxVwJvu3pQE8T8
	llV70CPMbOweFyRsHUlWy//oM1iZyciHRbNXaOnGTCBTJ5HCRBLAT+gL7FJnvaPLJ4TSZ8ODoEqja
	eAQtbTh1YS7wKaCt9VQUG4MHI5KejAQBB2u+tTqDkphbYcRa0YZopOYGbnHC6zMKLNpqqOFMDjiL0
	dgixctRfnYRBNZ63XP4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyDl2-0000Rv-N9; Thu, 15 Aug 2019 11:17:28 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyDkz-0000Qq-11
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2019 11:17:26 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4536AFD4;
 Thu, 15 Aug 2019 11:17:21 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1A75F1E4200; Thu, 15 Aug 2019 13:17:21 +0200 (CEST)
Date: Thu, 15 Aug 2019 13:17:21 +0200
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 11/11] ubifs: Add quota support
Message-ID: <20190815111721.GC14313@quack2.suse.cz>
References: <20190814121834.13983-1-s.hauer@pengutronix.de>
 <20190814121834.13983-12-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814121834.13983-12-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_041725_362506_2ABD9DCD 
X-CRM114-Status: GOOD (  22.32  )
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
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

On Wed 14-08-19 14:18:34, Sascha Hauer wrote:
> From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> 
> This introduces poor man's quota support for UBIFS. Unlike other
> implementations we never store anything on the flash. This has two
> big advantages:
> 
> - No possible regressions with a changed on-disk format
> - no quota files can get out of sync.
> 
> There are downsides aswell:
> 
> - During mount the whole index must be scanned which takes some time
> - The quota limits must be set manually each time a filesystem is mounted.
> 
> UBIFS is targetted for embedded systems and quota limits are likely not
> changed interactively, so having to restore the quota limits with a
> script shouldn't be a big deal. The mount time penalty is a price we
> must pay, but for that we get a simple and straight forward
> implementation for this rather rarely used feature.
> 
> The quota data itself is stored in a red-black tree in memory. It is
> implemented as a quota format. When enabled with the "quota" mount
> option all three quota types (user, group, project) are enabled.
> 
> The quota integration into UBIFS is taken from a series posted earlier
> by Dongsheng Yang. Like the earlier series we only account regular files
> for quota. All others are counted in the number of files, but do not
> require any quota space.
> 
> iSigned-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Missing Signed-off-by from Dongsheng? Also yours has 'i' there.

> +/**
> + * ubifs_enable_quotas - enable quota
> + * @c: UBIFS file-system description object
> + *
> + * Enable usage tracking for all quota types.
> + */
> +int ubifs_enable_quotas(struct ubifs_info *c)
> +{
> +	struct super_block *sb = c->vfs_sb;
> +	struct quota_info *dqopt = sb_dqopt(sb);
> +	int type;
> +
> +	if (!c->quota_enable)
> +		return 0;
> +
> +	dqopt->flags |= DQUOT_QUOTA_SYS_FILE | DQUOT_NOLIST_DIRTY;
> +
> +	for (type = 0; type < UBIFS_MAXQUOTAS; type++) {
> +		struct mem_dqinfo *info = sb_dqinfo(sb, type);
> +		unsigned int flags = DQUOT_USAGE_ENABLED | DQUOT_LIMITS_ENABLED;
> +
> +		dqopt->flags |= dquot_state_flag(flags, type);
> +		dqopt->info[type].dqi_flags |= DQF_SYS_FILE;
> +		dqopt->ops[type] = &ubifs_format_ops;
> +
> +		info->dqi_max_spc_limit = 0x7fffffffffffffffLL;
> +		info->dqi_max_ino_limit = 0x7fffffffffffffffLL;

This is wrong. You shouldn't mess with quota internals like that. You
should use dquot_enable() (and you even implemented ->read_file_info()
format operation to properly fill in info structure).  So you just need to
change dquot_enable() to cope with situation when inode is NULL. Probably
create a variant dquot_enable_sb() that gets superblock pointer instead of
inode and then factor out bits from vfs_load_quota_inode() that are needed
also for the case without quota inode.

> @@ -956,6 +970,7 @@ static const match_table_t tokens = {
>  	{Opt_ignore, "ubi=%s"},
>  	{Opt_ignore, "vol=%s"},
>  	{Opt_assert, "assert=%s"},
> +	{Opt_quota, "quota"},
>  	{Opt_err, NULL},
>  };

Usually, we have usrquota, grpquota, prjquota mount options to enable
individual quota types. It would seem better not to differ from these
unless you have a good reason.

							Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
