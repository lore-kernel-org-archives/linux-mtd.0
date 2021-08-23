Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9B4C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 08:34:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 041BD61248
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 08:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 041BD61248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Owsk2lfjLI1Se14lTvytzuu7jw0kHjS5AX05vrpv4k=; b=0Po77KJZtdlDUi
	64+c6a5x7u2hBlCMyRldFiv9sj0yZxheCrvAJIPEbghncmsKV7eX9Zhtdpauh7FdeqVVw+M36MpNF
	Fy/iizp3ALcdJopCPpnG+WTKeTAHMV/sr4ONhmMV36rP/B4vGs9yyNw8SKqyKOIg17pu80UKYsEav
	Ox9IuXb7xQAtlaoZp9HnRVW2IsyeC0+fwBSCXWuBNF5e0pm2IsapKQft2kA+gepi04qaUTf6AeVeh
	ZCxMlUtjEW+C9xTyZ2xmJAZNDxTmtR6wK4v/f0f0Lg+txn2NRRNxYNMRoTFKO5NOy333KX5zi0/t4
	ngmTkCfxY0caeVL16bUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI5Oi-00Fw1c-25; Mon, 23 Aug 2021 08:33:36 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI5OT-00Fvx7-45
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 08:33:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2FC0C40006;
 Mon, 23 Aug 2021 08:33:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christoph Hellwig <hch@lst.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 7/8] mtd_blkdevs: simplify blktrans_getgeo
Date: Mon, 23 Aug 2021 10:33:18 +0200
Message-Id: <20210823083318.9127-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210823073359.705281-8-hch@lst.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'37b143d12b5f099bb4375162303ff1df1692cc5e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_013321_336358_B727437F 
X-CRM114-Status: UNSURE (   7.83  )
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

On Mon, 2021-08-23 at 07:33:58 UTC, Christoph Hellwig wrote:
> No need to grab a mtd_blktrans_dev given that ->open already holds one
> and ->getgeo can only be called on an open disk.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
