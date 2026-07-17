Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB90C44515
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BnZIG6Kknu0yRHZSPzFKvnEqtIzOeabUFRM5HfRRT1g=; b=noTBXcMRHLuZHd
	bvtXMyz81rhZaj/+FNru5CqN5INBkMyX9cHilh9pyJo/4HZL9C3+BoESu3fioKY79Lcl81/YB5lI2
	zHRuVTbAyrV6hjf2W/3D5ndfau9KMeHS5NqnfQD5bALkFb1nJ0+YbLe76raJeC9OP7HVuggFTeb9G
	cDmqsSGCT102NaITfW8gtOMBxJtBzVedHTVkbF35Rz1AGYNCGb5BcIIJSKsYT5393Xc86BFLBi50r
	3wqLa3mcFxRIoSdkm1ONr9Pb9qZEmTx7LOSRolMN4TkYHIJeExgoEevwvny0mQutwMXs8izrvV9qo
	p8+B7hPs/LTAB2IFdDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkrX-00000002fmq-3PrG;
	Fri, 17 Jul 2026 15:52:31 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkrU-00000002fm2-36lU
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:52:30 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-39c86945164so69061501fa.1
        for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2026 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784303546; x=1784908346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mR8w9J8HX07mDDKSdmoHrKPNrY3xeykulocxr2DnutU=;
        b=YO5GSJRYjIP+Y7edhnmC85xkj6lzCfb4+fGAbIS5d/DUvbRVYdcfaOTU36ZxVWv9Uz
         yZh5WeQZuR2/p7EE3kWf9CyzXvaYESHwDROMQTc0ugkL11mR1GjU1upU1CqgYix8LUaK
         RIuwhfP/jvUJa3VfflD8N2/wTEjeJlGVY0d56/yoMGWXTboiRrPesUujpbricQVP1O5k
         iw+PUR1YAwl0l7geRU3pKUWbbgH8I0tfzwI9aVW6zyKCTlVEV/IgNWQJwKT3d/M9z+FD
         iwIbp6y5xpYXKEzIUQspRy3Uq0UIjD6RjbcIhfvrQjQ2BzuXm2K9l/BKReDAL+5rMHj6
         ufLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303546; x=1784908346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mR8w9J8HX07mDDKSdmoHrKPNrY3xeykulocxr2DnutU=;
        b=bL3hd6OFE+drkkUPJU3N8VhCDFqumpUVmEs5fjkNVnofktPot8Y/IEYTLcBSZv8RWB
         G4I40WA6i5VRBoMqFHfhhJ3Ag/CIK6Ogo/DNc7riA/mpH2/LDEj7ppBNwn+SWf5Z9i3e
         01pD54zL2wFxslF6t6kP/5ieZ3OwCcMna7eNu6rqLW1uuvh0B/CCDE4M1Q4pOvO6klzB
         Y5IAX9BGVEG4aIQQixxV3yZjL9T43fZhPGr/dkyfQbxJ3UEwaS5kUCh8fyEX3Fbob0Dx
         Y/SLtqsQ17XLlLr2f35xAKNhhtJzHmHcW9QFh5WHDjd60CH1sLE2r33XfaQTUfqVXOvp
         nbzA==
X-Forwarded-Encrypted: i=1; AHgh+Rq74TxVbYHI2EaG1HTtb6wB9dihDOM0z3t4YXEJXc8l29pMjsprUY7TJ9DT/80U4Y4H3wKD302nkpw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/T79gF6/oLj6dWlz9s3Lm3Ysw3eysmkO3Xxx55P52jmNIgQga
	7qz6uLZ87JpLYuSA2UEVxVdmhxwMuiMk2GDrIlW+X+1l2o1ArnQjoebp
X-Gm-Gg: AfdE7cnJbPlHG1myOh9xZnU8EidPVa89kPqOlf20e9w1bfdJX58jKRgjMi08i8eM83S
	HibVaAhYR83NN8LH1jI5bIiGyrILRmQWTgPjsjFiU5u/s/XJr/rl/zgiRg0I02OIZgH13xVcCzl
	HFjaC4l5/UkHZB19RLJhSDFlUZu0hezbL44PZKbdq3XWdvhiuE/rJ2ZTxjvgIPHIHyfQ2rvU9XI
	MCLDwiBjccn5wjYAotFo7JD4QFn5Ws9axiFTIejC8qGWxLIFOJbSZlX+yRTvtocf5hcuzvB/4Gc
	d9u8rjSv5oIyRF6tZkuhdiGHwvLagkdVXDXoLejMHcCqEeSOL5jDdCsAXq+wKV8iWRiK6NVgB4a
	SejVzMjPmrIM+8DbOzObmjm66zm7bAhypmjDy31PkG/gMH/HuZ9TRlmiMV6sufG1UCOa7aW465O
	kf6LLvB4mxf8VKsNKmYIIR4X3S1OvTWTseiAYNF+WoNfBwFiI9yyzT
X-Received: by 2002:a05:651c:158d:b0:39c:6f89:c9b3 with SMTP id 38308e7fff4ca-39eb282acf6mr6605421fa.14.1784303545606;
        Fri, 17 Jul 2026 08:52:25 -0700 (PDT)
Received: from NoteBook (sandersphylex.duckdns.org. [193.23.209.59])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eb501b90bsm3164781fa.40.2026.07.17.08.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:52:24 -0700 (PDT)
From: Aleksandr Mineev <sanderrrs@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Mineev <sanderrrs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: spinand: fmsh: fix FM25G01B/FM25G02B Quad I/O read dummy cycles
Date: Fri, 17 Jul 2026 18:50:50 +0300
Message-ID: <20260717155051.50-1-sanderrrs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_085228_798100_ED81C2E7 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: stable@vger.kernel.org
Signed-off-by: Aleksandr Mineev <sanderrrs@gmail.com>
---
v2:
- Add Cc: stable tag (Miquel Raynal)

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
