Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12569CAC5AA
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y3VytdH4v4E6Bh0STNF9ZTw4cv4suqb5vmc0utQBA1E=; b=dEDly4slgXMCw+
	A9idwxCNrcjzGB5XynOHwywY7XvsLjeCODeUd/4rJSrV6tZaL91vZzvI5j+jx/MF1TkL01seZAfnJ
	aObz5moKzMojf8Yk1aWHM6k9UA7IXy+BDtsv7kVHrrquwFbKYDOe0Y8fZiIcob9cKsdSOVlb6A6PZ
	FHxnDV43sTcG2vESjx4BvJthe1NG5wW4y86DxA6w2Oz0XPGpcDa8q+5uubnGMWzQEXS90/UO8a71t
	2DvNSjplmQ+9cqsIDH/b3OQKJh2D/oJPcufA7H+nxtFU781vdHEOZbuIbMybyddGrK5+R1pYaHp5J
	gfK3uSG2ui29JvyUFsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWO-0000000AoPW-3A7E;
	Mon, 22 Sep 2025 15:32:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWJ-0000000AoKS-3yOx
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F8BE4506F;
	Mon, 22 Sep 2025 15:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8EDC19425;
	Mon, 22 Sep 2025 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555122;
	bh=bClmoRfRjjOnU9fmAIB3gBoOykMbWx45Ktd4MD4g5Ew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uyq2eQkc8WJECeQgTxdjUWWuCtoxtnjjeTtJbwif/K+LgqdFe6CdNrek2IIRAzCEc
	 5EeeQ5lZJsSWJDSD60fzTU1EfkjBvcjrhlCchYrUOmRKatPjWV+xVGHS/7UYH+oBnR
	 qqTaQmPKmtunFKo3hNNIE6xGAKEeOO4TOGyId7paV3+F1O+1+6WUE9TMSDW2jRNGJt
	 tAihBprq3oqUSDSf+6C3CiH9G8hjhibigfm6PNlmNsjU5vOMxAcXCc6OfwrPWMMKdx
	 QFtjUaKVew8XFyWKpBh93zLcFgX0a4mAq8PmxMlfQg93OoPMDgfCaOxxjw7FNe+SzJ
	 5ImZrgw3fdaHg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v0iWC-000000004Hm-1Tv3;
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
Subject: [PATCH 4/8] mtd: rawnand: omap2: drop unused module alias
Date: Mon, 22 Sep 2025 17:31:03 +0200
Message-ID: <20250922153107.16381-5-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250922153107.16381-1-johan@kernel.org>
References: <20250922153107.16381-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_083204_007477_D57FE116 
X-CRM114-Status: GOOD (  10.81  )
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

The driver only supports OF probing since commit 086c321ec57b ("mtd:
nand: omap2: Remove omap_nand_platform_data") so drop the unused
platform module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/mtd/nand/raw/omap2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 61fd98ad5c78..39e297486721 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2332,6 +2332,5 @@ static struct platform_driver omap_nand_driver = {
 
 module_platform_driver(omap_nand_driver);
 
-MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Glue layer for NAND flash on TI OMAP boards");
-- 
2.49.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
