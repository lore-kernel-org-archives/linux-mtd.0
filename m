Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B32C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPXReo/JYIf4RIio//go306X/Q520cx9eNg6Xh2AJRk=; b=JStO7e3t4Sw2/C
	BU/mr2OYoHk3+ODnnBD7dx7OgfW8/gpJzGCktbHQKINa99Ic7XpuJ9hY+8R9alK4WhQxodohLnDoz
	dGPr37GXEScFTaLtJfJJQz56PvkPT8wuHQRsG7EK6WnDr2GJgMoL8mdOLY9YF9PJ889L5CNXNqcGQ
	GVT13kdF53OC+IuqwVT0nOsaGKAtV7tPtJ1Yz/n4QmThNd3N1Ds+U+6SIihPLBjV1fQFnsLz0NKGD
	mZ5iyiTkkfu/4szXXjXTjoq2vB/uGIyhKBRG8HByQEQmaO2ehqc/qsB+ly3LyxMeRNRoZTAFCRX5+
	HHhNRurzbgsidAakoZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZTf-009qXy-FE; Mon, 31 Jan 2022 16:24:27 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZRO-009pmE-AI
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:22:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F080260004;
 Mon, 31 Jan 2022 16:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UtIloJsR4Q0PYnZsjM6Fj0jrI6qRtZQg4gllAGP6NFI=;
 b=N6KrtvLQbB25E+R6Vk3Zx3Ps5kFSgEOjHODLLNNfc+uB1Bk8vmrX1JZ2kUMUVYA70M6Xp4
 MZ3WuXlvblW2i7wlr/bPnMtGbs9Wx6+PVJLYHO+g7lGk1v861ULgsvXToQHSyjKwUqQ9YM
 qyYA8NKozyDtLuGRdG7LOhjUJY91LtK0f3xinJ3CyuFGYNq36DH0kIv/i++6mxYxQjtyGb
 9AF/N0nNH7HHNduUXc8uDsb4n6/fV+S4WNXLztANSfKGJQwqodX9kTDHznBHSV8+goC5RZ
 HIVIdemZC2yLeo2DuCjKgGfBrUs5o8cOu20vmfxaHwnMxTCikIfHRaQaPJcdOQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v10 10/13] spi: mxic: Create a helper to configure the
 controller before an operation
Date: Mon, 31 Jan 2022 17:22:01 +0100
Message-Id: <20220131162201.23780-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-11-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'28410cbf1eb5feae955b2a75e9c24b6494df78e8'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082206_547177_1603D7ED 
X-CRM114-Status: UNSURE (   7.18  )
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

On Thu, 2022-01-27 at 09:18:05 UTC, Miquel Raynal wrote:
> Create the mxic_spi_set_hc_cfg() helper to configure the HC_CFG
> register. This helper will soon be used by the dirmap implementation and
> having this code factorized out earlier will clarify this addition.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-11-miquel.raynal@bootlin.com

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
