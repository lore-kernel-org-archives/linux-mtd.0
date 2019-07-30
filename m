Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B3AC433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 00:36:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B612F2070B
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 00:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dUXAxYPt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bll4copU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B612F2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ueW9jRLFaZIakb5KQ8hqtp+M9f4LK9cQL9MiA/1Tjn4=; b=dUXAxYPtXGaDez
	rCrwSeiWQv39Jk+WSkJDzGri/CA/enG6Xm6Ad7Ok6NXmxZRE7AixRjNInrtkr+5Ce+DlVGDm2CMF+
	k4D/RT0hZlk84Xk1Z7WfZ+tV3iBHUAxZez2a1mpdsIUC2SUQve4cjh+nnt2PaHkuv7Rvp37QC4ACs
	CIAY/9LXdgFnuZ2wvIpxMoMo5g/qgSU/2mvvlffThW1Fc5ZvCBFjZp6uSRDzUWMBczSdVxTwSJjPC
	q7MlZNzf58lXwyjvp/1GjhSX/DYJ6NySxT8/+zn5mqwYB3X4RJjY5WgU8ctgrcbIaovx1GpWcaQAG
	g0FlePcM5VPXTcoKlmXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsG7y-0006kN-1C; Tue, 30 Jul 2019 00:36:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsG7v-0006k1-2k
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 00:36:28 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 70C222070B;
 Tue, 30 Jul 2019 00:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564446985;
 bh=KhPYRx4m6xfAnJ1MITKt5VBEq7YANZou64QdZgQk6aU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bll4copUxMRU+/VRQS/9arl3WDnXVMNOvbSTmFhpmI3Cllp0VLUr8RHjVBv0VXE9B
 R/6EIIZbPfGZPhlipbIliwTA1p6lvFf/NwjbpYs6sIlrRDvcXzF+4LGnM1oqVdoRpw
 9Q+hUCAHQeuyOfKHt7iVbV7NeILJisfQnJZej5Pc=
Date: Mon, 29 Jul 2019 17:36:24 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v7 14/16] f2fs: wire up new fscrypt ioctls
Message-ID: <20190730003624.GA47389@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-15-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-15-ebiggers@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_173627_167533_3C9CD313 
X-CRM114-Status: GOOD (  14.93  )
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
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 07/26, Eric Biggers wrote:
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

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

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
> -- 
> 2.22.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
