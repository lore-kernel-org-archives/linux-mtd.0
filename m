Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7831C25B75
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2024 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PGHtt1WFO/PZZF2g4JngH33CIQAg+7n0gB1RPtv+euA=; b=sBZg7LANlgA9J3
	oMlwgIzOEeoErBLQTxccvo4aXmdm7bMwt/93iZj8LB++6I/F6//hFOH5XdLJ6hcE9+6++w2N6XsuF
	A2GrScXmxiHji0cXPozaS+fKI3ddiuGqMrRSYeNKnG33ReyykXK6rvczqaAWqmT2HmcbgH6zl4PNQ
	5bxnp9EmmFbztLcOLvonJP4khJ3bzs0zHwmU7bR7Acj9JOdeB6h2tFGVp61KAYa63i0IyxWw0XmoK
	8RqxPRE3oTxYgH2o18vEtkva8BG2mxU+SouHiFsPk/u1bsA4zSvh4mqf7lKufZnXbr/bURMjPix56
	V8x3g9bAqgJRba++vDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2Il-0000000Fvlh-0peu;
	Mon, 03 Jun 2024 07:40:19 +0000
Received: from mail-oa1-x41.google.com ([2001:4860:4864:20::41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2Ih-0000000Fvkk-1s3w
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jun 2024 07:40:16 +0000
Received: by mail-oa1-x41.google.com with SMTP id 586e51a60fabf-24ca0876a83so2203360fac.2
        for <linux-mtd@lists.infradead.org>; Mon, 03 Jun 2024 00:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717400411; x=1718005211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2FWb75cH+3iCprEXqTnOlMXbH+prg3pAb1WVvaGmF9A=;
        b=jJNbosV/y6aWVfWqCqaV0NEv30HPibEHl26M9pve/8o+j9FI02ySu3MFlddyzQjkov
         h53JahBRje4+9IqnjDIxdxEiVbjJt8U7+UkDG37opzlkMzBS3TtGl4Wg7zqusFB8CVZG
         SzPLPhJ5KKfrFEUIQEmlqaaftLD4gUGkYL5/cZQ5xaZYXQdbsOmvJNxDlMMJGHUV0RXh
         D3ZYGJ356bXrdPFHqAbwx2dH4zZzEXa+Jg4wUwz5G1OO2qIhmOOzjzdhGokCIEjor7oF
         NWO8Ca4/910w0FgyLeQqSa67nYCasLLIDPgKENMbhDNZ/CCxBCuYX2BPRSlID7yceRhD
         gPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717400411; x=1718005211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FWb75cH+3iCprEXqTnOlMXbH+prg3pAb1WVvaGmF9A=;
        b=dUIc1UNly86WeZpGvJ41L2YrmkDtjdg/Bqbha8T+lMb12XC3E5bqVguhZC1CUDlIDf
         T3/LTGkjo/2E4aktvzU1dop1gYT+C+CAaegG5qmtoAO0Y9rre1+p7FqFvjTRluUzb80u
         zP3DsRylQu3mMVH5t7gcOu0her31A/We1K/99QWyazmO0Ltx1jyJaqylQ8uzIkRhe+xH
         Xem6AtNUZEQpPgw7J+j6NwYRbx/7g7I/ae8a0LHrVoui7LVwksGx9tstgfT1FuGROy1q
         8s55EjdBHuDose6LP8HF8H6qhrKK3G355tByvXSGy9UfY496IipF0dbcLfqieQmMeZi2
         G5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWk57+g+KZK3eDoyojmSSgO4C7UJdnxYeAuXDZJQsXNPewtsl0Dfyf8T7F37w2iAnlLZ+6kPbIxWkINK3sb2aAwDyFK362a8spwyQSZAQ==
X-Gm-Message-State: AOJu0YzZKyYOyUX4BPu5CKX3V4uKHjCILWravJE1CZZxJZaRSQPaEIoW
	hx2LQkw+zuu8RoKRyCnXU3fw0VYgfZiomg+vWKv3/9D5QNevg3p9Yr5lSlX4niE=
X-Google-Smtp-Source: AGHT+IF5/ByL3b/SC1mcU5unJApgzzwn4Zx24MkG74MKNAPQfKKM9gMvAoT31/rXitQaS4tx8uULRQ==
X-Received: by 2002:a05:6870:a714:b0:24f:f413:3039 with SMTP id 586e51a60fabf-2508b9b8415mr9956592fac.2.1717400410647;
        Mon, 03 Jun 2024 00:40:10 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423cb705sm4904998b3a.4.2024.06.03.00.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 00:40:10 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 117BE8095A;
	Mon,  3 Jun 2024 15:43:08 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	dwmw2@infradead.org,
	computersforpeace@gmail.com,
	marek.vasut@gmail.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH] Documentation: mtd: spinand: macronix: Add support for serial NAND flash
Date: Mon,  3 Jun 2024 15:39:53 +0800
Message-Id: <20240603073953.16399-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_004015_514747_D76423DC 
X-CRM114-Status: UNSURE (   8.75  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

MX35UF{1,2,4}GE4AD and MX35UF{1,2}GE4AC have been merge into 
Linux kernel mainline. 
Commit ID: "c374839f9b4475173e536d1eaddff45cb481dbdf".

For SPI-NAND flash support on Linux kernel LTS v5.4.y,
add SPI-NAND flash MX35UF{1,2,4}GE4AD and MX35UF{1,2}GE4AC in id tables.

Those five flashes have been validate on Xilinx zynq-picozed board and
Linux kernel LTS v5.4.y.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index f18c6cfe8ff5..e1446798bfb3 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -132,6 +132,51 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+	SPINAND_INFO("MX35UF4GE4AD", 0xb7,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF2GE4AD", 0xa6,
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF2GE4AC", 0xa2,
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF1GE4AD", 0x96,
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF1GE4AC", 0x92,
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
 };
 
 static int macronix_spinand_detect(struct spinand_device *spinand)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
