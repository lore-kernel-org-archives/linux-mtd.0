Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957AECA100F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2AuUXvVSOqaM0RaiM2M98vt3ILqfNAqLq3L249XXz4=; b=wFdNHI1vXZ+Ne2
	+OFDF4zp9grEjJgnJvVLmWWOAk4RhCU2xhQBkvwzC7TZ65qjqdvhFJBqcGsgs032aGThnIKSvrnPI
	fLKOG04xwWnGolMJEiuS7znzf6E/cYocvAVFy7UOJKSxq5PMge05qxNeP54MX8OMQmF0kCEuWL8Sw
	njSsY7fradqlBJ8IFfQIO9I+BtvqpiNKzduaGfJEoCfwHnfClM5gOKM2YE66CaHEsL7j3Qdjq/h7x
	zyIYiim08/H+RcxZk1XCfyuJNdRlQzPSqAvVw8qebGR8lSLdHlactIQ0ljCKtUGI5Ko5N2Ul9mgT8
	dLM+2QGgC1Pm1Gd/wtTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWM-0000000AoMr-1bKp;
	Mon, 22 Sep 2025 15:32:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWK-0000000AoKZ-0i15
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:32:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8205D60218;
	Mon, 22 Sep 2025 15:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C1DC4CEF0;
	Mon, 22 Sep 2025 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555123;
	bh=/46VNVTt4hRRDh5qNYXbGvkTgn2zbGiWAxCXIl/j0UM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qAb746ait+z7U0VtEUwrdGoN50aXNUR2tNbPZA1ft84qr0fGqd+96zVb/GPcdmyzO
	 FV7h66ZEcbdsclu20Yq52/2I747nwx878AgDhQDtDHXgmIRrPkLg6dmcLh/449UuaU
	 VId6JLnKV5QQP24bu9APR9QPYVYH7CIdOSwCN9aNZrdrNHRMgFxKvllI4ZNtzB4hID
	 p9pa+Hg61tQvX/O4ruXL2fb+IHje3+qJqgXdpnqExUiiY6WMHjB18A7QoWqXEgzRak
	 l6VYm7y/pgrdb5bX+DTB6+S7nqxsrq0u9/F4++8I0mt/Gjg8vQm19t8RAulX6JLBYM
	 nNaWxWTLTenOw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v0iWC-000000004Hs-2I78;
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
Subject: [PATCH 6/8] mtd: rawnand: rockchip: drop unused module alias
Date: Mon, 22 Sep 2025 17:31:05 +0200
Message-ID: <20250922153107.16381-7-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250922153107.16381-1-johan@kernel.org>
References: <20250922153107.16381-1-johan@kernel.org>
MIME-Version: 1.0
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
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index c5d7cd8a6cab..9444ba02696d 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1505,4 +1505,3 @@ module_platform_driver(rk_nfc_driver);
 MODULE_LICENSE("Dual MIT/GPL");
 MODULE_AUTHOR("Yifeng Zhao <yifeng.zhao@rock-chips.com>");
 MODULE_DESCRIPTION("Rockchip Nand Flash Controller Driver");
-MODULE_ALIAS("platform:rockchip-nand-controller");
-- 
2.49.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
