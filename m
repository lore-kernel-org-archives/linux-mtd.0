Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87F2C47096
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 16:01:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A58D613B8
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 16:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A58D613B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJtJAqf+faQ6A6QSlM1Ok2STI3YlUEiTct77wJXb9Ps=; b=wWTPuOYEyzjIf+
	foMrN5iwVeWPSYg/3Lqj/3OK7OgvNf9tkgpsWsKBCbNgQlu+rWJMcn/SW3eiKz7fupIol/CisjL5f
	dUCLC4zDvvZUw9TkiBySLY2vx8DwTMSoZFxq9gdLGZcmsqum3uo84caShYbAiyVaSHxi1EaSS3df8
	4kNcJgoL7p/aujPJ522zCnmoQoybEYO8lHDPGV1r8MAlCMd/VsUWC60Sj1ZJGuyxzTB3zFRTXvJty
	AdrXEP+ZUVrYUOPe5dXt4Ghyf8TdXyr6UdoTROEzdkHOZLeERurMvC+U0bLitatVJsj2GGbCGpWCH
	QbdFE31EnJSKrLTVWIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loplN-009QxV-QF; Thu, 03 Jun 2021 16:00:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lopkS-009Qgo-9A
 for linux-mtd@bombadil.infradead.org; Thu, 03 Jun 2021 15:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+W0QahdA5jm5lLp4qGqziVkevJrOYYIsAeli4hbSoMY=; b=CROEiGfqKW/PHtKxFC8ME/Ttfu
 faaBV5Ra+tQ/nI2gcdsFd9ROe3XST26+B/+sHG4ZXRd79IhafGLApjOM4B3/gMkWH6pVlLqBNgi/a
 GxvWi3uYWXXiNmSX39nEsj7wB2yTRHdFIicWEItY78P1H00zyo1hlnAVdSvcZq7wvA3kRLj0b9fec
 1I7yiAuuygprSnJbeYcC5hiOKtOeMGn/pYSZ6BYWim5QEU7oJNJVYb7ZwM5DCRPN4QXR2EXvwimF8
 R/Aa6rrqIUbQ8CD9+oxOKlD+Xah1sAlDJzYyNDhB8jr1Upedz2hM36xywvDGBZ2ECUzSiyMUl9ENH
 C0sZqtPQ==;
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lopQG-003B62-EL
 for linux-mtd@lists.infradead.org; Thu, 03 Jun 2021 15:38:27 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id b1so1476469vsh.7
 for <linux-mtd@lists.infradead.org>; Thu, 03 Jun 2021 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+W0QahdA5jm5lLp4qGqziVkevJrOYYIsAeli4hbSoMY=;
 b=Sczm7Uhat9CAttKCKONsBvTvpdWX5VANaO58Cd0mJFcJ+A28Gj9YspGmhSWIpVtNS9
 gufvY+CGT5FXDIQfjOQ4ExwQIrmSjUqzpGxTG/ZkK/nXRMIOjYsW6gd0+0ljDlvbLbq6
 AyHgMcG1V7VrDrAancwHixbwlfPPPcOtQ/Us++pps4NpXbaz33l8+avCCapAkCFya/10
 FcaqevmvQJz8RurkVjboQlMdJ4KLmCFgJ9aWml7eHxoV4e7eWIKwWiCmbJjrhvsDE5K2
 PLLnqagHSU8ORkIhfE1C9Sx6ZNkln7FGogf+yyT7tKXsIRL7oAHDTXDC0cZ4GcZV2dc7
 4ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+W0QahdA5jm5lLp4qGqziVkevJrOYYIsAeli4hbSoMY=;
 b=QDwkbaV5gzl0t05XgYnJJUl+ySPsV6mc4gAsIEbt8HJ/zXTLE9PKy0iQo+1CIAgVHy
 T5fG76TOhsf3D4ihtWxLKxFUPxO0qCMIg6ughVmHcMxGneTXAI0TeRJS7m1vFn1spgke
 +q1KIdv752+uC+misR4/z+aYQeO35dPnp/XX6rR/Dw4YFrPJMFcN8s85TmIMF6o0IAFs
 vma2zmUOPDmdu5uzV6VMrhBFhixZoqHsENPPJCkT2/Ebg+wHrSbkXpatJXZ5/s83zOg7
 0ry5qR16GK3GX4hOtP2l9Ln86X7RqgyKz8skO+t6uSii6L4L4zxVH0En9R9wEruIWQBs
 MuuQ==
