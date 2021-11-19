Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA289C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 19:04:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80D8860F70
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 19:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80D8860F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ormgcb20kOP5wB8rAHxQPq8NxvVRfAk7mcuypUIhRBs=; b=rJCSBstnlmUBYj
	b/K71vOb1zu0aJDjeqjrpD2fIDIhtm3xlG1ruU7nef4tSDEk9Kfovm+dHe5WlKBs8VQ46Xa3c6685
	+fxTwbb/k2UaUfbDNgK/lVJ47KGNJZVzoPyLlNLhEqqMxXDwWAQxJ45jbfGKQzJLtay/x0n2w8NAF
	v9eqcTVS7qgYEaFWAeBA8d/fpMSt5KW914W6j6CVBGFZvf/S05oQ17XOO9LboYiCFodxi7lLLFSVK
	YU1A3V4Lr8gxifhbbd+2EsqvAgokaYlrOtQS34rWcY5TcAvCOL0iMvpETeNIbZJRuFuNE3DJlMrnf
	d36ZRBGygEJ8o1xaDh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo9B0-00BO9o-Sg; Fri, 19 Nov 2021 19:03:59 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8rk-00BKXM-10
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:44:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 44175FF80A;
 Fri, 19 Nov 2021 18:44:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, list@opendingux.net,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/5] mtd: rawnand/davinci: Rewrite function description
Date: Fri, 19 Nov 2021 19:44:00 +0100
Message-Id: <20211119184400.1404488-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211016132228.40254-3-paul@crapouillou.net>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0697f8441faad552fbeb02d74454b5e7bcc956a2'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_104404_250460_7F08D225 
X-CRM114-Status: UNSURE (   8.26  )
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

On Sat, 2021-10-16 at 13:22:26 UTC, Paul Cercueil wrote:
> The original comment that describes the function
> nand_davinci_read_page_hwecc_oob_first() is very obscure and it is hard
> to understand what it is for.
> 
> Cc: <stable@vger.kernel.org> # v5.2
> Fixes: a0ac778eb82c ("mtd: rawnand: ingenic: Add support for the JZ4740")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
