Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16F7EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ausTf/sJ/N7Wpa4nRVHXwKpxnyFiELdhzBLBleq0r5E=; b=CbgUoyyutDidS+
	WxctCDYSrrkc4r7QSfcuAqpModgyAlBxG3pBzkXFBYrdlMK8kyXeJUJG0TQO9aw24Bxjm+V7DXFbG
	aWzC7gyvf5bhoyPOqmLI6QwVbd4/UOp/qZJRvpW7Te2UcUvtbEhlJC1PjJNHM5UXWW7csG7Fi73Bo
	X5z/qN6G7Skz8TSyLxu80SXHdXlm66m5bcXJzb3UL016AWUisf5g0sXcrPf5nHEEimKri3WqPRHAy
	lNOxQEhgrTTWJ1X2W7jDUJI498HXPcLGiZlwqj9PoqGIoYl6AuVH1EndFHAA6r87i9gWTXeZdWi9W
	mCHk0upeP9G/c7BgOZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDB-002JXJ-2f;
	Thu, 13 Jul 2023 07:58:05 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrD7-002JU3-38;
	Thu, 13 Jul 2023 07:58:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E209E0006;
	Thu, 13 Jul 2023 07:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+6Pn5iiSJF+GC/UNH1Gs95idDem7d9h5vJpSRGFdPSM=;
	b=mfOlq3phyyjVO0J/+NMjLkQbr2QSym8B35ubgh48NPOxwIE23rz4iN+TdH6YZJlj7aKlYH
	QOtgtMI1kfv3F/8sm8CuK46U6EvRrSWycxsA2Yng7cVG1A5B/3k74vQ3Pf81ZlihLiYKSG
	xUo+BYHG1EbEorO2oaKB6VJk5MnFeErd+Au3OcjFRQB8P3ADiPLntAgllL1xg51IPXz0yj
	WaQDoqQDJWTNaCRUTNcTvn4RrYQoNizzRCo0gakQc3Yoq2Vn8HxZx5saEatIIwkph/YwUb
	PVUHYdNXv3finfYKpGggagVVAr4uBPUon2d9qNHUHt/RoAxqkzk6Xn2G1VZLfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/18] mtd: rawnand: atmel: Use devm_platform_get_and_ioremap_resource()
Date: Thu, 13 Jul 2023 09:57:58 +0200
Message-Id: <20230713075758.486161-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-10-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'09ea085f6414e3c0d8ff034e941fe30216bd6f89'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005802_160183_4A322F98 
X-CRM114-Status: UNSURE (   5.46  )
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

On Fri, 2023-07-07 at 04:06:14 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
