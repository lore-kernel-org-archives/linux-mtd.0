Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E59C44507
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2026 20:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vQXEzd1tjjER4eTmHZ+rFrVKVAU/FKJHunLPb4hVQzc=; b=fEg87FWc9oo0eM
	155iJCzBwfvE7LF/gNI4NhpH1JTGWPMzUEwsJR01VP+TP8ABKuD5sUFB5F0MwHaTwgwwsWksyAaBS
	+N59HDToriXHOM6xpe1HJkHqxWX6/kiHu7bW4cO8iWAP0dRkSJZmlIxhBvr21UJ9OFYHuzPvPRuPb
	b4W7zIYZIbtiXHizw1OTctOQP0OePvc6d2it6ziNuuWHMkroAWFKXkeoAh51uDNDTI095EcoxjkMj
	054opZwby0OzKQERYwDCU1g9resmRHF1XOLzNSzBw2G6OKodT+dOjJao8RR6/CuG8VZfvy7boBVgT
	x/umc9TQiN7h5l7z5fiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk6MG-0000000FtNY-1vva;
	Wed, 15 Jul 2026 20:37:32 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk6MB-0000000FtMa-3AHN
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jul 2026 20:37:31 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so2603483e87.0
        for <linux-mtd@lists.infradead.org>; Wed, 15 Jul 2026 13:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784147844; x=1784752644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NoIda1guEjtKHuZZquZPDvd4YRXgpw3e0ECzSA1t07Y=;
        b=a7ersYBXxiWkRfaBGPHiOCMXHkYENlW4s0m0lETLCqiNN8sC9OlkMuft9clsdiDCQo
         7T4FhKm+99tX1nbg6tbuFs1PQnEp+8IjipD//jua+Znc/WNRDzDPCfKvOC7FEaUtdKlW
         8gKozxBL2+REw1z2pT+yRWcuoJHqzq4s56CxOnZxPblSchUlWJ8p2374ErFDvdLhBHRC
         FxiKzmQ0AqMVXP/vMBYrygNKBkyM1Q/mvzAs2CMHWwTvEOaEAhPd2s500zHqgD/wn6tP
         HUAF5ZjH7vXSqGtSmWu6aNx7rdtTRPAOzzYBstnYpYFCBXN/aN9ICVIw0ofSDdV0aEjf
         b0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784147844; x=1784752644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NoIda1guEjtKHuZZquZPDvd4YRXgpw3e0ECzSA1t07Y=;
        b=WDCXYKtBsOmD8aZTV3jfwp0oMcbhPlTZ3wvIr+H4JPUBl9XAYD40HUxIn+etUzHEVW
         H7EtcT4e60dCoap1JzN4eXcFuvXZjCvlleEdHREwh/jkIOd9EKK/wuBkGnqQolTQuH0t
         fIjc3OMVOLpHlLfs4j0WsjptZohTwlr82Qz64lEz3smP30lbxK3Ar+DeFywCHllsPGn5
         vBV5T770IAdvwfhsvT/NsV3VoRs5zE7Iuiy0uhfDvQSoWpnKe4cUg0mQXkEyjVKOeb9B
         UPoSBdVSTtxJWRPX36tLVZOY1LbeLbryLfMbWfmC3GRCcRMCONw1zuF6fCY5j7JOsObY
         d5vA==
X-Forwarded-Encrypted: i=1; AHgh+RrD2LEEbK5YITfo9rnwTvKXAZCE56Yq6ZAwL58Se4vjg0MSzSbZ44WSXtrStXSItq+2sRpolrYjKwE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxS7cO53PfA12sUvzZpoa8eYrkNZrN6ZZG0t5ZBaM+KIuuOilSn
	b+R90Y+wrKo5io32+XM6rEf3+drZlyu/XnawJ+++g5lLGbWxbWOnZmF7
