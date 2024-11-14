Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2801CD637D7
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2024 02:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGXJLbMbHdzRQVCc/39DoRn8bzFMceh1FMiU9tWSdBc=; b=CfBUiwUiBTR/xd
	7wd73yKoVvhn5lE1XIGNRJwPkZMXeufNR7vZVfibsakYuMliqNtZRGTZ57u3hZVT19u2ErnJtxOx4
	HSuamRb0woNHEjmSgTuV7sLv0nZ2BBXrPS5/VWQSXZeSNsiFh80TP9YDImyzSmrYNJtS9QYFqn4YX
	i3GkkEqtUA7O6ucn2HGkt81wjYUghL1UpiqtTYV9W1nQJbFKda3S4L3JVVDkhFpqAwGEr8l7cQUiQ
	fcD67VU4uvbvm1RFHMktaA6InSGrUqlumZU0rwwi1qRQhGBdElyYhuNekcroidHjRjF5ssVBxSsRP
	4Xo2qEBY8wx8wWB7M5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPig-00000008ZNa-49D4;
	Thu, 14 Nov 2024 02:36:30 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPib-00000008ZMR-3htC
	for linux-mtd@lists.infradead.org;
	Thu, 14 Nov 2024 02:36:27 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e2ad9825a7so135770a91.0
        for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2024 18:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731551785; x=1732156585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZUHHT1NQG5Uvqfb4hSdJ+6FPn6N2m9pG+Uu3VTVYDw=;
        b=MRRhtDI1e/aVRetFU/kZN/gLFXjg48hrt9LdFuoK87Sj6f67qUKnsN2RYCmUPtt0CD
         uBkGvtfPX/IhilKIoM2B7VDv/893Cpxo54If9tQmfJ4QTEegz5hVhL7XWBHDDriyGGsn
         rZ2TaScYK4+cbl+1oT//s4Pv761CBXEFQss8L0JuY8dX2EbfLgQopURBV2kjG3MKbJn8
         djhfHOPO40DWIJWF4TDpZuVbg2k42PA3BiQGmUjtWWtBKjRMPAYHdb+Cff1fGdoGEIq9
         nswe8nMUGu+agBkW6QoLxi46Yy/HLXxj/YvmmxANzonpPM0SJ3LdDcuq+TsMBWyu+QGF
         jadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731551785; x=1732156585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZUHHT1NQG5Uvqfb4hSdJ+6FPn6N2m9pG+Uu3VTVYDw=;
        b=kkd9mU8UVFasJeng+ebrXkfFFoVQ0/fYSnBzEwN8WXjBbIWFpEZaWimjlanp70iRtf
         i1CiHJvy9LknPBsKohOGUtfdMN+cvdogBtypts4fejBKqnhnHRP58eT3VpwA107bLCuv
         0pGt2hhpJB/h3d+vzLJAhDPxrEc3jJ6z4qD3N47iaBbkDmNECtLj/oemK61iOH0Mdmdi
         8a3n+OyRlNA8VOh0saSDl7SOh3S98lxOM1MYoEWrCoHLoMJXCB1qP6aqPU1h/U+bx5ay
         Qw44GeGsZGHhtlQiY1W/2yONqlP6Vyofl9MsKdHk3VLH+LdO9WqkPUzxnKzAoMJrmr3m
         ZL1g==
X-Forwarded-Encrypted: i=1; AJvYcCUsemjb6Zdi0qwdvpIMC8EgaTk6sX79MtURDXqrNzwteCV8ByNiA+qZcmZtbsxgC2dX5+H+AmN6+DA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaRLkeGELysXk8A7xAcKH39wvJlMy1K7bcBzwuL4K7++B7JCNS
	9vPI3c+NTRf27L7dtWUXE6twlMaTbzwVGu7e89K202rP3Cl/JSVOKXl3lQ==
X-Google-Smtp-Source: AGHT+IFmomoWIK1E10LxkjPxLyAB+RT+I8tMD2yDFYg8SKFZADuzQIR0Sozc6K79hkkKRWRlU74dUg==
X-Received: by 2002:a17:90b:3146:b0:2e2:ad29:11a4 with SMTP id 98e67ed59e1d1-2e9b177fd40mr30185844a91.25.1731551784397;
        Wed, 13 Nov 2024 18:36:24 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c565ccsm532985ad.90.2024.11.13.18.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:36:23 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 83E428083B;
	Thu, 14 Nov 2024 10:42:49 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 1/2] mtd: spi-nand: Add read retry support
