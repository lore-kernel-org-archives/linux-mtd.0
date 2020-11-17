Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93477C5519F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 18:32:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B99B223C7
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 18:32:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AVKhYY+w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAff5vQT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B99B223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y+xiaCeBZyca29pdSj3Pcv4JhPXxDKSGjqT7z7fsQ9Y=; b=AVKhYY+wm+4LIW5IHLoXn5hJ4
	Myn6m0qkFlp5k+ZT0XO7quuOvDofLbN4O8G/WPs5JKCWc+WUfH+dyUqFzs2GaNMQ/3JkujfPmcSUD
	62VKA2Pc4cz7i5O5roalCcG28ey7VCFEnSdBzacZESsejsNEo476maPdQb0K4yB3MQKkCsRQeQdh8
	p+vaco4PQAxfbFq+eiGxA9mIJpXIP0hnyoILYusL40hbxfTHc7oogeGrvK10NVTGJqER3bZn1W9HG
	zDYRaWpboLP5VgzxlIdP+jbZ5BtxzO0FyYf6USF5mBd6d5/jb/ryz2YhRXPUw1/KR//MgL2zyKZ9H
	1ZQbN9+cQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf5lc-0000x9-H0; Tue, 17 Nov 2020 18:31:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf5lA-0000lJ-1w
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 18:31:44 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92D812222E;
 Tue, 17 Nov 2020 18:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605637879;
 bh=ao2XoyFvOst/o/NixL3wR1q1+HrjIW+xRos2auX+cis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fAff5vQTLS6o1LdCvxQyE8canT3iWN4lhOjqOGcJvd1BEB21bCVXFSHoF5miY2Gel
 79iEFHbzmxHaiCXtfzsJPMSKIhcmI/q+eODrQqe3gNsV6Hx+n0ZoUYbyeZyH63OkED
 kRJNByTFXR1CQLcQyIyq+lVu8j/Kdfzeo2frG81U=
Date: Tue, 17 Nov 2020 10:31:17 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v2 2/3] fscrypt: Have filesystems handle their d_ops
Message-ID: <X7QW9aqdF9ivHKBe@sol.localdomain>
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117040315.28548-3-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_133120_263816_E663D390 
X-CRM114-Status: GOOD (  17.98  )
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 04:03:14AM +0000, Daniel Rosenberg wrote:
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index a8f7a43f031b..df2c66ca370e 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -741,8 +741,9 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
>   * directory's encryption key is available, then the lookup is assumed to be by
>   * plaintext name; otherwise, it is assumed to be by no-key name.
>   *
> - * This also installs a custom ->d_revalidate() method which will invalidate the
> - * dentry if it was created without the key and the key is later added.
> + * After calling this function, a filesystem should ensure that its dentry
> + * operations contain fscrypt_d_revalidate if DCACHE_ENCRYPTED_NAME was set,
> + * so that the dentry can be invalidated if the key is later added.
>   *
>   * Return: 0 on success; -ENOENT if the directory's key is unavailable but the
>   * filename isn't a valid no-key name, so a negative dentry should be created;

This should say DCACHE_NOKEY_NAME, not DCACHE_ENCRYPTED_NAME.

But more importantly, the explanation here isn't very clear.  How about the
following instead:

 * This will set DCACHE_NOKEY_NAME on the dentry if the lookup is by no-key
 * name.  In this case the filesystem must assign the dentry a dentry_operations
 * which contains fscrypt_d_revalidate (or contains a d_revalidate method that
 * calls fscrypt_d_revalidate), so that the dentry will be invalidated if the
 * directory's encryption key is later added.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
