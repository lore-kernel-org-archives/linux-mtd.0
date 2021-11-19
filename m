Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04001C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:52:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB04561AA2
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB04561AA2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cvFg24RZGaXqIGU+RhH9y9EVfA4k77WyGrE37SE+ug=; b=nbPjUnEODs2xDe
	jWv1GIY8EySmZA4hf3cI1Ld7sJOClOgpztmupR1auDGCAMyHgbV8UvNmMnGTA9sWmIp/IZunZfiEF
	/A79T657eaDQyLXmOw9fMGBdeIgA4YiJkRArugb+rlBbPtRG7Bzus1PXfHNHsIzM9lUHNcC9n+d6g
	QJ/+4bI7HZaWWzo5hg1j0xzKGtVcIGHPvu8sn4X3Oc4tlaICbQfnv9TP7iU+8VjtRtm7Hr8QC5XsW
	cqTcHQ3HYUeGYgZ0N7xs0Vx/hYQjRJDW5GQxalMIPK4peoqXJdlLOv0AxZSL06/6UapKATWvoD1qX
	9k5hq3yoy7vNe9xf26Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8zQ-00BMCi-Bw; Fri, 19 Nov 2021 18:52:00 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8mk-00BJOQ-K9
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:38:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 834581C0007;
 Fri, 19 Nov 2021 18:38:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cai Huoqing <caihuoqing@baidu.com>,
	miquel.raynal@bootlin.com
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: denali: Add the dependency on HAS_IOMEM
Date: Fri, 19 Nov 2021 19:38:52 +0100
Message-Id: <20211119183852.1402966-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211109134758.417-1-caihuoqing@baidu.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8495c7eb9dbed872b5498270e661a6cec4c019da'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103854_839276_A57173D1 
X-CRM114-Status: UNSURE (   6.33  )
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

On Tue, 2021-11-09 at 13:47:58 UTC, Cai Huoqing wrote:
> The helper function devm_platform_ioremap_resource_xxx()
> needs HAS_IOMEM enabled, so add the dependency on HAS_IOMEM.
> 
> Fixes: 5f14a8ca1b49 ("mtd: rawnand: denali: Make use of the helper function devm_platform_ioremap_resource_byname()")
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
