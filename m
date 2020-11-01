Return-Path: <SRS0=Psr0=EH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDBFC2D0A3
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 16:48:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7D6322265
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 16:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TfcmsogN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="1fh8hw1b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7D6322265
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yYY4WJxV/OZf5toD4shn4j1BtGKZlxUrW2ChFdpq8Ro=; b=TfcmsogN/n++d+STCtNKogHX2
	nbWUhPgPN/QnTAiW9NDf2vcmbOJcdJ7wdq2E4VRhpWImBUNeGc0b8+dlu+5dwm/EH4wQfPkhTM90J
	nxBxovYRBNSK9zhaH5kuyCpJcn6SwShUHhobFpJBo7TxIwoy9EcHOkdpjjF70WeBE5wfU7GwycYtA
	MDe4YiPt3ByJEMJtNSDDAH3YYyozCMdk8y8GrvsrYg9XgWPc0Js8qzDOPFvOPx9zsjj0tUiJWRz0f
	755RxGv5DBxEEqq5zS/YFTSfr7QKvYasKHVIbChDKd2I3/ElLcLHaKvhrB2KaJ+WFy0KakoQtXASO
	O1XAa51vQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZGVs-0000S8-3A; Sun, 01 Nov 2020 16:47:28 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZGVp-0000Rd-Bk
 for linux-mtd@lists.infradead.org; Sun, 01 Nov 2020 16:47:26 +0000
Received: by mail-pf1-f174.google.com with SMTP id 13so8961122pfy.4
 for <linux-mtd@lists.infradead.org>; Sun, 01 Nov 2020 08:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZnX97cZi6Tq1d5eR74IXiOWMCb5Il9NZ1Se/Vo5HW5E=;
 b=1fh8hw1b4PtM43PjPjUPsgwnC03eOzq1D/OIFg9Z2RLVbDo9D2nclogiTHPlZ9q9gq
 rrmC+XRj9jIExjEAIOBmizVgp08ZK+1BOrKNPSsqt6PXuv87piwipBy0tmkGDLci20YZ
 JR2v8tDBzCXLzUsRIF3SNeDwpgOyDiUoBmGT/dKyCVInbDNsH3XW6LdeawRrzdGSBvi3
 mi2Zd1b281L8/5BerY1o0iDfhGaz4v1tgb6OR3HUy1joR3/yNIFriK7SN7QateperW5W
 2nQPknP0sHnoa1Z7dhknzTXPvkZP1QGclC+Qpgjo7CRH5NKu46KBXTrYpjYhzZx1X2si
 M+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZnX97cZi6Tq1d5eR74IXiOWMCb5Il9NZ1Se/Vo5HW5E=;
 b=prU/Kg63zwnG894OSd33WMkNihavrCkcgLvgsHf8CQi/TcDdSNrcjCrP7+o2Xgak+p
 s1ASldLPPa9cJEWlrMsd3rvsx7QKqRcRAbeh0uhzadQitKAz7AR7+8YKGYxpF69c0b0o
 g7721nkYTC+L4tKNpCXb92kAXyb+jiDvSlhRxgpE19Q9ZMz5jsY20oV6fcde0SH9Uelr
 oh/al2EfS23t0K1mQqUzvGfD92WbOV8ixhTeSVUtyvGMxKEXTA5QjBv4ki9NdW26yJDz
 B0MTJCJXzWNrLREK9WAe8GbqXi84BjFV5LAvKyvECoRsaGYx7d0lc46lbtKdo1Vi6RYF
 +w9g==
X-Gm-Message-State: AOAM532wJt+WzFgw/g5pS6sqGsq5qWusM1z4LXeuIR8hPk6PJ5zMTMWs
 /NeiT60kJiZ9joDrRYM+Q49/Rw==
X-Google-Smtp-Source: ABdhPJxTQE4+lDH2ha7od50bGb6ipTN3YldzqLbuO9m9iCrZbUFUOoR3Y6ocz+rikoLtjR5mdUiVNw==
X-Received: by 2002:a63:d74b:: with SMTP id w11mr10225608pgi.147.1604249183766; 
 Sun, 01 Nov 2020 08:46:23 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id t74sm1926656pfc.47.2020.11.01.08.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2020 08:46:23 -0800 (PST)
Subject: Re: block ioctl cleanups
To: Christoph Hellwig <hch@lst.de>
References: <20201031085810.450489-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <877901e6-6cdb-42e9-3b32-cb8b93bfff4e@kernel.dk>
Date: Sun, 1 Nov 2020 09:46:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201031085810.450489-1-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_114725_419767_3EC038B1 
X-CRM114-Status: GOOD (  16.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-raid@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/31/20 2:57 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series has a bunch of cleanups for the block layer ioctl code.
> 
> Diffstat:
>  block/genhd.c                     |    7 ----
>  block/ioctl.c                     |   62 ++++++--------------------------------
>  drivers/block/loop.c              |    2 -
>  drivers/block/mtip32xx/mtip32xx.c |   11 +-----
>  drivers/block/pktcdvd.c           |    6 ++-
>  drivers/block/rbd.c               |   41 ++-----------------------
>  drivers/md/bcache/request.c       |    5 +--
>  drivers/md/dm.c                   |    5 ++-
>  drivers/md/md.c                   |   62 +++++++++++++++++++-------------------
>  drivers/mtd/mtd_blkdevs.c         |   28 -----------------
>  drivers/s390/block/dasd.c         |    1 
>  drivers/s390/block/dasd_int.h     |    3 +
>  drivers/s390/block/dasd_ioctl.c   |   27 +++++-----------
>  include/linux/blkdev.h            |    3 -
>  include/linux/genhd.h             |    1 
>  15 files changed, 73 insertions(+), 191 deletions(-)

Series looks good to me, apart from the mentioned mtip32xx change. If you
repost this, can you look through commit messages and titles for typos,
I spotted quite a few. If not I'll do it when applying.

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
