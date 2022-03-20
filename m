Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A106EC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Mar 2022 10:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QYQWNA9oDluIa1kLhJlIM2A1RpaRqxoPE0gFoNCe5Q=; b=NaR1sZbzAxjPbO
	7LMFFh/ASDvqhy+YUA3L+8BobwevdQfnOTu7Tssd1GFJdy4pLrodqpk4arXo8kJyP5Wb1EzF6pOWL
	N6j4KmXi1bhU39wVBDCnKIuMrm5oSIyqbK/XhjNy84vl3B5gE6oQ79fRfbn7+OUZxBRiOYErerpLD
	MOUaX1vpZLF6/HAJNkyclWZlos+PuAXr6ndmnlof58gTEoPK6EJxOt9mhBGC1cnAUqfafV9j5NRNT
	VxtrOoUVhnF0z0yR5kDC3dzJkgECwoxGE2fkGdLF4auVQmP2tJV4QYL6UMd79x7Fw1z5PuieywRYG
	KI0dnVXRSASJTSrRtSoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVsNR-0050iP-9Q; Sun, 20 Mar 2022 10:01:33 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVsMp-0050Wk-GY
 for linux-mtd@lists.infradead.org; Sun, 20 Mar 2022 10:00:56 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so9554191pjb.4
 for <linux-mtd@lists.infradead.org>; Sun, 20 Mar 2022 03:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HsVJmSPxGv/ua7JkMd1tIRNttw+E7BtumVyOfqfONlU=;
 b=Ne2CBROykIoGHI3CdKLx7jPrmwtAjcB4/mwPHf/2QF2ipEFz7iZFe1E9pcwxJydG3C
 XGM3gu/fg1B9MMMJNIMl7BbBWnyMxB7AVVLqAD7fWMuDPsHYaRm0z0EKwhBUGVnS7p+P
 FJHz6iqsiZ+9D6rqc3dYPTN9pLvxLYjrdg5f2rYQgW7apQpx1fk6CV/KMIWs66/7tVn0
 kXsfYwbcfaBKO3whu0PIW28p1bvpzsXy+SbHYCZjkR6VLQpFJ0HEz4WE64qY103hl+t0
 bH0vXI7MNt9lnGF3f6H5vF7IhHmHnNmjMzobXeOdlqQzO8nGf3CF1Ve2M1mHW32jT2vy
 O0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HsVJmSPxGv/ua7JkMd1tIRNttw+E7BtumVyOfqfONlU=;
 b=IsJmyXVP7Xa+LbHR9RR2T8Wqez9BVifeXF/n/vvVraeMw6PMYsfcwCSpqTXVAJ2vD+
 MiUg2TbbNbMSukCaEy3oBv387Gq/wDnkvs/nMbxocfKbBSiY3WB/uth28SZ4aWBDZtbc
 bCmnBE8yvlZ5N0CamzKGUu6BhL4LD1WTpzz+EjUaKhsVnh5MfDbpXEqtosQ3AvVyz4PP
 2x8PoKyzhOnDLPsub/ISqkTYIONEeFsos/5MFhopJFKnVWHn38+K8kS68l8dnKUeEoA/
 wI9rV+CbV93Wuh2huQc/u8WwdKEMjOMQzAsieGaK01sLB09UnCRdl49gUPo8PGpktX2i
 LFhg==
X-Gm-Message-State: AOAM533iZ3UCJAje5uN9am/ZuoXGfmpywy3jaDdqDLPtQNk4MDcwKMaJ
 xJUh08xzFbrlETL0fMcNcmvn746En21DwqeB
X-Google-Smtp-Source: ABdhPJyDnTvRx0nCssTLA5II5kcWpDTCLY1uagW/jC/lgi7zl63LqJ66wBQcib2k02G7ZK0bP0eogQ==
X-Received: by 2002:a17:903:32c8:b0:154:2161:df5b with SMTP id
 i8-20020a17090332c800b001542161df5bmr7616196plr.164.1647770453543; 
 Sun, 20 Mar 2022 03:00:53 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:7978:d40d:86ff:591d])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056a00080b00b004f791d0115esm16597810pfk.171.2022.03.20.03.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 03:00:53 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/5] mtd: spinand: gigadevice: add support for GD5F{2,
 4}GQ5xExxG
Date: Sun, 20 Mar 2022 18:00:00 +0800
Message-Id: <20220320100001.247905-5-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320100001.247905-1-gch981213@gmail.com>
References: <20220320100001.247905-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_030055_576269_3128940C 
X-CRM114-Status: UNSURE (   9.04  )
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

Add support for:
 GD5F2GQ5{U,R}ExxG
 GD5F4GQ6{U,R}ExxG

These chips uses 4 dummy bytes for quad io and 2 dummy bytes for dual io.
Besides that and memory layout, they are identical to their 1G variant.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/mtd/nand/spi/gigadevice.c | 48 +++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index d519bb85f0e7..fcd1c4e474a2 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -47,6 +47,14 @@ static SPINAND_OP_VARIANTS(read_cache_variants_1gq5,
 		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
 
+static SPINAND_OP_VARIANTS(read_cache_variants_2gq5,
+		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 4, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
 		SPINAND_PROG_LOAD(true, 0, NULL, 0));
@@ -393,6 +401,46 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
 				     gd5fxgq5xexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F2GQ5UExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x52),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_2gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq5xexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F2GQ5RExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x42),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_2gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq5xexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F4GQ6UExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x55),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 2, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_2gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq5xexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F4GQ6RExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x45),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 2, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_2gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq5xexxg_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops gigadevice_spinand_manuf_ops = {
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
