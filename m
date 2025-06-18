Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C783BC761AE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffiL9DVAm5RsS22zm6lmMYZ94uqaUkVfyyVqFqMwN1o=; b=m5f/gUfLwfSmiN
	bWMNca49Rlzkk1K5qVnW0rK73wknn8BLgM7dNJ8lmzU7NlDEv22ei9wWFxuZzwgZwijkyxKbWlq3X
	F/sv9OgGBqMSLEHJ0/ygv2kK9X+dAhjDCUSF9WaXFv/OaQjWLYSruD496Supg6HWOU97wxkRp2FpF
	lWreCIvDtkPT440GGwMYFIF2rjZnUgekx7TqSGo/M7ypMiXQdQbXxxgSpLBjqQ7t97moJuutGLSRY
	0DEh2e0wv5GAwjF5p0dVc8SL+ovZ4Hs6vl2TdV1+dXusFRWi3E/uN8hledA5aGQverSqjmJYprBif
	/81907xCyOmVNbC2gKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRouE-00000009Ve1-1xyN;
	Wed, 18 Jun 2025 09:16:30 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoSk-00000009T0L-2xnu
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 08:48:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD8362044C;
	Wed, 18 Jun 2025 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750236484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6FU6SDX17aNoN9IEiJOQ14OoPG5LsdEowjWPMC4qis=;
	b=Owen+bOr8Ao+naIB9j/EiRrAlULlUhOgUFl6I52R9m0Zv34rM+IqEqiXgpvgwcI768LHaz
	HjBl8GyUeU7FWf0QOI0mcrtQlqlXUIc/ZO4NBcWP/KdKUd/uXhKoGmUsdH47ZwSrZLMtmy
	Ry5W60QztuSAytymv6Hp96Xm+OOBEjKHiKtJSnn/zSpNGP8j9Q2jdgtBHC5nsWUjTABuqI
	IIyRatTUmUrnU9b3kP5ILFEuLdhF9Geg8lXs3ha7CW2qZMzFYuIZYblVXfE37iX5+6cYL+
	G8wOMXtnBdbecO2aGa2HB0H26gZ3j+vCZJ/JuyxxQu7EqSLZ0HqjIH66bwHwaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andreas Dannenberg <dannenberg@ti.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] mtd: spinand: winbond: Fix W35N number of planes/LUN
Date: Wed, 18 Jun 2025 10:47:58 +0200
Message-ID: <20250618084800.1644246-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250618084800.1644246-1-miquel.raynal@bootlin.com>
References: <20250618084800.1644246-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueffgeevteevkeegkeehleetteffhffffefgleeuleevjedtgeelgeeutdekgeelnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidrrddpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgru
 ggvrggurdhorhhgpdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_014806_918062_97717AE7 
X-CRM114-Status: GOOD (  11.27  )
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

There's been a mistake when extracting the geometry of the W35N02 and
W35N04 chips from the datasheet. There is a single plane, however there
are respectively 2 and 4 LUNs. They are actually referred in the
datasheet as dies (equivalent of target), but as there is no die select
operation and the chips only feature a single configuration register for
the entire chip (instead of one per die), we can reasonably assume we
are talking about LUNs and not dies.

Reported-by: Andreas Dannenberg <dannenberg@ti.com>
Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
Fixes: 25e08bf66660 ("mtd: spinand: winbond: Add support for W35N02JW and W35N04JW chips")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 19f8dd4a6370..2808bbd7a16e 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -289,7 +289,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
-		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 2, 1, 1),
+		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
 		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
 					      &write_cache_octal_variants,
@@ -298,7 +298,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
-		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 4, 1, 1),
+		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),
 		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
 					      &write_cache_octal_variants,
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
