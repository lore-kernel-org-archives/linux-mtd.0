Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE44C021AA
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 09:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UTTKsczulgfs1S7hcGrXmyqAL8eNt0OLUNicpHvdbw=; b=BHn9IjYoh1gurI
	nendPmIUSb/G+T5O7S9LmjtBVGuI5Y7lO3onbtbi6GeddTEV9Faut8bDnAOla9NTFYi/iSqRAtSF9
	9bEbDw1ZESXZIajbPI0/dTLHljyBC5eFiSCq3sBZUkTV3jhahCgx2yo/ESgwNpr3LhC1qQD5J1n1/
	G0JFIfBRQOlbeFnMMt58QGyDF97858WenbyA+zW3VXDWJldoZ8XB+8zLsnSVaKphiGBNBJQxeb0hp
	nsNddKF2EB8n41pdR3IaQTLOqHxrCMJtey0iuLmI3yxksjxuPtmZTLYGu6RhR3PMFua1e7Se4zaVf
	LGQbasLBkRksBw3wF+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPhl-000000051Ow-1e6S;
	Fri, 21 Feb 2025 09:52:21 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPTa-00000004xmr-1Hdt
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 09:37:43 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fc291f7ddbso3061053a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 21 Feb 2025 01:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740130661; x=1740735461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uTXc5mDGcxofMRZcNXDa/UBr6/on046eyKp8zh2sgQ=;
        b=IIJRFL1ftHVuJ0Ce9Fg1sYKEeqQNYDH5AJcZ3UIIvUR40ikgOVOot3tgcQqmdBCRzL
         Vqynk7OP1BGoRacG+wlB3Rnfd8Ftf1VOabzf+3TnXqa9hJHHF/hhfQRPFbTfib1YYrdx
         RI92fObGuFy39bjgs3ueEq7NhuQNRnYfBecUpnn9NmMf1vBOR8xwGlPwZ/J1lilJIUuo
         p3b+xDAoei3IHbLFxUihF2FwlYor2cu8oLavLRyogFHaUXctfwQTlxHrhvBLnud6+img
         7n/nqavafm9AbDTQ0MRk0CkYCoMMrgGvBx/QQxGtBIjQPIfo+2Ge+2BUQgfdnbj1BhpD
         wR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740130661; x=1740735461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uTXc5mDGcxofMRZcNXDa/UBr6/on046eyKp8zh2sgQ=;
        b=pFztC6ikM9/KcCI2kYTwI0HvjjuM0J3chqw6KIet+QL/cX5WL1T7u5dZINvJp+h6B+
         OCHHlPhVHfscDZldv7Q1TBnVWlHkCdLqhozTlxN7fZA9Rn8DSyGjz40r4fo3khcNEF8d
         WzXuxVfwEf/R2pjEGn8ok0b/yE3nNCG1K5cYlpASe8T4LRt77uduwJJuLiN3LarrCn4Z
         d702I+NM3ToVTBKY1R3KDJfSFqp4vzAkNl/C4kwtED5xxQsELNhiINBAvI7Pf/I2olGt
         aI5UtGS/ULAbXF/TEfgH90aQQu7zkTVwyDlCvVmYxn/Xjl2eyBBVvuoLzQE48w0E0Ufn
         igdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtcgNDbn4empSfpbK2ethgtp79bXZr8o+OWhZHz22rj3TpHPPzMpjBQL4ceRTFHV6SXb8fKpLsXhA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxmFMLtWlYCuFWtqHWJ3y5wxeuWRQ96onI7A52Gq2F/+8LvV3u
	lKiBgjMZu78pzTvh5dceoRHcJA600lKnltlVhJeICdYqzDyPuk67UcExTg==
X-Gm-Gg: ASbGncsb88ZaCSCSwnP0dSL91/uQP13l2H8jhw8lqK18sGxRcOt462+YRI+RUpQstYK
	ft272XbP9VuT8z/4+Q8ddOwuuxOPe3VLCU0pE2vB17yycMRBS0jQrqUnSq0psSSF4WxA0kTJ5wJ
	nbMo3KDArGNXkMbHLhInvqVccgOIV4DBF0w0dpMGePDZ462Anl6ZxipDYOsUHwJRqO40csDZIYI
	jAKlHBAM2slRejDYqoe21TKPEEkfyLPGnHqNiP6QWPAbyTNFToffcPoTHNUfzYB6E78l/cUHFRR
	5V+v0kNPeGrrYTXqOQMbYAvKRnihCnotbj0HlfAkVHo6L9oYXg==
X-Google-Smtp-Source: AGHT+IHUPjYb2qe97dUurXhu/69IHL6noHJOVmh7CNoaPDeusUsv3n9W6aIlNXrzZoAP/1F2rTNX6g==
X-Received: by 2002:a17:90b:2b8e:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-2fce78cbe94mr4724202a91.16.1740130661359;
        Fri, 21 Feb 2025 01:37:41 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb088c7dsm976492a91.39.2025.02.21.01.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 01:37:41 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 4FFAA8058E;
	Fri, 21 Feb 2025 17:47:53 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v4 1/2] mtd: spi-nand: Add read retry support
Date: Fri, 21 Feb 2025 17:32:59 +0800
Message-Id: <20250221093300.430994-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221093300.430994-1-linchengming884@gmail.com>
References: <20250221093300.430994-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_013742_353344_11516A86 
X-CRM114-Status: GOOD (  21.65  )
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
index 4d76f9f71a0e..beb40f3619ca 100644
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
