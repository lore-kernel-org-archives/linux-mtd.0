Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75784C432BE
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 05:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B15C610C8
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 05:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B15C610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ionos.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/bjMUSaLHhP7S0sFPQ05aJjFKO+L2CxveoKoJSPVgQ=; b=aS22RozJR9UqpC
	mGcXQPxXwozI1dhvMJ+DDvFKtMz+ya2Kh591nKWbkNMlOrWuEleKr1Ddcgy/Zq9FLPAdYyIpouFGo
	rUusZYdQLGYwCK8tiR/C8TbpN3a9O6ia5N1jXPmA9XJZg6EpKgwblPwH8dfro5wGnYK10IyGb3pop
	VgiSuaOYoR9NlMsgZP4rvcr2FlnRZTdsBy9WUmBW9uR+dBr3jNNIGliV5nqKKKGinI0mj1+0q89Uy
	z4EdV1jlEE9uDje624IbFqPMtgk1vesPwmmurnNB3wy+urfD/aYTpxwoBamI3hVVn3R5O8hHoWYiA
	xLrNb7EnIetHWSbcTT/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfLU-008Yho-A0; Thu, 02 Sep 2021 05:33:04 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfLO-008Ygi-5Z
 for linux-mtd@lists.infradead.org; Thu, 02 Sep 2021 05:33:02 +0000
Received: by mail-ej1-x62f.google.com with SMTP id n27so1513056eja.5
 for <linux-mtd@lists.infradead.org>; Wed, 01 Sep 2021 22:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8zwGb32jFXjCTTE1DLnmCCv3fIxegxghKmjAnTUaGrU=;
 b=RS19rQ3k1Oo6pxKXgESwj7SfQiQeAghwOQof8XbrKhwNE9r6QeFgGT2il12wSmfJo9
 8RLJ69QqKwMCfmgCe8M/wbbEBhqhxk27tSTA860KNjxs6Dep+LCz50EZWWyTtRkLnpaG
 HHNtk7tVj3z6KzRxoS7eJZOEmrrHFm2T8M6OdF6HLsxQ448iDnbZYKDRE+L45pgmMAX0
 wL3zbL9IzEe6T8KByoXsf2bthQqrzfNltsaTJ4qpvLruEzOxx1hVvxgobQpTwfTh760c
 2yOZCMqZm9faW+ZRKR1n4FoFQ5PHujT5YaYWgeapBWM6PozMUvM8nG4mCK28njnF3mZP
 maHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8zwGb32jFXjCTTE1DLnmCCv3fIxegxghKmjAnTUaGrU=;
 b=ZlKkgX/P3vE4Bnj6CVsz1AjvYtIpywd0I25OV6WoK34PjwxC9uAEIblb9/QiW5lrtd
 6oavZKFRAf6e1y1X7J7FJDGRxIq/8N5wzLQ3eZM6b28TGMsqMfS2HDD1duoIhgEntJL0
 T1siuWOZITZrIVvgWhzfeklGc0r69OZ8iTAr/OKQUKoPOwZfj3E3qRRxBzAdoK493gkL
 PkipDVIPs/FAJrnWBLaI7MdG2pl0ezQLorkTlNIv82t0VmB30+29nla0F5ozoV58Zim5
 yv8SwHZE2TpyEhMrcMxFPoIBEghxSyvDhYfwfbQDeUdZtCRTZ99vnADryL9LzelnMYGv
 K1pQ==
X-Gm-Message-State: AOAM530+sYVxk9VWZOQBVsRubHszSIXR4CnCfhYreOY8iVRY4fHtl2cb
 XMReUQQZdEWBPw12reCyzIM37yoOumJjS6mby7eZzA==
X-Google-Smtp-Source: ABdhPJxZFwC5NbWhR92zcxWHUA7yiRr/hOydqIOl9pEkJvL3G+5pMpY3cQSKaW1W2ZY+RQK9Gl5bBm6LDK3c2kx9+28=
X-Received: by 2002:a17:907:6297:: with SMTP id
 nd23mr1740993ejc.62.1630560774884; 
 Wed, 01 Sep 2021 22:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210901210028.1750956-1-mcgrof@kernel.org>
 <20210901210028.1750956-6-mcgrof@kernel.org>
In-Reply-To: <20210901210028.1750956-6-mcgrof@kernel.org>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Thu, 2 Sep 2021 07:32:44 +0200
Message-ID: <CAMGffE=+jnKpO-ZGqW5JQnUbdH+NjQHgq7_f4XoEem2itHhe9Q@mail.gmail.com>
Subject: Re: [PATCH 05/10] rnbd: add error handling support for add_disk()
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Bjorn Helgaas <bhelgaas@google.com>, 
 Liu Shixin <liushixin2@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
 Lee Jones <lee.jones@linaro.org>, Geoff Levand <geoff@infradead.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, benh@kernel.crashing.org,
 paulus@samba.org, 
 jim@jtan.com, Haris Iqbal <haris.iqbal@ionos.com>, josh.h.morris@us.ibm.com, 
 pjk1939@linux.ibm.com, Tim Waugh <tim@cyberelk.net>, 
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-block <linux-block@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_223258_238285_0DC58C2F 
X-CRM114-Status: GOOD (  19.63  )
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

On Wed, Sep 1, 2021 at 11:01 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
looks good to me.
Acked-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>  drivers/block/rnbd/rnbd-clt.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
> index bd4a41afbbfc..1ba1c868535a 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -1384,8 +1384,10 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
>         blk_queue_write_cache(dev->queue, dev->wc, dev->fua);
>  }
>
> -static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
> +static int rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
>  {
> +       int err;
> +
>         dev->gd->major          = rnbd_client_major;
>         dev->gd->first_minor    = idx << RNBD_PART_BITS;
>         dev->gd->minors         = 1 << RNBD_PART_BITS;
> @@ -1410,7 +1412,11 @@ static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
>
>         if (!dev->rotational)
>                 blk_queue_flag_set(QUEUE_FLAG_NONROT, dev->queue);
> -       add_disk(dev->gd);
> +       err = add_disk(dev->gd);
> +       if (err)
> +               blk_cleanup_disk(dev->gd);
> +
> +       return err;
>  }
>
>  static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
> @@ -1426,8 +1432,7 @@ static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
>         rnbd_init_mq_hw_queues(dev);
>
>         setup_request_queue(dev);
> -       rnbd_clt_setup_gen_disk(dev, idx);
> -       return 0;
> +       return rnbd_clt_setup_gen_disk(dev, idx);
>  }
>
>  static struct rnbd_clt_dev *init_dev(struct rnbd_clt_session *sess,
> --
> 2.30.2
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
