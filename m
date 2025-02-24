Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B37C3DA4A
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 07:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VIv+WkpR1cnNFAL+Zakr6777XEcTTYo9oOs7mZ/Fts=; b=fNwGpz6vQJokHc
	VGw6koadNBaxEgLfU97VCnM48pa7cd6wk6Xe65sC7Q5CCV0GIpJmpXJoYRzgDBYOJIkfOIrpnCCkf
	yppxKUEfoGyYV5GgoEzUn5LB1C1efVfmnd/J5Q4YdDyD0jwfpqfewvImwW4gkQIJMxSKG3LEYw/bq
	0oaMpYaxQHE57Z5QwN34wXPXj111ZZTEA7/SsMAAMEnaY4pSEfTxFsoZB8SIEGK5ys1ofMX4HSqty
	HsrMBLCFXAp9yIK5164XucD6WSRIA+nnIGfDMWiuGAuyurz93lcUB9hzInz36KAX/AX92t311SWS/
	GRjVL7RWwUuwMJ+lsmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmSZc-0000000CW80-09l0;
	Mon, 24 Feb 2025 07:08:16 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmSZY-0000000CW6i-23yP
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 07:08:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22101839807so85172695ad.3
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 23:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740380891; x=1740985691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuwxW0/kSg8UdM9sxgaU8RMlCzyHiyIIgr/U3aOdQEY=;
        b=lh+muFJjH0y4bSqrdCjyBl7lKmSmbTZJ8lF/0h1jn3uFA7juK5dBvtb4KDMtjp4ibn
         s/2wxsBhJ7cy73CWuAU61m6Ro4wmGGfVMpD4KC/fF+HpIl7Xmz8DiY74O1+M83HQiWWa
         mVIwLKFw10WWsqEm03SIMY+wH+7npAAfSHc6bVbQOOL4ksDFTvEOZp0PeZBX76kZA/1q
         d2LNH59B+6DEjbwvI2DMRndaQW851SbQ2vc/tHgFOLEMEN2AZeAvBXCdCrvryd+SO+2i
         Rn+t+cdW5/EVNI55AhudsP52NoILIc7pkYwiFRQ5AJ3WWQTXtj7o/wxiA9o5yl0qhFHN
         liGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740380891; x=1740985691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuwxW0/kSg8UdM9sxgaU8RMlCzyHiyIIgr/U3aOdQEY=;
        b=HZGczXYZJxlLCaJXyXeWEEs3imAbTD7fX/IU2M4uuEaTerdoMFU4iEpS/3BnUSwHtG
         cQUbuBKybKl2v5q6JO/E1aDHPqX/lSNnca8V3+zupmsZET7Ge0QcVdGPQJdLCW5rfYFG
         1hfR5ie5bk1l41NCnzTzmLqDVf3bK5fSWHk+7zX92QXOjOXNTX+hnYeUo8aeZL+NQ7+m
         YqbOAspI6ly9tgjalamTAq/7Ai9kilnXt5n2ILU6OBEgxuyV04367YCbZyCvCJ1yU1RJ
         uSPq6EQAKpnDXIGNG8/yIenAq7DEN4wDFhZHld3e4MPMbMXk1NTY1dzdWXXa/DbOpEV1
         PaFw==
X-Forwarded-Encrypted: i=1; AJvYcCUHCS3EQGYisIN+ub5R8GXN3FEahkPIkSWNlKOYHIB3qlKOeABB3uGdcvrmkE3QV8T3yVs0acXD7V8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyVJB22n1NvKdB26/D72MGUWwcqU09Ibhi8TOZElffcrxijtXb
	zUZ9B8M6lA9ipH8wXuruOSZfvyLgv0Oh/FD+RuBjhanl02rUq6gMtDJVng==
X-Gm-Gg: ASbGnculLJzOlyre1/lMhWbgxuEqjpAHFkR/aF/x0PaijJorDMS9IPPk743Vi5WA3SC
	D6yoYAjf3uIkDjUc1R/AJkMhzBO4AYfheXFotPKkTNxDkI3Dk+bmeqzD91XmSb47TvxSaij1qN7
	8X4hM3KIWlM1vDR39ogrAdmd1owe7CyfEbrTnZU/YTI1hnmYreEDeM4f6P8RVjuSb2rDt3gJzjJ
	kRzUJtaLnxMiGS5K/nnuG7aD3kbhtYFECqQA+v/BQcHb56AQRwMYRu8HGFBEYZsJTiJIUPbVD7y
	GRt2IDYGlLO0SfLQNH6tBT9HfRw0zbyUbMa98O//rHGKnq1hCQ==
