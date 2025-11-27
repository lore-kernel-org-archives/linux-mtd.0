Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5166CFD2F6
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Nov 2025 19:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=odyHl49Y5OvEJAgKL5JhtH4Jek1Od8pSedSiPeEg8tA=; b=bi8QJrKpb6LRYD
	vEqDM1doUuS4fOkrNH5373aWu+w1r809E9bUuF97g89PD+TP1w0FI4kC3cGtNNyhNHsfBa7gD0YxM
	c9ZQ4J5ZsASDw6AbSRPewmGTwxWs8lWzhxY1mY3inSI2zQQB3Xxdh7/phuGNLFg6dQwzyENolm1Qy
	EoFroWUW4W6lB6G7xUPffoJUf1UAJIsfFD7Jur729wpmwhDa4oLY3L91GB4wWlZE7x/sQAOkX0TC2
	N1NmLnWg4nehOASSHW1HnI7TI8Q58FRPNdOC0PJ7zIJlMf2cDJhdUKIwDNxpwKKGC70gcj8OeaseF
	3c06oWaRrMkjK3kpUdjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOi9S-0000000HAkn-0nke;
	Thu, 27 Nov 2025 19:59:38 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOi9P-0000000HAjm-2RFf
	for linux-mtd@lists.infradead.org;
	Thu, 27 Nov 2025 19:59:37 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-37b9879f5e2so2343211fa.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Nov 2025 11:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764273573; x=1764878373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBL0OLiRvOy+2BpJaN3HpSOOdnUWxf+kwsaabH1QSOE=;
        b=Ek/x/bdTr/UZrEeXzJfraLhtvq1+GYvgWKdBG1NfAHcpEblSLOGp+ZUTLZbxnPJcOk
         JnZpsTvitpwu3h8uDRo89WUZi+yWj5y9GwLTcJkBITNn5Qkpwu06mXfEAJWrz3a01rlT
         TNTzDYTBxOzUuvibsWtSSb+LZTBPTOWYpWqIu/gTBKMDWmq+0Cu11cmU9hx3tX52bI6B
         yto4SQmWQmuWQpAzGLPAQToxSEI71T8jD6BFmondHE9UUMpPGnHtPsWsCefTwg0goD07
         TIEsnCvZ8vUaQiuIGd/7xFyQdk6jIm6UzO0aV6X8gALTEFT+jptXaI0HBj7W3OcgczzR
         60Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764273573; x=1764878373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBL0OLiRvOy+2BpJaN3HpSOOdnUWxf+kwsaabH1QSOE=;
        b=DWYFeI3sJIBLPUk2tvCVVu8+8LwWco+JLkKEAVgaeUsZqKI1onY6Cng5y0KgR5JIbB
         sjOEyWiN0QR/jOFlVgOzi0/6A1o8T/0zSX1t7vKNohSt93omiMEG5hrNduIRbZeP39/f
         w/HhLiMGepsKqMbfivaJm02RQa6NfbHSy4F5wAEqcwtyK4cdou0LYYbemQ8bjHll0A7R
         +BMShQ73yao94iaigGPQa5YFrOKPO+HWoh4XuT5aSEbta6niQ9mHVV4w+0ogvkW5l7m1
         2CNnokZ2wfay7J/N0pxytaBDVmhlRpOC43YGNi1nq99IGBKqFpC/qYPF6HovcVRI40pF
         Rz0g==
X-Forwarded-Encrypted: i=1; AJvYcCV3fYXdibRCtCpT3vFHb69lVsKOPcLrnEOORdm4O0BE9JJb76pAIiUv/mu3/cjTMXYrUdueb66fZ9w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3gBVumBUQCzih9I5RdsyaNKajlrJgIvDJrHWBSPBhsxOJfevg
	L6Jf9MrKpj7VMsj0j2GghU2xmQWLon9Ds26bSnQDaREx40CTGocei6kY
X-Gm-Gg: ASbGnctOj1q5fQGD+Niv4y0ikJuKs/oIJFQj8YBPHp48acZvxyFlAonZvDciH7swFMe
	78tYBOV3FQe9P84oWH/ZjQviD+r0+4cspKgiRJMSHqS3+jYr43fSMGxe7Uh6DFvuLODLEZXow3c
	t3WpjLENe1x3dx3WfBqCgVGFygzlg77P9xe45COK4HfzlD1ff4FevUXvbn5PvDveGloWVTxbgEz
	ZQlwlMGyqygnK3UxdlZUQ6R68wK4DUfcv4KAqB0Ew+nv3vAEnjFKYy6RvsYdy40Kt39Xpzvgi1x
	DmtGlq1HcrC70KQ6g/+lH4QFSWfMDjcU7lV5vW94X3BfpHwHvm+12M7g0Buk036PvjLBOlJ0+oD
	GTpJMjdmFeomoqkUk1sRDdv1ZYD0eozPfPVpB5UMaSEnIRFsRvHnMFak9rMSQa9DMk+0T0qHC7D
	4lO+wISg9doywA6eMIroqIdw==
