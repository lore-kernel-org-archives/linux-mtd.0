Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C066DC2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:44:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C1661417
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C1661417
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=epyL3StI5YElbpLoycr8NVTj8qshsucYui3K6Kcda9o=; b=SOdlZZm1/CQj0T
	4H8Sc2IO9ZqTbvrQBYVUKvkgqbHrVgTAZem1Djvl6+4DcDgylMq3OmigRkJkRTj9jFGN9cvp+VQcT
	j6fDFudiPIV4SKjg7ejvw/0IOq1ORRuqqcWNQXWoLX72dfkWs4vRlUBdK6KZVaga8x3uVL0diIAil
	gkTKcv9BUy6IjsQMdMU5nSiYd5xzZkG28v11EK1G7vx2odgskGYHbHi2RliE2fzM5dK3tOyBXzHQ5
	OWb+tQIr5eRHF2R7IFOw/mwa4Fp06Sv61kKb8Ruxs41M5ug4mOHyJop4isNERpC7K/6FtV0l4cP1i
	HMRRBW4Z0mbnFcHNkmMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llq4a-00CyBn-TR; Wed, 26 May 2021 09:43:33 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpRx-00Ci9u-AQ
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:03:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E75A6C0003;
 Wed, 26 May 2021 09:03:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/5] mtd: rawnand: Move struct gpio_desc declaration to
 the top
Date: Wed, 26 May 2021 11:03:34 +0200
Message-Id: <20210526090334.181225-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510104051.9701-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'31df6381cfad18fef295e8cb2997d02d037c1d73'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_020337_530380_A4FAB9C1 
X-CRM114-Status: UNSURE (   8.14  )
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

On Mon, 2021-05-10 at 10:40:48 UTC, Miquel Raynal wrote:
> The struct gpio_desc is declared in the middle of the rawnand.h header,
> right before the first function using it (nand_gpio_waitrdy). Before
> adding a new function and to make it clear: move the declaration to the
> top of the file.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
