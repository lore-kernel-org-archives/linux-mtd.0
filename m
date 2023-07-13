Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD92EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUQkAN1aSbLCG6cTXegr9L6N+0APL+C0u8S1zKKbWNo=; b=lKU6pznOHbwncm
	VjVS8AGWBMxAVfU4fmNZqD180g0GmDjNjq9CC5o73GEXNVVUBViNEd+wS4AHXYaQ2oUTuJAchiOHP
	m5VHLpJbs7yFBLww9oyEZqvqy+D8lhOM0jFjo4Mm+KpQl7JHMlEI99nve2AtOe1pCpaZOJJ0bj7Ij
	K4DkgwgW/5JC6DPJmoxyaHa7xMcNMLaQWrJ6XjDDTq+uIvlacKX5z7QLsgQbVWCPmdiqZqfsao7UC
	KK2ZTubG6dtQay3ypf/RMGQ1oZuGhgy0f8bWREvpX2QljrIMi1/+GskUgV3z/7IXNs62m/bU8ibrg
	HHU5Cj7Bl2TYTB8jrZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtut-002zBu-0M;
	Thu, 13 Jul 2023 10:51:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtuq-002zA8-2L
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 10:51:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso4753185e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2023 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689245478; x=1691837478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqLSAA90T4El4unSy+rJmwFQHhLKA9BpcFb7p3wUGvY=;
        b=JEfMncqtwwe26DnHVkX1dxHxJJ12+3EwB0aAbDR+lYB4zZRUkDaYUWbxoSfgvrGiPX
         jvKVcey3vr2VkI+YmQo3eunzvC92LS6cxq/bsE0fhffjjaAi91cqABxrkgyPnZfhZTK7
         vN/VstncmJ3RYaOYrzWxXp+1eIUREFTBVYc7cYysqZTQrFvBRpdO37zN1wEbtkPgWvza
         Xn3v6Xk0fUiyQSc6XTx4luJQk4HKr1lEgaeiJxbdeLtHw9oGWP8Dzs/vLNZIR3PcNjAe
         V4PspmlGjDORGjN+fHPYpJJRG2MX3puqDmRsxRUVxcq+aFeTsPT/tNvpjQTRTVTUEqLh
         4RpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689245478; x=1691837478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqLSAA90T4El4unSy+rJmwFQHhLKA9BpcFb7p3wUGvY=;
        b=eP/UJIDAEsL3fhGsqziLjPn1erDv2QSVRoegAS1ZTfY0SwTfiH0SwxKt0lGF5l/N7N
         dqmNa/7EWMfuK67nro+hwALOb/D7u+k0QLElL/1RXoHLAr8HQVu9Vf9ldBOt3SI31HNP
         2+QWFys0rgzc/3KKED+Ti/25eRtCgaDpfZ0FSlQxkGkVMBjqYaAdH4yoyVBge8rEvpdn
         PGraN6tibEOsT2b7y6emY7/A2uOSIQbtF7cr5XK3vxKXgeBmS4rVDk+wR0m5cMA2aVp4
         Cbm2HeO6wIw/kz/P4dF/miIrKZ/9JBNmP6JZ+zwPNTTbfJ1CS/WJRlnfuehnVsTMjqNZ
         0fNQ==
X-Gm-Message-State: ABy/qLb99QtKamYGi1ShrcsMOQy1zISnKadeYLzUZlfkF6FaOgFmkl7m
	k7G/jsGF2y0jYihr9tLbofg=
X-Google-Smtp-Source: APBJJlGCTHX5cFrI5ipzwor7r2FmMuKBGxdLymMvxYKgUguKV7VniLuAR9lWeM4Ff21IcvFoPcl9Jw==
X-Received: by 2002:a05:600c:2346:b0:3fb:e189:3532 with SMTP id 6-20020a05600c234600b003fbe1893532mr1063465wmq.20.1689245478425;
        Thu, 13 Jul 2023 03:51:18 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id x8-20020a05600c2a4800b003f9bd9e3226sm7497380wme.7.2023.07.13.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 03:51:17 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id D8210818EE;
	Thu, 13 Jul 2023 18:50:40 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v1 2/3] mtd: spi-nor: Add features support by parse sfdp
Date: Thu, 13 Jul 2023 18:50:57 +0800
Message-Id: <20230713105058.101321-3-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230713105058.101321-1-jaimeliao.tw@gmail.com>
References: <20230713105058.101321-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_035120_762753_36DEE569 
X-CRM114-Status: GOOD (  11.40  )
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

From: JaimeLiao <jaimeliao.tw@gmail.com>

Add SECT_4K, DUAL_READ, QUAD_READ, OCTAL_DTR_READ feature
checking by parsing sfdp tables.

Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/spi-nor/sfdp.c | 25 +++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index b3b11dfed789..cff3e9d6d061 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -463,6 +463,24 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	/* Fix endianness of the BFPT DWORDs. */
 	le32_to_cpu_array(bfpt.dwords, BFPT_DWORD_MAX);
 
+	/* Checking Sector Size 4K */
+	switch (bfpt.dwords[SFDP_DWORD(1)] & BFPT_DWORD1_SECT_SIZE_MASK ) {
+	case BFPT_DWORD1_SUPPORT_SECT_4K:
+		nor->flags |= SNOR_F_SECT_4K;
+	default:
+		break;
+	}
+
+	/* Checking 1-1-2 Fast Read */
+	if (bfpt.dwords[SFDP_DWORD(1)] & BFPT_DWORD1_FAST_READ_1_1_2) {
+		nor->flags |= SNOR_F_DUAL_READ;
+	}
+
+	/* Checking 1-1-4 Fast Read */
+	if (bfpt.dwords[SFDP_DWORD(1)] & BFPT_DWORD1_FAST_READ_1_1_4) {
+		nor->flags |= SNOR_F_QUAD_READ;
+	}
+
 	/* Number of address bytes. */
 	switch (bfpt.dwords[SFDP_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
 	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
@@ -1218,6 +1236,7 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 }
 
 #define SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE		BIT(31)
+#define SCCR_DWORD22_OCTAL_DTR_MODE			BIT(23)
 
 /**
  * spi_nor_parse_sccr() - Parse the Status, Control and Configuration Register
@@ -1264,6 +1283,12 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 		      dwords[SFDP_DWORD(22)]))
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 
+	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_MODE,
+		      dwords[SFDP_DWORD(22)])) {
+		nor->flags |= SNOR_F_OCTAL_DTR_READ;
+		nor->flags |= SNOR_F_OCTAL_DTR_PP;
+	}
+
 out:
 	kfree(dwords);
 	return ret;
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index 6eb99e1cdd61..84a98e3f8710 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -31,6 +31,8 @@ struct sfdp_bfpt {
 #define BFPT_DWORD_MAX_JESD216B			16
 
 /* 1st DWORD. */
+#define BFPT_DWORD1_SECT_SIZE_MASK		GENMASK(1, 0)
+#define BFPT_DWORD1_SUPPORT_SECT_4K		(0x1UL << 0)
 #define BFPT_DWORD1_FAST_READ_1_1_2		BIT(16)
 #define BFPT_DWORD1_ADDRESS_BYTES_MASK		GENMASK(18, 17)
 #define BFPT_DWORD1_ADDRESS_BYTES_3_ONLY	(0x0UL << 17)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
