Return-Path: <SRS0=WX7q=MH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F653C636C8
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 23:09:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17DC6613D0
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 23:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17DC6613D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xUzDttTryeYpj9fvTIYx2uTLhLsaVqCmA41UPb9zzc=; b=UZdn7qvmFXfXj0
	33isMBeXyqKWjQ/fDf//I755i+dacTuNDDWY9qXjHSrvOczGD6yyt3M96eTj4L1KQEwxYxvlEvq2g
	IQfCpLD9vQQNmSUvn4FJ9HbtGUpNDiIBNhqziKfzP74TQjndy2GerUyIEuVe33DsiB3pVUH4Pi2iE
	M+a1/R4xUh6Mu/77fvqq73TavOwJOkrkRan9wOohH9GMZUWsBXG8OXaZiPPHmFZ+jis9WqolULrK1
	Q31uOIA/iGHnnZxgWEcfTveDqYYqO7rjKzuQw+Fr6iE51iUSnPnffa2YYCGuUq+IuQu/6ecjOQfzj
	GH0qC057hkbGXbrMiIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4ATZ-002cq4-FD; Thu, 15 Jul 2021 23:09:05 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4AT9-002cl5-Ua
 for linux-mtd@lists.infradead.org; Thu, 15 Jul 2021 23:08:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A7972C0009;
 Thu, 15 Jul 2021 23:08:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Riedmueller <s.riedmueller@phytec.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dan Brown <dan_brown@ieee.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: nand_bbt: Skip bad blocks when searching
 for the BBT in NAND
Date: Fri, 16 Jul 2021 01:08:36 +0200
Message-Id: <20210715230836.222817-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210625123821.207458-1-s.riedmueller@phytec.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1a57b13e6017d2af575f4f42e848aa0b64d4bcf1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_160840_189923_4AC7700F 
X-CRM114-Status: GOOD (  12.34  )
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

On Fri, 2021-06-25 at 12:38:21 UTC, Stefan Riedmueller wrote:
> The blocks containing the bad block table can become bad as well. So
> make sure to skip any blocks that are marked bad when searching for the
> bad block table.
> 
> Otherwise in very rare cases where two BBT blocks wear out it might
> happen that an obsolete BBT is used instead of a newer available
> version.
> 
> This only applies to drivers which make use of a bad block marker in flash.
> Other drivers won't be able to identify bad BBT blocks and thus can't skip
> these.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
