Return-Path: <SRS0=3Cmf=PT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69926C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Oct 2021 17:52:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2687261076
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Oct 2021 17:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2687261076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyothX21ylSaHpXUGc1LXErzD5RgJg9U972ppAy4S2k=; b=wWbGuMERVZ3Nk8
	i+G2uRNZkUGDVTfFuybczyyjKLro+OAuJ10cgz1cCjjKYmbflWBR8aaymh/SiUyIPPgSYXypZQCJ7
	ZlxCF+gjzNLm38qQHf0A+GubIArDM+iCy/cIKIdxzGH3mET5pIYAvkT+EqgfQQNOjXhXt61cY4Bt4
	jpPiHLNK4K7VI5rW6KO8hxYZgsAN72A6MD0WjTcKY50F9xu/YTCchCGv4vjHDxvTsL7KRWXi+Iw04
	39s/LZAhZteYMTt9kvZocZRVee7v//Hyq++0pJ8OxJx2OjpjYS/IdVXlLLdWVitnOEj8OctW+VWqf
	h3lp/1EScWe49Ng7QmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhEzV-00ETyd-Dc; Sun, 31 Oct 2021 17:51:33 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhEzH-00ETtq-Dy
 for linux-mtd@lists.infradead.org; Sun, 31 Oct 2021 17:51:20 +0000
Received: by mail-pg1-x52b.google.com with SMTP id e65so15145761pgc.5
 for <linux-mtd@lists.infradead.org>; Sun, 31 Oct 2021 10:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f8mR+D/eH/dZNNjPVwCwixw0JTq5UBSJUqcsN3WCTdc=;
 b=MvRLH8wCuHLDGU5wWh67k3cqC1Fdd3cZizRDNMF6VwG3BIGVykQrXQ5XqN/SFH4gF0
 aMNjx/sd3ls8H4qnD1YxCP5l5GJAAEpAG/Esp4V6LKux9NYOWi96TwUZ/pFb3TcmZBWP
 zVBzvEL+MVUnbMk9GV0AJMQQu68lxnATIX9jNgOg6W2MrQQWyRvUFoiusZtaNgUAPfI1
 AxT4pyI0WF/pD617rNm69wlS3SI/GAt5yD+1ZKqpLA3r9I/GOI56o8ePSp4PP7gIIGX3
 ZjKHBLE0TTaieZDjpKAQiXOrBhNCxqkLUX94RtN1Jp6OGXuvi8GYPomwsciSqBwOSwmF
 zWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f8mR+D/eH/dZNNjPVwCwixw0JTq5UBSJUqcsN3WCTdc=;
 b=U/1j2yp150dGhxHpqxIGhoBBFIijatzlAzf++XEidAMNM03kiNaZBvAaurftZA2Glk
 t7TzzA7KNocuPKuRwzMOcdGHSVClu/iaSQRl2dy476EDt22MpJ2Myq1U1en1z1C1RrlT
 hEFnD5u6BgsPaQKAPUSMEHivmpqKYEtWqJ/Wxvsj1SBfANg9N+7unm4iMrgcUMB539wX
 102Q8x3eum1OpLSLhSxltIOCxvKI2g5fnDOu0QQjm0aC2ULnYEeG0C1h8k/yVsELDlIP
 8189NvVKPWYvFUhhYaxKQ9xy7Xytb63Yd727WA4jrGtyTvY8yeeizDFzGdv7hVAzu2sY
 9hig==
X-Gm-Message-State: AOAM531DoO7sNDIVKc83/P9x+gL0Mjrkn/PEjzznEZE1Ay0fLUxohimC
 eq4HwFFqqIGWjdyoG/+NxzdOikMOv0H0kzuSd2tJuA==
X-Google-Smtp-Source: ABdhPJwgKG5Mr66Ui8RTcSTuDFaX+/IepWZB1EHkIZ09RxQEUmJyKltynz0/5/JNtOiXpRzef+xr6SruizxyjaU9z7s=
X-Received: by 2002:a63:6bc2:: with SMTP id
 g185mr17997770pgc.356.1635702678641; 
 Sun, 31 Oct 2021 10:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-5-mcgrof@kernel.org>
In-Reply-To: <20211015235219.2191207-5-mcgrof@kernel.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sun, 31 Oct 2021 10:51:08 -0700
Message-ID: <CAPcyv4g98Dk4HFvgzEeCfCNjF-vjfpEhjGjsPDazGPg-BqMr8A@mail.gmail.com>
Subject: Re: [PATCH 04/13] nvdimm/btt: use goto error labels on btt_blk_init()
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Geoff Levand <geoff@infradead.org>, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Jim Paris <jim@jtan.com>,
 Minchan Kim <minchan@kernel.org>, 
 Nitin Gupta <ngupta@vflare.org>, senozhatsky@chromium.org, 
 Richard Weinberger <richard@nod.at>, miquel.raynal@bootlin.com, vigneshr@ti.com,
 Vishal L Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 "Weiny, Ira" <ira.weiny@intel.com>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mtd@lists.infradead.org, 
 Linux NVDIMM <nvdimm@lists.linux.dev>, linux-nvme@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_105119_508295_85B76D5D 
X-CRM114-Status: GOOD (  17.27  )
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

On Fri, Oct 15, 2021 at 4:53 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> This will make it easier to share common error paths.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/nvdimm/btt.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
> index 29cc7325e890..23ee8c005db5 100644
> --- a/drivers/nvdimm/btt.c
> +++ b/drivers/nvdimm/btt.c
> @@ -1520,10 +1520,11 @@ static int btt_blk_init(struct btt *btt)
>  {
>         struct nd_btt *nd_btt = btt->nd_btt;
>         struct nd_namespace_common *ndns = nd_btt->ndns;
> +       int rc = -ENOMEM;
>
>         btt->btt_disk = blk_alloc_disk(NUMA_NO_NODE);
>         if (!btt->btt_disk)
> -               return -ENOMEM;
> +               goto out;

I tend to not use a goto when there is nothing to unwind.

The rest looks good to me. After dropping "goto out;" you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
