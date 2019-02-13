Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94789C282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 06:50:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 643DD222BE
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 06:50:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JyoZLpVk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 643DD222BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wm/Tox9eWVs2GjYzPGN/NNvvfvYrbZMtOyQOKMZAAGA=; b=JyoZLpVkgpv6Dm
	JPcX8/vPVf2iua/UIYsACqC4XIicJs3B/w4h3ganKtSGOJpDB1LPg2kANHwo2uTIhjUeSAMFoCghW
	nibhcwrkT5K/TUKGzLBYFPhzENk55wPLOz//zaUEYW69+M16FcD5s3/3uopgWfM30kPbrk7+ZkY4b
	Tx/5ValijC4C3Rnri+IJz121llwSqJIVjL/lcvaTAmTmTZPgye24dvfMpQE+T4estMirLGKDv+dD2
	f4p7fUFaO65ZwFMW8fJf+TrHzGXat9adZVhrQr/HDLpljpOKEjCkEPhGwEhLBwF4efmeIKFrCjglT
	7YcSzZmNks6DXv6orKiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtoNj-0004wk-F5; Wed, 13 Feb 2019 06:50:55 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtoNg-0004w2-4D
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2019 06:50:53 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AA4A9E2C14194E7BE5E0;
 Wed, 13 Feb 2019 14:50:45 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.14) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.408.0; Wed, 13 Feb 2019
 14:50:42 +0800
Subject: Re: [PATCH] ubifs: reject unsupported ioctl flags explicitly
To: <linux-mtd@lists.infradead.org>
References: <20190209085420.2375-1-houtao1@huawei.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <5a556b50-9af3-0f0d-7638-cfa808e31946@huawei.com>
Date: Wed, 13 Feb 2019 14:50:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190209085420.2375-1-houtao1@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.177.31.14]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_225052_339062_E6806DFB 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: richard@nod.at, adrian.hunter@intel.com, dedekind1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ping ?

On 2019/2/9 16:54, Hou Tao wrote:
> Reject unsupported ioctl flags explicitly, so the following command
> on a regular ubifs file will fail:
> 	chattr +d ubifs_file
> 
> And xfstests generic/424 will pass.
> 
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  fs/ubifs/ioctl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
> index 0164bcc827f8..daf9f93e15de 100644
> --- a/fs/ubifs/ioctl.c
> +++ b/fs/ubifs/ioctl.c
> @@ -28,6 +28,11 @@
>  #include <linux/mount.h>
>  #include "ubifs.h"
>  
> +/* Need to be kept consistent with checked flags in ioctl2ubifs() */
> +#define UBIFS_SUPPORTED_IOCTL_FLAGS \
> +	(FS_COMPR_FL | FS_SYNC_FL | FS_APPEND_FL | \
> +	 FS_IMMUTABLE_FL | FS_DIRSYNC_FL)
> +
>  /**
>   * ubifs_set_inode_flags - set VFS inode flags.
>   * @inode: VFS inode to set flags for
> @@ -169,6 +174,9 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  		if (get_user(flags, (int __user *) arg))
>  			return -EFAULT;
>  
> +		if (flags & ~UBIFS_SUPPORTED_IOCTL_FLAGS)
> +			return -EOPNOTSUPP;
> +
>  		if (!S_ISDIR(inode->i_mode))
>  			flags &= ~FS_DIRSYNC_FL;
>  
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
