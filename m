Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20CDC2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:24:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E04611C2
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E04611C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RubZpBSYmmpInvLgVNZeAqY1Ztt7//y7XFfO+qCr1sY=; b=p2q8eNgpyeYlEk
	XCoiy0U2hhj/zynr9/cbHLqx/warI1uFsh+wCGZcK3AsamZbvkjp89WET7R6TV17XVCMwtEu2tahS
	n9fZDzido2hyFOkU0u/9897oKuljIhQVII/R4lUtiGHGZQt0JiIcGZa1d1SxX9bV1kUxOUB2HsXNG
	XjkvSPWAo7fZVTIxlPC2nJaEqBn5J1/4tqv0n99UuFBxDPszW2gk5LY/mR3z+mS8CjjLKLfjShFaM
	KKAcVyUV6EbEtWQVG3AAWiM2ievJ3zwTRRFDGILRFi59FM/usixOO4Xapc2JyyvHH3CZ/VlWfwy4f
	mObFFR1Jp7uYZ3oTQl/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llplQ-00CqPY-Bh; Wed, 26 May 2021 09:23:44 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpRD-00ChrM-7G
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:02:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EABE7C0005;
 Wed, 26 May 2021 09:02:48 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Corentin Labbe <clabbe@baylibre.com>, boris.brezillon@bootlin.com,
 linus.walleij@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: partitions: redboot: seek fis-index-block in the
 right node
Date: Wed, 26 May 2021 11:02:48 +0200
Message-Id: <20210526090248.180636-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210520114851.1274609-1-clabbe@baylibre.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'237960880960863fb41888763d635b384cffb104'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_020251_435231_C4D81123 
X-CRM114-Status: UNSURE (   8.75  )
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

On Thu, 2021-05-20 at 11:48:50 UTC, Corentin Labbe wrote:
> fis-index-block is seeked in the master node and not in the partitions node.
> For following binding and current usage, the driver need to check the
> partitions subnode.
> 
> Fixes: c0e118c8a1a3 ("mtd: partitions: Add OF support to RedBoot partitions")
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
