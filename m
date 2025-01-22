Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD039C02181
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2025 07:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5k2cuFS5ziWM1XPG3xSqzBmjkml5gzDU69iVmkwJkQ=; b=E9i8JBhEEKvy+k
	0T0AQIJ/6tk36uILuzRpwlF9XOxnSDfzzg460v6pVfWngZyOKwhtKECxnJv/Ih7t1folZnANb3ZwB
	xPPLsNf/+cfaGAMjZMv6BPxHgwezwJOhexRe4tKePQCYEmDLC5MMYXo1SOaSMryuBcyniRcH0tq+w
	mHPh1+DrKyNir15wtCD7dDNPIe7bb8dLnpssyeVzxY9gYh7c60MAI+MVpZlogXu9uOAJqUeUU0FrQ
	YRQBPrQVqpFu9aSi9DyW5tUbztYvOoewv0+Fx/VeogORqseZnMyEvAf56Ph0lyyFNAM7A4iwJ/yAW
	ot3e9aER8agYhmTAE5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taUlu-00000009ZHe-1HVb;
	Wed, 22 Jan 2025 07:03:30 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taUid-00000009YoJ-05WN
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jan 2025 07:00:08 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ee74291415so8811397a91.3
        for <linux-mtd@lists.infradead.org>; Tue, 21 Jan 2025 23:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737529206; x=1738134006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orKgfn/62hgyXHtKpMULf6DcLHIRTW29nQEWatsda+s=;
        b=R99XfHKUr3jbHj1vfRf46BHo9OLe3x/uXVJ+RTcd134/+dGehlY0eJ4Q4z6fuSRCuP
         ytFXDmd1joNhg+yAqzMnRAWewBojHb+xBIxEEm5nenEtZ6PH2EiJ4hUmD99rqgswriRf
         taQrL10MYIN6I5TfV56UNqRn5isIrjaIqBryNHkech0JapLlG4tr3Vdqj997u/XQ+CoJ
         w4q5KZm4jiRHuldAksfeBLkGWphx0AWGga4GR5xlXEMKRN4NcXIp2gprSAb6RG3Dudat
         qockKLZDS19oBiN/0QCgYTOn1ru/ZywYs0jIOsYcvfgYlNOiro7c9BHBBuhJBPRX/Hsy
         mg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737529206; x=1738134006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orKgfn/62hgyXHtKpMULf6DcLHIRTW29nQEWatsda+s=;
        b=LFjHzcQJ3eeYF7kLMtch64mIm5jEJQUPS6Y3u7DGaRzSDE2UZ2Gh1kuNiXC+Kl+SJG
         chBHll0+fzhc68Jw4knx+hzsxMGivBDN08LPOa6q83wny1D00OOL5kAWv2v3b62oJcwB
         kXeIrXPPPWVJ0syujerDDDfbjCZYkzhknTqiDKJ7mX+vbt2fq+WzVI+gPaq7tDND+t0d
         HXNPg5IrChjIFtfRh8dt5m0YpjNJsS9h36EBAw9rG4IGu4g9khen1xli7sduE8g7hM8Y
         Sa38rwaMLK1UhwutAnu5kuLOH1hWK7QBnd1ni8HcnywF+RK1oyntoRgLiDsH+J6rU3+z
         Pn7A==
X-Forwarded-Encrypted: i=1; AJvYcCUtn2SIOUmQS1OsntzNUQEKCNzjBxDAL0WlISfJYBBTzNPW7vo4TMWxebIdCoIUpB3GEu+DqrBo5iA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEkEBFUv+PWTl5M2TWmFigV2WBk+ZNhgb3cxxU7AJ+c3+Qzy51
	yBFFlAR2heP9r7R6pj9fQOHK09YN07E9/92qEe51cp9P2FxMNfUpF3YUOA==
X-Gm-Gg: ASbGncvie1OdML5e/2cmy5YPIJdynAWQjXWtb4HpOTU2W2WCwOE81aR+Jvc+ZFHWvXZ
	SgZKBPLlcxLdhdk0CA9YNY0x+0xUA+GUKGc0N/7SvXoMnzDs9YThNqxDx3A4HHZnhPE66Gk6r2g
	1cCsXvOh0WDDkguwGjCztR1RCtntEdz/j/6lggNFC/p81qZ6N+Hrur0BDrhpNi0ju7LxRZEQ828
	UG1wrsSCY7UWNRgtFOTmZ/ZpbOaVyPMsDiE3NHFYUeQVsVT09iU6+IVm3hmfV22FME1Tym8aCtw
	CycSFWXFx6H0BW2rnQ==
X-Google-Smtp-Source: AGHT+IF3j9wNjx/QmXnK6y25+vqbk9nxjFMXAMQM7bsucb9ST55Vtw+XzXdPQUNXlrlJ+UJpiJl2MQ==
X-Received: by 2002:a05:6a00:1c84:b0:72a:9e3c:920d with SMTP id d2e1a72fcca58-72dafbe6a98mr25796238b3a.22.1737529204462;
        Tue, 21 Jan 2025 23:00:04 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8d7csm10499480b3a.101.2025.01.21.23.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 23:00:04 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 529848086D;
	Wed, 22 Jan 2025 15:11:07 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v3 1/2] mtd: spi-nand: Add read retry support
Date: Wed, 22 Jan 2025 14:56:04 +0800
Message-Id: <20250122065605.285145-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122065605.285145-1-linchengming884@gmail.com>
References: <20250122065605.285145-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_230007_066055_5255867F 
X-CRM114-Status: GOOD (  22.24  )
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
 include/linux/mtd/spinand.h | 14 ++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 4d76f9f71a0e..3f72d94c09f3 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -671,11 +671,15 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
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
