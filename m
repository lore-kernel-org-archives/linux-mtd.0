Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1525C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 16:28:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E7982087C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 16:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sbou2jDS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E7982087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2OBrgxvlSNyY55mCmaEegamx/ByMw/PcXae+4PL4SU=; b=sbou2jDSbRTC3F
	bO2YqbbXe9xW+/dmC8IBK9ud/D0seDC97uZyQf8LeYm1YL4jTquxA1c4BEahjvjg244eFm/0aYtUQ
	5gLCOKE2gdu8qg/pvu8BaIMlBtPPVH1YFPoZrRTtrU1CCrSbxdBIX68TiRbHdwvVVAafpFKzuI8hF
	Jmq5uig81NT3VB15sQVzvwefWrP2vmQxOMG7PrabIxPWmE0nn5F7WtnmMNhYTvXZKu6FMzWlSOr3g
	C8FTEOdWRwe71wOK0myG0j2Duwag5sCJoNi/bjkrO+PgBBcYnjez2xTDFLeDJCTAN8L75pLFd30o8
	dHcNgF7VXtUK76Xg2nxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8SSy-0001vl-2d; Mon, 25 Mar 2019 16:28:52 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8SSu-0001v4-Mz
 for linux-mtd@lists.infradead.org; Mon, 25 Mar 2019 16:28:51 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C2CC9AFDA;
 Mon, 25 Mar 2019 16:28:45 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id CA5401E429A; Mon, 25 Mar 2019 17:28:44 +0100 (CET)
Date: Mon, 25 Mar 2019 17:28:44 +0100
From: Jan Kara <jack@suse.cz>
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Subject: Re: [PATCH] fs: fix warning about Using plain integer as NULL pointer
Message-ID: <20190325162844.GD8308@quack2.suse.cz>
References: <20190322221021.GA24814@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190322221021.GA24814@hari-Inspiron-1545>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_092849_523873_AA97A378 
X-CRM114-Status: GOOD (  16.91  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 Chao Yu <yuchao0@huawei.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat 23-03-19 03:40:21, Hariprasad Kelam wrote:
> Sparse warning below:
> 
> sudo make C=2 CF=-D__CHECK_ENDIAN__ M=fs
> 
> CHECK   fs/f2fs/data.c
> fs/f2fs/data.c:426:47: warning: Using plain integer as NULL pointer
> CHECK   fs/notify/fdinfo.c
> fs/notify/fdinfo.c:53:87: warning: Using plain integer as NULL pointer
>  CHECK   fs/ubifs/xattr.c
> fs/ubifs/xattr.c:615:58: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>

fs/notify part looks good to me. Feel free to add:

Acked-by: Jan Kara <jack@suse.cz>

								Honza


> ---
>  fs/f2fs/data.c     | 2 +-
>  fs/notify/fdinfo.c | 2 +-
>  fs/ubifs/xattr.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 97279441..15a2381 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -423,7 +423,7 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
>  
>  void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type)
>  {
> -	__submit_merged_write_cond(sbi, NULL, 0, 0, type, true);
> +	__submit_merged_write_cond(sbi, NULL, NULL, 0, type, true);
>  }
>  
>  void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
> diff --git a/fs/notify/fdinfo.c b/fs/notify/fdinfo.c
> index 1e2bfd2..ef83f40 100644
> --- a/fs/notify/fdinfo.c
> +++ b/fs/notify/fdinfo.c
> @@ -50,7 +50,7 @@ static void show_mark_fhandle(struct seq_file *m, struct inode *inode)
>  	f.handle.handle_bytes = sizeof(f.pad);
>  	size = f.handle.handle_bytes >> 2;
>  
> -	ret = exportfs_encode_inode_fh(inode, (struct fid *)f.handle.f_handle, &size, 0);
> +	ret = exportfs_encode_inode_fh(inode, (struct fid *)f.handle.f_handle, &size, NULL);
>  	if ((ret == FILEID_INVALID) || (ret < 0)) {
>  		WARN_ONCE(1, "Can't encode file handler for inotify: %d\n", ret);
>  		return;
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index f5ad1ed..066a566 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -612,7 +612,7 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
>  	int err;
>  
>  	err = security_inode_init_security(inode, dentry, qstr,
> -					   &init_xattrs, 0);
> +					   &init_xattrs, NULL);
>  	if (err) {
>  		struct ubifs_info *c = dentry->i_sb->s_fs_info;
>  		ubifs_err(c, "cannot initialize security for inode %lu, error %d",
> -- 
> 2.7.4
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
