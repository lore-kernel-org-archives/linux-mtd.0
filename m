Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F0EC7115C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLb1Niuy5rOG3Fbl6YD6gYPBQ17y1ijAmtBgHgS1MN8=; b=0YraR4ke56K4qo
	o1VIscsVjF5Vtjvt0QJrCOh33EHpBRKp/araV5OJhqanHsP8IAJeKheCdihGKGNS9nds6p8gHly8J
	E9JE3Y9u0ALM7rfUo9AMLk9syGguCF0Bkr8kGics0XizvjjUNgs4SQJM9hhNd77LqpFAYP05R19yl
	mJ7SW21BiHqfuitdSOPUvHq3eQklgQC+Jt8IvmlvxbMPlggAkInPNLsTLOAyqf0vRomtRts9TcOe2
	rAU71OznUOQPtQLLVkr76DFVOqYV6uG0QtYGgFGZDIQ6n9jXiZjVLuwOCFiFJ6OwxJaLzv4MiK7Bs
	WZO5ZdPATFFvw/WEpcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRouF-00000009VeL-0Dnk;
	Wed, 18 Jun 2025 09:16:31 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoSk-00000009T0d-2x1b
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 08:48:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73AB5205B2;
	Wed, 18 Jun 2025 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750236484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zu2HhPe64NDOF5VlWgz8G6tLY3Is6YRXvV1QblpwZPo=;
	b=KHvrmZ7mTzp5b/lw5ntfVLBZlB952zfXHfML23AbLcdn6uHdj8TNG8UPEOyQ/O0vx7udgW
	icDt0EwpZAgtfSrJNZbZ3odujtJ6PpzcrOeDDxqhcWT6i579/nvIG9kYCMe9Poq2B9cm+7
	yO1RNgfInSnweyuSScCWtCfK2+Ta1FSZuB+mtk4WOwScgL+1sw1nVtonw/325EufN+PKWR
	mzfhbIKbMO1+d4U8aEmnVH0xWmgPgdF7NZHN46UF+/p7MxpyP/GoAxRgVgEEqavRvMEUyF
	QcQQz0p2TkzN+Y6ktn54jfB9qMKajiuUOdLtZHjPE/LzUOBN+Nws4yNg0OGmCA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/3] mtd: spinand: winbond: Increase maximum frequency on an octal operation
Date: Wed, 18 Jun 2025 10:47:59 +0200
Message-ID: <20250618084800.1644246-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250618084800.1644246-1-miquel.raynal@bootlin.com>
References: <20250618084800.1644246-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueffgeevteevkeegkeehleetteffhffffefgleeuleevjedtgeelgeeutdekgeelnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidrrddpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguv
 ggrugdrohhrghdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_014806_900012_06442C92 
X-CRM114-Status: GOOD (  10.46  )
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

The default number of dummy cycles is 16 in octal I/O mode (1S-8S-8S),
and with this default configuration the maximum frequency is higher than
what is being advertised. There are higher and lower frequency
possibilities, which involve making changes in the number of dummy
cycles through the VCR register. At this stage, let's just describe the
default configuration correctly. There should be no functional change.

Fixes: 1ac5ff2f2ad6 ("mtd: spinand: winbond: Add octal support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 2808bbd7a16e..0756966b4e3c 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -25,7 +25,7 @@
 
 static SPINAND_OP_VARIANTS(read_cache_octal_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_8D_OP(0, 2, NULL, 0, 105 * HZ_PER_MHZ),
-		SPINAND_PAGE_READ_FROM_CACHE_1S_8S_8S_OP(0, 16, NULL, 0, 86 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_8S_8S_OP(0, 16, NULL, 0, 162 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_8S_OP(0, 1, NULL, 0, 133 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
