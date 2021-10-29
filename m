Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170FAC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 12:53:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F9460295
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 12:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3F9460295
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qEqSjwXC5AZ4malUiifqbid+f8gi6fStkABzqTSs4U=; b=d+1tRHGt64zX1y
	zfpLinbwOYOhy9qyHCUwVbB1Yw/PfOkpaVpsBAvaQY5XtjbYN5GvxUgdc9l9+EjQzmG1EpGF8nA6y
	PNO0VirPSvaCZ4BlxZcxqRRzONYtr6TUFXvskmOH/r9eN/2Sqako2hMQj1vi88rLZkSJGPfPnhiIS
	zuTuoJZ7UVzWBEsz69mVR5dDK4yE1H8XjElRRPTkgTk8WQ7Wz5Mgl+VvsByDfRcxdfuOqIUlwNtuQ
	vvHLBAtkQ0xDWeXFAf1Hy3zDSlulelUyxoRGJHR3wnLAtzWmGFAFPJQQRDCysHnUZOLncb05WJbA6
	SnoxSMvGgfzS7m03ZVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgRNH-00AyRb-Ei; Fri, 29 Oct 2021 12:52:47 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgRNE-00AyQn-BJ
 for linux-mtd@lists.infradead.org; Fri, 29 Oct 2021 12:52:45 +0000
Received: by mail-il1-x130.google.com with SMTP id j28so4103768ila.1
 for <linux-mtd@lists.infradead.org>; Fri, 29 Oct 2021 05:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=uhb6XVldQ6Tqmc638dZl/EsCqLPiV0DWHYdItNojyKA=;
 b=5GN0r5l7hiNpTcfLkqhYBuNFAySG3bDs0RzGVfLozpBbOOqcW2Ol5fjMfiztfSwGR7
 ecsfF4O7pN/iQHAQtqmWUAKbmPkaoUO6QANa1l6qh0P9P+dJPK6c5vvQxdCtXkDBmqzN
 wcuzr6fHGMRM7IpqZvOq+ym0pgdpkjYalqhNslx4X8xU4LltacTcQM3T9XxlDouHOCfD
 k2dsJPduQqzjvNb+bs1y1L6g/Vb4tCTRIRw25UKqIX7xro2yvpnlJU3bf48TPfCx8RHm
 x0Q933IFlQ7nga0pwTdZcQICicL+1yG8JDbm1vO32ZDYTrXoqEH7n32/zz0XT+k84C2I
 d8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=uhb6XVldQ6Tqmc638dZl/EsCqLPiV0DWHYdItNojyKA=;
 b=3pSJKZ/yhBFCxwQImwdzVWgxCd4tc4w4Pi9LcKrDkgI/epDI9vhH//lyjMTiWIGhks
 pb81PNGMtXhWXupk6XDn5RbV3X/5tfi8uVq+CkCy5IGRKRfTDaL+JsBOC4JnPgEfDVy0
 hMwK585VkX/SqvkGoMKOGKvjPeUh6ZUoI8oNCFtFY3TVWs3v7rbhqiaRvNVHZALqNDx6
 3wHRFLSwC5crRkc+6WoHHuFjKXs5jyPfrTE0LirP6qKTFY/NUqWQlAO/+OwRPlfV0ZYy
 kenJlo9MsDp+QFAN3BSvjJKMhs5d3h75KU5N5PHeqc1ChWBQdIF2mNQGyTCl2+4DDKL2
 ibTw==
X-Gm-Message-State: AOAM530EK+SJqycExyJcWjxKtbEsXotTdKEjSMbu3W4pSKXhDNcPOjS6
 oQm6HV4QRJtXr3YSJTziuAIiEw==
X-Google-Smtp-Source: ABdhPJxlsx7MLgDr//casvyGS6hISvFBN0+MeYK+NGcV0Ht28rkLQLfyTGFFc8OUgybOJDEyA0wdfw==
X-Received: by 2002:a92:cda5:: with SMTP id g5mr7783563ild.36.1635511963406;
 Fri, 29 Oct 2021 05:52:43 -0700 (PDT)
Received: from [127.0.1.1] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id c23sm560811iob.52.2021.10.29.05.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 05:52:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
In-Reply-To: <20211025070517.1548584-1-hch@lst.de>
References: <20211025070517.1548584-1-hch@lst.de>
Subject: Re: (subset) move all struct request releated code out of blk-core.c
Message-Id: <163551196149.84649.4583690575292414176.b4-ty@kernel.dk>
Date: Fri, 29 Oct 2021 06:52:41 -0600
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_055244_435787_F01B2C34 
X-CRM114-Status: GOOD (  11.46  )
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

On Mon, 25 Oct 2021 09:05:05 +0200, Christoph Hellwig wrote:
> this series (against the for-5.16/passthrough-flag branch) removes the
> remaining struct request related code from blk-core.c and cleans up a
> few related bits around that.
> 
> Diffstat:
>  b/block/Makefile                     |    2
>  b/block/blk-core.c                   |  362 ----------------------
>  b/block/blk-mq.c                     |  573 +++++++++++++++++++++++++++++------
>  b/block/blk-mq.h                     |    3
>  b/block/blk.h                        |   33 --
>  b/drivers/block/paride/pd.c          |    4
>  b/drivers/block/pktcdvd.c            |    2
>  b/drivers/block/virtio_blk.c         |    4
>  b/drivers/md/dm-mpath.c              |    4
>  b/drivers/mmc/core/block.c           |   20 -
>  b/drivers/mtd/mtd_blkdevs.c          |   10
>  b/drivers/mtd/ubi/block.c            |    6
>  b/drivers/scsi/scsi_bsg.c            |    2
>  b/drivers/scsi/scsi_error.c          |    2
>  b/drivers/scsi/scsi_ioctl.c          |    4
>  b/drivers/scsi/scsi_lib.c            |   46 ++
>  b/drivers/scsi/sg.c                  |    6
>  b/drivers/scsi/sr.c                  |    2
>  b/drivers/scsi/st.c                  |    4
>  b/drivers/scsi/ufs/ufshcd.c          |   20 -
>  b/drivers/scsi/ufs/ufshpb.c          |    8
>  b/drivers/target/target_core_pscsi.c |    4
>  b/include/linux/blk-mq.h             |   16
>  block/blk-exec.c                     |  116 -------
>  24 files changed, 597 insertions(+), 656 deletions(-)
> 
> [...]

Applied, thanks!

[02/12] block: remove blk_{get,put}_request
        commit: 0bf6d96cb8294094ce1e44cbe8cf65b0899d0a3a

Best regards,
-- 
Jens Axboe



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
