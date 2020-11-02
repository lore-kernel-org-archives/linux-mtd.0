Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935BCC2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:31:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E865D22275
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VyUZudRX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLuIKgWr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E865D22275
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=31bYdzXGjhTX8z3IAlMFZ5D12hcbbNm4a2BhiEPSCYk=; b=VyUZudRXQ/rzvq/3GtsiTBGBR
	NvAmBvCeOScU0wbcYp466PF1DYtiFWF/Uw3WFBjkGFaledxBE7UNFIyzMkQtw7/KsWXJB40K7WFAo
	YOZF0URwyzYALyX9eqWls24P+R8puWhvDP6kIpO1Kw+bBmlzzUqBSLzUAe9eZPFFWGIbaszXpEh2o
	9Hl0Ix4ofekJA+JNAIKiZ1Yjnzor1MVfHbg9S6E1ps5eU1JDtT9RASzgeluSlnd4EcAN9k9Qq+wOQ
	2Qx7gENCoebGzhvbE6jCbtAe5PGlSCxgYWLARu7m4Q48l/xe4BwlS4uTlFimubQDTaN9uIHrC3arN
	6wB3/B+Lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZY2S-0003oK-Pi; Mon, 02 Nov 2020 11:30:16 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZY2N-0003mH-BH
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:30:12 +0000
Received: by mail-il1-x144.google.com with SMTP id c11so12613501iln.9
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8sUFnRhpnLvg7Edccau1zP+dWkQRjNO5vrDkvqn3/Yo=;
 b=jLuIKgWriDRxMgI2AiuOdNFIgDsPVBJsLKxgfRIXXGVbdL6r8kSn+BSLm1lQXISCG6
 O0LNHKmTmYC4zDJpDa7M0SFjOEdxTEN8Ax9ezfwA3XBzKd1zzem9OtH+dftOfFllmBXZ
 QwpP7IMjL36MyfBKKfh22hQngXmxc8QrsFWOV6t8YrOKk0sqncnBsZiT7KfibIb9G+OU
 fldtoNWCAlh70Nm5A5VE/gR3iE7lmDy7OBbtAvBBLXmhFhwveqbLvH7ugaEHEaqsKE2U
 D7sIK9/xTPLckHko6qUcyq4805xHKFZfIYVyFl/yg+WcDgCxOQkzsYQdtRIMwmvPNZkB
 H7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8sUFnRhpnLvg7Edccau1zP+dWkQRjNO5vrDkvqn3/Yo=;
 b=kSFh9IDPCCetHBVuw0dr0f3F8gp2bGmX26DTEoO551AVN3L55X1Y4EU1HYroCJHAr8
 BAzgaG+ncgUUAysMIOjRGyHh/LYxqB+jZI6WuKNMScTPE12nE3b+5TCpI06Qjo0/Ndz0
 R6YEmL0IBrwK1iXJ4qI2oOzt15+oXAHvuedjLqyQla4PJPiVxCE6DZsm9VCXbMhR6aUH
 kUgjS2fRvjHu/kezXKaEx3GdlyVpL5OfqSF0gkxQNDNFWQTCj8nMXnDkrARpvbQBWEIt
 jBaTJQpbtvpuT3WTvSfOfaCptekHeIdxLfnI81kx3PdrTucPUUkDLbbGai9oML8QEZa7
 Nudw==
X-Gm-Message-State: AOAM533IxlphN93Na/kfEOKOwdHqE2IGUjE7OsdKkeygBuThHxB2f5gN
 LAjtGS5mBttWEA9yAiKcp4oPbrZk0YdihnwsJ9PjWDbpTa485w==
X-Google-Smtp-Source: ABdhPJzpyGmJV5pG8ZiDqRv2txjmaZQGWb7h3zlA7GiMfetk64KQGYmh/FJhJNPZ6zDF33Q1fRfyCjNzxRjhwa73XGA=
X-Received: by 2002:a92:1f43:: with SMTP id i64mr9932879ile.281.1604316605261; 
 Mon, 02 Nov 2020 03:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20201031085810.450489-1-hch@lst.de>
 <20201031085810.450489-6-hch@lst.de>
In-Reply-To: <20201031085810.450489-6-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 2 Nov 2020 12:30:05 +0100
Message-ID: <CAOi1vP_-GydZpwuR2DWpNmz2N2Wf7MHDbXudLB=t5xuEEq3Y=w@mail.gmail.com>
Subject: Re: [PATCH 05/11] rbd: implement ->set_read_only to hook into
 BLKROSET processing
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_063011_584724_F5E90569 
X-CRM114-Status: GOOD (  21.76  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-s390@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-block <linux-block@vger.kernel.org>, Song Liu <song@kernel.org>,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Ceph Development <ceph-devel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Oct 31, 2020 at 10:11 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Implement the ->set_read_only method instead of parsing the actual
> ioctl command.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rbd.c | 41 ++++-------------------------------------
>  1 file changed, 4 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index f84128abade319..37f8fc28004acb 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -692,12 +692,9 @@ static void rbd_release(struct gendisk *disk, fmode_t mode)
>         put_device(&rbd_dev->dev);
>  }
>
> -static int rbd_ioctl_set_ro(struct rbd_device *rbd_dev, unsigned long arg)
> +static int rbd_set_read_only(struct block_device *bdev, bool ro)
>  {
> -       int ro;
> -
> -       if (get_user(ro, (int __user *)arg))
> -               return -EFAULT;
> +       struct rbd_device *rbd_dev = bdev->bd_disk->private_data;
>
>         /*
>          * Both images mapped read-only and snapshots can't be marked
> @@ -706,47 +703,17 @@ static int rbd_ioctl_set_ro(struct rbd_device *rbd_dev, unsigned long arg)
>         if (!ro) {
>                 if (rbd_is_ro(rbd_dev))
>                         return -EROFS;
> -
>                 rbd_assert(!rbd_is_snap(rbd_dev));

If you repost, please leave this empty line.

>         }
>
> -       /* Let blkdev_roset() handle it */
> -       return -ENOTTY;
> -}
> -
> -static int rbd_ioctl(struct block_device *bdev, fmode_t mode,
> -                       unsigned int cmd, unsigned long arg)
> -{
> -       struct rbd_device *rbd_dev = bdev->bd_disk->private_data;
> -       int ret;
> -
> -       switch (cmd) {
> -       case BLKROSET:
> -               ret = rbd_ioctl_set_ro(rbd_dev, arg);
> -               break;
> -       default:
> -               ret = -ENOTTY;
> -       }
> -
> -       return ret;
> -}
> -
> -#ifdef CONFIG_COMPAT
> -static int rbd_compat_ioctl(struct block_device *bdev, fmode_t mode,
> -                               unsigned int cmd, unsigned long arg)
> -{
> -       return rbd_ioctl(bdev, mode, cmd, arg);
> +       return 0;
>  }
> -#endif /* CONFIG_COMPAT */
>
>  static const struct block_device_operations rbd_bd_ops = {
>         .owner                  = THIS_MODULE,
>         .open                   = rbd_open,
>         .release                = rbd_release,
> -       .ioctl                  = rbd_ioctl,
> -#ifdef CONFIG_COMPAT
> -       .compat_ioctl           = rbd_compat_ioctl,
> -#endif
> +       .set_read_only          = rbd_set_read_only,
>  };
>
>  /*
> --
> 2.28.0
>

With that nit,

Acked-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
