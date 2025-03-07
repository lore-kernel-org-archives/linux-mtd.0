Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499C5C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02u3BpmLtLA6/+tkNj/5hmi9uHxgVKaXBRawJioZpss=; b=pl62x9OXwybcjZ
	3B4/Yk0Q9scBE5cwPUUyQW0jHosAiUXonRnrTOjEQ/dns/ouxqEmbNt+nmv5WARLm4LrfJ3labHL0
	WbK5zdykdWuinVDcgDHyqP4sVbIMNudX4I8GlKyTU/Qrfc5nEGH8rnHMWwTbdY4KWiNZQQfgsZXQM
	zbLZNS9hYB9rTEKyeV9RkeIWEmoYNQDa89KjJSEMN1VV+dRv7kP4nTuA7Azbp8nUOfdEFB7dzcmMS
	cAIDOBujBocR9JmN+t20tQhUcw0hFl4nGJ0ofjg/3u7CMQoQoN+uCFc61cTQyncW9bxI5eGr2CJc/
	B+ZU+9jnRgKNUvMXcLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaPk-0000000Erw2-1aZ9;
	Fri, 07 Mar 2025 16:19:08 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZJo-0000000EYSU-396z
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 15:08:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 309F84430E;
	Fri,  7 Mar 2025 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741360135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PsAcuJOu7/lWVEH8aUBxgETw4MYWZ072uSOVdJKydWQ=;
	b=EjgnWCKOvcKmEm5sEc5LjeK5s0O+6ydsozM24Obus0PBzC9VK6jzZnNGIQCPfgwmnQi6Ui
	FloIWtZc5knad+dpIZZcLpYld1ah0Bw3Z5r5eclpQYVoGcByRo4AoGw5CTPHLJJvU27vU8
	cEIt+gag5Cj8/Sp4UAiM+jqwihblrx2FM0e/kTQwu3BHqWDnAo1cG9ZEyjWNNWvOnflhi7
	ZWU7/dEqozPLpSjD7reR61RQgcKwFaXpI0tyeWdV1V+HEZHGlukW/HxpFQvot/lQ11nYsU
	pssM8k8GfqpETtSvkt+GSf0itr8/Ix+KFoRtxNllrgcljMGFTWyEt2IDfQS0Dg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 07 Mar 2025 16:08:37 +0100
Subject: [PATCH 18/21] mtd: spinand: winbond: Add octal read support
MIME-Version: 1.0
Message-Id: <20250307-winbond-6-14-rc1-octal-v1-18-45c1e074ad74@bootlin.com>
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfehvdduieefieeikeffgffggfdttdeugeffieetheeuleelfeehffdtffetveenucfkphepledvrddukeegrddutdekrddujeeinecuvehluhhsthgvrhfuihiivgepudegnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrudejiedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtlhhin
 hdvseifihhnsghonhgurdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_070856_933469_043AE1FE 
X-CRM114-Status: UNSURE (   9.77  )
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

Describe the octal read from cache operations (1S_1S_8S, 1S_8S_8S and
1S_1D_8D_OP) supported by the W35N01JW chip.

There is no observable improvement between the two octal SDR modes,
which anyway offered a great read speed improvement compared to single
mode.

flash_speed test results ran on the TI AM62A7 LP SK using a 25MHz SPI bus:

* Single mode:
eraseblock read speed is  2346 KiB/s
page       read speed is  2342 KiB/s

* Octal modes:
eraseblock read speed is 10801 KiB/s
page       read speed is 10711 KiB/s

However, testing on the cadence qspi controller driver did not allow
mixed modes (where SDR and DTR cycles are mixed in the same operation),
thus 1S-1D-8D mode could not be tested and is provided for reference (it
is anyway skipped on platforms not supporting this).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 9b0369a077efadac8bd6be632f15b822d42a7227..4b1bfc15588ad3ffc8f2cb7615db6c14d0b62903 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -24,6 +24,9 @@
  */
 
 static SPINAND_OP_VARIANTS(read_cache_octal_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_8D_OP(0, 2, NULL, 0, 105 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_8S_8S_OP(0, 16, NULL, 0, 86 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_8S_OP(0, 1, NULL, 0, 133 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
