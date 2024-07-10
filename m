Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CFAC41513
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 01:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npZJ8NbImitE3ITUgeCG46VK51gaL9mniFbSnG4JKtM=; b=pLnhoAnCg2u273
	GvrJUa5ewYUaJJ9V+6daeoHBRwcZylmpLIsCk9G0bDL88dQHxlFQZai5DT749dGxXS4o/0+8XclJR
	fS6h1hnQMxaDV4668MrUWBliq4FIGSfcX8vhnm3Z9/vP4UuRvA5B03VhyjRH1hhcvzkk7Eo9HCDmf
	m1FS8PPeV25F6YugO6BJFCqyhB8FNPA55gcB+EbFa1eYrcnVEqZno5K/aEIABaZzjk+cafNDOPWvY
	ThRiMu0VNkqXR1GP1J913mKN5/L1ISONAr+8vI1pga510JOdrQXzNRTjZ4dmn+jV8vaFcDUEwON1J
	oofWmjpiN/ZH9ZjES16Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRLxD-000000093Ry-3mBT;
	Wed, 10 Jul 2024 01:17:07 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRLxB-000000093Qv-2MRM
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 01:17:07 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-75c3acf90f0so3251344a12.2
        for <linux-mtd@lists.infradead.org>; Tue, 09 Jul 2024 18:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720574224; x=1721179024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2dsJ2aWzWwaeeiB+7cgn67HIrpaGRIuOZ04+FOm5ts=;
        b=UZzdIzGx3OssCXt9Alv4Tqossvy6rBhSpayUAp/I60dhTdpLxz7PMkQDTLy3GEjPcT
         13G9MtnpmscD57Nb7G4/RYWBhmBDDvDHiNLNJb0yyr1/e/ZHmP3Mlg+70RmSPRbFFh/l
         LqnUr4/HkeYyDWrTGwwa0qLBqKdy07hnSwbTOiORwvlh6/Rgr8iV+jK7LUpST4L1Vmsw
         QzAgTayHqCSC+XTKtrcTQtbPLC1goXqhjmAiYLRdJHKvWf+D3/nYR6YrJ3NEW9sKMI9l
         HV0x/e9ftuf8q2Ti6sbtHbMr7SVKjP6CsZNLCCFE5t30UR3ShvtkK7V0ALxb2YvJkJSA
         lKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720574224; x=1721179024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2dsJ2aWzWwaeeiB+7cgn67HIrpaGRIuOZ04+FOm5ts=;
        b=xEaisFerhIZ2ppW19t1XEZ6McDibOb0DO/tG8++JfTgXblpu5i7FkLgTpVXTA/d+3g
         suQ/otHCPCxrHSzAVA4cIjn2B78WkaYyN+/haKLmEGY4lzXwznYnLYCH/kbNegKMGNCF
         ZbpRqHdMYLhx4ozTSU9VxDkCDxBnoWnJDc78FceIlXwcLVOkk0Q4w/aHl78mZYWu57E7
         uoXAtCNc2K+UxheBtxshXVzhk9taIFDK9waGzyLdMJ/6of2OdhgBtL8fPca3qa3qXFp4
         BCEogA9AdMkPlag9u6T/rHBZZMg0VSsAe3WG3ev28JZiO43EL2GsRNmqfB3k7SYMWq1w
         18JA==
X-Forwarded-Encrypted: i=1; AJvYcCV2iJ0IjOYHTtEjmX0Zr0bONR4fcGCEuHWEnt1ywECzKmmPDbx9bTUqKWgET5elL5Hx4C3E2iOkmsoR+L8IwJgpL3D3ie3pXrKuoC6/og==
X-Gm-Message-State: AOJu0YzM0O3eVJq4dthUejuUFXMQ1JJwQy3HLwEK6OJLmgLv8jsTDhJ+
	meSOgixB82sXAHbotlRrnD/GylkS649rpi+ZuxI1vwjBz3kZFRz5
X-Google-Smtp-Source: AGHT+IHm6oTa46wAfHgqvgABJgg5St2rt8NOqt0qemFHgyPVBzhcmvIccECM4VmefXK8hvUPLjeUqw==
X-Received: by 2002:a05:6a20:7288:b0:1c1:f6f1:de05 with SMTP id adf61e73a8af0-1c298206687mr5241342637.6.1720574223818;
        Tue, 09 Jul 2024 18:17:03 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad4b60sm21960575ad.296.2024.07.09.18.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 18:17:03 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 5D9C480DF0;
	Wed, 10 Jul 2024 09:26:29 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 3/3] mtd: spinand: Insert Plane Select bit for the column address
Date: Wed, 10 Jul 2024 09:15:41 +0800
Message-Id: <20240710011541.342682-4-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240710011541.342682-1-linchengming884@gmail.com>
References: <20240710011541.342682-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_181705_627769_FE6C3342 
X-CRM114-Status: GOOD (  10.34  )
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

In the function spinand_read_from_cache_op and
spinand_write_to_cache_op, add an if statement
to determine whether the device has fixups and
their corresponding functions. If so, give the
Plane Select bit to the column address.

In the function spinand_match_and_init, add
spinand_info in spinand_device for determining
whether Plane Select bit should be inserted.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index e0b6715e5dfe..d6d6f3832f9d 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -386,6 +386,9 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 	else
 		rdesc = spinand->dirmaps[req->pos.plane].rdesc_ecc;
 
+	if (spinand->info->fixups && spinand->info->fixups->read_from_cache)
+		column = spinand->info->fixups->read_from_cache(spinand, req, column);
+
 	while (nbytes) {
 		ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
 		if (ret < 0)
@@ -460,6 +463,9 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 	else
 		wdesc = spinand->dirmaps[req->pos.plane].wdesc_ecc;
 
+	if (spinand->info->fixups && spinand->info->fixups->write_to_cache)
+		column = spinand->info->fixups->write_to_cache(spinand, req, column);
+
 	while (nbytes) {
 		ret = spi_mem_dirmap_write(wdesc, column, nbytes, buf);
 		if (ret < 0)
@@ -1095,6 +1101,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->flags = table[i].flags;
 		spinand->id.len = 1 + table[i].devid.len;
 		spinand->select_target = table[i].select_target;
+		spinand->info = info;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
