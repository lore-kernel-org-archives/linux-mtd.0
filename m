Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC59C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 17:12:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABBBB60EE6
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 17:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABBBB60EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REd9sTpWqnR0RcDujx10FYhAdr69J+aY55heMlWobOI=; b=4hPVg6n+sEAnWp
	jB+/mXybLsenuhDr9w43ocdDFb0ed7XjtQ9WcjBRympPg/7LnrI5jYbfixNboA3rMxwVxbyn1WnNP
	X5Y66G3dVS1O0BM86+wFzTgO21/TmT2lKV2K1aNaGO4Lix/Z3dVRyoUT3//SBKFrbp7xWwdNHZ3Sb
	3T+yjbD+Is3umIb6ufbz69qsoHDUThKmJ7vKhPPhLZLMRzegCOVsXQLYhl0cAaJIT0FO9S7h0NJQL
	iBTBMiD+yz7sLbJW12klnSW2QQbY/x+C3YWbRtIt8bc1ZPmUoggWrSJSOapvYToehMM8kmn3zrGr/
	Q+P+zdY1t1Q1zSRKdXFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNIA2-001P8S-D8; Mon, 06 Sep 2021 17:11:58 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNI9C-001Ol0-8u
 for linux-mtd@lists.infradead.org; Mon, 06 Sep 2021 17:11:07 +0000
Received: by mail-lf1-x12a.google.com with SMTP id n2so5029733lfk.0
 for <linux-mtd@lists.infradead.org>; Mon, 06 Sep 2021 10:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cu2xJTqozk4xsbaxL8H9BoFzyGhonAhAaycqLOW0ec8=;
 b=OlLhUgbAfIRcaQBkm3ucc7CkjQAA3BY3foo15moLBOuI3bnD2Kus4MNZyf0QsYgIYo
 nYbwNGvkReFol2qerrmiIPhJwlB8yfL4VS7xERe6PQW1ZAkPROcukdDIAppf1FTAiEtW
 y+1oyCqSnc3RJ5wKu+lHo6J8Hhxb89KqfMf2R86r38NWDbRsmOlMpqbHkNHi7bCFiSqW
 cl3lahlfSxznPdky39hR5eu7x7LzmxY6PmVuGHoR2GG6KV3mnQh2ksxW1J/2m2kjXAZA
 AXoTX3K6GFv1heJQ79c2pUmD74HsC98NaYlHdj2R9LB8Mw6mkN6Kj8B5D6ZJn7udld5B
 OXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cu2xJTqozk4xsbaxL8H9BoFzyGhonAhAaycqLOW0ec8=;
 b=p9Q/ky+DQZNucfMPCa1edKENJ+nkPEnJjhIjQkVuHBg+2M2jic9V3FRlfcyNM4b3Jx
 5br3LSBH94HHKE3JZoTWrEjpEFr3tGXOYLhFHCdFE1UVlSJ9KkWiKDrMcPPzJdR0Dta3
 pwQq8vyBMgu73Rgek0a86Le3ooGO6WJzdWiyTUM/Rr1GhBkknVsVhGzMlQTQn/dwGTP0
 bwzxYEpnFtIC+/S0LGYp0ITxYIVj+FzJXSxD0RUYqNLWY1TfpTIoCQIq8jIVCjh6X2DB
 vgMscWcWlzOW5QvAnAzcXK8oqgcmoZ4TL5GP54mRL89Ox8v8cancJPAeJiORHKCIaMZs
 Y9yw==
X-Gm-Message-State: AOAM533xPmnRvOIzebLF46UUmxaUr4hRud7Ki4gpnwOj8DLrOs1s58EU
 c0P5wOdv7QJ212zHCdi8zFGoX0AW7EnbYITkCEfhOw==
X-Google-Smtp-Source: ABdhPJySjVy/4t45uf+nwvNhsrs7H6NHiflWPlp7zgQ9bQXGTclgeFZjH9Q4gk7PApD5uzg0A1VOJOtWwiyVL3oaHNk=
X-Received: by 2002:a05:6512:1043:: with SMTP id
 c3mr9631426lfb.358.1630948263963; 
 Mon, 06 Sep 2021 10:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-4-mcgrof@kernel.org>
In-Reply-To: <20210902174105.2418771-4-mcgrof@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 6 Sep 2021 19:10:27 +0200
Message-ID: <CAPDyKFrwjJyLXfr48+Jujfp7VvxPu5JCGJAhZJn3-GzDb1Kh5A@mail.gmail.com>
Subject: Re: [PATCH 3/9] mspro_block: add error handling support for add_disk()
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
X-CRM114-CacheID: sfid-20210906_101106_357515_2A4D15DD 
X-CRM114-Status: GOOD (  20.03  )
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
>  drivers/memstick/core/mspro_block.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
> index 22778d0e24f5..c0450397b673 100644
> --- a/drivers/memstick/core/mspro_block.c
> +++ b/drivers/memstick/core/mspro_block.c
> @@ -1239,10 +1239,14 @@ static int mspro_block_init_disk(struct memstick_dev *card)
>         set_capacity(msb->disk, capacity);
>         dev_dbg(&card->dev, "capacity set %ld\n", capacity);
>
> -       device_add_disk(&card->dev, msb->disk, NULL);
> +       rc = device_add_disk(&card->dev, msb->disk, NULL);
> +       if (rc)
> +               goto out_cleanup_disk;
>         msb->active = 1;
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
