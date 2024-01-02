Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B11C47074
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jan 2024 01:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnvZX3JI5r3gEfn3vwUeA2/UBeWCGJulKlMFv6LTSWE=; b=XN+BJVE/+jUm1r
	qxpKd+jQ8Ieh85j6TYoKGrPZj5RgVUyeUZo6f00kNYup8lqWXv/57Q2Gku5czFnaat1B3BxroSx+8
	9K6U0P389/BQrZhmh2MhZVtoWRXZtEZ39lY+sltIAxyoLXYy6AOxy+OYeZQNKkMd3GUs6+fuEoY3B
	uh9Swno8PpZntANK05euM5fzg6RPq+h859TOQgJB9nygjakFct2GXA5dHiHtuO1OcVKze4x/lGLWE
	90lRTC76th4j8i0WqugLRRTP4FHMB+M2XufecmTcCL9kSMw+XgUkQ1CIiRsMtzGiCnefkbRtaG03y
	5XoP8mQKrP0r8LB4YVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKTNy-006sif-1C;
	Tue, 02 Jan 2024 01:16:02 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKTNt-006shx-14
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jan 2024 01:15:58 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-2045bedb806so6338280fac.3
        for <linux-mtd@lists.infradead.org>; Mon, 01 Jan 2024 17:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704158150; x=1704762950; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AiGwSYUXI9fxcYVwvEl26RBkMK69KBi7r4UwJQYgdE4=;
        b=THe+j+mBI178+xWXShb7Aq11yR11zEMGbct6rolvy5eymhvyFg/O5oD0UqRr1ynACG
         bjwNVvKk00tUWkbV3Fj8mnfpX76Nrivb9xBd33FZ7q4b5pABSqZs6mztkWLDnixut+ku
         V/84EXMW1StobpOBuunkMzjIYlKfuIVuPGrZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704158150; x=1704762950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiGwSYUXI9fxcYVwvEl26RBkMK69KBi7r4UwJQYgdE4=;
        b=N7rYR401VpcFgI9lU5KIHYsdS7/WLxYerZqAYuuzDkQ8NCpWCBjPwx3MVc5dVVyeLI
         PdReavghBm3tC/MLu4T6FwS8d5bld1IKaA6FQnCsvovC61TUWpUjRvLcY6v7G+j5v1j2
         91WN7yV7f5yln9aV3zHCdMHrDfZMKLsVgKIF3dM5G8Zvhl/NndkHn8NDHFH5ntg3+Pkr
         VTjKPe5A/s10uNN+1STU8JSSuSOkBl4sVdf0r9kHBElFLFa0bmony7GPG6gWkN8LWidY
         BpTpO1Y4fF86tRVIrVSd0NBluhZVqUed8yGrqPh8NyKwe7NI3L+VS96VlzAyFlT7a+NB
         cLog==
X-Gm-Message-State: AOJu0YxqAOIIeS0TLXQN8WJU1ZuhMdDdXBRXu7ybKD4e35aWo45Ll02i
	W309wTd16vMDewbyQBEFf0skBNpnqgtw
X-Google-Smtp-Source: AGHT+IH9S0eoxCJzaBceLRCqYyMLMz41Ex8ouKxN6Dp7H2vys3Lzl953E5tC2NyCU5dsGbkan5tlDA==
X-Received: by 2002:a05:6871:8983:b0:204:5246:eda6 with SMTP id tj3-20020a056871898300b002045246eda6mr19443277oab.69.1704158150228;
        Mon, 01 Jan 2024 17:15:50 -0800 (PST)
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id si6-20020a17090b528600b0028b5812c477sm25447407pjb.35.2024.01.01.17.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 17:15:49 -0800 (PST)
Date: Tue, 2 Jan 2024 10:15:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Coly Li <colyli@suse.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-um@lists.infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 7/9] zram: use the default discard granularity
Message-ID: <20240102011543.GA21409@google.com>
References: <20231228075545.362768-1-hch@lst.de>
 <20231228075545.362768-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231228075545.362768-8-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_171557_430755_21712299 
X-CRM114-Status: GOOD (  11.11  )
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

On (23/12/28 07:55), Christoph Hellwig wrote:
> 
> The discard granularity now defaults to a single sector, so don't set
> that value explicitly

Hmm, but sector size != PAGE_SIZE

[..]

> @@ -2227,7 +2227,6 @@ static int zram_add(void)
>  					ZRAM_LOGICAL_BLOCK_SIZE);
>  	blk_queue_io_min(zram->disk->queue, PAGE_SIZE);
>  	blk_queue_io_opt(zram->disk->queue, PAGE_SIZE);
> -	zram->disk->queue->limits.discard_granularity = PAGE_SIZE;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
