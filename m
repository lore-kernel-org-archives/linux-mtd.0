Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78262C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 17:12:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33FEB60FBF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 17:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33FEB60FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7EAzZc/TU8OYE+I/X8IED3O0a8ZAPrGAHAcY4dyhvE=; b=eitOlSCJ8uaUQy
	+fX/Ne07RHeu3FAzivWHbNOjC45HB1qDtf7LJpJmSVUwUE/cwbHYpdKYbB2GTwS3z7h5p36GEX2sR
	Zt4J/bES53opTYq1FLK/jcqhRuaoy5CUMqdOFyZV7ilqVz7XL9V0TzXOQ9WrVXVERhbGJBjh/8wOt
	Euj/rwUyGNtIkVz/H/UMKzxc5ypqDHksKtVxF20Ed6PnsaLz8f58wH+77FfdmQ/YZodvHhV479woa
	LKWWzz8mOEmqppRoe35dAN3iaXm1mPZq9xqHYBRzGqwZY/qF+244OZPE/tjpSTvDp9wDAUSRLvEEK
	0lA8cglK/rxgPnqlyBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNI9f-001OxP-1t; Mon, 06 Sep 2021 17:11:35 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNI94-001OhQ-D0
 for linux-mtd@lists.infradead.org; Mon, 06 Sep 2021 17:10:59 +0000
Received: by mail-lf1-x12b.google.com with SMTP id h16so14503509lfk.10
 for <linux-mtd@lists.infradead.org>; Mon, 06 Sep 2021 10:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CW74dcoV+jr+H/cOee9EJDtMnYKDaAeGSoGkoOfBh0A=;
 b=fiBYOjOq+VBGQV/Z/w0zPvWtW2UdpSWfKvNcpoxD+K0WhuhAtoceEVoeVxOgsHPOhv
 efrzRbDV+uvCfhjgMPpEAyHUjdY3TNBRGO2ascjrj0a8sJkn7E+gp/dr4pWniQgzRRQF
 q98akxIU254+B/rN3gPB3vS2zoJRULAlh32sYQ3MgkDWtN5OmaO+jI6cVC8P0jEcXZjM
 5J9yOudkRCUkuEmbSVcv7bhsnzpejWiq8jfUXL/v/giNNCifV/BladKTn0Y7v9egF/vN
 7pklhCc4DE5X6amh2/h+2STJm39f2wwFex5emYYC4FcRMupzl4VSdjFxUGanzZUlpoBw
 tJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CW74dcoV+jr+H/cOee9EJDtMnYKDaAeGSoGkoOfBh0A=;
 b=PdMlVK0Lcl/uFJxZ0jEscPjQeRlyMZ9hlNLDQ+N6vnTvwCxofmQKREWrGOQlBYWxU5
 VVFxZudlTJzMisRjuYyuYKkVMf6nu3ctiTxWf7FfYkhBlu5VX8ulDdGTn+FiTYYnCTbM
 wro7ApdPEZfcmurGi26x3aTY8IR4MVe9FCMH6GqYjJvbVLTUi9CUK6FihhZ4a8/HfQ/k
 Loj5u1S3xR7xlf9PsuDod8GPbdGxzWNE5QH02iuaZGwVRnweIktpMhqbLYg+smh4qO+r
 8oCPlNvHwncylyrI4G4yKS511/jMdegLGon+t3arQK72gh8W7Vlk2FxHXHZmT7WtnYtM
 COXA==
X-Gm-Message-State: AOAM532n/J0uIZktu8oGdygIh1SL5/N3Pi+vzZDEAB/TB21NQgl7KwXs
 sLBtjWZsXITjd9V/HoA8Xd5VXzAlN3xJ02RKMEjr6w==
X-Google-Smtp-Source: ABdhPJyhjHArMca68TR5pTBXzBL9tRGf14Q3uN8WTnzHOdYd8ltoCuxOYH+yY9mOHeyJ4NbktZ7AcuCVRlMvz/GSBvU=
X-Received: by 2002:a19:dc47:: with SMTP id f7mr9888628lfj.71.1630948256412;
 Mon, 06 Sep 2021 10:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-3-mcgrof@kernel.org>
In-Reply-To: <20210902174105.2418771-3-mcgrof@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 6 Sep 2021 19:10:20 +0200
Message-ID: <CAPDyKFoZ1QqPMYi=N=3s2058mnbzcXYPodNFkexCi0eTbD4NmQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] ms_block: add error handling support for add_disk()
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 chaitanya.kulkarni@wdc.com, atulgopinathan@gmail.com, 
 Hannes Reinecke <hare@suse.de>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Colin King <colin.king@canonical.com>,
 Shubhankar Kuranagatti <shubhankarvk@gmail.com>, 
 Jia-Ju Bai <baijiaju1990@gmail.com>, Tom Rix <trix@redhat.com>,
 dongsheng.yang@easystack.cn, 
 ceph-devel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh R <vigneshr@ti.com>,
 sth@linux.ibm.com, 
 hoeppner@linux.ibm.com, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, oberpar@linux.ibm.com, 
 Tejun Heo <tj@kernel.org>, linux-s390@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_101058_514323_A008FAF8 
X-CRM114-Status: GOOD (  19.64  )
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

On Thu, 2 Sept 2021 at 19:41, Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
>
> Contrary to the typical removal which delays the put_disk()
> until later, since we are failing on a probe we immediately
> put the disk on failure from add_disk by using
> blk_cleanup_disk().
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Queued for v5.16 on the temporary devel branch, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/core/ms_block.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
> index 4a4573fa7b0f..86c626933c1a 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -2156,10 +2156,14 @@ static int msb_init_disk(struct memstick_dev *card)
>                 set_disk_ro(msb->disk, 1);
>
>         msb_start(card);
> -       device_add_disk(&card->dev, msb->disk, NULL);
> +       rc = device_add_disk(&card->dev, msb->disk, NULL);
> +       if (rc)
> +               goto out_cleanup_disk;
>         dbg("Disk added");
>         return 0;
>
> +out_cleanup_disk:
> +       blk_cleanup_disk(msb->disk);
>  out_free_tag_set:
>         blk_mq_free_tag_set(&msb->tag_set);
>  out_release_id:
> --
> 2.30.2
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