X-Google-Smtp-Source: AGHT+IGe9iNDDYMZJ98ditRBL3ZHvUepuL6pZwenkzZTL2HMWvvHwT4yZRX6OzgYSzxEorsHxkqVGA==
X-Received: by 2002:a2e:2284:0:b0:37a:9595:a77a with SMTP id 38308e7fff4ca-37cdc38bd0bmr29811421fa.5.1764273572996;
        Thu, 27 Nov 2025 11:59:32 -0800 (PST)
Received: from OpenwrtBuild.lan ([178.207.14.215])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d24102440sm5610761fa.41.2025.11.27.11.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 11:59:32 -0800 (PST)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mark Brown <broonie@kernel.org>
Cc: Mikhail Zhilkin <csharper2005@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spinand: add support for FudanMicro FM25S01BI3
Date: Thu, 27 Nov 2025 22:59:00 +0300
Message-Id: <20251127195900.2562-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_115935_660946_62096FBA 
X-CRM114-Status: GOOD (  13.39  )
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

Add support for FudanMicro FM25S01BI3 SPI NAND.

Link: https://www.fmsh.com/nvm/FM25S01BI3_ds_eng.pdf

Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
---

Changes in v2:
- Rebase with nand/next

---
 drivers/mtd/nand/spi/fmsh.c | 72 +++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mtd/nand/spi/fmsh.c b/drivers/mtd/nand/spi/fmsh.c
index 8b2097bfc771..43689b91dc28 100644
--- a/drivers/mtd/nand/spi/fmsh.c
+++ b/drivers/mtd/nand/spi/fmsh.c
@@ -9,6 +9,13 @@
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
 
+#define FM25S01BI3_STATUS_ECC_MASK		(7 << 4)
+	#define FM25S01BI3_STATUS_ECC_NO_BITFLIPS	(0 << 4)
+	#define FM25S01BI3_STATUS_ECC_1_3_BITFLIPS	(1 << 4)
+	#define FM25S01BI3_STATUS_ECC_UNCOR_ERROR	(2 << 4)
+	#define FM25S01BI3_STATUS_ECC_4_6_BITFLIPS	(3 << 4)
+	#define FM25S01BI3_STATUS_ECC_7_8_BITFLIPS	(5 << 4)
+
 #define SPINAND_MFR_FMSH		0xA1
 
 static SPINAND_OP_VARIANTS(read_cache_variants,
@@ -45,11 +52,66 @@ static int fm25s01a_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static int fm25s01bi3_ecc_get_status(struct spinand_device *spinand,
+				     u8 status)
+{
+	switch (status & FM25S01BI3_STATUS_ECC_MASK) {
+	case FM25S01BI3_STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case FM25S01BI3_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	case FM25S01BI3_STATUS_ECC_1_3_BITFLIPS:
+		return 3;
+
+	case FM25S01BI3_STATUS_ECC_4_6_BITFLIPS:
+		return 6;
+
+	case FM25S01BI3_STATUS_ECC_7_8_BITFLIPS:
+		return 8;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int fm25s01bi3_ooblayout_ecc(struct mtd_info *mtd, int section,
+				    struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = 64;
+	region->length = 64;
+
+	return 0;
+}
+
+static int fm25s01bi3_ooblayout_free(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 4;
+	region->length = 12;
+
+	return 0;
+}
+
 static const struct mtd_ooblayout_ops fm25s01a_ooblayout = {
 	.ecc = fm25s01a_ooblayout_ecc,
 	.free = fm25s01a_ooblayout_free,
 };
 
+static const struct mtd_ooblayout_ops fm25s01bi3_ooblayout = {
+	.ecc = fm25s01bi3_ooblayout_ecc,
+	.free = fm25s01bi3_ooblayout_free,
+};
+
 static const struct spinand_info fmsh_spinand_table[] = {
 	SPINAND_INFO("FM25S01A",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE4),
@@ -60,6 +122,16 @@ static const struct spinand_info fmsh_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&fm25s01a_ooblayout, NULL)),
+	SPINAND_INFO("FM25S01BI3",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xd4),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&fm25s01bi3_ooblayout,
+				      fm25s01bi3_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops fmsh_spinand_manuf_ops = {
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
