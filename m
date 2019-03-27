Return-Path: <SRS0=crBW=R6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22954C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2019 13:53:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E35ED2075E
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2019 13:53:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SU3NhjUV";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="WfWNfV+d";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="GiipJnaL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E35ED2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XFXzBkPjUu9E5N+CPsmUS4KP08aCZpEcy+K7H7wpyzc=; b=SU3NhjUVhm/NlyWFZZfqmzPxH
	cl85LiTMF7DoEZju3O9HK5EnCqitKgpG484ACvtSN43KRc7KTp2EanmhW6Zpsw9q70AYeF1rGJdtW
	YoB4qpBTTCogEoHF9a0VJm73+rqWoHZ9PeImYzrsDFPB0ROm6zZ9H1TIiFuARqIJFLzLl7+i6IHeF
	aT+1fjoeT3MiMLvf5rWuqcCvTlKvHlun/YayxuT7a3rDs1prVBmJ6nLjn8JifdES3kOKx41lgNxi3
	up1LT9kRQ/iWXzUAA0i8fUTzf3mTgJKH/M4qxyU9ilInU5SrhGs1/izlUdld4aDJc3m6+czozADxa
	L7dLFkR/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h98ze-0003WZ-Nm; Wed, 27 Mar 2019 13:53:26 +0000
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h98zY-0003OP-0M
 for linux-mtd@lists.infradead.org; Wed, 27 Mar 2019 13:53:21 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 7AE9161A25; Wed, 27 Mar 2019 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1553694799;
 bh=JmUbfQxsHOj5SXBkCsYMoFaxqHxlEGh95LyB0+AhJwQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=WfWNfV+dw476+pknIKEXgTRG8fRae1Ii7kQ5GmU0RQFbGcmcjJfgW2Cjr/PMAvWED
 Gm2wUcii+7JvMUuzMXjXBIj2I5SPK4UkfqP5+MoaQkPpHioyAFHANAsFjx+srUuefO
 V6s0pYLeFwXNLvfzyoDbc2RXH2EwWaSz2BeAUm0U=
Received: from [10.204.79.83]
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: mojha@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4807461A25;
 Wed, 27 Mar 2019 13:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1553694797;
 bh=JmUbfQxsHOj5SXBkCsYMoFaxqHxlEGh95LyB0+AhJwQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=GiipJnaLqXZAXxB/yqF/KOtYicyHlKQkPn29iHemSZ3Ue9fbREZmcKMoSy+kxbUAS
 q6YIOWyIjYZJmqp0p16qqBufZ1RrTpMrQjFoynxM3LFcDPJc3ORiTCcRdOLh4/UA0j
 kMxB6/XPBZqR5HeWPkkTn+MCwcvngvBAooxyl928=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4807461A25
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=mojha@codeaurora.org
Subject: Re: [PATCH] fs: fix warning about Using plain integer as NULL pointer
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
 Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20190322221021.GA24814@hari-Inspiron-1545>
From: Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <ac5a9f95-e04a-54bc-e7cb-4103555a79b4@codeaurora.org>
Date: Wed, 27 Mar 2019 19:23:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190322221021.GA24814@hari-Inspiron-1545>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_065320_089931_5686570B 
X-CRM114-Status: GOOD (  16.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 3/23/2019 3:40 AM, Hariprasad Kelam wrote:
> Sparse warning below:
>
> sudo make C=2 CF=-D__CHECK_ENDIAN__ M=fs
>
> CHECK   fs/f2fs/data.c
> fs/f2fs/data.c:426:47: warning: Using plain integer as NULL pointer
> CHECK   fs/notify/fdinfo.c
> fs/notify/fdinfo.c:53:87: warning: Using plain integer as NULL pointer
>   CHECK   fs/ubifs/xattr.c
> fs/ubifs/xattr.c:615:58: warning: Using plain integer as NULL pointer
>
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

-Mukesh

> ---
>   fs/f2fs/data.c     | 2 +-
>   fs/notify/fdinfo.c | 2 +-
>   fs/ubifs/xattr.c   | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 97279441..15a2381 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -423,7 +423,7 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
>   
>   void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type)
>   {
> -	__submit_merged_write_cond(sbi, NULL, 0, 0, type, true);
> +	__submit_merged_write_cond(sbi, NULL, NULL, 0, type, true);
>   }
>   
>   void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
> diff --git a/fs/notify/fdinfo.c b/fs/notify/fdinfo.c
> index 1e2bfd2..ef83f40 100644
> --- a/fs/notify/fdinfo.c
> +++ b/fs/notify/fdinfo.c
> @@ -50,7 +50,7 @@ static void show_mark_fhandle(struct seq_file *m, struct inode *inode)
>   	f.handle.handle_bytes = sizeof(f.pad);
>   	size = f.handle.handle_bytes >> 2;
>   
> -	ret = exportfs_encode_inode_fh(inode, (struct fid *)f.handle.f_handle, &size, 0);
> +	ret = exportfs_encode_inode_fh(inode, (struct fid *)f.handle.f_handle, &size, NULL);
>   	if ((ret == FILEID_INVALID) || (ret < 0)) {
>   		WARN_ONCE(1, "Can't encode file handler for inotify: %d\n", ret);
>   		return;
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index f5ad1ed..066a566 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -612,7 +612,7 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
>   	int err;
>   
>   	err = security_inode_init_security(inode, dentry, qstr,
> -					   &init_xattrs, 0);
> +					   &init_xattrs, NULL);
>   	if (err) {
>   		struct ubifs_info *c = dentry->i_sb->s_fs_info;
>   		ubifs_err(c, "cannot initialize security for inode %lu, error %d",

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
