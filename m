Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D43C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 07:43:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55618204EC
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 07:43:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W/PaYRgp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55618204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAb0ji6x6OJsELmVrR5grvQ8BydugIhrL88twTKcRtc=; b=W/PaYRgpJZnmoB
	vC6auFU8kWGmLIrmJ0c3I23AwRpn2Qkc5y9TUWGw9N/DFzdBTSSIqUTUQVkj6yxx1Tf6oxRlT7t8U
	QzXe9fdFQmkFqeLA3QRyUZ2fPmU/DDTLejpZROAut+7HA810Z9EoN5/AWhydap7KezIH07EpL/TVb
	rwOUh10Uj0ltt4o41ZHZkdTUJP72U5nTi8650bfVHNnPXntEkrlzmwfsXIH9JtZikWr1B+uN3o+BU
	QM2h0XYYTSOJJ7Fc4lcngfnlERADJeJh84dhg1Dp9kuqph2PJpvz6IJcplU+gVVlSb8vC7FVd1+/z
	7T+C4BODJnyWl7FoHvRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guBgX-0008R9-V3; Thu, 14 Feb 2019 07:43:53 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guBgV-0008Qf-5S
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 07:43:53 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C36B9608A389;
 Thu, 14 Feb 2019 08:43:48 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AbZ8NrRKvnOI; Thu, 14 Feb 2019 08:43:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6BF47608A38A;
 Thu, 14 Feb 2019 08:43:48 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dnkhoCgG4jwj; Thu, 14 Feb 2019 08:43:48 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 239DC608A389;
 Thu, 14 Feb 2019 08:43:48 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Hou Tao <houtao1@huawei.com>
Subject: Re: [PATCH] ubifs: reject unsupported ioctl flags explicitly
Date: Thu, 14 Feb 2019 08:43:47 +0100
Message-ID: <4196190.pOxQ1y5nLB@blindfold>
In-Reply-To: <20190209085420.2375-1-houtao1@huawei.com>
References: <20190209085420.2375-1-houtao1@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_234351_353183_2787018C 
X-CRM114-Status: GOOD (  13.54  )
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
Cc: linux-mtd@lists.infradead.org, adrian.hunter@intel.com, dedekind1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Samstag, 9. Februar 2019, 09:54:20 CET schrieb Hou Tao:
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

Makes sense, will queue for the next merge window. :-)

Thanks,
//richard




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
