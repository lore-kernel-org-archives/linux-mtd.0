Return-Path: <SRS0=z7rv=V6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAA1C32750
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Aug 2019 08:10:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42AA620665
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Aug 2019 08:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HkJuRqU/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42AA620665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9AF81IJSgBknFGcW27C7hjv6JN4jv0ZACzDj5hcw+L8=; b=HkJuRqU/Pah2lH
	eq4uXYEQU9DeLiqnhAG9E3kKpmFznC3IoXXNwraaPRM+iebGxJv/YImgG27Sj9WhjjlCutMuVjDI8
	w4zPB+0MiOzJrNAtyWtAlwR67qiiV5jS+JmD3ZA6w59rS8JlU2vAmzts/HOnzSbKKw6C9J+S/wGW1
	8XoQ9UvYZSsw1a1Y3V/8iWVi5q5Q42tWV2SqO8LpU2R4UMSWjwX4lE6mPDxxGWfPtuMyoTdWipS2I
	828NKb7aAGFK8/5e4lQJU0tg8Kkr/GuXcRA7/ZYxsH155MHCLaEX1AhcVaJEEWNOkUCMZ5UAC4vuV
	7gGFnjPSGDBTtNvv6IKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htSdz-0004G1-Kv; Fri, 02 Aug 2019 08:10:31 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htSdv-0004BL-Q2
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2019 08:10:29 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BB2431235F7661B2BA51;
 Fri,  2 Aug 2019 16:10:21 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 16:10:17 +0800
Subject: Re: [PATCH v7 14/16] f2fs: wire up new fscrypt ioctls
To: Eric Biggers <ebiggers@kernel.org>, <linux-fscrypt@vger.kernel.org>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-15-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e3cf53a7-faf2-0321-22de-07d2e2783752@huawei.com>
Date: Fri, 2 Aug 2019 16:10:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190726224141.14044-15-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190802_011028_126363_07BBBF4F 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Eric,

On 2019/7/27 6:41, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Wire up the new ioctls for adding and removing fscrypt keys to/from the
> filesystem, and the new ioctl for retrieving v2 encryption policies.
> 
> FS_IOC_REMOVE_ENCRYPTION_KEY also required making f2fs_drop_inode() call
> fscrypt_drop_inode().
> 
> For more details see Documentation/filesystems/fscrypt.rst and the
> fscrypt patches that added the implementation of these ioctls.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

BTW, do you think it needs to make xxfs_has_support_encrypt() function be a
common interface defined in struct fscrypt_operations, as I see all
fscrypt_ioctl_*() needs to check with it, tho such cleanup is minor...

Thanks,

> ---
>  fs/f2fs/file.c  | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  fs/f2fs/super.c |  2 ++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f8d46df8fa9ee..d81dda290b829 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2184,6 +2184,40 @@ static int f2fs_ioc_get_encryption_pwsalt(struct file *filp, unsigned long arg)
>  	return err;
>  }
>  
> +static int f2fs_ioc_get_encryption_policy_ex(struct file *filp,
> +					     unsigned long arg)
> +{
> +	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
> +		return -EOPNOTSUPP;
> +
> +	return fscrypt_ioctl_get_policy_ex(filp, (void __user *)arg);
> +}
> +
> +static int f2fs_ioc_add_encryption_key(struct file *filp, unsigned long arg)
> +{
> +	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
> +		return -EOPNOTSUPP;
> +
> +	return fscrypt_ioctl_add_key(filp, (void __user *)arg);
> +}
> +
> +static int f2fs_ioc_remove_encryption_key(struct file *filp, unsigned long arg)
> +{
> +	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
> +		return -EOPNOTSUPP;
> +
> +	return fscrypt_ioctl_remove_key(filp, (const void __user *)arg);
> +}
> +
> +static int f2fs_ioc_get_encryption_key_status(struct file *filp,
> +					      unsigned long arg)
> +{
> +	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
> +		return -EOPNOTSUPP;
> +
> +	return fscrypt_ioctl_get_key_status(filp, (void __user *)arg);
> +}
> +
>  static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
> @@ -3109,6 +3143,14 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_ioc_get_encryption_policy(filp, arg);
>  	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
>  		return f2fs_ioc_get_encryption_pwsalt(filp, arg);
> +	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
> +		return f2fs_ioc_get_encryption_policy_ex(filp, arg);
> +	case FS_IOC_ADD_ENCRYPTION_KEY:
> +		return f2fs_ioc_add_encryption_key(filp, arg);
> +	case FS_IOC_REMOVE_ENCRYPTION_KEY:
> +		return f2fs_ioc_remove_encryption_key(filp, arg);
> +	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
> +		return f2fs_ioc_get_encryption_key_status(filp, arg);
>  	case F2FS_IOC_GARBAGE_COLLECT:
>  		return f2fs_ioc_gc(filp, arg);
>  	case F2FS_IOC_GARBAGE_COLLECT_RANGE:
> @@ -3236,6 +3278,10 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case F2FS_IOC_SET_ENCRYPTION_POLICY:
>  	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
>  	case F2FS_IOC_GET_ENCRYPTION_POLICY:
> +	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
> +	case FS_IOC_ADD_ENCRYPTION_KEY:
> +	case FS_IOC_REMOVE_ENCRYPTION_KEY:
> +	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
>  	case F2FS_IOC_GARBAGE_COLLECT:
>  	case F2FS_IOC_GARBAGE_COLLECT_RANGE:
>  	case F2FS_IOC_WRITE_CHECKPOINT:
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6de6cda440315..f5fae8d511a20 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -913,6 +913,8 @@ static int f2fs_drop_inode(struct inode *inode)
>  		return 0;
>  	}
>  	ret = generic_drop_inode(inode);
> +	if (!ret)
> +		ret = fscrypt_drop_inode(inode);
>  	trace_f2fs_drop_inode(inode, ret);
>  	return ret;
>  }
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
