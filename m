Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487A1C3DA79
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Dec 2022 19:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xa0TRY3+tTOCZF7TkmZqQhPfp9ivi2nR1diLt53lUGY=; b=RtPboNno2DWIkd
	4nqNT5DTq3mRs1iUXjI9W0orbRD/pLctodMPzohBaA1Cg+a3WnxeBj28p69sE171WfD1wfcuFgtaw
	bboyl4WNqqwnc4n21tugtUloZkjwDt4I5batXo9uNDDk5R88hS1H1xqEvbuMdKQsiF5KzzgsLapqe
	VmlM0GIlih5nyv5WsOsLFE1n7RtmV3Cxs5Up+0T/WffRgw9MmdcYP2mq2/OfIWsFKxgat+x1GNV6+
	mtyGZ717QJKC7cKPqO9eIlsBumZvYcIbm041MQF6qFxH6aOdo6YPMc3Y3YcFk38CxLtq6PVq8zmgn
	p4K3VjcXd8bz2D8Fkc3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAyYT-001I6J-Fh; Thu, 29 Dec 2022 19:27:05 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAyHB-0016Bl-Cs
	for linux-mtd@lists.infradead.org; Thu, 29 Dec 2022 19:09:14 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 6DCB432005B5;
	Thu, 29 Dec 2022 14:09:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 29 Dec 2022 14:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672340952; x=1672427352; bh=g5
	qIXCdzDVSxDpcNOdyuqgoqHDHz1BqdbXW1iSCF4RQ=; b=kId0KHA/Yh/Tao9yLi
	sVxAs6/QCg5Hh8jzHO0IxjRVrXCnNkAybj4+8mPbwCGiQq5f/HfGPkhgnVei3/MZ
	nyN3cWblK5XqrHIZ5ryOpVBecaHw+8V7WboS3jjnv0L6UQvTeLi9oM3MJxFf2iIS
	bQDTeBHO4YDoKsgINIHWAoVMoD9Lbj9omyLHV+NO+9Op8MWsMay1RJozwMerrJ/J
	HCxJT7L1bhg9wBM3jIkkm4ZOmwblOcX/esNnLj2JBeYszamhfbocSYQypldGfBSl
	XEmFpzGx/AMZ16f1jkvgem3N4c3JfEkknWYykkgzFX4QY4Xk8Xgm6hHBibQJktdS
	rGnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672340952; x=1672427352; bh=g5qIXCdzDVSxD
	pcNOdyuqgoqHDHz1BqdbXW1iSCF4RQ=; b=GscAcTS8q4m6HwlCdc3FoLVACmKZy
	4Xg8WgSFCMxf4DBfQoqQvpEufdjsVyBdbbZ6wKBiQLT2em7FTezVIvWiuZqvXRD/
	QrKlPM4faGsEEVipnhmWaqSNeWxcGHxbmnV36rGgNRQAw0wDSyDwspAb0m3SKaSl
	azSw+oKts8o3R/NvDNbvXAk6wBeQuJI0SPG0sxj4n6Sg6E6naVJcl/hHV2qviPLv
	o7gTlSGreKJwnIwfFxIPvDU36gs28yeZkIUnEyhqgOqrbisQRiPIRb9wx7VBMiFO
	bTV4igaPTGGzmb1uZ0SRzLsYVj+lzR3pTCnfSm+LGBB2zgxM1ioxQG1CA==
X-ME-Sender: <xms:1-WtY5gjWUB2OMkut-e7Cuz3mHwtzDreYAzL1MO_QZ_il-zRZpp5IA>
    <xme:1-WtY-DTBGQ42A4RFNqhneMdqPgjb3tEB1eMM-DbdM72zQP5SQdast7GbI7XmgQk3
    d5E1Q5utB47buxMFw>
X-ME-Received: <xmr:1-WtY5HOSXYzO9HeE6CUa96-bbdB4S-wiNe9Rp4UinXVrF1mV5qxy-aUz5DQziUuhsyWRm743rRCbBPM-AUw3ic02WnsVxHD7t9OXpGVRgH6X8ld7-ZxIL18O5I5ie_GJXLHEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:1-WtY-Slkh2zIQRf-4_zq4yic2ZsX9DdG0ovTpqyUhTFnAGf7KUY1Q>
    <xmx:1-WtY2w-7zp5EQBsBSrEe9FWunGTKjJBoygRbs5L55oO_kiGs6HDEQ>
    <xmx:1-WtY044ab489IVsbvbqX1KLhO-Cdk3U5UmmB1JFdyosPJTG_FiR8g>
    <xmx:2OWtYwvJsFttLxTjB6e_WfMMv1kg7Y2WauiStFU8j4ScC0RdxrV9Ng>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 14:09:11 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>
Subject: [RFC PATCH 2/3] mtd: rawnand: Support non-power-of-two chip sizes
Date: Thu, 29 Dec 2022 13:09:04 -0600
Message-Id: <20221229190906.6467-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221229190906.6467-1-samuel@sholland.org>
References: <20221229190906.6467-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_110913_553997_9FCBB237 
X-CRM114-Status: GOOD (  10.51  )
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

Some NAND chips have a number of pages that is not exactly a power of
two. Support this by calculating the shifts and masks for the next
larger power of two.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/mtd/nand/raw/nand_base.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c3cc66039925..f46bad7796ed 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5003,6 +5003,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	u8 *id_data = chip->id.data;
 	u8 maf_id, dev_id;
 	u64 targetsize;
+	u32 chip_page_shift;
 
 	/*
 	 * Let's start by initializing memorg fields that might be left
@@ -5148,18 +5149,13 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	chip->page_shift = ffs(mtd->writesize) - 1;
 	/* Convert chipsize to number of pages per chip -1 */
 	targetsize = nanddev_target_size(&chip->base);
-	chip->pagemask = (targetsize >> chip->page_shift) - 1;
+	chip_page_shift = order_base_2(targetsize >> chip->page_shift);
+	chip->pagemask = BIT(chip_page_shift) - 1;
 
 	chip->bbt_erase_shift = chip->phys_erase_shift =
 		ffs(mtd->erasesize) - 1;
-	if (targetsize & 0xffffffff)
-		chip->chip_shift = ffs((unsigned)targetsize) - 1;
-	else {
-		chip->chip_shift = ffs((unsigned)(targetsize >> 32));
-		chip->chip_shift += 32 - 1;
-	}
-
-	if (chip->chip_shift - chip->page_shift > 16)
+	chip->chip_shift = chip_page_shift + chip->page_shift;
+	if (chip_page_shift > 16)
 		chip->options |= NAND_ROW_ADDR_3;
 
 	chip->badblockbits = 8;
-- 
2.37.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
