Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2DEC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=coo1K7hv0gK1LrxpTqtZpU197rhZKZU/iJdnQ/jpXro=; b=LEK6AsA4Z0Gyxx
	LQ4GiDToktAZV5fpVadOX1z2PQU4iIXqhPJriNmzjCPAEtdkK73TnMeR1w4teejSJQexBH5Q0Pftl
	bZqlJ4+ZCHXDFHJWEw+qlwmNl6I2wGsukUUdoz32ZqWwNEFRk1BgBi6ggIcQGtujZe5R+OpnFUv3m
	QFJUdR7ir4zWG+Xx2euVymDfudlYjBL3elgS5nnP5saceX9PXqAlBdBt3Isr1ME5iKZDQmLfW9fdy
	z6iatffJPzoRv/Dy/ofya3q14RuVHlpgDTs+VwZXtZZoRHOPMXmKLkD7QPwY4SkNM6zeff+FyEcDD
	M7hgVVhk83zqbn/3nfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n04Rx-00AtEn-Dv; Wed, 22 Dec 2021 16:26:45 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n04Rt-00AtDb-UT
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 16:26:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 56341FF80A;
 Wed, 22 Dec 2021 16:26:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: gpmi: Use platform_get_irq_byname() to
 get the interrupt
Date: Wed, 22 Dec 2021 17:26:36 +0100
Message-Id: <20211222162636.257421-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211221212609.31290-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ecb78b290bb56ccc835cf3fdc2dbcaaa610b65a6'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_082642_138669_AACAF367 
X-CRM114-Status: UNSURE (   8.40  )
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

On Tue, 2021-12-21 at 21:26:09 UTC, Lad Prabhakar wrote:
> platform_get_resource_byname(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq_byname().
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
