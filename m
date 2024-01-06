Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9409CC3DA6E
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Jan 2024 01:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F21QtR3xFBfDLQkPpXyN1fYXnpStc4nVUqvCp/Bp+Wg=; b=sfNomA+LOkYKbM
	pzib97WI/HZe0Lu8tC3RqiKLOg+mf4DBpRt1ZAWyV3p1HPTlSdl7+yHVX/KB/bKLTDMAewovtU0+0
	2fc7tfXWKneHbvc3VEo9pzhUpXpx5V+4PEJSAJAJuuQNueU+3JNOy94lYcS6SETNSawzaX+vsronl
	GnK6917MnPcWiL85+bv5HvQ2TgjetH3t7Z5ZOSftLqe+QmLIw5ZqkBSPFcvpdRuQvSWqwflwFVbfE
	3Sl2skONVdLUSihMmTU1PCoY6ch3lRD8XsO8ay6/tgOmrCw93RlJ1ArpIvJsbPk0yHcygIbOfOkTN
	af1+POAtF/sXIfTgWRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLvYp-000Xzb-05;
	Sat, 06 Jan 2024 01:33:15 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLvYm-000XyW-1v
	for linux-mtd@lists.infradead.org;
	Sat, 06 Jan 2024 01:33:13 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3606ee78686so1089875ab.0
        for <linux-mtd@lists.infradead.org>; Fri, 05 Jan 2024 17:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704504780; x=1705109580; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qT3oZQlZSl6Q++CcuktscPeZvw2bExX2KYu8x/389yU=;
        b=jrG3wQ1aQn2YQ3PyNl1lFMMSPCMfCJZTcgqsn1Y6NLV7jKs/ipMJbmP4hAwYSvnV6P
         kRFN39YV9WL07g6iU5ykhRhszFxWEA+pGlUWiGbTKjB6NAu2TcgCc+sAaeooRI+P+LW0
         xfv8idv0Km+ANVR02B11dtIh+o5i1WZg4LeXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704504780; x=1705109580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qT3oZQlZSl6Q++CcuktscPeZvw2bExX2KYu8x/389yU=;
        b=SJvF+1SYhDqFh4gr4v/EBM7J+g3iPYb6kKvgkUWR28foBk5z9XXOsGaqs63hK+VZ4i
         l8DSBOqNzMzMOVPtuFB9mTEIcu+nfb2iX3guQxdhnpdjQktgsQ2TMh2giGnMRawBOPv6
         7L8WplcbkA6c7oroI7VNzXG4C3Su0iOe7AFYwcCRMaAqW8ZDBGXB5srRobHmVWr6NsiT
         quj86nMMsPFf4p904nbPp3+hT/1spi9IGqpAjsB3sP5s3Aj+CfmwhYs/0W+NNKbAFJLv
         h9ZFRFt4vsDk+/WbmP8F9fkmY/nKZiVmwkrdsr634Zl5dSf0na6R6b6oPTvTpAfbyeOv
         RwgA==
X-Gm-Message-State: AOJu0YwlIW6bQfULkHtAz3Mgbd7sOK2j5WrXA8uhukGaQPoFlX3+0/Ac
	Khb6iuTU6K+M3GPfXwzPkF/7+oD9tgRG
X-Google-Smtp-Source: AGHT+IGbdqkCX01n0F2LxOJc20c51ndSlx6/hfXSdI3NKdAsCGkhvdsG05i+OtNt2Y/UCPH6C9phNg==
X-Received: by 2002:a05:6e02:1c0b:b0:35d:62f2:1f45 with SMTP id l11-20020a056e021c0b00b0035d62f21f45mr533250ilh.20.1704504780792;
        Fri, 05 Jan 2024 17:33:00 -0800 (PST)
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id y17-20020a170902b49100b001cf511aa772sm2017224plr.145.2024.01.05.17.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 17:33:00 -0800 (PST)
Date: Sat, 6 Jan 2024 10:32:54 +0900
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
Message-ID: <20240106013254.GC123449@google.com>
References: <20231228075545.362768-1-hch@lst.de>
 <20231228075545.362768-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231228075545.362768-8-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_173312_634938_CC26604D 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
> that value explicitly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

FWIW,
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
