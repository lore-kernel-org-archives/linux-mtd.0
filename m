Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B1AC369A0
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HyPI4Cj8ezhlEYFl2Y8nzwIJsdt3Xlw3Cn//YiINI+M=; b=HnFaJqo8LrzAqJ
	DcfO7jY/rEp5mQqoAkGa2NySYR7w6cq/zVUZPgkk5wzQxdSXva9JiFx+14w7jYNzs/ekcVRADvkQr
	N7bvtZQxb3sNVldlZsy5JaGkHzPfAIZTqdRScyYT4V45IZszwZ7WVNrHwrgC3HeTtvA86zqVfZ/lR
	XAQ9YW6YhMYJLr+iZraUpAyG0EVJ3+jkoEkvINOW7ohfUpxUTYR9gZsHg9QR6zDCp5w9IkfCFV5+V
	aAfk0NentalZ2S/2cbTCp/o71w8mu5v01e0N/8yVjFHk0q4QuEVoyIDmnlnV0EG2hwqseSzj2fHKI
	gkj3D9sNo2O1OW36RNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HWv-00000008UYM-0a9z;
	Thu, 03 Apr 2025 10:10:37 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GjO-00000008Nfx-2frW
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 09:19:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7595543230;
	Thu,  3 Apr 2025 09:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743671964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DgbyTBEil3THxolEwGq86sbK1ICKDQIFcTImL0o1a7c=;
	b=hYGsM1cL3jBqyCg8AGga4H/uHGCcNVx/RvMOv1iijTh6PAHH4Ryp2p5on+fNW8Z5KOthSy
	nn2r8+L4KUqw8Gxak9T/445FxAObiOs0Qf2jVA+DnWIc0alvFcqFM4QstJkqv7oYnwa2+p
	RbiEp4mQqwBAV8qEnHNUpVHsySk8KSEMxQg4Kg9LYYbimfA5DQldBnt6s3OqnlYmzSWHTD
	UMonCAtWHFMQ4rg9cK7MfhfVv5sEkQq8mXPs1WA7Y9Y8sj2o1CPaXGEyHhDLflE6eaE1H+
	oJgCcNVLL6nsB+F2egYRcHaLoMVcxtd3DyCA4m6JeYMOzhSz9+vOvtSz3aDyPQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 03 Apr 2025 11:19:13 +0200
Subject: [PATCH v2 03/19] mtd: spinand: Use more specific naming for the
 read ID op
MIME-Version: 1.0
Message-Id: <20250403-winbond-6-14-rc1-octal-v2-3-7846bd88fe83@bootlin.com>
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
In-Reply-To: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfehvdduieefieeikeffgffggfdttdeugeffieetheeuleelfeehffdtffetveenucfkphepledvrddukeegrdduuddtrdduleelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduleelpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomhdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgus
 ehnohgurdgrthdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshdqkheisehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_021926_827124_015AD4AB 
X-CRM114-Status: GOOD (  10.55  )
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

SPI operations have been initially described through macros implicitly
implying the use of a single SPI SDR bus. Macros for supporting dual and
quad I/O transfers have been added on top, generally inspired by vendor
naming, followed by DTR operations. Soon we might see octal
and even octal DTR operations as well (including the opcode byte).

Let's clarify what the macro really means by describing the expected bus
topology in the read ID macro name.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 include/linux/mtd/spinand.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index bbf0048104aac86e90b0706793db8503c8fc2a3b..cde7f0f08c1e45106ebba3b027b620fb8bb7cc51 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -573,7 +573,7 @@ static int spinand_wait(struct spinand_device *spinand,
 static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
 			      u8 ndummy, u8 *buf)
 {
-	struct spi_mem_op op = SPINAND_READID_OP(
+	struct spi_mem_op op = SPINAND_READID_1S_1S_1S_OP(
 		naddr, ndummy, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
 	int ret;
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index a69feaec711b585b1fd95d8a699be9230c13c324..47c8c148a019396134ddd2aa3f5c6ddd039a4af6 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -32,7 +32,7 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPINAND_READID_OP(naddr, ndummy, buf, len)			\
+#define SPINAND_READID_1S_1S_1S_OP(naddr, ndummy, buf, len)		\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x9f, 1),				\
 		   SPI_MEM_OP_ADDR(naddr, 0, 1),			\
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