X-Google-Smtp-Source: AGHT+IGfszCtI/n/y/N1a12SDHSeE9d2dYjSptoYpB6Sb9ADrTYnehoVJIVKr/VCIRLpEtH3TRJxsg==
X-Received: by 2002:a17:903:2283:b0:216:48f4:4f3d with SMTP id d9443c01a7336-2219ff50ddfmr143610565ad.13.1740380891444;
        Sun, 23 Feb 2025 23:08:11 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349061sm174504825ad.5.2025.02.23.23.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 23:08:10 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id A6222806A6;
	Mon, 24 Feb 2025 15:18:18 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v5 1/2] mtd: spi-nand: Add read retry support
Date: Mon, 24 Feb 2025 15:03:48 +0800
Message-Id: <20250224070349.446739-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250224070349.446739-1-linchengming884@gmail.com>
References: <20250224070349.446739-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_230812_531019_0A5F4E33 
X-CRM114-Status: GOOD (  21.16  )
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
there's a special read for data recovery method which can be setup
by the host for the next read. There are several retry levels that
can be attempted until the lost data is recovered or definitely
assumed lost.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 35 +++++++++++++++++++++++++++++++++--
 include/linux/mtd/spinand.h | 15 +++++++++++++++
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index dc5b11fa7a15..d16e42cf8fae 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -700,11 +700,15 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 {
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
 	struct nand_device *nand = mtd_to_nanddev(mtd);
+	struct mtd_ecc_stats old_stats;
 	struct nand_io_iter iter;
 	bool disable_ecc = false;
 	bool ecc_failed = false;
+	unsigned int retry_mode = 0;
 	int ret;
 
+	old_stats = mtd->ecc_stats;
+
 	if (ops->mode == MTD_OPS_RAW || !mtd->ooblayout)
 		disable_ecc = true;
 
@@ -716,18 +720,43 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 		if (ret)
 			break;
 
+read_retry:
 		ret = spinand_read_page(spinand, &iter.req);
 		if (ret < 0 && ret != -EBADMSG)
 			break;
 
-		if (ret == -EBADMSG)
+		if (ret == -EBADMSG && spinand->set_read_retry) {
+			if (spinand->read_retries && (++retry_mode <= spinand->read_retries)) {
+				ret = spinand->set_read_retry(spinand, retry_mode);
+				if (ret < 0) {
+					spinand->set_read_retry(spinand, 0);
+					return ret;
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
+				return ret;
+		}
 	}
 
 	if (ecc_failed && !ret)
@@ -1320,6 +1349,8 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->set_cont_read = table[i].set_cont_read;
 		spinand->fact_otp = &table[i].fact_otp;
 		spinand->user_otp = &table[i].user_otp;
+		spinand->read_retries = table[i].read_retries;
+		spinand->set_read_retry = table[i].set_read_retry;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 73424405232a..5837a09ab9d8 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -452,6 +452,8 @@ struct spinand_user_otp {
  * @set_cont_read: enable/disable continuous cached reads
  * @fact_otp: SPI NAND factory OTP info.
  * @user_otp: SPI NAND user OTP info.
+ * @read_retries: the number of read retry modes supported
+ * @set_read_retry: enable/disable read retry for data recovery
  *
  * Each SPI NAND manufacturer driver should have a spinand_info table
  * describing all the chips supported by the driver.
@@ -474,6 +476,9 @@ struct spinand_info {
 			     bool enable);
 	struct spinand_fact_otp fact_otp;
 	struct spinand_user_otp user_otp;
+	unsigned int read_retries;
+	int (*set_read_retry)(struct spinand_device *spinand,
+			     unsigned int read_retry);
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -520,6 +525,10 @@ struct spinand_info {
 		.ops = __ops,						\
 	}
 
+#define SPINAND_READ_RETRY(__read_retries, __set_read_retry)		\
+	.read_retries = __read_retries,				\
+	.set_read_retry = __set_read_retry,
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -572,6 +581,8 @@ struct spinand_dirmap {
  * @priv: manufacturer private data
  * @fact_otp: SPI NAND factory OTP info.
  * @user_otp: SPI NAND user OTP info.
+ * @read_retries: the number of read retry modes supported
+ * @set_read_retry: Enable/disable the read retry feature
  */
 struct spinand_device {
 	struct nand_device base;
@@ -607,6 +618,10 @@ struct spinand_device {
 
 	const struct spinand_fact_otp *fact_otp;
 	const struct spinand_user_otp *user_otp;
+
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