X-Gm-Gg: AfdE7cllNe89svRxtWoxy8ZMROc480wxKN9Fo7sIJdqncVB7YWehs4C4E3Ct27bGHkR
	scXxKOIaHHpr1CLNuWsiItKAcJa0wy93/9IBhJnAsomRsGUD/FtgnG5U5jMvHzjkPj6GWPvfBH5
	YNYSHdPVhpTYLLbwL1+/AlqLSQWISVZqBOk//qaynDBS3VVwx9qCY/uuvTtlTwX8GD+uTyfjrN8
	hebDPPX9jzkvuVTEOowEnK+wygJo0ukIUWJXXcTM9fuhGJLD3LMdmIcjZLdSBwnHsqOOadI6WyE
	BjJ3vgLVdNL5gzbSeWsLSMpE7wBYi8lb72iy4lAvSFh5Za2LUefnE8ei0V/yWuF1YDmJDyrpbsl
	zG1HgfKH13HaA/KiK9BE7j8jI0hjhTS1UiPihI6RpEHZ/u+FxSWMnI8W3qSJW5Na+CeiXlWc4JF
	bB1xb8MU6cMhP7eiYVVjB6jnNGfa++ExeDf9p+TqwtZ13k/CbkjxdJ
X-Received: by 2002:a05:6512:611:10b0:5b0:1df9:2aed with SMTP id 2adb3069b0e04-5b0235633f1mr3066253e87.5.1784147844176;
        Wed, 15 Jul 2026 13:37:24 -0700 (PDT)
Received: from NoteBook ([37.153.34.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9dde5sm4422923e87.38.2026.07.15.13.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 13:37:23 -0700 (PDT)
From: Aleksandr Mineev <sanderrrs@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Mineev <sanderrrs@gmail.com>
Subject: [PATCH] mtd: spinand: fmsh: fix FM25G01B/FM25G02B Quad I/O read dummy cycles
Date: Wed, 15 Jul 2026 23:36:02 +0300
Message-ID: <20260715203602.1462-1-sanderrrs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_133728_462610_EB5D829F 
X-CRM114-Status: GOOD (  10.70  )
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

The FM25G01B/FM25G02B datasheets specify a single dummy byte for the
0xEB Quad I/O read-from-cache operation, but the generic
read_cache_variants set uses two dummy bytes for the 1S-4S-4S variant.
The extra dummy byte shifts the data phase and returns corrupted data
with no ECC error, breaking boot on boards using these chips.

Use a dedicated read-from-cache variant set with ndummy=1 for the
1S-4S-4S (0xEB) operation.

FM25G01B datasheet: https://www.fmsh.com/nvm/FM25G01B_ds_eng.pdf
FM25G02B datasheet: https://www.fmsh.com/nvm/FM25G02B_ds_eng.pdf

Fixes: d5a5c9eb2ee9 ("mtd: spinand: fmsh: add support for FM25G{01,02}B")
Signed-off-by: Aleksandr Mineev <sanderrrs@gmail.com>
---
 drivers/mtd/nand/spi/fmsh.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/fmsh.c b/drivers/mtd/nand/spi/fmsh.c
index be5db9f9502b..6352e9c9e502 100644
--- a/drivers/mtd/nand/spi/fmsh.c
+++ b/drivers/mtd/nand/spi/fmsh.c
@@ -44,6 +44,14 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
+static SPINAND_OP_VARIANTS(fm25g_read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_2S_2S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
+
 static int fm25g01b_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -192,7 +200,7 @@ static const struct spinand_info fmsh_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xd1),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 21, 1, 1, 1),
 		     NAND_ECCREQ(8, 528),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+		     SPINAND_INFO_OP_VARIANTS(&fm25g_read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
@@ -202,7 +210,7 @@ static const struct spinand_info fmsh_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xd2),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 41, 1, 1, 1),
 		     NAND_ECCREQ(8, 528),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+		     SPINAND_INFO_OP_VARIANTS(&fm25g_read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
