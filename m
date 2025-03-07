Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A988C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 16:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYJPva2mHiESFxpLJy8mwrS5yhVMkxlNcTmCoyTyvYM=; b=Nwu/DJEv8JC9gG
	OPR7TbBc10YWPyh11XN5ms5gOVeQSo3DhkPqLu+xZbizDLBuJWa5Ylnuet8/ywvYx9or7E2brI0ve
	9lVBjn+6qGQmODT9owR6LVcfW2TSWTDPYqwAUFqz6jqA713p8oNMQOEI8IVSxrnVpmEbP0N8gIPcj
	4FAVM8dN2L+tezDL0aECvjL71cH+izcF3gDm4rlMQOGDnaK6AiRCrqYRfx+WaibsbZc/Iop06RLAj
	Cjrnmy5N9ZTU0WRaz73/OQGImchYw2khQp8+nm5xq8P/nIALzuc2dk07HbFmIlf8nOIKHZAYclEEC
	JJEq6JJW07dC4cNg59xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaPk-0000000Erwa-3ZhN;
	Fri, 07 Mar 2025 16:19:08 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZJr-0000000EYTk-32nZ
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 15:09:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A49144319;
	Fri,  7 Mar 2025 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741360138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pYeE6Qo0/rqCoQkJAk5IYEem/jjV2f//r4H04iV0mD4=;
	b=bragyoqoQ1+jrXxw8buCbx8/eaIY5FPRsIhTaL7NwHZwIfeY3y1LjQvgFziAH1O2D+9uZ6
	rxS4YrTwHtvKjWxhmUoyCaDKBawvGEPpou1xl9g4+gKqlh3fBefjy76oO/yL1oyuiuoUuk
	QRYiyb9RFO6gvVg8c9m3MR/4gEarRIQVsKO3r+zWXzgAK1R2A3oa2UVDxFKB4CqTtc9sSx
	J1kVZCa6KIhKQBSRfOIDXHJCti6LdZ9uOtfPPr8wizC/UNcsSsTt10axRVmzRnswXFh2eT
	EdEdfJwmlY69leVVEn1a+2gJxHoIgN5qlfPrZOq8bmIYlKV2tGvUmDwwZptuow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 07 Mar 2025 16:08:39 +0100
Subject: [PATCH 20/21] mtd: spinand: winbond: Add octal program support
MIME-Version: 1.0
Message-Id: <20250307-winbond-6-14-rc1-octal-v1-20-45c1e074ad74@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfehvdduieefieeikeffgffggfdttdeugeffieetheeuleelfeehffdtffetveenucfkphepledvrddukeegrddutdekrddujeeinecuvehluhhsthgvrhfuihiivgepudelnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrudejiedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtlhhin
 hdvseifihhnsghonhgurdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_070859_903921_793D01A3 
X-CRM114-Status: UNSURE (   8.31  )
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

Describe the octal read from cache operations (1S_1S_8S and 1S_8S_8S)
supported by the W35N01JW chip.

flash_speed test results ran on the TI AM62A7 LP SK using a 25MHz SPI bus:

* Single mode:
eraseblock write speed is 2028 KiB/s
page       write speed is 2028 KiB/s

* Octal modes:
eraseblock write speed is 7335 KiB/s
page       write speed is 7293 KiB/s

However, testing on the cadence qspi controller driver did not allow
easy "update cache" tests so these macros are untested and given as-is.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 4b1bfc15588ad3ffc8f2cb7615db6c14d0b62903..c263c9b5affe79a14466bc0e2ef2da53ecfd48cf 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -31,9 +31,12 @@ static SPINAND_OP_VARIANTS(read_cache_octal_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_octal_variants,
+		SPINAND_PROG_LOAD_1S_8S_8S_OP(true, 0, NULL, 0),
+		SPINAND_PROG_LOAD_1S_1S_8S_OP(0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_octal_variants,
+		SPINAND_PROG_LOAD_1S_8S_8S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