X-Gm-Message-State: AOAM533UY3o4P87e/c/p3+dt5Pi0YGQltPAtB7ck7BfYXio4d6qOdroq
 +zUUM8C+GJLigdvYpLKAisDYwlzNzxP02zNR7Mea9w==
X-Google-Smtp-Source: ABdhPJzM3LSrPJI4FkB0laodTTeEei+m50SowhpqaGtsNgUdvieHcvbYUQloJUD/a79xzNmd816023E4d1PORKHhPJg=
X-Received: by 2002:a05:6102:3023:: with SMTP id
 v3mr756919vsa.19.1622734639015; 
 Thu, 03 Jun 2021 08:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-8-hch@lst.de>
In-Reply-To: <20210602065345.355274-8-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jun 2021 17:36:42 +0200
Message-ID: <CAPDyKFoJssCnHv5tmG4vJJ9m0Zj5HkMEVYvnsjamvyemusZaUg@mail.gmail.com>
Subject: Re: [PATCH 07/30] ms_block: use blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
 Denis Efremov <efremov@linux.com>, Josef Bacik <josef@toxicpanda.com>,
 Tim Waugh <tim@cyberelk.net>, 
 Geoff Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>, 
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, 
 Alex Dubov <oakad@yahoo.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com, 
 linux-block <linux-block@vger.kernel.org>, nbd@other.debian.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, ceph-devel@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
 linux-mmc <linux-mmc@vger.kernel.org>, linux-mtd@lists.infradead.org, 
 linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_163823_436053_F4480E85 
X-CRM114-Status: GOOD (  19.33  )
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

On Wed, 2 Jun 2021 at 08:54, Christoph Hellwig <hch@lst.de> wrote:
>
> Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
> allocation.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/memstick/core/ms_block.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
> index 0bacf4268f83..dac258d12aca 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -2110,21 +2110,17 @@ static int msb_init_disk(struct memstick_dev *card)
>         if (msb->disk_id  < 0)
>                 return msb->disk_id;
>
> -       msb->disk = alloc_disk(0);
> -       if (!msb->disk) {
> -               rc = -ENOMEM;
> +       rc = blk_mq_alloc_sq_tag_set(&msb->tag_set, &msb_mq_ops, 2,
> +                                    BLK_MQ_F_SHOULD_MERGE);
> +       if (rc)
>                 goto out_release_id;
> -       }
>
> -       msb->queue = blk_mq_init_sq_queue(&msb->tag_set, &msb_mq_ops, 2,
> -                                               BLK_MQ_F_SHOULD_MERGE);
> -       if (IS_ERR(msb->queue)) {
> -               rc = PTR_ERR(msb->queue);
> -               msb->queue = NULL;
> -               goto out_put_disk;
> +       msb->disk = blk_mq_alloc_disk(&msb->tag_set, card);
> +       if (IS_ERR(msb->disk)) {
> +               rc = PTR_ERR(msb->disk);
> +               goto out_free_tag_set;
>         }
> -
> -       msb->queue->queuedata = card;
> +       msb->queue = msb->disk->queue;
>
>         blk_queue_max_hw_sectors(msb->queue, MS_BLOCK_MAX_PAGES);
>         blk_queue_max_segments(msb->queue, MS_BLOCK_MAX_SEGS);
> @@ -2135,7 +2131,6 @@ static int msb_init_disk(struct memstick_dev *card)
>         sprintf(msb->disk->disk_name, "msblk%d", msb->disk_id);
>         msb->disk->fops = &msb_bdops;
>         msb->disk->private_data = msb;
> -       msb->disk->queue = msb->queue;
>
>         capacity = msb->pages_in_block * msb->logical_block_count;
>         capacity *= (msb->page_size / 512);
> @@ -2155,8 +2150,8 @@ static int msb_init_disk(struct memstick_dev *card)
>         dbg("Disk added");
>         return 0;
>
> -out_put_disk:
> -       put_disk(msb->disk);
> +out_free_tag_set:
> +       blk_mq_free_tag_set(&msb->tag_set);
>  out_release_id:
>         mutex_lock(&msb_disk_lock);
>         idr_remove(&msb_disk_idr, msb->disk_id);
> --
> 2.30.2
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
