Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1880C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qa8IjzzF2t+wxQ3E/fC1oYqR3GNdW2OLRSm4hpcoxFY=; b=2ZWQKLFWfkZEZQ
	xFfatusWxzcycwgxsdSPzhYobNpo1pXcvZEVet0m3bW44vgkPA9HwEET5AgmzomutVvoKNABFV0fo
	OVEspHK37t4ectkdY9CFa/hvvTvD8HacLHhnJrCiftDASyfswHzAsvGEdqCm0uhwX0gXAT8I+Qm9x
	XDoVgGtFiQvjX4R3y+GnPEuBA52zzAcbJbJhF1GUbZgnztAzNzyLgVItW4Tu5X4uhpqgvnD7GDZXp
	VOQz09FTLAWDvB92S6yu0l38CYhucCGNYVKNvwvEOA37KaRw44Wc8ZDHwmQeCKwCeB33wilzpFyeR
	xugpM3NpRvoVTNuH7XUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZeE-009t00-Kk; Mon, 31 Jan 2022 16:35:23 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZS4-009q0t-W9
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:22:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7E736200007;
 Mon, 31 Jan 2022 16:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00QmH9ZSV1KrxgsE23TL7EVgHqdgvORlx80j77l0KVU=;
 b=TsCAYYucoisHpkHvV04EV6nJ6K6fQh/2pY1DsqcTRmXX/XF7wxXZjLfKdwq776O5iRbcDM
 7HQ/yYB6aEV1G1TggcNFeTJKxl2E4l1V2C2CCPStQyrHHcfp7Ln9wIMLXvESMPTpTx7WAr
 q2uGz7Cm6udLBQ/744xXft2gzjeTpBziIOzYo/5yBmighQZbTE//XlzOYetg9abxNDXsn8
 m4RUy9m0UWXfX/qVUdz5F2fLJTLbE0ZYHDt/iGmWa+Qqv/sgWRSwUeQ9eVNnMbBLv50Jha
 SdqSUwpg8z4aIch+Wma0+Jt8aMZy/W461m5FL0IhybeEs4dLNHfw+fPtxyTbgw==
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
Subject: Re: [PATCH v10 02/13] spi: spi-mem: Check the controller extra
 capabilities
Date: Mon, 31 Jan 2022 17:22:45 +0100
Message-Id: <20220131162245.24300-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3163fc9215d89c19cd0ee1f6f9566d292d7db275'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082249_225325_8CD94346 
X-CRM114-Status: UNSURE (   8.15  )
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

On Thu, 2022-01-27 at 09:17:57 UTC, Miquel Raynal wrote:
> Controllers can now provide a spi-mem capabilities structure. Let's make
> use of it in spi_mem_controller_default_supports_op(). As we want to
> check for DTR operations as well as normal operations in a single
> helper, let's pull the necessary checks from spi_mem_dtr_supports_op()
> for now.
> 
> However, because no controller provide these extra capabilities, this
> change has no effect so far.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-3-miquel.raynal@bootlin.com

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
