Return-Path: <SRS0=s+BH=MQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0B5C4338F
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jul 2021 10:28:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B5660E91
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jul 2021 10:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65B5660E91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=dbgaX8yigObi5WW+SIRVG/X0r5fnWNaeuVsDoLrOmzk=; b=4Q3t7VbwPxOp3Y
	OBz1q595QsQa1LFbeVMYExuNkoTxx/B+InGOntV7yDbkvJI2JpWvSc+rAVI03jVPLAYp4eCllsW73
	S+XV1XALiYybxzHRCEg4GjjGKPYvpPVQ+U4n4vCJcvgYwDFIqCwjeaP1DuD2y+YRwEBBF0B5S0qzA
	fA9HiCNCDPY6h4qmNAXh473m1/n/s8eB7inCXphYfxH48raFNtYerVkRJgfbss25sH/B7eFmWpGZK
	Z4fhmH/tyO/wQzDk9SxT4nK+oy/B6029xFJ4/ZItt/n3WU9ormAzY20LeOPLPJD+80WgQIqu0/4BI
	nx9UHZY98dyGrhmBobFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7EsX-0073GQ-5Y; Sat, 24 Jul 2021 10:27:33 +0000
Received: from gofer.mess.org ([88.97.38.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7EsT-0073FZ-Qu
 for linux-mtd@lists.infradead.org; Sat, 24 Jul 2021 10:27:31 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id EAC7CC63F2; Sat, 24 Jul 2021 11:27:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1627122441; bh=9+VzlKTA/UjXwMiDCTLm0djf5IVwggDX2+A+vGZazNA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=SCXrvNxJ0xcFvq1IKXUOXPefRTq4tC0/TjZLkNnRIknFr6rWCqFVK3FaWN9pqyLe1
 nZ400GVFe91tHnwd4XBTQdMvQJ5YcIDjETb2xjcYo73jwJqtVANtoESl5DEYk84y8+
 rJFAAMONVmgww6brr20yDuh2rK7y6351W0hjex8iYsGjZmdv/ndOVcqSVVy3SGBV7L
 26Y4Vv75FtcgVg3GHFaUce/zvVXnL1YnsCvE/flHlvKh0aGpb6KRUTT6Ib39/lkF7x
 zubHFpm1/U8Y5aG+ZlOPMg5Ckh+9UiKxKRxTST8aUu8tgho+ztEGD3pmwul3/1b+ip
 5C2uaakCRQWRQ==
Date: Sat, 24 Jul 2021 11:27:20 +0100
From: Sean Young <sean@mess.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/4] Fix various issues with RFD and FTLs
Message-ID: <20210724102720.GA3508@gofer.mess.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1626169090.git.sean@mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_032730_212614_4576AFB9 
X-CRM114-Status: GOOD (  10.82  )
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

Hi Miquel, Richard, Vignesh,

On Tue, Jul 13, 2021 at 10:43:59AM +0100, Sean Young wrote:
> Sean Young (4):
>   mtd: rfd_ftl: allow use of MTD_RAM for testing purposes
>   mtd: rfd_ftl: add discard support
>   mtd: blk_devs: make discard work on FTLs
>   mtd: rfd_ftl: fix use-after-free
> 
>  drivers/mtd/mtd_blkdevs.c |  1 +
>  drivers/mtd/rfd_ftl.c     | 44 ++++++++++++++++++++++++++++++++-------
>  2 files changed, 38 insertions(+), 7 deletions(-)

Do the mtd maintainers have any feedback on this patch series, or will
they be accepted?

Many thanks,

Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
