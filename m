Return-Path: <SRS0=JW0y=I5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4F6C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Mar 2021 04:56:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50C776187E
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Mar 2021 04:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50C776187E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yEH61bAPpSV1UGJlVmNzjIDApd2hEYP3sQUznRDpsdc=; b=jJTazwwY9EKi43HL36GesRXJV
	DmL+tXXlOlHEttnxHZaGzG5nd24TIVwmlsGz2mXbpI39z6DwnU80lk4Rw2S4Lpd10VkKc40UJP1zA
	rpk+39WB9CLF0YvQaHGCmVvGL8N0mqDxKiK5v54jQPD2gSm6i2UM5eRGefUIYKtKIAV7bghL7nMH8
	4BTILPD/vI5WFJjcCzHccxBqkBr0MPwqhVpZDfF6DXJPXgWv/zhegNhZgJbnfmm2UmaweOBoqRwJS
	EdV10sjpMPZm63RqudsYuX0GMmQ9ts9sPaTcaSgyuPUHMcPQpP4fsBSXoYTiSfX5QT4mSciA9HA0o
	z0h9o+yzw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRSt3-005UsK-Dk; Wed, 31 Mar 2021 04:55:25 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRSsw-005Uqx-IP
 for linux-mtd@lists.infradead.org; Wed, 31 Mar 2021 04:55:20 +0000
Received: by mail-lf1-x12c.google.com with SMTP id o126so27257136lfa.0
 for <linux-mtd@lists.infradead.org>; Tue, 30 Mar 2021 21:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vWM2i/Jx+bgof7D8MVRWvlYvDcBJTZI4MpLJfBGFFVk=;
 b=VT3ZzBbYHwc1X0kR4cjMxXLUu6aCOb5AUG3Qb1EuY5hFuqGu3AzdnYXaJQmMPlOZuD
 OiHResEevDsvjTP2KRTX4qaiSLOoAFWHj3xoAX0DECTimqJ75wj3ON6f8qJkNvvolYcw
 cVxX+mTAoDM18OqFxORXJYuJn/4lYaSVXSg0UmOs7mggZNVm7yYgMEqsAUA0K4sf/zug
 XFMtT+2iWaY5uCtG4zIttrPkSpeQKNOVbq0eoUuz9eBCg7ERmwV88KPLk+j4kqZMF9qy
 qFHOd+31boZPFnqTWfbejArZjMstg6LFPTcBW5iR0vSWMiqSmMzGYg7QUaPWLpiV91J6
 KA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vWM2i/Jx+bgof7D8MVRWvlYvDcBJTZI4MpLJfBGFFVk=;
 b=hoxd9aj8uMxTmHJs+kGBGhPKNlIRgWWYIoZKKEGZMBYenweVm/hCe1uIDNHGHduB3L
 FBmTznRdK8ryDjVbm9DydroMr72ilSz6k633+qQsneLq7ISXFJL5aTiYV81PWR4Kktv+
 VwdmzuTRZ5kQKPFhXYcoLWDbAdCoXot2x/tGPv/CCmQEaHP/lJksld7Mqw/hbDbQ0GAd
 bBO+Lb1BvWqrk+ZE8qoCzBYdyaTQWyDQJCx9EtDbqvXFXM2HmoXu28gaCrWYxv1KEsme
 dq8LAgZOKN+wQAEsMgXCdahbvm+8V/Trf1w1rSyJwTBh+GQ0cxC4AdP1x52iu8b6NAWC
 ohgQ==
X-Gm-Message-State: AOAM530h7YoJXNMtGzCftl8KUevEtMXiXImslANoOe4EspFfSlpIK0d/
 GaLEoPKDKNHsrrtM1jbWDtruIiJFxMiGl+X9kdk=
X-Google-Smtp-Source: ABdhPJyt8sVTIXnZKzCxMyktj5iNCSIX8kBZeQPZb/A4JrasC+CsaiAvX5n/u9azIgLNBWQnUL4w2BDyEIOb8vr2skM=
X-Received: by 2002:a19:b81:: with SMTP id 123mr1027890lfl.553.1617166516732; 
 Tue, 30 Mar 2021 21:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210330134537.423447-1-joel@jms.id.au>
In-Reply-To: <20210330134537.423447-1-joel@jms.id.au>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 31 Mar 2021 12:55:05 +0800
Message-ID: <CAARXrtn8bq9X5nDVYrGDxT4O8xWknb0nErG_SjZRUZbbk5nguA@mail.gmail.com>
Subject: Re: [PATCH] jffs2: Hook up splice_write callback
To: Joel Stanley <joel@jms.id.au>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Al Viro <viro@zeniv.linux.org.uk>, Kees Cook <keescook@chromium.org>, 
 Christoph Hellwig <hch@lst.de>, "William A . Kennington III" <wak@google.com>,
 linux-mtd@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_055518_843526_DECE4C6B 
X-CRM114-Status: GOOD (  21.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 30, 2021 at 9:45 PM Joel Stanley <joel@jms.id.au> wrote:
>
> overlayfs using jffs2 as the upper filesystem would fail in some cases
> since moving to v5.10. The test case used was to run 'touch' on a file
> that exists in the lower fs, causing the modification time to be
> updated. It returns EINVAL when the bug is triggered.
>
> A bisection showed this was introduced in v5.9-rc1, with commit
> 36e2c7421f02 ("fs: don't allow splice read/write without explicit ops").
> Reverting that commit restores the expected behaviour.
>
> Some digging showed that this was due to jffs2 lacking an implementation
> of splice_write. (For unknown reasons the warn_unsupported that should
> trigger was not displaying any output).
>
> Adding this patch resolved the issue and the test now passes.
>
> Fixes: 36e2c7421f02 ("fs: don't allow splice read/write without explicit ops")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  fs/jffs2/file.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
> index f8fb89b10227..4fc8cd698d1a 100644
> --- a/fs/jffs2/file.c
> +++ b/fs/jffs2/file.c
> @@ -57,6 +57,7 @@ const struct file_operations jffs2_file_operations =
>         .mmap =         generic_file_readonly_mmap,
>         .fsync =        jffs2_fsync,
>         .splice_read =  generic_file_splice_read,
> +       .splice_write = iter_file_splice_write,
>  };
>
>  /* jffs2_file_inode_operations */
> --
> 2.30.2
>

Verified on g220a openbmc system that the patch fixes the issue.

Tested-by: Lei YU <yulei.sh@bytedance.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
