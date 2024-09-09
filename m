Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68481ECE584
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Dt90ySDRnUPPIQK9RAc6qqzxKgoUGVhd5srrYh8re4=; b=ynVQEeNAsJmgX2
	gNFsCkQsO0q9eOQMaWkZZpDo8oh+KvwAsKV7hFbD2k5K7a9A7xoaDFz8NTMEBwWMSOse5KFjk+kSa
	r3Lxy+KOMNgNYiwcwfW7RY7AGoqqaHY2KRsZz5ITCxAJ6NjHnzEnVjM+9/ngBtXmYCYjJlvR4tCH6
	/3cLzJ+ZOp+8bREOt3gmLbWQO8Ld5+ItEll0B3UL/MP7Mk//oAcxKvp9NKYt4hqOSlLmRCD+Eo/JK
	xzVxUBxOhP/APsEMwnqGBJw6N2Q30UU7WavUzIQtVnXx2glJRiCBQfoj/IfGyftB0IBFUtJSKd+v8
	AOsOZzLuRGbst7/V5kXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snahp-00000001JQ3-0QvA;
	Mon, 09 Sep 2024 09:29:09 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snahl-00000001JO6-1EzD
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 09:29:06 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7094641d4e6so1944674a34.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725874144; x=1726478944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOc8UFAAtqggyuAUfUV2vLnHyNxYHiQmTTJ3sFWJppA=;
        b=c6Dec513XmNj+d1LD9MYLVygZjXTJKkIewJVMRcktMrEpXiCfapXgHd2XleD24NYsv
         PEU92d0YP/yIY3SJFMKQF19KM6Nbf7UCRv9/Me1Qy+McGOrxWpNi31TAD/5v40tXE0iT
         fTVS/KpwIJBqE8sUcUR8/3yDeimtYc1DPRCKONBiuHOHW+UJCY9LVzgMGwTbhPs8RoJA
         SPu6DMsteI96HRq7iaRwFCjteXLXMgAxoq5o2lRmNP3/QhWCUtL8bQiz35MlZ3AwEUSC
         X/FaqgO4HSrkMv/xw9+Gk5Z5em8qiwpLPJuSkFMyeKaPm6M/tQJoFaqwXAkUsBx5gnwY
         eImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725874144; x=1726478944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOc8UFAAtqggyuAUfUV2vLnHyNxYHiQmTTJ3sFWJppA=;
        b=qx/FDB9YxWNnfwxhWquEF732k04fo189QsdOXW0Ui9LhQgoYXF50rXMpQBvMTO/E1g
         XmPr1EGbEBViT4AeBjWkezG+FV+n8pHBCU7tjvFP7RSQaUCDVag/BhanV9AE9wj8pJTe
         6YDGkSCYNumBxU1vKlB2FjYY0c2wMgNjZW4IiwJttfuRVPE2jjDwVJZwXyWDmp+f3lLP
         QvJCjQyEPlbRvj4SHMwzGSlXHrV1ZAkqgnOSoXpv317E1g8awXWO+JUzxlEuFo+NDkAj
         LLZvhq3pqzj+/Urwz//uybah0jGTl5RYop6F8AE6z/1awELTDJbOaNYKO5NiPrdMctTY
         O2ew==
X-Forwarded-Encrypted: i=1; AJvYcCU5q6CK5FA1i3FOT/5K0WTGZF/WxytKRPef9P2Cvr7MOasWGoM0SQwIi0uYuTtPdAQzJXTFgR5GW/I=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKFKA231kOxQpS3AVwgIyeeHMn0La7hDY9kENfCnY03LOVTdnp
	x+VoI7E3KKc3IXnhmahyni4CCs00ADzrY3HS+DjAcpui+DFU8jYZ9Cg04w==
X-Google-Smtp-Source: AGHT+IHDKeNhq0uVsmiNCfODSAiBroEAtra1i+qw7maXrJyaPreWE/YkO6JCHXpvdj/Fb6E3wTK3lA==
X-Received: by 2002:a05:6830:4489:b0:703:68e5:725b with SMTP id 46e09a7af769-710cc25e877mr12601623a34.24.1725874144031;
        Mon, 09 Sep 2024 02:29:04 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8255dc167sm3050794a12.71.2024.09.09.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 02:29:03 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id B4F128058E;
	Mon,  9 Sep 2024 17:37:20 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v7 2/2] mtd: spinand: macronix: Flag parts needing explicit plane select
Date: Mon,  9 Sep 2024 17:26:43 +0800
Message-Id: <20240909092643.2434479-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240909092643.2434479-1-linchengming884@gmail.com>
References: <20240909092643.2434479-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_022905_409408_344557CB 
X-CRM114-Status: UNSURE (   8.77  )
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

Macronix serial NAND flash with a two-plane structure requires
insertion of the Plane Select bit into the column address during
the write_to_cache operation.

Additionally, for MX35{U,F}2G14AC and MX35LF2GE4AB, insertion of
the Plane Select bit into the column address is required during
the read_from_cache operation.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 9c0c72b913ed..d277c3220fdc 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -154,7 +154,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT |
+		     SPINAND_HAS_READ_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF2GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x26, 0x03),
@@ -194,7 +196,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
@@ -212,7 +215,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
@@ -251,7 +255,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT |
+		     SPINAND_HAS_READ_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status)),
 	SPINAND_INFO("MX35UF4G24AD",
@@ -261,7 +267,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status)),
 	SPINAND_INFO("MX35UF4G24AD-Z4I8",
@@ -292,7 +299,9 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT |
+		     SPINAND_HAS_READ_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status)),
 	SPINAND_INFO("MX35UF2G24AD",
@@ -302,7 +311,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT |
+		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status)),
 	SPINAND_INFO("MX35UF2G24AD-Z4I8",
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
