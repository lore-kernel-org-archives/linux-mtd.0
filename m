Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD67EC3DA42
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2024 07:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vW36DHrKKss87CVJaiKhPRujZvtHR41n4UKD4vDSb7Q=; b=ykLAYKAlyX4DfC
	d1hORdXl2Bq7zgSxWsnqjSH31kWr4rposkRr4pEW+FohKpwj8ibhyWOolT4uMKkDM4R5pxPpvUeMI
	wdzVa8N5q0nLz4i/7NsFAwbsyWgWVYrs0K798KdCfhzfELIqy9eZ3TRi01rwEqo2ktkiBeYMnOtsZ
	hy0XKHw6hVOe85nNhn3apsfmDpnn+0rxVMoZfWrXehrQh6qD4bMtyH8TKp77jdzIF/rz9txPUsnOb
	ey+9E/k4pSObE/05EZ2XchpQ2PcHTrzbEkAAgGOAlcpOOnmW5TfnuPv/dVPgnPakuQGTWkMz9PqHc
	rjsUX6O1P3ONIYoHUhNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiNw-00000002xbq-3kPC;
	Mon, 08 Jul 2024 07:02:04 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiNh-00000002xXj-0zQc;
	Mon, 08 Jul 2024 07:01:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68E841C0002;
	Mon,  8 Jul 2024 07:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720422106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFyhUQfDWH2BkI3PZl+BB8bptYesbh+J9oIuRZIQ3+Y=;
	b=csnDubFDvkPISyceGvrqdlxbuax7LfjnBvSwBCZIVZ2Bxzx1nbRCMLzV2cfRFTcvcgoMoS
	160VjK8L2pogbqOcIoH0+rZvjxx/z70M36+8OWVwh6ivxior4c7pEnySrkrvSz7RnPbeRk
	a1LKS2zVqAGX/eTJU93s5cv9nHVsjHnGMMl318U/tWVu9Ak6GLx9qvgbRrmk9eiH0Q4+4B
	X8Z0VqjFKuAFq2zt3P4B2xglPp/FfNB/dfxLDEOvpwwr7gO6+cwuVlCKaxlTjj3+cIxTZv
	qTbrBXbZFRXl2IbKTCT8wsVqZ7oBfY4OggevI9HURM4Zo4B+shwE78DqIqRCBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	miquel.raynal@bootlin.com
Cc: stable@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Patch v2] mtd: rawnand: lpx32xx: Fix dma_request_chan() error checks
Date: Mon,  8 Jul 2024 09:01:44 +0200
Message-Id: <20240708070144.12186-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240705115139.126522-1-piotr.wojtaszczyk@timesys.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5f713030117a12b0239e604c163e69af58bb0b63'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_000149_448587_CA4DE1C7 
X-CRM114-Status: UNSURE (   6.43  )
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

On Fri, 2024-07-05 at 11:51:35 UTC, Piotr Wojtaszczyk wrote:
> The dma_request_chan() returns error pointer in case of error, while
> dma_request_channel() returns NULL in case of error therefore different
> error checks are needed for the two.
> 
> Fixes: 7326d3fb1ee3 ("mtd: rawnand: lpx32xx: Request DMA channels using DT entries")
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> Cc: stable@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
