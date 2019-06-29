Return-Path: <SRS0=pBCJ=U4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214F0C4321A
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2019 07:05:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDA7D214AF
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2019 07:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lr39owcH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gfu5Pz78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDA7D214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6vuyLDsDb36nCeS3zb6M7zoF4cwuBaQJe8h4et9ySE=; b=lr39owcHgSDLxT
	558yVxM9B5ghqh0/L+hSwMxZgS/JIQelNKtUgLTpxhFA1dMiLR/0/yitNrN/JdM6ytC/P479jDBz2
	6vyrjJ5gAJbenw87/kvBSMV91Z9/4JimFdZskxaZlrmJSdMszXJXegyFfXNJjhfqxARBdWverJJ7t
	e9yuEHM7K6ugN9nEJ6DkdQzoLuVkoZG4iNhsEp4uy2W5+r497mRPQOSohVBqmCMEoyFKYErrjqgF3
	9LWXRJfPjXmreNLmWHkdbSIbODL0MS8biBrOLeLRfiE55RcGm1R1Nf0G0iVUtIrfsRY1GhUrIaLnR
	ZmIAZtra1MvGN9J37Fag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hh7QB-0004PZ-Vb; Sat, 29 Jun 2019 07:05:16 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hh7Q0-00038Q-1L
 for linux-mtd@lists.infradead.org; Sat, 29 Jun 2019 07:05:11 +0000
Received: by mail-yb1-xb44.google.com with SMTP id l22so1634492ybf.4
 for <linux-mtd@lists.infradead.org>; Sat, 29 Jun 2019 00:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xM/xcvkzohmQdtVDVPIgTFxuHjb4HOBVLFjrfhylohA=;
 b=Gfu5Pz78tLVKvI8Q9WtRwxoZiso9oqghADUZOQqtlF6a4PF4ZC24i4bhdxEFOWT9mb
 ogpxVnV34CUKT9Hp3X/zqMkMMajHb+ZB117iqrYsimXsLjh5l46Ev8rT8yc8cIX3yIvp
 pPvNValE4fvXkmuBjtLVOlUXgnPgouNfZrFrcwZJP2fDEoyBu6UDZfe0+vDH3DvWwhm2
 zDFMbFYJkqZlfRqwPcIjOiXLiRHvuGtOYey5wWMnlJCELzFsocHIwB5e56zebm7P/vZi
 S6f79kvT8PuUPJTo2r7gwPTQl2Z6a4vDBem6y6JYpyyoLzjF+dqkakkpoHJf+XnufEOL
 I8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xM/xcvkzohmQdtVDVPIgTFxuHjb4HOBVLFjrfhylohA=;
 b=IZbEw3jzNk9ZegSr8fsXziWZjug+iEBBe9ubTXTiI4/awWe0AumKSR3o3dbf1aYgTU
 TRbirqNrFAXWC3Oeg9jmBaThLZf3tliusl0pgQdeUAxx25fGxZ0F0G5bmn/IC4UCLirJ
 m2obfT9QY5k4za2SCi7NWipyfkqEtVsAHOsX2dCr24IWVE/bQwAdsFKRlLEzx5/VOzhm
 4SNhetBLHRRqoUFTrNNkEHZltgOR6eowqqUM+Td14wnQcvvINlYoYiYgfFDOtM53TqiG
 McKpapZsvqPLT1KhhhhDcKGySaYcmrsMd8DZM98i94KZUw5ZxMppN71/Y0Lyl+9Tf1V/
 wbIg==
X-Gm-Message-State: APjAAAXYLJ6aRtNyKf0X1qqSrk09wtHPGyQAIcquzykVxsc6MSo+J/TN
 Y3dNpTE2sGYh8+GnVvSg9RP7pz6KEmI3eEPu5gw=
X-Google-Smtp-Source: APXvYqxU4FPLSq/gM1nVlP+fbK0BmSrMY2hESytnxCDMdjqY3j5BqEk3eirFdcbLmu5rTiIZzzGPOTH2wPbd9PuZuhY=
X-Received: by 2002:a25:8489:: with SMTP id v9mr8918225ybk.144.1561791901221; 
 Sat, 29 Jun 2019 00:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <156174687561.1557469.7505651950825460767.stgit@magnolia>
 <156174690758.1557469.9258105121276292687.stgit@magnolia>
