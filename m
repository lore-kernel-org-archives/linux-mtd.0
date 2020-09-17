Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1655C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:42:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C552076D
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:42:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n/3+RIS3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C552076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N/lqSv2OKdJ4verYN/8p82agcfg1lDFoPlz4XBzoVFI=; b=n/3+RIS3J9E1FyK9bO0m469t3
	ruxAsEqb8O6aWniVio/pVcSgC6KMH9AHWmmnEl0wNCXt0ISs7sv8i4weXzTuq17wpQN66oPmJPJVV
	HnQVKDc9JkqqSqguCgZxJZX4TT6PUujMH9AlBq0g3MpNuDH7T4LRaed2EtT5gSIYQ73eChRHTEIk/
	K5NwRnH+J0rLrmKMBGu4doG+TYoyMmMNV7x4FI3cQ6wuPMjmEPErtCaENjNxCvQHBmdU5f67GysGS
	AgG8+sgwUU/YFlNNvKxBOr9ymWSxLNg7gm1syvbZw4BrE5amfIoVDY8Duibgcti1TUH+UzoVBCzGK
	Wex/XmCOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIqPl-0004Cb-RT; Thu, 17 Sep 2020 09:41:17 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIqPj-0004Aq-4G
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 09:41:16 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6C92AFE5;
 Thu, 17 Sep 2020 09:41:47 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id B26A41E12E1; Thu, 17 Sep 2020 11:41:13 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:41:13 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/12] fs: remove the unused SB_I_MULTIROOT flag
Message-ID: <20200917094113.GH7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-2-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_054115_307072_D4794042 
X-CRM114-Status: GOOD (  21.18  )
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
 linux-mtd@lists.infradead.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 10-09-20 16:48:21, Christoph Hellwig wrote:
> The last user of SB_I_MULTIROOT is disappeared with commit f2aedb713c28
> ("NFS: Add fs_context support.")
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Nice. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
> ---
>  fs/namei.c         | 4 ++--
>  include/linux/fs.h | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/namei.c b/fs/namei.c
> index e99e2a9da0f7de..f1eb8ccd2be958 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -568,8 +568,8 @@ static bool path_connected(struct vfsmount *mnt, struct dentry *dentry)
>  {
>  	struct super_block *sb = mnt->mnt_sb;
>  
> -	/* Bind mounts and multi-root filesystems can have disconnected paths */
> -	if (!(sb->s_iflags & SB_I_MULTIROOT) && (mnt->mnt_root == sb->s_root))
> +	/* Bind mounts can have disconnected paths */
> +	if (mnt->mnt_root == sb->s_root)
>  		return true;
>  
>  	return is_subdir(dentry, mnt->mnt_root);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 7519ae003a082c..fbd74df5ce5f34 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1385,7 +1385,6 @@ extern int send_sigurg(struct fown_struct *fown);
>  #define SB_I_CGROUPWB	0x00000001	/* cgroup-aware writeback enabled */
>  #define SB_I_NOEXEC	0x00000002	/* Ignore executables on this fs */
>  #define SB_I_NODEV	0x00000004	/* Ignore devices on this fs */
> -#define SB_I_MULTIROOT	0x00000008	/* Multiple roots to the dentry tree */
>  
>  /* sb->s_iflags to limit user namespace mounts */
>  #define SB_I_USERNS_VISIBLE		0x00000010 /* fstype already mounted */
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
