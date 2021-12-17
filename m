Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6059C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 12:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LP0uCOYiX3MMj3N0oF3M43zSYNuUMiY9IF6QwxulMwE=; b=RE/iPZ8tU+JEch
	X8S1rcwaPjK5qAaJwgYytLsfRLr+4nSHtYG2Adkrr48c/FmvMqU1dPntgoL0hjATBm1D6q3qd9nl+
	HJj04csURjP/GeCfkhj/k/ykNuXHhpoSd4p6JmEVYyX2VYfXC5jwE0DKFmoFB1u63Ytp3J29UQFQR
	tS8tcCMroNmirQuKLqe9gLeOvXp/R0Nq7pLwZjuTq7FQstg4aC7OTYn88auJWKaMYyDvTinB/SLyK
	yjZ4LOxrsQFqkbbOnPoX/zcjmT9cYsGDn2ogZNxFGEnCtTGELtnRWZS9axB0z+0LNMqXCfd6YZCGD
	Xo4vSXxqGNBp0PW736cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCDO-00A5ME-UG; Fri, 17 Dec 2021 12:19:58 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCCz-00A59C-GR
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 12:19:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id A2889200003;
 Fri, 17 Dec 2021 12:19:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 richard@nod.at
Cc: vigneshr@ti.com, kishon@ti.com, nm@ti.com, tony@atomide.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] mtd: rawnand: omap2: fix force_8bit flag behaviour
 for DMA mode
Date: Fri, 17 Dec 2021 13:19:28 +0100
Message-Id: <20211217121928.327685-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211209090458.24830-6-rogerq@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4695a3cf004a44a8d196d7c2f23d46efca0f92e3'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_041933_712460_7AA5B1FC 
X-CRM114-Status: UNSURE (   4.88  )
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

On Thu, 2021-12-09 at 09:04:57 UTC, Roger Quadros wrote:
> In DMA mode we were not considering the force_8bit flag.
> 
> Fix it by using regular non-DMA 8-bit I/O if force_8bit flag is set.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
