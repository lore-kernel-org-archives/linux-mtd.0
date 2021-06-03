Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE3CC47096
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 16:00:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE3D3610C8
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 16:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE3D3610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEiDDMLHSJ1hZxjgnxPjELE/tQ9gqZwDirvgzFRDE6o=; b=ABbIOJi2kteXaF
	AxsKaBeyLBvtdic1g0uO2lXO8SXMQTdMPZhdUkPW3ky7edhP5EYwF+TsQ++nFwz+pnEWlBaT60teJ
	kp7PDaoZ908yrVbF78vuYT9ENnrttHhlvE+lQ2a/0+OVwZjdi6IOtwsBJqJgJ78PG00nUmJLIxlAt
	eh9LHtQ1qkgDCHS8V+UI7UxAGaJZS3V6WchNhlrC2wZd5BZOdHetVrhd++cz5v1pboou0v8qBiawi
	p51NCgX/GvzbR90ZfIP/dH4Imt1+OusjldUNpOG+/gPb/b1HWch4WURpX70KaBhSPen2cDIXdUWET
	4Pb+WV6D2nNT3Y8hUbnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lopl7-009Qqw-1p; Thu, 03 Jun 2021 15:59:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lopkR-009Qfr-QA
 for linux-mtd@bombadil.infradead.org; Thu, 03 Jun 2021 15:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7DKVf+GiS9951bpd4cfEBh88PiRutTQ//wVEud26id8=; b=BxGH0HBE+4MvfO5vOQWMWHKY0Q
 rQMcAHNxE3/CZqRhfTkmgM8HoxKsY4mHEO9RTNcs2a7t0hzOeNERg28LmmhXgkFR7BE9N9ly0YP0S
 1Z1PqZeBQEFfodK36JnNztuaxjh6+YbcSd0alk9NEb34H+q3yVKuhz5mfloF1aGTKJaEqGimtyTcq
 lsHhTdw08Aqg6O9q+IFn3M6qSapGT1gnxZgjP9RWMTCbfEf7/I/HzwgFDvBEdEyVW6eSqeBQndj8X
 KXY5sFniI/iejd688Wh5MM/3/SAxmVWVXzXhB2Up+Ir7SFcutQyYcvjjWANcEedz99hEkLv0act1c
 z1ET91pA==;
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lopQH-003B68-E3
 for linux-mtd@lists.infradead.org; Thu, 03 Jun 2021 15:38:31 +0000
Received: by mail-ua1-x931.google.com with SMTP id p1so3511909uam.13
 for <linux-mtd@lists.infradead.org>; Thu, 03 Jun 2021 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7DKVf+GiS9951bpd4cfEBh88PiRutTQ//wVEud26id8=;
 b=XGhrfqnzBbfnTVSNkFDv5GHmpnKX09udhfIYlIGvsHf5udWupM3hEeaCuAp1/iGcK2
 itxazCeDLeGnN0Ew9V7mjQKrXGASjKXLT43xef2dS4qB5N1wZq329ew5d1FZXKKcqiVw
 6FD/vr0CrXQkvA5Vx5CUZuiBjtgVFz1ZbiUU7kgR3MEWuPhMcO948V0XjU30zv2QSu9a
 tohz+jrjUWOtrbk55SyLep3Y8Ie2TFo0EIpc+U1g5ZdabSEhCf2ga/7pzz9IJem82LbC
 xz7dKg0/t3XaDdcBysnSaVg/DwjADlBkyj4crHUSmvNFlYRf/JXspkWoLbMUskTXooPD
 5/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7DKVf+GiS9951bpd4cfEBh88PiRutTQ//wVEud26id8=;
 b=r5bXxTTw8AP7BfXVzTg40r9Q9O1AOTW2Z/UhBciywqzHZTKtGhD3hycYK4fxpsI934
 KzwqBIIt0bKSztjnQ3wgvDkchN1r0lDE1Vuhw/FnvlStHvnSwX+BRgTb9CxW2YfBxWUk
 wLO8mab2FjDUCGTjwqzZRJTx4AhqEgBPwmNBLtvETRzo7GkrAoexFZz3O5GARIlxiV0I
 DUPwxDz+67c+aNcSRKfe+6CfqYgUJA86HZP+jykPV1zVz9iX+krSTtInVQ9DSOlIRkMI
 1R9/6T6i16N1niPN3dh+yRTO1wyJAnytQNTvKs3qpaHzmKMsPeWhWV8qFwJBOBOvHRna
 EsOg==
