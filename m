Return-Path: <SRS0=A4L3=E4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAC1C56201
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 05:14:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C24CE2078D
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 05:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TbGv2kuT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eTcNT+8p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C24CE2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=24IcM7peL1oR5GiAzldyb4Sfk0Wcbv8U+e1TFW6DIFQ=; b=TbGv2kuTwMLgzqND32Vg30a2F
	TGMvsW5COiEsNSWn+k3IMN/fVWc0TLjG5pBFk2tczE3AmVrdjQpERKKgeELnhUwa2zSc1qIFr9byF
	ZbH4fBxDk6e1XD507CtdqXuVRHwuwxxz8gqQadShMg26Pe38vFgiKx4HhAt0tCo0WvTHbvPGZqipN
	U9L5l7n9rhcYeFPkOrfte75mLauB9wnrrk3AKR8Qo2VCyQqWmwgpEErbpJzVaFKlWQcKdOxV6ttu9
	e7PS1u1qzlZ9kidGQHWqbAtbTkc3uTXYs7XRgLvPsVaJGmDp7k8pWMVCsyez3CYCLYwgBe6s2vuOY
	HlN3nOFtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kghhO-0004eG-Pg; Sun, 22 Nov 2020 05:14:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kghhL-0004bF-Dm
 for linux-mtd@lists.infradead.org; Sun, 22 Nov 2020 05:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606022041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kkf8a6qy5yhhSG9mvfioRD8ySsdwKXfzz3BkGnvDRY4=;
 b=eTcNT+8pBt33FF5y9rzVMWNl1yGjpk/mrKYCHpo9G93/1JHvgf94jcN6O+/j5j9H/5EGUx
 usiYfA2eOiy6442Y1qiwFP3ZvXswTza9CutcCvNNSuutmfM/gnfxpOLWVl4Nbe9eXOzrpE
 wIqNAqZvdgKXXoUo66BARKJhzzaeu2s=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-UMccb9q8MJeSEJJUUy9GNQ-1; Sun, 22 Nov 2020 00:12:34 -0500
X-MC-Unique: UMccb9q8MJeSEJJUUy9GNQ-1
Received: by mail-pf1-f197.google.com with SMTP id a24so10369455pfo.3
 for <linux-mtd@lists.infradead.org>; Sat, 21 Nov 2020 21:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kkf8a6qy5yhhSG9mvfioRD8ySsdwKXfzz3BkGnvDRY4=;
 b=A0JWk4mx7/lHFLSTQbg0UzuIHxCEmlrad4bVxRqkMNo2k59EeXpTjlt5CKXdwopozQ
 Vmaxs742UbIiYvRCgJdp3ffcK6git2UojtTC7uqUG1lY8cJktz9boRRr++EiRRTF7hn+
 +/Pcd1A74rDZypzNyCuw1Gp3si5JbvnfgMwKzAQBGt9LW6Qv7IkF4xz/hVBqv+mzWbie
 RTGxzbZLCccrERILYEkN/EKx/qOoNwdbFc0DiZNRFptkH5BtXQtt073DKIy/7kcmKfqr
 fe69J0t76i3qHJJO9y+H0WmnzHSYwerKAolcXWO0MiOejvgQxbJ2l9L6lYoAgt7mE8MO
 NAWQ==
X-Gm-Message-State: AOAM532+Q+g0l8lJe3QM6raIB6dgW1ngAUYArKxzWfBkU2sO/inaIPIA
 /IFPoa0B+2uih0tBtj9B8qegILs9049/jNP1cfoGVyEM1PYJf3yn3k/xMPdJ9dyj80iizBfPMe4
 7OEvOPbfYHtzsh1OmW4g8ryG40w==
X-Received: by 2002:a63:4513:: with SMTP id s19mr22764178pga.254.1606021953719; 
 Sat, 21 Nov 2020 21:12:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhkBDDpVzvwVvP6QvR7b7bk5JCtZ4ytNenw2ZosC6tbrjTUa7xakgrk4oLyDhCHqqDiw3bXw==
X-Received: by 2002:a63:4513:: with SMTP id s19mr22764154pga.254.1606021953454; 
 Sat, 21 Nov 2020 21:12:33 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b21sm9346038pji.24.2020.11.21.21.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 21:12:33 -0800 (PST)
Date: Sun, 22 Nov 2020 13:12:18 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v4 2/3] fscrypt: Have filesystems handle their d_ops
Message-ID: <20201122051218.GA2717478@xiangao.remote.csb>
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
MIME-Version: 1.0
In-Reply-To: <20201119060904.463807-3-drosen@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_001403_520850_16F6B2EA 
X-CRM114-Status: GOOD (  16.98  )
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
 Eric Biggers <ebiggers@google.com>, Richard Weinberger <richard@nod.at>,
 Chao Yu <chao@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all,

On Thu, Nov 19, 2020 at 06:09:03AM +0000, Daniel Rosenberg wrote:
> This shifts the responsibility of setting up dentry operations from
> fscrypt to the individual filesystems, allowing them to have their own
> operations while still setting fscrypt's d_revalidate as appropriate.
> 
> Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
> they have their own specific dentry operations as well. That operation
> will set the minimal d_ops required under the circumstances.
> 
> Since the fscrypt d_ops are set later on, we must set all d_ops there,
> since we cannot adjust those later on. This should not result in any
> change in behavior.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> Acked-by: Eric Biggers <ebiggers@google.com>
> ---

...

>  extern const struct file_operations ext4_dir_operations;
>  
> -#ifdef CONFIG_UNICODE
> -extern const struct dentry_operations ext4_dentry_ops;
> -#endif
> -
>  /* file.c */
>  extern const struct inode_operations ext4_file_inode_operations;
>  extern const struct file_operations ext4_file_operations;
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index 33509266f5a0..12a417ff5648 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1614,6 +1614,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
>  	struct buffer_head *bh;
>  
>  	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
> +	generic_set_encrypted_ci_d_ops(dentry);

One thing might be worth noticing is that currently overlayfs might
not work properly when dentry->d_sb->s_encoding is set even only some
subdirs are CI-enabled but the others not, see generic_set_encrypted_ci_d_ops(),
ovl_mount_dir_noesc => ovl_dentry_weird()

For more details, see:
https://android-review.googlesource.com/c/device/linaro/hikey/+/1483316/2#message-2e1f6ab0010a3e35e7d8effea73f60341f84ee4d

Just found it by chance (and not sure if it's vital for now), and
a kind reminder about this.

Thanks,
Gao Xiang


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
