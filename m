Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBF4C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22JWDTyK6cjPU5ZNb84Q5YmwCnju8OuKGl6/9kh6YvY=; b=SNd4JtgxKAgTJL
	uZkeuLECFjkZ+OkqBFUlenL8jPa+xb+kh0WJcOxuK4jZRPVvWfQh82+jkPNif6nV7syJpiQ2SbrsL
	ffh3wbExz+8G0l7v7umhTduGt8sEmoYUkefafWx4WR/84nWCdZzqhAhN0vngGmpSi5wDnnafTHlq3
	OZsJtfDQ1A9yevKiUWBVzxgRYynJtOULfiCyfSgOvJhJoXOwMIDNEkfttwk1LyNDqHMV/UQHiKNXx
	lv5z8UcWsJz7AseEDAi25dqCyl6Laoh17q7o9OzU5XEeaychuFGgFRAuoYoLyhHxak1iQP3YRDEH+
	nDyFO1o7JKQci9aLTDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZUc-009qmj-Pv; Mon, 31 Jan 2022 16:25:27 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZRS-009pnj-Sh
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:22:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1E10B60011;
 Mon, 31 Jan 2022 16:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ckYBW4QVjvNg2b0zvA71CQv3fW8uXEkP/szPey4KL3A=;
 b=hRdZ7snvTe/l55NDaJ54a0V4Ja6TRYLwnanJZauX0mCxizulfEQNcbEVol/ry21RYjn09S
 e8nP4r1UnZ2xV25jmeq7CAoKneARg2g8kFd2jn5tpKq2jOnSrLwca2mJA9BwctV74ZFUfn
 W9v0veujl5gmHJ+evAHMhUDNgbreSyr1ZEl+Ss6pkuKHsB9yHFfCX6pvViMaAZhjao1cpP
 zP0Merlyh0DNj7RrlgrdgJL6jpokBBZOqSGsHPxnrlP4kpw4tCgykrC/35hTtqYnIfUznP
 BIrUSzHv6m14FKChk94y0yOpyHQhLZwTJZIKBZf+YUyNiOesZ8NQUD7h1licYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 stable@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
 Zhengxun Li <zhengxunli@mxic.com.tw>
Subject: Re: [PATCH v10 09/13] spi: mxic: Fix the transmit path
Date: Mon, 31 Jan 2022 17:22:06 +0100
Message-Id: <20220131162206.23850-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-10-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c2f816543ff9a4dec31cfde31ff889cd09ea6c1f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082211_116129_0CA00CD9 
X-CRM114-Status: UNSURE (   8.09  )
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

On Thu, 2022-01-27 at 09:18:04 UTC, Miquel Raynal wrote:
> By working with external hardware ECC engines, we figured out that
> Under certain circumstances, it is needed for the SPI controller to
> check INT_TX_EMPTY and INT_RX_NOT_EMPTY in both receive and transmit
> path (not only in the receive path). The delay penalty being
> negligible, move this code in the common path.
> 
> Fixes: b942d80b0a39 ("spi: Add MXIC controller driver")
> Cc: stable@vger.kernel.org
> Suggested-by: Mason Yang <masonccyang@mxic.com.tw>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Zhengxun Li <zhengxunli@mxic.com.tw>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-10-miquel.raynal@bootlin.com

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
