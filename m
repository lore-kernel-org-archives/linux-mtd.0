Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7237EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9hdYj02QfxOYLttcxul7Ofs1ZsK+SIfP5Mx3J3Dkqo=; b=Ci62YF+4RRFmgR
	/wQHaqikDTsSyR+a6TYlblopS26/6pGmFrv3wY3QB0v+4d7NeN5k+JBdLQZN/cdfjXy6qrZEa9e76
	hVOAiiiC/fIJ8qYjGAsB0JzrDP8v/IOgAuqC3zuj9XaSflAmNmXG2D8P2pdLVikJUaU5T+CZBdGTc
	FXfaO3mtkwgda0NNQ3mf5SQlkzoIcFB+xQBrIn1hKIWl8mkFI59GuineOjEg8lRjW17XlGmi1CJ3D
	8K6Zg99EuqG9qxJkdtr0ru1Bvgw2dqW3S/uzQ6vLOxrbbsDLbrr2KEIbglPUcRp28KGsZjPdanrHa
	euVgjMf4mfzjsXmV4ZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZiS-009tk7-0g; Mon, 31 Jan 2022 16:39:44 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZSF-009q44-J2
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:23:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9284120010;
 Mon, 31 Jan 2022 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86IqAUCSeNJMWB8neOsxD9ttHYUs56oiSvgyAaM50O4=;
 b=oZFfSiYQvH+XvClmQm1xf3QSdzYsVVIctFIOq8j9lWNEXZyonYrJSeJHjBk7/xEvu/nkde
 8QpnzWwkvteiqWJR174Ji3rAPcUGf7Tmd4FeOUz2KvcHH9/LLr3orLxljlg9y3xCrOviCE
 ohjy4O5JTBaQgRJPgxIcJpfkQwIrI0qr0anPEE5Xk/jzyGD4hQ16/nffKSdGx7k4aUtkOk
 YDvuUG2inVaP/JV6s6KZ8OR4EcBpMjkMoCSnE2hQLLS+Hp4MPtY50xOFFt1dfKG9oOBbPC
 +0RSLERLrg2yEqMeeUWHPQa+xdBLHC7+bekXhe59e9qqlJGk74Y/XrvPhvnKUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: nand: ecc: Rework Kconfig dependencies
Date: Mon, 31 Jan 2022 17:22:56 +0100
Message-Id: <20220131162256.24430-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220131145032.17614-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'319169b2a767b293984ae2c5e22268fecfb91864'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082259_795476_7FE72410 
X-CRM114-Status: UNSURE (   8.66  )
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

On Mon, 2022-01-31 at 14:50:32 UTC, Miquel Raynal wrote:
> Unlike "depends on", "select" does not enforce any type (y or m), which
> can lead to the following situation:
> * SPI_MXIC=y expects the NAND symbols to be built statically
> * SPI_MXIC depends on MTD_NAND_ECC
> * MTD_NAND_ECC selects MTD_NAND_CORE
> In this case MTD_NAND_CORE=m is "valid" but will trigger 'undefined
> reference' link errors.
> 
> The cleanest way to handle the situation is to use a "depends on"
> between MTD_NAND_ECC and MTD_NAND_CORE to avoid such situations.
> 
> While at modifying the MTD_NAND_ECC symbol, fix the spacing.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
