Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41567CAC5AE
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQy4QixP/RKxHXiTafabQnFGqXcX4k1jkPjvxaFwRqU=; b=LL2OTshx1nAH4C
	QNIGbA4V1h0m7uuUGveO/y+feDKzwQoW1Z7fUJ2Aksaw3qULBeBWqDaqxfSJG62oPtp5PJ3m2gMG0
	TdBWASdmcJAPIk6ansjfVHlfVzJpFZSVMiyl2OyoDqAMMjhdmOvw+oEeDLh4+8dx5x8VzVgzTHiRO
	XlgCu6dHgGOPiEAaxsxwXOcqAjxRE6vVTCugEsAurADxQ/zyQXWhqfAtHSW6mkeLAj3uWmX/NStjR
	1twog4H6lb7/BHAjPaLNKR6TmTNLW02hYXPgRNhPVWq0KnXFlAS0aqQOqeKFxhQ12tGFvR7I4B6/I
	nNV/R87WGf1a9xfYJimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWO-0000000AoOt-0Lkr;
	Mon, 22 Sep 2025 15:32:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iWJ-0000000AoJo-22VD
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA669445E6;
	Mon, 22 Sep 2025 15:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D70C116D0;
	Mon, 22 Sep 2025 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555122;
	bh=K2Jx9BZnG+1brk58AH7l9lttwi2IYYooNAGrB6W3v7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oLleysYm8tMn61SqI+EdCtDkI4JMBll4THA8PsVy6EqflzIUEQ6pWTa72KiQKMSQX
	 DJWTq9yxyV5gQP7NpfLfyJKPU6YkdDEZPw3MY2EJhe+ey6CtNeURoqAEAUDzKDnVsI
	 dSzKw8R+4AnQ/T3goBgbLApDfw2TLRDrrwkxytTeRWIiq3QoEkf7e6aYDSeNDcrXTf
	 HX6mek7Rz3VUSmKt8flauLFkHXZVQQfgkKtX8pgBEYrygobKuGjZ79rz520mJBOHgW
	 KhyUhADPJ+045pswEj0uaKXAB7IdaT6n8fMILFLPm14SIsdoR1J1eqjWJtKwFmvyqD
	 TzwbTuF/VOgBQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v0iWC-000000004Hk-13sj;
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
Subject: [PATCH 3/8] mtd: rawnand: atmel: drop unused module alias
Date: Mon, 22 Sep 2025 17:31:02 +0200
Message-ID: <20250922153107.16381-4-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250922153107.16381-1-johan@kernel.org>
References: <20250922153107.16381-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_083203_565576_657D6D75 
X-CRM114-Status: UNSURE (   9.34  )
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

The driver only supports OF probing since commit f88fc122cc34 ("mtd:
nand: Cleanup/rework the atmel_nand driver") so drop the unused platform
module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/mtd/nand/raw/atmel/pmecc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
index 0b402823b619..1d0e93e4edb1 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -1010,4 +1010,3 @@ module_platform_driver(atmel_pmecc_driver);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@free-electrons.com>");
 MODULE_DESCRIPTION("PMECC engine driver");
-MODULE_ALIAS("platform:atmel_pmecc");
-- 
2.49.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
