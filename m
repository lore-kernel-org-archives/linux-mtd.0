Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73359C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 19:00:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38EBF6152B
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 19:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38EBF6152B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8uUnfD8cgNH0gWsRZNGLIR/yBfp65235JMl1Zzrm62s=; b=oXzHWyH2EBYKAx
	B2kykGhPS9yE6i3XZQOaE8PkYVZl6XEdsoMZtI7H23LlPYVMIB1hTl1Kr1e79+M7FqyXhdPgdvD2K
	zs5Ctv0T2/dsuPU3IZhgnI/RFQgH9j87rxj2pyRE0XVKPoGDqQWtrWriarbeFdaz8VB5D40ZX5Oo+
	vl2SzzfMvcGBEsKupBt92S0NUXcxpTajfqdoS+ATy6O1ZrLTFPmYwqwT3O41/Y1PxkZ+rQXGQtYYh
	YZn7XUuihB616HkdQkupqtOjrieDu04oaZK6DGD1+kB4nbvueQoSA9QsWL159splYPAFuAkoCOp5n
	FJ6nMggdsRUuHf5Vd8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo96U-00BNON-98; Fri, 19 Nov 2021 18:59:18 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8ra-00BKUH-Bn
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:43:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E4E21FF805;
 Fri, 19 Nov 2021 18:43:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, list@opendingux.net,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 5/5] mtd: rawnand/ingenic: JZ4740 needs 'oob_first'
 read page function
Date: Fri, 19 Nov 2021 19:43:51 +0100
Message-Id: <20211119184351.1404360-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211016132228.40254-5-paul@crapouillou.net>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0171480007d64f663aae9226303f1b1e4621229e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_104354_581577_D6830CA0 
X-CRM114-Status: GOOD (  13.79  )
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

On Sat, 2021-10-16 at 13:22:28 UTC, Paul Cercueil wrote:
> The ECC engine on the JZ4740 SoC requires the ECC data to be read before
> the page; using the default page reading function does not work. Indeed,
> the old JZ4740 NAND driver (removed in 5.4) did use the 'OOB first' flag
> that existed back then.
> 
> Use the newly created nand_read_page_hwecc_oob_first() to address this
> issue.
> 
> This issue was not found when the new ingenic-nand driver was developed,
> most likely because the Device Tree used had the nand-ecc-mode set to
> "hw_oob_first", which seems to not be supported anymore.
> 
> Cc: <stable@vger.kernel.org> # v5.2
> Fixes: a0ac778eb82c ("mtd: rawnand: ingenic: Add support for the JZ4740")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
