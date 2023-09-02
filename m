Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E5CC71153
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Sep 2023 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6j3qPaeVi/wavt2223Bm8Darx2aSISVm2mp+qKOA2g=; b=Hx4BlQ9bRQ5q0D
	d/oBEBepYGAGYoy5/vCmWnYj67NrmwuZuWjHhXW6gZPG6xiAlNVnL8z86r4UtlOBAbcW1mFGsY2pd
	WqmoR3yLzhkeZVCiMOqCVDTECqY1b2R5bjSb4ROWnCdfTBJJP38P4Riwq6baqj7Zro/4z9u+JVbcX
	XzrScIUR4aJPVq0QylhMHKqMoXvP6EBlPk9Mv6SGWrcw8in5Bswd/EMtnNvIGuG6KvVlvgSYnmK91
	ehZ8k9H7noZz5BIhMHf7I5zCXrF3PWz5WI1KjLiXcU+G1pw6AjT9KcNywJIF3UoCnooqauxRr0R79
	JitWZeZe7ZvzGRyb8JNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcNw9-001HSI-22;
	Sat, 02 Sep 2023 10:33:05 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcNw4-001HRh-1v
	for linux-mtd@lists.infradead.org;
	Sat, 02 Sep 2023 10:33:02 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-34baf19955cso9455965ab.2
        for <linux-mtd@lists.infradead.org>; Sat, 02 Sep 2023 03:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693650777; x=1694255577; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5OnI434n9NeNnDKmiNIVPrhxOf7YFyuDkJUxLVMdSiA=;
        b=bMcBOdpFSdQVMrQEp6kW/6GVvmR6jKeJ+/SBPlRei/5uX5X/B2AmzFYwdXo8B2j4RP
         ZCkSdUVQbE058dxXVX74QFG94wdCDSXAxXUBZ0NxEfvR4s3/m3Je5PsiqE4zjJ74WW10
         WQn94H6zfamUhoV0VGMjPHV5hgLwuvFgRi8lCeGNrFtQWO8dt+mq3H1YTNJdOMHsYEoJ
         pI2aRrqt59cboDjEgWWR7YY4KhyFgs+FtPGbXDoTWdBZTAYh7YXfLof71MOu86v27/IL
         cqnxqiCswT4fcECozXoh6fZmesKHzcQHDRL/tBaAnTISYEvK2Uv+caJvjYNy8bIl2eoZ
         UAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693650777; x=1694255577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OnI434n9NeNnDKmiNIVPrhxOf7YFyuDkJUxLVMdSiA=;
        b=Ogv0MkvQZ2/RSxe0uGecoU8lw0I3lejOPjPbTbf7te4a4aYRmyOcv8ouB/gXa6dUEZ
         UfunsJVE+ntXhXOokHCFbxXg+D0eL2eM0RzRnqzIEgg8FyDKd8KnBqC6lWe+esBpKgJY
         Gmo9qdSTV0WTjrjJPC4bTcoZpyTtlTrai2jeg8N5hDmEnXckmYKOBpYYzlmCjnL9yvMO
         9KZJ92GR+6zzyn23s9At8XmRIAQ27K3WCDRHgWIMSy+MchK1pDaxodx0AsNeP7XCRzPC
         EZ95B0BixAbV0d8jTEUp+ok4W/6UM+XCo9p5fTgHhtzM1MCUF7bLex0qc55ZBWdTcJz3
         w9qw==
X-Gm-Message-State: AOJu0YyYCTabJvMlaDQUmiyj7JIZ8Q4auBVjUipqTnLaZ9C8snt6gZNY
	yis2sP71T3mixOnahj2pj0DRLAm1f11yPP5DBTo=
X-Google-Smtp-Source: AGHT+IH4PP5dWsT0jG0ti38U73JafvHzDWIElKwhl5OhOObG91+aQOEOROQHRtidpsNLL6+FiaYmWkl/VyHq61KoV5I=
X-Received: by 2002:a92:cb0e:0:b0:34c:e6e6:80d5 with SMTP id
 s14-20020a92cb0e000000b0034ce6e680d5mr6122660ilo.26.1693650777195; Sat, 02
 Sep 2023 03:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230901133641.60817-1-dii@itb.spb.ru>
In-Reply-To: <20230901133641.60817-1-dii@itb.spb.ru>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sat, 2 Sep 2023 12:32:45 +0200
Message-ID: <CAOiHx==_azyuNzVEvYrGQmDxb2TYPW=2bFjyRjGoxWX-pGb7OA@mail.gmail.com>
Subject: Re: [PATCH] mtd: tests: remove useless checks
To: Dembskiy Igor <dii@itb.spb.ru>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, Boris Brezillon <bbrezillon@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Akinobu Mita <akinobu.mita@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230902_033300_654620_7149D2FF 
X-CRM114-Status: GOOD (  14.85  )
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

Hi,

On Fri, 1 Sept 2023 at 15:39, Dembskiy Igor <dii@itb.spb.ru> wrote:
>
> Return value of mtdtest_scan_for_bad_() is always 0. So it causes senseless

Your function name got cut off.

> checks in some functions such as mtd_subpagetest_init().

Then maybe it should return void?

> Fixes: 084db4b020c7 ("mtd: tests: introduce helper functions")
> Signed-off-by: Dembskiy Igor <dii@itb.spb.ru>
> ---
>  drivers/mtd/tests/oobtest.c     | 2 --
>  drivers/mtd/tests/pagetest.c    | 2 --
>  drivers/mtd/tests/readtest.c    | 2 --
>  drivers/mtd/tests/speedtest.c   | 3 +--
>  drivers/mtd/tests/stresstest.c  | 2 --
>  drivers/mtd/tests/subpagetest.c | 2 --
>  drivers/mtd/tests/torturetest.c | 2 --
>  7 files changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
> index 13fed398937e..976f40a5656e 100644
> --- a/drivers/mtd/tests/oobtest.c
> +++ b/drivers/mtd/tests/oobtest.c
> @@ -399,8 +399,6 @@ static int __init mtd_oobtest_init(void)
>         pr_info("test 1 of 5\n");
>
>         err = mtdtest_erase_good_eraseblocks(mtd, bbt, 0, ebcnt);
> -       if (err)
> -               goto out;

That's not mtdtest_scan_for_bad_eraseblocks().

Regards,
Jonas

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
