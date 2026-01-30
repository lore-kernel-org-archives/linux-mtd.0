Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC71D49C8F
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9r7z9PX/wZxUCBjjvoxgCbL1dHzREUR11WQlKz0zUUM=; b=lvsmJ+L2h5EbpA
	+wTuhfDHnGZPJQxgMjg8y4Rj3MoWGLF3mWVSDnIUdhAa3Jfa6Fw+QR7J6CxPcBO5LUZhMQUL3Yxb2
	kivAkY8JRe2VgrjNMaG50xMTojWESOxpooxGh6r4ep3ZaR/+T3yDs5sy2gbtqIEj1QrV3OnIgrSL9
	L0DAsoo06G+OXizmZwdX4qHY7ETPGHeib7qL1NmFJ5kjjSYdeLMJqpcPCX0MCUqc/nRpS5ObjJhGD
	YHa/K3GQO5O4Hv4ASR0Pj4pNN1O3MAtRnCYELziCBgbhgOPmy+rKWOiioKWYKk2NneJM/xGFYZG0o
	svBX//3TPNiILEvGxrkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlkl4-00000001GP9-0Ex3;
	Fri, 30 Jan 2026 09:25:42 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlkl2-00000001GNv-04rY
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 09:25:41 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c648bc954c6so750819a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 30 Jan 2026 01:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769765139; x=1770369939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvpJFnejTXh/YO8agJdfgwPv43+krClG8TqDCYLuRPA=;
        b=fOIeSLleV53WcMKXzLh5orOFqA7FZrDqv26gTsqSx8vJKMhkWr4/S5MYLnD8iPF94M
         GOFU6dniNztKl0b8go3XGISeka4jNYctkcORGMFifrLPyt6rbjMZl0nkpWO6eqvM3dg+
         mjSfi0xywB9sI/kXEd4WHcTQwceabY9vMRU2tgxedHpuM8fSTs11wdvNK1WcF39dc5oW
         Om37yu17WUFGENiTB/SZMhdDsIhH7h/i+dLA/B0ZPjdgMgxie3+xzQJj4JaBcuJiRIF7
         cRb+jklotf96dHIMxbB/ulMFozeCSWDRLjWXweIdwqdvIlOw8zwbS54pvYmxoW7Mz/0V
         zCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769765139; x=1770369939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KvpJFnejTXh/YO8agJdfgwPv43+krClG8TqDCYLuRPA=;
        b=ig7ItUNHwOiWKrKl9ayb65ccfRqCxzN1Xl6cdfL5ROUUxYvHCq0CMMNgCjUf0day/u
         Q6g5hB7AhqXEHxiUclq6uGWlRCN+t5aW0ptyNLTffsikJFvvRGOvdAAaVQgwMvnpSfb2
         SVK/PQcFHTpoTgtV9q0vSYImKSh8kQTsE3o09NVIFmAxWIJpKHH+NiLrJ1ObU5PlCRW7
         yqR2q6yhRzWVXBxJyiL60j/pLz5ih29LbF3T0vkfIi6ApFXvpoyRrYkdI6pw1MPuUKHY
         AVn2jsSgR2ydC4ul4YanpQ03qOHkLbfUx1Tqo6P3c2E+eXSjA9b/7AzzhdE64fTW2h4P
         cWfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU39gbB6w+IqKyJNdRDhSQB5Ml3ReSFHctVUmQMs/LwStIB/jD0/q6pohMQB5BM13nEqtIq8iBdG0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7tu+RATxAc6VXWtGG725gH49DqA9yUmOxW9+MosyapN3aSxOO
	iVRsUnOtTmkz5xlaNOEi8UiF/zt4aHWbntnB4e5YgAPG69kFmJYmK6ju
