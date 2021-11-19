Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E78C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 19:07:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 889E160F70
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 19:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 889E160F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jV3ZALqIxl9fLdIDBcyVyx3EGdp61Il+xF5WuwQnBGU=; b=U2az62wf3kHJrb
	xpMK2ZwkdAb9AJZzGQziepTsMAyDjgkdmaBrTC1ACH8kifFgpGPjbBBE6RZkhcpjcYdH4qX4AVml1
	64TEEoTY36xY54vM8L2S3u9SKjnPIeLCkqpxhmi7s7LaBbyidOlYjj458QMitEB2p7MaR2EWgsEnJ
	yIGPNGvY98GEC8HW6yfosTGIPzN1XFYDewKq4BHRBe8o6caoAdmyWDxGt3fORhIATonVSDiH88Dsq
	gBAHDoJ4PE4eXFz0Ge4eocAsCEzw34pk8kmEYV6dc7TsEXrTebX0jnxoJBg3QX9TIx4bc44t4RrAi
	fDHnpq7m8IeoeFu7lecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo9DR-00BOZY-Nn; Fri, 19 Nov 2021 19:06:29 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8ro-00BKYw-Hi
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:44:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B37111C0004;
 Fri, 19 Nov 2021 18:44:05 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, list@opendingux.net,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/5] mtd: rawnand/davinci: Avoid duplicated page read
Date: Fri, 19 Nov 2021 19:44:05 +0100
Message-Id: <20211119184405.1404555-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211016132228.40254-2-paul@crapouillou.net>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9c9d709965385de5a99f84b14bd5860e1541729e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_104408_765868_4EF3B32A 
X-CRM114-Status: GOOD (  11.35  )
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

On Sat, 2021-10-16 at 13:22:25 UTC, Paul Cercueil wrote:
> The function nand_davinci_read_page_hwecc_oob_first() first reads the
> OOB data, extracts the ECC information, programs the ECC hardware before
> reading the actual data in a loop.
> 
> Right after the OOB data was read, it called nand_read_page_op() to
> reset the read cursor to the beginning of the page. This caused the
> first page to be read twice: in that call, and later in the loop.
> 
> Address that issue by changing the call to nand_read_page_op() to
> nand_change_read_column_op(), which will only reset the read cursor.
> 
> Cc: <stable@vger.kernel.org> # v5.2
> Fixes: a0ac778eb82c ("mtd: rawnand: ingenic: Add support for the JZ4740")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
