Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B4EC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 15:25:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7337E61A8A
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 15:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7337E61A8A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fAsosyYeqkqJu/vqhr9VyY4ovNyJgyviSX6qe2u4Qos=; b=t0kmpipMuxkS/2
	GF3Ey93wxjFK6JNyuKITbLI9HK9fX+2e9fr5A8Y2V/Nuiie+Dc7azC/J++/O6oYuI1WmXGQ3SZekr
	oAMH65saH6o27fzF4c9qVspLfpOGycTp4BSGBZd2vvr4PoDLBQv1OokPlTB2tbB9ufntNaWSgwshx
	dbzYf71QKL3qki17dLjAzwjaQ1LNr9G6F/cGP77JnXysmd6rvKMFo7Y1U//MhCjoEyttJivqi3bs/
	+P+pZ/c5x0zhLZZPg3B7/CeHnW4VqjB5DPrGNbfIfJ5kyzEgNh3SHnRQfVCsCrsV6oxcdRZhmkxZx
	IoTufd5grO/pYyZheo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnjHI-008GDT-2m; Thu, 18 Nov 2021 15:24:44 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnjH7-008G9T-2B
 for linux-mtd@lists.infradead.org; Thu, 18 Nov 2021 15:24:34 +0000
Received: by mail-il1-x136.google.com with SMTP id j21so1277277ila.5
 for <linux-mtd@lists.infradead.org>; Thu, 18 Nov 2021 07:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=O+/LXAwdkIJFE9KERkHFyTHYhgjPDJwSFxMMHTdX3yg=;
 b=zBgJto18usU1xmq60M/0PBBdZEdin6MxUciyiMPmsRm9qlqmMppb67SSa8ExVBDlU0
 wMIMQB4F2uNjgBspW9AUAlLe9EdMZagx6Rw1bo3z9mBb+ChKlYuY023xwH7+4mqCB5VR
 28utk188sEDlpfgFJZ3bUToDJwh7ta11qg2TsiHU4DmE0/hLFb2s6IMMzKqHd3CoJarX
 leI/RkYcuY9ShLCIT2USQboFiPMG+8K1u9hjvChxmToKwaVWHJ5Vu67XtNT6KkP4JK5b
 M6pScDfMWb/7d9+klkgpUmswb5SRm4iY9TO0N0KEN4YreO/SfqghCDKbeS2uLRFWovX2
 fW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=O+/LXAwdkIJFE9KERkHFyTHYhgjPDJwSFxMMHTdX3yg=;
 b=n5U60oOKbfmaWaQcS6XwuphhFJJqxENYNaXm+fnhPlHR8le411ruu1phKuTVoO0YPm
 UIqlYY21GkNqqGlXnvRN8TK4W1quhLNxy5jUSc4vYjUxg8KQ3XJSS+JdZMa2f/Licrm2
 m3gz43LYaQl1UQKpMbyM8ns+WqbKBypYytnT3q7FPjTuMHkNtho9jI+45jOpgdVBlfIb
 eZSHx8QdaHAlHfp1gX24WW3Z4Fkve6EZIQXDysDKdYsJb15VZK33kvYzsoMipZ5jHRgy
 mnVAMyyS76EOIpxlqLuH4tigNiaQqn6E6vh4of0WRQF8TP3Q5QiXCLZafdhNocH8/W3j
 Py2A==
X-Gm-Message-State: AOAM533hU8x2/EtfhG1Ee5d5pzIlcJra/KT5ACcTPYO+ob6gBdKn+yvU
 Q83I32L1qrBUu8cjXr5AWDzuU9ul2wvKQR+S
X-Google-Smtp-Source: ABdhPJw1CWvXIjvXMCPpD5KBZHirebHOwrkAQuXnPfp/9QlIOYGfAXP3exXDWUrnkjPXIosCNhmHQg==
X-Received: by 2002:a05:6e02:1c0c:: with SMTP id
 l12mr16760032ilh.84.1637249071369; 
 Thu, 18 Nov 2021 07:24:31 -0800 (PST)
Received: from [127.0.1.1] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id p18sm73311iov.44.2021.11.18.07.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 07:24:31 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-scsi@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-block@vger.kernel.org
In-Reply-To: <20211117061404.331732-1-hch@lst.de>
References: <20211117061404.331732-1-hch@lst.de>
Subject: Re: move all struct request releated code out of blk-core.c (rebased)
Message-Id: <163724907076.288457.4311609107060829308.b4-ty@kernel.dk>
Date: Thu, 18 Nov 2021 08:24:30 -0700
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_072433_184645_22E52195 
X-CRM114-Status: UNSURE (   9.96  )
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

On Wed, 17 Nov 2021 07:13:53 +0100, Christoph Hellwig wrote:
> this series (against the for-5.16/passthrough-flag branch) removes the
> remaining struct request related code from blk-core.c and cleans up a
> few related bits around that.
> 
> Diffstat:
>  b/block/Makefile            |    2
>  b/block/blk-core.c          |  341 --------------------------
>  b/block/blk-mq.c            |  573 ++++++++++++++++++++++++++++++++++++--------
>  b/block/blk-mq.h            |    3
>  b/block/blk.h               |   33 --
>  b/drivers/mtd/mtd_blkdevs.c |   10
>  b/drivers/mtd/ubi/block.c   |    6
>  b/drivers/scsi/scsi_lib.c   |   42 +++
>  b/include/linux/blk-mq.h    |   13
>  block/blk-exec.c            |  116 --------
>  10 files changed, 552 insertions(+), 587 deletions(-)
> 
> [...]

Applied, thanks!

[01/11] block: move blk_rq_err_bytes to scsi
        commit: 6ace6442a37e17d56a1c54f55bea48ac796f869d
[02/11] block: remove rq_flush_dcache_pages
        commit: 01ed1e78789a2e3d7a895ca38706a4fb1a6146d0
[03/11] block: remove blk-exec.c
        commit: 9048707b1d8f8aebcf23e5b5b143ad1de2a93b34
[04/11] blk-mq: move blk_mq_flush_plug_list
        commit: 33af852518417ed7a90703c572e58cc99bef4770
[05/11] block: move request based cloning helpers to blk-mq.c
        commit: 432f3b8863dc44ac224e231dbe1b0038b5aa4239
[06/11] block: move blk_rq_init to blk-mq.c
        commit: 8586ee1a36a8f690492a7b7ee8f31c514d65957d
[07/11] block: move blk_steal_bios to blk-mq.c
        commit: 4ef40a1dc9ebeaa87cb53f16641d439d4ebcfdd0
[08/11] block: move blk_account_io_{start,done} to blk-mq.c
        commit: 1bdc7c540b455837af9d736e5f0abb77cfce3e62
[09/11] block: move blk_dump_rq_flags to blk-mq.c
        commit: 8a77648954e63f6654042567e31794bfd5ea02a5
[10/11] block: move blk_print_req_error to blk-mq.c
        commit: 065c87d65d74ac24bfc3bbc43de068ba99188b1c
[11/11] block: don't include blk-mq headers in blk-core.c
        commit: d94d230a3711ac85af1c3cd484419a4a81193387

Best regards,
-- 
Jens Axboe



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