X-Gm-Gg: AZuq6aJf2bbba3Lw3vCSC+1stcXAWIw/aIA8IsTSfhuklt5avdPkh0d9YON5Jlu417P
	cE/4vRaiCDSQ0lP+l+BY9fKjEEf+Q6fE7FwjYcWyHgKLjZRZN/ObnLHCKHnLA0OyekP/MLOkK89
	rzF+jkWHvhPF9B2dtOWDR8+YoX5xMfed357/pzn+HQR2/EZjFHpn6VB8OUmqMN624WxpsvGsKmq
	rGmNPogEv0XT0rONuS2XxsYm27WR+w5ZccQQ5i+m+IwroN1t/+AZS1FsHl5pWbYtszoxR6dwxUS
	dzo6ulVmXbZx38D8ZXyZGBlveQKMikCtv+DNzE0SyLhvfbFC/jBi6303anvRinO3pl6UA+ejMrL
	8IEy9+VIxwC90zw4eN6YCY914pfoleHzbf50t16B3qpJo6Bfw+LdIAAKs3bOLLxsOfdq/98wj5S
	CunwLVniPUhE7K9dHJijyOd1BQEtXm6sNolA==
X-Received: by 2002:a05:6a20:4327:b0:38d:f62a:a9e8 with SMTP id adf61e73a8af0-392e00007d9mr1937087637.7.1769765138815;
        Fri, 30 Jan 2026 01:25:38 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c64284689fasm6771372a12.15.2026.01.30.01.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 01:25:38 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 1F46A4136075;
	Fri, 30 Jan 2026 17:25:36 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v3 2/2] mtd: spi-nand: macronix: Enable randomizer support
Date: Fri, 30 Jan 2026 17:23:49 +0800
Message-Id: <20260130092349.621034-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260130092349.621034-1-linchengming884@gmail.com>
References: <20260130092349.621034-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_012540_071856_B161F75B 
X-CRM114-Status: GOOD (  13.74  )
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

Implement the 'set_randomizer' callback for Macronix SPI NAND chips.
This feature is controlled via the "mxic,randomizer-enable" device tree
property.

The randomizer is enabled by setting bit 1 of the Configuration Register
(address 0x10).

This patch adds support for the following chips:
  - MX35LFxG24AD series
  - MX35UFxG24AD series

When the randomizer is enabled, data is scrambled internally during
program operations and automatically descrambled during read operations.
This helps reduce bit errors caused by program disturbance.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 47 ++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index edf63b9996cf..0212d44b1a3f 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -14,6 +14,8 @@
 #define MACRONIX_ECCSR_BF_LAST_PAGE(eccsr) FIELD_GET(GENMASK(3, 0), eccsr)
 #define MACRONIX_ECCSR_BF_ACCUMULATED_PAGES(eccsr) FIELD_GET(GENMASK(7, 4), eccsr)
 #define MACRONIX_CFG_CONT_READ         BIT(2)
+#define MACRONIX_CFG_RANDOMIZER_EN     BIT(1)
+#define MACRONIX_FEATURE_ADDR_RANDOMIZER 0x10
 #define MACRONIX_FEATURE_ADDR_READ_RETRY 0x70
 #define MACRONIX_NUM_READ_RETRY_MODES 5
 
@@ -155,6 +157,21 @@ static int macronix_set_read_retry(struct spinand_device *spinand,
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
+static int macronix_set_randomizer(struct spinand_device *spinand, bool enable)
+{
+	struct device_node *np = spinand->spimem->spi->dev.of_node;
+	int ret;
+
+	if (of_property_read_bool(np, "mxic,randomizer-enable")) {
+		ret = spinand_write_reg_op(spinand, MACRONIX_FEATURE_ADDR_RANDOMIZER,
+					   enable ? MACRONIX_CFG_RANDOMIZER_EN : 0);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct spinand_info macronix_spinand_table[] = {
 	SPINAND_INFO("MX35LF1GE4AB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12),
@@ -213,7 +230,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF2G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x24, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
@@ -225,7 +243,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -236,7 +255,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF4G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
@@ -248,7 +268,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -259,7 +280,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX31LF1GE4BC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x1e),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -305,7 +327,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xf5, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -317,7 +340,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF4GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb7, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -355,7 +379,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xe4, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -367,7 +392,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF2GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa6, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -413,7 +439,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF1GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x96, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
