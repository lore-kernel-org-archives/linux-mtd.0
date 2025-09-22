Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CF5CA100F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTYFXIIjSgaEhf0QXuQe1mYlkCA7e1ktFG5XxNdmlz4=; b=ZCTh+7kSynArF9
	ooebRQYWpHhO0n2I9v2pZHaf4CRk+0oxWhfDsywyYPm+9vl9tFajIexLEN6oR8GT0QoRbfaJYT/Af
	emBPkXI4MTlId+tKMCY39PqPwmPGwO+aYX+gwiIHlp/7FhKwqaHDQt0Kwx7LQ2IzefLz1D1gWAvVw
	o7sqPvMnK70r1k7RAh9v5JAbgAg25b725/q3cdPOwzpQMmA7lZkAVV9Lbl45dMmcUKyBUSvD+jX/a
	e71xo8geuNJAFtZIoCYWqHE3wzoMPhUcupZVvXO8KWxTdN6Z+oeDaBAylDQQY8qF0Xrbd0nM9sqxt
	yN1ir15xqxxF+be72TBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWQ-0000000AoSj-3qj5;
	Mon, 22 Sep 2025 15:32:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWN-0000000AoNn-1pWR
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:32:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 721204509B;
	Mon, 22 Sep 2025 15:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9C3C113D0;
	Mon, 22 Sep 2025 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555123;
	bh=feNJQYv7PInY8I5BenFb+SjBP4yk4Vqx0u5EFIvIY3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gz62KBYA4icXkq8LRLecHE6hFGtBxR2ZKAkf74n7Yfm5t8WTKoQam2QUNVsE41lol
	 MnMykPy4iMoleAUuZB2Vugf2iHe3Ggzt52/ng/dg8VZNnGUg2XUj9HA/8FD7ORNc22
	 SU3VjwfxwwGKtSs2uGBd7kVKPIkMzeI1fCj6gvtt4AJEuIGpuq5/d54XMS65PMuM5f
	 zWyufuxmGw1ZDSW4gVfxvTW4IdWWRik0aMOKC1Ts+I4nF+KkI2qi/3V+rf4b9zg7i9
	 FxJTEPZloVjPxCd9LIvVDfe6VFrcpERCLx/rK68yPuhEIS0esYnvpzSuhGmDdddii6
	 ShTj+K7svTvHQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v0iWC-000000004Hv-2hcA;
	Mon, 22 Sep 2025 17:31:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 7/8] mtd: rawnand: stm32_fmc2: drop unused module alias
Date: Mon, 22 Sep 2025 17:31:06 +0200
Message-ID: <20250922153107.16381-8-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250922153107.16381-1-johan@kernel.org>
References: <20250922153107.16381-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_083207_495567_BD54EE13 
X-CRM114-Status: GOOD (  10.09  )
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

The driver has never supported anything but OF probing so drop the
unused platform module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index d957327fb4fa..c08d6b176372 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -2158,7 +2158,6 @@ static struct platform_driver stm32_fmc2_nfc_driver = {
 };
 module_platform_driver(stm32_fmc2_nfc_driver);
 
-MODULE_ALIAS("platform:stm32_fmc2_nfc");
 MODULE_AUTHOR("Christophe Kerello <christophe.kerello@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics STM32 FMC2 NFC driver");
 MODULE_LICENSE("GPL v2");
-- 
2.49.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