X-Gm-Message-State: AOAM5331rSe2Oq7grUlsckNID775JQL3yIsn1elEjmZRk6xhHVwxGBug
 nFBDkK8+soBC9KyvlNk8Ju/jZUnZ80htzOsRob/adQ==
X-Google-Smtp-Source: ABdhPJyc/MDglzj7ZqHuKLnfpO6vVPHNJJJjAhghObYaMjdvGQtxzeGy+jhwPjnJIpGZowWwyMtWi1MuD2fSyYUnfEo=
X-Received: by 2002:ab0:7c5b:: with SMTP id d27mr407242uaw.15.1622734642855;
 Thu, 03 Jun 2021 08:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-9-hch@lst.de>
In-Reply-To: <20210602065345.355274-9-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jun 2021 17:36:45 +0200
Message-ID: <CAPDyKFoh6HKx2rHHRXvw--Ou53TR2wLFGrKCDuetigxQ8QbvfQ@mail.gmail.com>
Subject: Re: [PATCH 08/30] mspro: use blk_mq_alloc_disk
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
X-CRM114-CacheID: sfid-20210603_163824_322526_E1EC3BCF 
X-CRM114-Status: GOOD (  19.32  )
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
>  drivers/memstick/core/mspro_block.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
> index cf7fe0d58ee7..22778d0e24f5 100644
> --- a/drivers/memstick/core/mspro_block.c
> +++ b/drivers/memstick/core/mspro_block.c
> @@ -1205,21 +1205,17 @@ static int mspro_block_init_disk(struct memstick_dev *card)
>         if (disk_id < 0)
>                 return disk_id;
>
> -       msb->disk = alloc_disk(1 << MSPRO_BLOCK_PART_SHIFT);
> -       if (!msb->disk) {
> -               rc = -ENOMEM;
> +       rc = blk_mq_alloc_sq_tag_set(&msb->tag_set, &mspro_mq_ops, 2,
> +                                    BLK_MQ_F_SHOULD_MERGE);
> +       if (rc)
>                 goto out_release_id;
> -       }
>
> -       msb->queue = blk_mq_init_sq_queue(&msb->tag_set, &mspro_mq_ops, 2,
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
>         blk_queue_max_hw_sectors(msb->queue, MSPRO_BLOCK_MAX_PAGES);
>         blk_queue_max_segments(msb->queue, MSPRO_BLOCK_MAX_SEGS);
> @@ -1228,10 +1224,10 @@ static int mspro_block_init_disk(struct memstick_dev *card)
>
>         msb->disk->major = major;
>         msb->disk->first_minor = disk_id << MSPRO_BLOCK_PART_SHIFT;
> +       msb->disk->minors = 1 << MSPRO_BLOCK_PART_SHIFT;
>         msb->disk->fops = &ms_block_bdops;
>         msb->usage_count = 1;
>         msb->disk->private_data = msb;
> -       msb->disk->queue = msb->queue;
>
>         sprintf(msb->disk->disk_name, "mspblk%d", disk_id);
>
> @@ -1247,8 +1243,8 @@ static int mspro_block_init_disk(struct memstick_dev *card)
>         msb->active = 1;
>         return 0;
>
> -out_put_disk:
> -       put_disk(msb->disk);
> +out_free_tag_set:
> +       blk_mq_free_tag_set(&msb->tag_set);
>  out_release_id:
>         mutex_lock(&mspro_block_disk_lock);
>         idr_remove(&mspro_block_disk_idr, disk_id);
> --
> 2.30.2
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
