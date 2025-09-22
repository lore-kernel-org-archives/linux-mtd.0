Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CA7CAC5AA
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8VyEY07jV3FII2ePioR07053BqfsL8TNrX433iG4V4=; b=TglVOLmnN8Y4/y
	llLlUMMtpOE8wF2BQOXQTEAj+FW6splbW8k+QwMH6ULERfXajA1ok89uOcJtVGyepdhBhuBdLwnGA
	6iHa/S+7imCZbRMm2qvwm1l+7lp3pRmzS4o8JsR5CMwzi1lWgzMzV1QuDuFuf7rJUYyfmf4JGO1j9
	6kBJOAb5pA+CTi0i2uI/8KXgvU9skPS+MEiwYhp1K0AUhg4iytlNiiR3UEbTS/2K82ACfYy6Df32D
	PSDU1nIHLJVxTUm8GG0aEroi+CYuq42C10iOdhq8KhWn9yTr1rnT4BR35bMV/B9XWk2b4iiExM17H
	rwj3av8tj8uLDMfYsJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWR-0000000AoTb-1Thj;
	Mon, 22 Sep 2025 15:32:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWN-0000000AoNo-1oul
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:32:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BAC64509D;
	Mon, 22 Sep 2025 15:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBADC19421;
	Mon, 22 Sep 2025 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555123;
	bh=I9Zhr/ncIXq/m3dpt8T77ukTpAxt82yNYfe1wjICwFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l0v40rMtUuCWItO0Sc01keGjKU8iGrhe5gVrS4BiJ48e1TdRGzdaRNq2EJDeVm2QV
	 AjSPfqG0lk4YclZhLk8YioWPhrD+7YnGJRKSfbi/ghPLhE6wYs00Py+TbXTb66tf6+
	 x2S28vHktHwCTYoHhY+ghoUhRMNHW4nHg0y7kLLp9doZbLeklnUpLxbEebpJ39fU7r
	 TnApx1atpPeIyv9xaBZ/8Ox2f8ow1Q4LkDp1wIzp54MK5VZMLFAu/cbKfu8tJbRo4O
	 jsXUW9+OKLdv6lMmnHKmjHNjkxXD5ILlaz9Gu3ZViy79BdJywHqdKNqH6xwWgJS5Sf
	 h5ugw+9h7brEA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v0iWC-000000004Hy-34zZ;
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
Subject: [PATCH 8/8] mtd: rawnand: sunxi: drop unused module alias
Date: Mon, 22 Sep 2025 17:31:07 +0200
Message-ID: <20250922153107.16381-9-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250922153107.16381-1-johan@kernel.org>
References: <20250922153107.16381-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_083207_497314_391BEABC 
X-CRM114-Status: UNSURE (   8.69  )
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

The driver has never supported anything but OF probing so drop the
unused platform module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 162cd5f4f234..f6a8e8ae819d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2205,4 +2205,3 @@ module_platform_driver(sunxi_nfc_driver);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Boris BREZILLON");
 MODULE_DESCRIPTION("Allwinner NAND Flash Controller driver");
-MODULE_ALIAS("platform:sunxi_nand");
-- 
2.49.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
