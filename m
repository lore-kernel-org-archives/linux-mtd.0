Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4D0C73C66
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmeI0Tdq/BQJtQyuTezKkP/ZPYQcCOKN8gZkV7rJtk8=; b=jych9DxdcrJlhy
	iygcYMz7e73Yx/Pa5BrSO1goSN4zsEdJl2DzzOijqmf26MKmfXvgz5ATDXFFdTbnVOcb7lleMacSH
	Zv1J1I3HP/0g3CFRXRa7U+Feu/281Bo+bPz0ckDn0YSvIgqSe8/HtHGZGONUyW5bumpD9Q//n9uBw
	8ZMcGc0ONKct7n+aNbeaMVLmL2YcFLHjvGGr1RcWlGQO4Hd8mADfVkwyTZNViKpHoAiOMVNxU2ZOD
	mX/IfosZPUeez0ScgG50tJVcFjM8g9PudVK5Pai0DAorFUcadW25Q2REgDJDS7DqgKgBY1xaiB/Vg
	VCv0dMBo0/McnCu2O/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRouF-00000009Vee-2Vf3;
	Wed, 18 Jun 2025 09:16:31 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoSk-00000009T0g-3g7w
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 08:48:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB9DE1F433;
	Wed, 18 Jun 2025 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750236485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=scr4w9LNGE+xiVVv5BjqF2MPYdmGongciREKFgskxPU=;
	b=K0aQfI8/PydQWmvJqmdaC56BXdgIANP9mGc8n6fW7MS1vpYZls1v++gJHvXHDHTJzhVBXR
	Z0kvBGd9NpEq39spzFFCgfev69YCbGk/gUWzY+BNKyBgs8LgIhdPxn4gxbHq2fBfyUHpyP
	L/MgFzzGoWqOaeq5zL5kJZD3FPBQ4tRHASApzJVILZ003H1bdJFg4EKZ0j9LsBPZz8yvmM
	sa63ZWJwTJf+r+KG/zfoZhrv/gwEA0SBCu3wXqIwML59fmrsmNwg1FxQD88GEWcQX8tK8Q
	8OFUeNdZgV/KTjmhgnddyJawxYR++etDaqzmTdji2g00dNtxBkCFsmNnlylc0g==
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
Subject: [PATCH v2 3/3] mtd: spinand: winbond: Prevent unsupported frequencies on dual/quad I/O variants
Date: Wed, 18 Jun 2025 10:48:00 +0200
Message-ID: <20250618084800.1644246-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250618084800.1644246-1-miquel.raynal@bootlin.com>
References: <20250618084800.1644246-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueffgeevteevkeegkeehleetteffhffffefgleeuleevjedtgeelgeeutdekgeelnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidrrddpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguv
 ggrugdrohhrghdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_014807_066900_A43B6B20 
X-CRM114-Status: GOOD (  10.84  )
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

Dual and quad capable chips natively support dual and quad I/O variants
at up to 104MHz (1-2-2 and 1-4-4 operations). Reaching the maximum speed
of 166MHz is theoretically possible (while still unsupported in the
field) by adding a few more dummy cycles. Let's be accurate and clearly
state this limit.

Setting a maximum frequency implies adding the frequency parameter to
the macro, which is done using a variadic argument to avoid impacting
all the other drivers which already make use of this macro.

Fixes: 1ea808b4d15b ("mtd: spinand: winbond: Update the *JW chip definitions")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c |  4 ++--
 include/linux/mtd/spinand.h    | 10 ++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 0756966b4e3c..b7a28f001a38 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -42,11 +42,11 @@ static SPINAND_OP_VARIANTS(update_cache_octal_variants,
 static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_4D_4D_OP(0, 8, NULL, 0, 80 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_4D_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
-		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 104 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_2D_2D_OP(0, 4, NULL, 0, 80 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_2D_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
-		SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP(0, 1, NULL, 0, 104 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_1D_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 811a0f356315..15eaa09da998 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -113,11 +113,12 @@
 		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 2),			\
 		   SPI_MEM_OP_MAX_FREQ(freq))
 
-#define SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP(addr, ndummy, buf, len) \
+#define SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP(addr, ndummy, buf, len, ...) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 2),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 2),				\
-		   SPI_MEM_OP_DATA_IN(len, buf, 2))
+		   SPI_MEM_OP_DATA_IN(len, buf, 2),			\
+		   SPI_MEM_OP_MAX_FREQ(__VA_ARGS__ + 0))
 
 #define SPINAND_PAGE_READ_FROM_CACHE_3A_1S_2S_2S_OP(addr, ndummy, buf, len) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),				\
@@ -151,11 +152,12 @@
 		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 4),			\
 		   SPI_MEM_OP_MAX_FREQ(freq))
 
-#define SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(addr, ndummy, buf, len) \
+#define SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(addr, ndummy, buf, len, ...) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 4),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
-		   SPI_MEM_OP_DATA_IN(len, buf, 4))
+		   SPI_MEM_OP_DATA_IN(len, buf, 4),			\
+		   SPI_MEM_OP_MAX_FREQ(__VA_ARGS__ + 0))
 
 #define SPINAND_PAGE_READ_FROM_CACHE_3A_1S_4S_4S_OP(addr, ndummy, buf, len) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
