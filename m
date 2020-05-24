Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AE1C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:04:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9A872076C
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uw8em0xL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9A872076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WweOxzbxhfiwcSCgba5X8iGi1N1aZ//wU6srQikVU+Q=; b=uw8em0xLBW8dZe
	pAr5/WkYgRcR7EerfV75uhFS2PUN/CNYi7dxTHvW05xeJu8k/ycsDrEjmu74QuiGG7vCEOoUdtI7o
	JRq8PFtub2cBdMaao0zv8+I68Ju8j3jmfQNOnp912x4Ty8Z7UlucUZUQ/b6DeM7XxjUwOsPETPcLk
	uTFyyIedb/moZ1SAEl4ZUlZ4tNtBG1ae+oO3cYdkF1rwlKBIt+jkgyMhB+j78zfmO3lc0hv3C86RL
	flTkDBM1bCBMNUJ2VtmdiK6Sra5DH5Nl6khToskiPKJhstjWPdEM2jfaMxzWHpgyfKTbMuBJ9oG5B
	ooP5oqt0Kdzx9esdz32Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcvv2-0000hb-79; Sun, 24 May 2020 19:04:20 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcvuI-0008QD-CN
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 19:03:36 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A2A69C0004;
 Sun, 24 May 2020 19:03:31 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 3/4] mtd: rawnand: ingenic: Fix the RB gpio active-high
 property on qi, lb60
Date: Sun, 24 May 2020 21:03:30 +0200
Message-Id: <20200524190330.3754-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519232454.374081-3-boris.brezillon@collabora.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 46a67c911733eeecaedd3d6f85c1cd7a481dbb8e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_120334_576033_544D6B24 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-05-19 at 23:24:53 UTC, Boris Brezillon wrote:
> The rb-gpios semantics was undocumented and qi,lb60 (along with the
> ingenic driver) got it wrong. The active state encodes the NAND ready
> state, which is high level. Since there's no signal inverter on this
> board, it should be active-high. Let's fix that here for older DTs so
> we can re-use the generic nand_gpio_waitrdy() helper, and be consistent
> with what other drivers do.
> 
> Suggested-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
