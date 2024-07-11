Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C3DC3DA41
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 08:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mYcv28INCh3X3ikRBicZ9sh97TmwkJu39uiT+S64XPs=; b=vn2iIocK71XUMJ
	KkQOJOl1W5xSGU06o5iGERn1h7v15chCPV5Zc7Z/nSI1t3l4EYD4IjFZc2ZOKctHz6eJoJxKudGX8
	1zYHkVD7S1cBBr1KT67DIKLikXYfnq3m6QY7unt5VQkczvEpLEGeUmE7C76Lwow1O/iMhSKDrIIEK
	M3VHGt6uhVxqRRI55JL0AOEaGi7rwe3mlr2cmL8xE7Amjv6HisOO+fIM+zP6UXbtaVl5GMqJI953H
	EPPe4r5eORo+8K7APtsZ/j1KtZtn/tWpw/KJYCUIcCWhDSbgQq8Xz3lQuSq/3Om8jZrtdW3Eb6ZkS
	3QZ770QKHmJ65oEOWJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpIf-0000000DDlZ-2fSk;
	Thu, 11 Jul 2024 08:37:13 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpIc-0000000DDkT-2phB
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jul 2024 08:37:12 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-70b0013cf33so590710b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2024 01:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720687029; x=1721291829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=atTBjk9wptxxVtf7Y3tfuR/uu7YgNKVETKoQtx0qD6Y=;
        b=Us1UbuVGHHlo9ZPXY8kIYXucdG8zl8aBv9YP2xAjV2HJqYurCXYGGIyZkAwsNVo5LH
         atKjr3amEgLpOT5S3N8CzUj7a+2sjNnGEGyvm9PI5F0BPOBStRP8BtkehvCpfygoTAxR
         Q+3kXv5POr2VlUDYxgfHc6iiwUeXNEPc1Qt/i+V3/y26Cp1wDijhAhzlV/4xm0dWlr3Q
         N7yTD1PZbzLb+QA5w4q147GLGXKsI4Eo+vpJybqspfdXzf6AnQqEF76P/4RnerlO13dl
         f6T65PU2QX9LL6fpcnaHKF6yp9Y/iQO1854BcQuuIjwdfxQTfe/myKyUtOQ4WbdYjTDq
         6pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720687029; x=1721291829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atTBjk9wptxxVtf7Y3tfuR/uu7YgNKVETKoQtx0qD6Y=;
        b=cnyHqr1IyrTii8rImhXQV8RacR0nkB36l7B7nLqtD7dBP4qsTWzulmlK6UwR1vV/5I
         ZeqO2w1A/KGSBXPzlEyM+z/cAxNALWgsmbUqrQdiOlTpDQxMBFsk7ZnomP4LYg6u6nRm
         RivrlMjAIU964YfJCRM9UyH451xMFnaCuxbNAV+CrHnR+8ap9+1A3lSFLk8xgAf5lkZ3
         Pxw1dUJIXBGvjSKbFJnpp/P9ulW+VZkoNcrAuWkuKQXxKOGanTLIQNcjoa5aF55z/Sas
         5cDJaF901lTCYyT6JtPBEruyfSqyMSAYvGLefOLRvIj3hME2Mldl/hW4xyzrSCDCnqrN
         GsGA==
X-Forwarded-Encrypted: i=1; AJvYcCVZfspU58dG7nYaRhURRXYTmpCegH2cgRORJ4mUfhwPGvLDv70L6TO37attP43El2QA0QWepMzbCN466TQvzNkEO8YJTu22WWCoCLDRtg==
X-Gm-Message-State: AOJu0YxWpHHp62/N4cjMBd39HkJWtSZvQs0YsDaxlquJiulobvEkHuwz
	F3X8Bfe3QeSOBJl9zdmISUIEhW7Y3dnAqpT6AQtHyjNuKTxK8PUFXamCFw==
X-Google-Smtp-Source: AGHT+IFigDR87HJX5Kkn2JMv3ufTLyQ4WVF4QUdRKgricWGF9fAUSAIYjx5H538G8KVh9siAZ6puwg==
X-Received: by 2002:a05:6a20:729a:b0:1c0:f323:1bd8 with SMTP id adf61e73a8af0-1c29820667cmr8967595637.7.1720687028971;
        Thu, 11 Jul 2024 01:37:08 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad3837sm45535835ad.300.2024.07.11.01.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:37:08 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 913E3805EE;
	Thu, 11 Jul 2024 16:46:31 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] mtd: spinand: macronix: Fixed warning: Function paramteter or member not described
Date: Thu, 11 Jul 2024 16:36:11 +0800
Message-Id: <20240711083611.364431-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_013710_740295_2F18684C 
X-CRM114-Status: GOOD (  10.49  )
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

Fixed the warnings: Function paramteter or member 'xxx' not described

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407110520.pbPnrOlM-lkp@intel.com/
Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index c61f1ba31f0c..ea956933e8a1 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -101,12 +101,16 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
 }
 
 /**
+ * write_Plane_Select_bit_in_cadd - Write Plane Select bit to the column address
+ * @spinand: SPI NAND device
+ * @req: NAND I/O request object
+ * @column: the column address
+ *
  * Macronix serial NAND flash with a two-plane structure
- * should insert Plane Select bit to the column address
+ * should insert Plane Select bit into the column address
  * during the write_to_cache operation.
- * Additionally, MX35{U,F}2G14AC also need to insert Plane
- * Select bit to the column address during the read_from_cache
- * operation.
+ *
+ * Return: the column address after insertion of Plane Select bit
  */
 static unsigned int write_Plane_Select_bit_in_cadd(struct spinand_device *spinand,
 			const struct nand_page_io_req *req, unsigned int column)
@@ -116,6 +120,17 @@ static unsigned int write_Plane_Select_bit_in_cadd(struct spinand_device *spinan
 	return column | (req->pos.plane << fls(nanddev_page_size(nand)));
 }
 
+/**
+ * read_Plane_Select_bit_in_cadd - Write Plane Select bit to the column address
+ * @spinand: SPI NAND device
+ * @req: NAND I/O request object
+ * @column: the column address
+ *
+ * MX35{U,F}2G14AC also need to insert Plane Select bit
+ * into the column address during the read_from_cache operation.
+ *
+ * Return: the column address after insertion of Plane Select bit
+ */
 static u16 read_Plane_Select_bit_in_cadd(struct spinand_device *spinand,
 			const struct nand_page_io_req *req, u16 column)
 {

base-commit: 6000ef48e571f49a636b0c51494c1326ff9b7736
prerequisite-patch-id: 5cea93c94f6237a2f8f51397ba76187952ef45b2
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