Date: Thu, 14 Nov 2024 10:35:27 +0800
Message-Id: <20241114023528.181583-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114023528.181583-1-linchengming884@gmail.com>
References: <20241114023528.181583-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_183625_953148_D013E4E9 
X-CRM114-Status: GOOD (  21.59  )
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

When the host ECC fails to correct the data error of NAND device,
there's a special read for data recovery method which host setups
for the next read retry mode and may recover the lost data by host
ECC again.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 35 +++++++++++++++++++++++++++++++++--
 include/linux/mtd/spinand.h | 14 ++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 4d76f9f71a0e..bd5339a308aa 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -672,10 +672,14 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
 	struct nand_device *nand = mtd_to_nanddev(mtd);
 	struct nand_io_iter iter;
+	struct mtd_ecc_stats old_stats;
 	bool disable_ecc = false;
 	bool ecc_failed = false;
+	unsigned int retry_mode = 0;
 	int ret;
 
+	old_stats = mtd->ecc_stats;
+
 	if (ops->mode == MTD_OPS_RAW || !mtd->ooblayout)
 		disable_ecc = true;
 
@@ -687,18 +691,43 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 		if (ret)
 			break;
 
+read_retry:
 		ret = spinand_read_page(spinand, &iter.req);
 		if (ret < 0 && ret != -EBADMSG)
 			break;
 
-		if (ret == -EBADMSG)
+		if (ret == -EBADMSG && spinand->set_read_retry) {
+			if (spinand->read_retries && (++retry_mode < spinand->read_retries)) {
+				ret = spinand->set_read_retry(spinand, retry_mode);
+				if (ret < 0) {
+					ecc_failed = true;
+					break;
+				}
+
+				/* Reset ecc_stats; retry */
+				mtd->ecc_stats = old_stats;
+				goto read_retry;
+			} else {
+				/* No more retry modes; real failure */
+				ecc_failed = true;
+			}
+		} else if (ret == -EBADMSG) {
 			ecc_failed = true;
-		else
+		} else {
 			*max_bitflips = max_t(unsigned int, *max_bitflips, ret);
+		}
 
 		ret = 0;
 		ops->retlen += iter.req.datalen;
 		ops->oobretlen += iter.req.ooblen;
+
+		/* Reset to retry mode 0 */
+		if (retry_mode) {
+			retry_mode = 0;
+			ret = spinand->set_read_retry(spinand, retry_mode);
+			if (ret < 0)
+				break;
+		}
 	}
 
 	if (ecc_failed && !ret)
@@ -1268,6 +1297,8 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->id.len = 1 + table[i].devid.len;
 		spinand->select_target = table[i].select_target;
 		spinand->set_cont_read = table[i].set_cont_read;
+		spinand->read_retries = table[i].read_retries;
+		spinand->set_read_retry = table[i].set_read_retry;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 702e5fb13dae..bbfef90135f5 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -339,6 +339,8 @@ struct spinand_ondie_ecc_conf {
  * @select_target: function used to select a target/die. Required only for
  *		   multi-die chips
  * @set_cont_read: enable/disable continuous cached reads
+ * @read_retries: the number of read retry modes supported
+ * @set_read_retry: enable/disable read retry for data recovery
  *
  * Each SPI NAND manufacturer driver should have a spinand_info table
  * describing all the chips supported by the driver.
@@ -359,6 +361,9 @@ struct spinand_info {
 			     unsigned int target);
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);
+	unsigned int read_retries;
+	int (*set_read_retry)(struct spinand_device *spinand,
+			     unsigned int read_retry);
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -387,6 +392,10 @@ struct spinand_info {
 #define SPINAND_CONT_READ(__set_cont_read)				\
 	.set_cont_read = __set_cont_read,
 
+#define SPINAND_READ_RETRY(__read_retries, __set_read_retry)		\
+	.read_retries = __read_retries,				\
+	.set_read_retry = __set_read_retry,
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -436,6 +445,8 @@ struct spinand_dirmap {
  *		A per-transfer check must of course be done to ensure it is
  *		actually relevant to enable this feature.
  * @set_cont_read: Enable/disable the continuous read feature
+ * @read_retries: the number of read retry modes supported
+ * @set_read_retry: Enable/disable the read retry feature
  * @priv: manufacturer private data
  */
 struct spinand_device {
@@ -469,6 +480,9 @@ struct spinand_device {
 	bool cont_read_possible;
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);
+	unsigned int read_retries;
+	int (*set_read_retry)(struct spinand_device *spinand,
+			     unsigned int retry_mode);
 };
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
