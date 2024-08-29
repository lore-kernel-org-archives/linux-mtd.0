Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3226DC7115E
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2024 03:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SnN6o/GKgJpYH5dBvpmzPFxWdBRXsafbtgK9eor8y5w=; b=uN4erkXgMnVoZC
	cPyGNvK7cn/s4xpSaERAWFZqD3x0U8Zl2iDX5mYugHVOHtVuNJSFPiRDPVSmpMopDNVDRiHTfH4l8
	YGq4wX/5dKM/T9c417U2/KM2AT+5N6b6yw2FSftSDFw6yD4b3HQuM4xyTgBeI72zj7kyab0YqRnVA
	oYGwkc6nTNQWkX/BmSpmU0Lbx3g5zPzWbyXIbp3ekIbvRO8FiRYI+WBEWvg0Ay18y1u3Xajf2NTMn
	C35D8+AQfLZNTnEMy+qdlriyXQdFG8SNBZXc8THR6AZoaMFXfspmDtr0+pBJhQAaoRY0aSxolAJnB
	zFxWNOnJCKeZuhZJMz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjVpS-00000000M59-1Nxj;
	Thu, 29 Aug 2024 03:28:10 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjVov-00000000LlG-1pWh
	for linux-mtd@lists.infradead.org;
	Thu, 29 Aug 2024 03:27:38 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2d3ce556df9so137838a91.0
        for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2024 20:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724902056; x=1725506856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd0jWR3VXJxuNlLXtqGwbme+uoTJ0s2xTOcRj568YVg=;
        b=Sr5lnRO1hvE847knOp9WzBGhzn3yf29GRK68Gapl62bbAaQdZpkZxD790PSt0xLoqU
         GEzA8lPy5EypdRI2aiC71Vqbcrw3KvVLIJEhUJuYQv3ICw7lioMh4OyIYueqX2XkmAVs
         aG2HB4QmDWV1O0ZkDZZnUEr8LyFKsdiaN6JULsyFDN10jOxz/ea0w3+h2EyDTrMr3V9E
         QeP96TN+fQHR5VMXtJwA/5XwlMNV0byU/GL42nV1tTX9pkHCAYLGAgKgD1FAfY3LY3gJ
         /Kke3/urkT+RO83geLSV+R3WenV2GOzNaK3HRO/afEsxpyi0OnuJVmGhArx/4qsxXqxj
         aefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724902056; x=1725506856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yd0jWR3VXJxuNlLXtqGwbme+uoTJ0s2xTOcRj568YVg=;
        b=O+vlYZ4lEcVt5vbXGnqoOx+rVoFlTfbD9j3nbSnOYfQbrF2lMmvu7MRd1VnD5H7Gxu
         rVwOitNRxRVQ5dF0zpgFBbBrnp4RBfzjrL1yCViT0B9zy2lYtpMUfQeaIOB6VmKS6dnc
         /FocfhfUfuvY2xZqKZzURdPazWcy2l0FzUeIt04OEp5cqiAUODSq9AX3LXFPwwa8XeEg
         MsMRf3WfFNRXVyn5aab6clt+ESsA+35uHkzjV+yec5fg8GaOYQCKs3YVro0PMJuqEesf
         x4Vtnq6000MFAHlaG/nL6lhxxhLTBtem/qwTsqLqtpe73RTx4i/vB0rK4lcZ0+SVv93b
         YdsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiG4yTqfI/DchnJVTfBjehDsRtvs20/wchpdFioVRIpWzr1q528UrgEZzf8BR0ipMQIdsRsrJ3Qcw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBEfDqVgBBDdzFwQoLGhubecfPoNHWnhVpG3AOVM4To0/+z52Z
	tUmzHrqPhOdHJdJ/oNmXQZYMnL0xgYlwAeF277tQVylO/0Eyelyy
X-Google-Smtp-Source: AGHT+IG9vzMS34n3yQrqIZe1bl+5NJqDWVg/BsUpiS9mu0yGMFa3eQDSdfkFbu1or+R3IOgWVhw3KA==
X-Received: by 2002:a17:90b:2652:b0:2ca:2c4b:476 with SMTP id 98e67ed59e1d1-2d85619d40bmr1665311a91.10.1724902056294;
        Wed, 28 Aug 2024 20:27:36 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445d8afdsm2810877a91.2.2024.08.28.20.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 20:27:35 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id B3207806A6;
	Thu, 29 Aug 2024 11:36:11 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v4 1/2] mtd: spinand: Add support for the flag
Date: Thu, 29 Aug 2024 11:25:16 +0800
Message-Id: <20240829032517.1517198-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829032517.1517198-1-linchengming884@gmail.com>
References: <20240829032517.1517198-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_202737_503978_0E754521 
X-CRM114-Status: GOOD (  11.28  )
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

Add two flags for inserting the Plane Select bit into the column
address during the write_to_cache and the read_from_cache operation.

Add the SPINAND_HAS_PP_PLANE_SELECT_BIT flag for serial NAND flash
that require inserting the Plane Select bit into the column address
during the write_to_cache operation.

Add the SPINAND_HAS_READ_PLANE_SELECT_BIT flag for serial NAND flash
that require inserting the Plane Select bit into the column address
during the read_from_cache operation.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 6 ++++++
 include/linux/mtd/spinand.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index e0b6715e5dfe..49f2d66c3a9c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -386,6 +386,9 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 	else
 		rdesc = spinand->dirmaps[req->pos.plane].rdesc_ecc;
 
+	if (spinand->flags & SPINAND_HAS_READ_PLANE_SELECT_BIT)
+		column |= req->pos.plane << fls(nanddev_page_size(nand));
+
 	while (nbytes) {
 		ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
 		if (ret < 0)
@@ -460,6 +463,9 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 	else
 		wdesc = spinand->dirmaps[req->pos.plane].wdesc_ecc;
 
+	if (spinand->flags & SPINAND_HAS_PP_PLANE_SELECT_BIT)
+		column |= req->pos.plane << fls(nanddev_page_size(nand));
+
 	while (nbytes) {
 		ret = spi_mem_dirmap_write(wdesc, column, nbytes, buf);
 		if (ret < 0)
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5c19ead60499..cec451e7c71c 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -312,6 +312,8 @@ struct spinand_ecc_info {
 
 #define SPINAND_HAS_QE_BIT		BIT(0)
 #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
+#define SPINAND_HAS_PP_PLANE_SELECT_BIT		BIT(2)
+#define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
