Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D503C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzeTyPDxdmyDr3k6nY9MQqF+jPz7zs68qdcn8T3YpUU=; b=N9k32/o9rUPBct
	ZxvV+g7KG/bB1t5eEVnE5CfFRPPtkr2W7pHDtW7eVpCWF8V4l7KbtEvJzoYrVDmJMF3h1RQ0e9KC9
	VmGwWdjoMzPg7G5hFB7z9ak79SQIdOP1PqprHBvTgv00q+Yn6VBR4MquLcQ8VN2203+IasReHYUwr
	AkVs2Jc99PFEPp5eOI8/Pn3Q5uboza+TtMAceQhFrQySY+KKUiUI+oF/9BIRJre1kFiUSemp76oH1
	MPbNoyYsWPrIjlXT6HGjyzxHB4iZiLbQAIOhRgGPviCyIKxlEwcRSd6zozW872cokwxbgKWBio8ez
	yGfe5MwhhMuu4KKs1pXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n04SA-00AtHJ-29; Wed, 22 Dec 2021 16:26:58 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n04S0-00AtEy-8g
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 16:26:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id C807A240009;
 Wed, 22 Dec 2021 16:26:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: omap_elm: Use platform_get_irq() to get
 the interrupt
Date: Wed, 22 Dec 2021 17:26:41 +0100
Message-Id: <20211222162641.257487-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211221212609.31290-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3b2af5c6174c821134eb62f69f830bdb96662187'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_082648_478063_0F0424A7 
X-CRM114-Status: UNSURE (   8.50  )
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

On Tue, 2021-12-21 at 21:26:08 UTC, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
