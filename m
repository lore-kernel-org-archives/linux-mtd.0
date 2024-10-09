Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E45CEDD89
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 12:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0n/fad2ETxwchAXslJNfmHC/ZWmIhIMANWo2GslCA8=; b=goPrE+AEkkN651
	YVsraY37uKX3w806MkzyZmbNJwPsmsr+6c6ilQnYZqlGtLZW5M73v71UVtrBtY0lU92xeMJaYiHuv
	27sx6HqacCR3GMrXBkbJNb+xR3rVYkrfsA1jmnp+EvwGxd8n5IUkOhF1knRDY+NeKoXZVAgjdv1Wz
	NtVH3Dz5fqwHMQ2xqT6gQDxGwkQintEgLW7TE4k2gF0fQT6EpWM7jPwyl33yzLij6UEtb6yLlpHfc
	84kdduf08E+fq+B+EStmlzEFx6JxSMi81PfBb8UMWEHjKUwD4btwkBK2uWYCoVV3YkXn89EG5Uv7o
	Hsyx8C4e9oO190+WhEJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syW8u-00000009HlO-0x5P;
	Wed, 09 Oct 2024 12:50:16 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syW8m-00000009Hed-4BXz
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 12:50:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1ABE1C000D;
	Wed,  9 Oct 2024 12:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728478205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=99CvSVKc2OGj1mXYyz7kU4sOpawQLKPY7h3Y3IqJTVw=;
	b=PiuXCtPJnSsCSd6xtydD7+f4MX3fBCaKeCfZ06Rhr7K6DAQJFU4nL5fOGKIBHak0d7SguS
	hkh6uzBglrUDxws/uTTSAV9hX2ymQoTXe6ha0+8ez07Q177soXQypcWri96MBlOaPptmT1
	lbBShV7mleeZjUssXhBlylkZRY9HEAWpdtNmGCdZ/Rapt4oONsBPX9Ctd0qzX2mKiUqt2f
	c3iUqIZfh0IMiAYc6/jHwFZ8wWKVf21+bQTDtd6zRfFcvn4Tzfht3f40ayPvPws28kmE0R
	vBiu9hFyhxJsahaU/7jR22o37TFEQr/m0GibTtwvSpJSARLFI/GD/FnF31LxSQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] mtd: spi-nand: winbond: Fix 512GW, 01GW, 01JW and 02JW ECC information
Date: Wed,  9 Oct 2024 14:50:00 +0200
Message-ID: <20241009125002.191109-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009125002.191109-1-miquel.raynal@bootlin.com>
References: <20241009125002.191109-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_055009_839450_34B7E130 
X-CRM114-Status: GOOD (  10.71  )
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

These four chips:
* W25N512GW
* W25N01GW
* W25N01JW
* W25N02JW
all require a single bit of ECC strength and thus feature an on-die
Hamming-like ECC engine. There is no point in filling a ->get_status()
callback for them because the main ECC status bytes are located in
standard places, and retrieving the number of bitflips in case of
corrected chunk is both useless and unsupported (if there are bitflips,
then there is 1 at most, so no need to query the chip for that).

Without this change, a kernel warning triggers every time a bit flips.

Fixes: 6a804fb72de5 ("mtd: spinand: winbond: add support for serial NAND flash")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 4e765cec0a3b..9b611bf7e8f0 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -175,30 +175,30 @@ static const struct spinand_info winbond_spinand_table[] = {
 	SPINAND_INFO("W25N01JW",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbc, 0x21),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
-		     NAND_ECCREQ(4, 512),
+		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
 	SPINAND_INFO("W25N02JWZEIF",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbf, 0x22),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 2, 1),
-		     NAND_ECCREQ(4, 512),
+		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
 	SPINAND_INFO("W25N512GW",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x20),
 		     NAND_MEMORG(1, 2048, 64, 64, 512, 10, 1, 1, 1),
-		     NAND_ECCREQ(4, 512),
+		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
 	SPINAND_INFO("W25N02KWZEIR",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -220,12 +220,12 @@ static const struct spinand_info winbond_spinand_table[] = {
 	SPINAND_INFO("W25N01GWZEIG",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x21),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
-		     NAND_ECCREQ(4, 512),
+		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
 	SPINAND_INFO("W25N04KV",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x23),
 		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 2, 1, 1),
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