In-Reply-To: <156174690758.1557469.9258105121276292687.stgit@magnolia>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 29 Jun 2019 10:04:50 +0300
Message-ID: <CAOQ4uxgG5Kijx=nzFRB0uFPMghJXDfCqxKEWQoePwKZTGO+NMg@mail.gmail.com>
Subject: Re: [PATCH 4/4] vfs: don't allow most setxattr to immutable files
To: "Darrick J. Wong" <darrick.wong@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190629_000504_990661_DC43C2C5 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: linux-efi@vger.kernel.org, Linux Btrfs <linux-btrfs@vger.kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Linux MM <linux-mm@kvack.org>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Ext4 <linux-ext4@vger.kernel.org>,
 devel@lists.orangefs.org, Josef Bacik <josef@toxicpanda.com>,
 reiserfs-devel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Tso <tytso@mit.edu>, ard.biesheuvel@linaro.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs <linux-xfs@vger.kernel.org>,
 jk@ozlabs.org, Jan Kara <jack@suse.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 28, 2019 at 9:37 PM Darrick J. Wong <darrick.wong@oracle.com> wrote:
>
> From: Darrick J. Wong <darrick.wong@oracle.com>
>
> The chattr manpage has this to say about immutable files:
>
> "A file with the 'i' attribute cannot be modified: it cannot be deleted
> or renamed, no link can be created to this file, most of the file's
> metadata can not be modified, and the file can not be opened in write
> mode."
>
> However, we don't actually check the immutable flag in the setattr code,
> which means that we can update inode flags and project ids and extent
> size hints on supposedly immutable files.  Therefore, reject setflags
> and fssetxattr calls on an immutable file if the file is immutable and
> will remain that way.
>
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> ---
>  fs/inode.c |   27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
>
> diff --git a/fs/inode.c b/fs/inode.c
> index cf07378e5731..4261c709e50e 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2214,6 +2214,14 @@ int vfs_ioc_setflags_prepare(struct inode *inode, unsigned int oldflags,
>             !capable(CAP_LINUX_IMMUTABLE))
>                 return -EPERM;
>
> +       /*
> +        * We aren't allowed to change any other flags if the immutable flag is
> +        * already set and is not being unset.
> +        */
> +       if ((oldflags & FS_IMMUTABLE_FL) && (flags & FS_IMMUTABLE_FL) &&
> +           oldflags != flags)
> +               return -EPERM;
> +
>         /*
>          * Now that we're done checking the new flags, flush all pending IO and
>          * dirty mappings before setting S_IMMUTABLE on an inode via
> @@ -2284,6 +2292,25 @@ int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
>             !(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode)))
>                 return -EINVAL;
>
> +       /*
> +        * We aren't allowed to change any fields if the immutable flag is
> +        * already set and is not being unset.
> +        */
> +       if ((old_fa->fsx_xflags & FS_XFLAG_IMMUTABLE) &&
> +           (fa->fsx_xflags & FS_XFLAG_IMMUTABLE)) {
> +               if (old_fa->fsx_xflags != fa->fsx_xflags)
> +                       return -EPERM;
> +               if (old_fa->fsx_projid != fa->fsx_projid)
> +                       return -EPERM;
> +               if ((fa->fsx_xflags & (FS_XFLAG_EXTSIZE |
> +                                      FS_XFLAG_EXTSZINHERIT)) &&
> +                   old_fa->fsx_extsize != fa->fsx_extsize)
> +                       return -EPERM;
> +               if ((old_fa->fsx_xflags & FS_XFLAG_COWEXTSIZE) &&
> +                   old_fa->fsx_cowextsize != fa->fsx_cowextsize)
> +                       return -EPERM;
> +       }
> +

I would like to reject this for the sheer effort on my eyes, but
I'll try harder to rationalize.

How about memcmp(fa, old_fa, offsetof(struct fsxattr, fsx_pad))?

Would be more robust to future struct fsxattr changes and generally
more easy on the eyes.

Sure, there is the possibility of userspace passing uninitialized
fsx_extsize/fsx_cowextsize without setting the flag, but is that
a real concern for the very few tools that are used to chattr?
Those tools, when asked to set an attribute, will first get
struct fsxattr from fs, then change the requested attr and set the
fsxattr struct. So IMO the chances of this causing any regression
or unexpected behavior are ridiculously low.

Thanks,
Amir.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
