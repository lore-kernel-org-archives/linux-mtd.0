Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E2FC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLTZYZOLVlKq7zyYwHeVtzUR5cSOh2KbA4nmtvrRtIQ=; b=eotg5HLvfyqJgr
	G3rb2U7l0Y09jwCOGJb6DAt12kNg6QB/4WkswF7fFMZ2BiSxWcC0ZDR4qfHSMCGTfv3QE+rnKBMcU
	0XFEFIuqh8ZBkc50ULUjXKyWcpsjla6m82fVWLMVL3jBAd6/wXZRpDjN5wp0GbsI3BsbiYLtBDyNg
	4Bz2j2U9QrkKoE4bbiA246BRwaKgZFWAt9bStrAj+RaikHDCQksL422B5ak9O045KrMU5xpaE95wu
	hkd2MvfJB30WumQN6z6Pv+PgBmhzfcmZcbmKKHgIWtJXiqGbePcvEbxcCNyzvZlS0SnIOCkDI8hHu
	sOaovt1Mu4kbxeA2rHtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYLd-001dXz-BO; Tue, 20 Sep 2022 08:11:17 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYLL-001dPW-Tf; Tue, 20 Sep 2022 08:11:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 518D34000A;
	Tue, 20 Sep 2022 08:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f5qD6zAA466UgjuEnk9mGMzuomEV4pr6kH+NFdqWMZA=;
	b=Rk9GSBxs4RNRvtWALvLdb+rRqzYClM8TfhIuBnVxxeoxW8f1EpYVSeNP6sOhpTIzze4O1t
	hvOvNSJp8BmFUIpAwgjNOxXbKqfrKWeAmU46oXNP1Dbc2dN0P8gziskCHQXrN07JZXmVun
	4r3foNSpGPhFvJgODD7wcF7YkxHq5JDZ9YsNizuw84bZ/4QluLfUZjy9yc4DQkpUuwm3a1
	3GVS/2bCWKCR3fhDo2dDvUBlhCbO7zwDyuCTilattLeHKBX6JSJj0bWkHWtTLxa/jV6+rv
	3DzaZUC9miz+bKAjM4qn9FdMQ0Xf+NpIJ0a9Fe4YTiAJ4QqJjaYu6oqcchYCRw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	peda@axentia.se
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@microchip.com,
	bbrezillon@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: atmel: Unmap streaming DMA mappings
Date: Tue, 20 Sep 2022 10:10:53 +0200
Message-Id: <20220920081053.597303-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728074014.145406-1-tudor.ambarus@microchip.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'52d0997b6bb062fed06d12d31c2c2851ffde8d45'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011100_117391_0585E944 
X-CRM114-Status: UNSURE (   6.46  )
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

On Thu, 2022-07-28 at 07:40:14 UTC, Tudor Ambarus wrote:
> Every dma_map_single() call should have its dma_unmap_single() counterpart,
> because the DMA address space is a shared resource and one could render the
> machine unusable by consuming all DMA addresses.
> 
> Cc: stable@vger.kernel.org
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Acked-by: Alexander Dahl <ada@thorsis.com>
> Reported-by: Peter Rosin <peda@axentia.se>
> Tested-by: Alexander Dahl <ada@thorsis.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Peter Rosin <peda@axentia.se>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
