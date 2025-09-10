Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB923CAC582
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 03:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3h2m38iDggOKh3skfvicKlwxSwDVmJyvUg4UUQJIuQ=; b=S7T2toATPpqBQ3
	TXxbdqaYQrBtpeRMfQ4PDzvX18r3fmOwpf1qszGraMp9WGVhVc06tOUvzaa8rXhyNOyITmucSZTkb
	+7+JqsUYIkQQpyJ7VwGITb/plDp5GfTi2Sd1SLFSVx6tz2fWgBO9Mae+34D/owV0h+8CKxPeztWy1
	B8bbzaSjk56J8Jes92d2SPjLoPpxrBUr6UsLq2+B3SN5o3cbNXap0D6PtULn7oxMjvvf6JIFHfeK8
	Isp3EtdT7WxTmBwz/l1Dv9b5k3kPPiuqbhafDt57yAXFxrtHPeOBlwjJxRm8gT1MgA5FmxV64eV8L
	oGPA2TI0vAvJgpre9S6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB9x-0000000BnR8-3fTO;
	Wed, 10 Sep 2025 03:06:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB9w-0000000BnPd-0U4x
	for linux-mtd@bombadil.infradead.org;
	Wed, 10 Sep 2025 03:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Jfsu13HN8biP/n/EW77zykxwoqDcdIlmZQ9zgwYNdFA=; b=hstNRxZ0WLzSugfeQJ0WOmkfyp
	EDdkos7H0bRPTdaiUgQxdYi0mO+2iXBipcQH1X0Q7g4dVqAPWrcpWgMGk+U1G+w7kYI/Zjop8JW17
	aDIJqtfO734I7xJNI6f2v24CQiH6l68No9RzU42lx/3LN8lP6jQIzAHG4i27v9ITYccSAHSh4oQfF
	CNT0/n42ObsxWFNVhoYSh+OYIG+JUv4JSf5ZI+PAErmv3Ud5FTR0YNjlBNM/HyOWLU9J3FmoR2fHU
	CTzBD0ZcHb88uRLgdPLtljzJf0v3fejokvZ95PoU5eu8a8JoGc84nPJ9wlEojze1wXRh4eZoWDRhO
	l2iK5njw==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwB9s-00000005hef-3dxC
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 03:06:10 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b5241e51764so1892746a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 20:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757473566; x=1758078366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jfsu13HN8biP/n/EW77zykxwoqDcdIlmZQ9zgwYNdFA=;
        b=GR/ULd1lbqPMPo48X4bIfZiSKfNIL0iQ7AFXABVdCFjiyfFSrbLv4pI8V339j8/zYS
         W/JSsgvsW5FyxWdwkULs6sUgbT1XF0Jvp9hixPpNBC0BZ9jWPCITnhC/VWv8EYDmer7P
         EmuThD8ayA4KR5ji6x74oUUFCFWSu1IV5rrARdP3e/VFlSnaU/Mk+B/M4vAM0cEnDQVV
         /CujqUeplbY3unieHbSnEb7/fo5DW1hyQR6grk/NuSSCZaFm40nLZABnxLyfukOUBm40
         /Qd7TbI4yOdxDT13EirX975/i/krxVlyg51DxhUvtnL4oLXx8CbBh0nSn/HHlbXAL79c
         cyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757473566; x=1758078366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jfsu13HN8biP/n/EW77zykxwoqDcdIlmZQ9zgwYNdFA=;
        b=SysrHpGY8zAtnBZnFGzV/c5PjiVeT2ztaTtmEdVQz5y8t9cIfd8medNtQjkhiprgEt
         PHMeKYi3ZifrP9/bXED6PlFMflwLIRdm0HJsH+cs4L9YdCWyPWAegx9GJCEjbyw3AIp4
         LyMX48ugCc4SDLoyThy3Pe+y4YCUI9n/uS++GDsSMM63NyVy+QwWFWoCLDcBxvviRZRJ
         6vhUHlzXYTgfVh/FXiZ43QlWcUCqHN5HdGZoo94jadOx7iia5yTXU6Acq0pFdPJlM0gg
         Nh9lcfCV1q4VCFmu2nD+4HmQIkHru/haIw6ZSTc4hcPrWqYk6QUgpjIU6t5/z1Mk7GAp
         bJkg==
X-Forwarded-Encrypted: i=1; AJvYcCVZDedb35UWKjWk5AZEJawXtBrxqHuDcGC6zabgorN7j7zxPe0j2oMy9QLQzEI/uXgYOst4cn79piE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwd89MJP9x5rbVz2Q+jPgrmln4yqAVlGGFJD9Qj0vPbishEMeQ
	Aw+xAv0RQ5ksKX91kXOmilU9cEXnC2cM++GJ+Eocva1Wvq+XgGwB4KSRK3zSzw==
X-Gm-Gg: ASbGnctDInWDJRO1erQ+QKWRP7JLk7PtNWzCXMcscft0JyNtuU89mTanIHgU9wtaHrf
	NZLZ9IsBu66jIzhPHzBm8hdr1fN0XzWFijzw2HHj5e9sLBOexyK/jq7GS+hjsh6l3YwXImNKzqI
	iupcXPMf9C3zbOCONVnXXWOcbobdqmAvi1FjHKBstMWo7gsrlGuwEdbRD0WS0Hk7l4H6mUSF4dx
	qmZEDQYuD+tixn47Igg0yQ/TqHI/c29gkRe2xs//dRcOS1/Bk1QQ0EYxNt0iGTjBdIEURRAdf+I
	ZUnGoJvzDyFKbTevql2AMr8dlHj7inuoc0dJfsTqPWEYo8w9OAi/229XaP5E14EmrIfSVu1mn2c
	JJN8k5clZyQSRaEGmWhpwSB3Lk4Lx+yD+6Y1Aqu+3InnRwdeE4nVABnb0arX4scZM0DZWXCUcka
	BQiuVSrO996PmPKoJVD00RLTr6lPykaEDsK5IHt4aFfZMx+jrKjU444ys=
X-Google-Smtp-Source: AGHT+IH5S+qulOuahC60MPb/08HMw3Py358hrTsN36Vcd02nHOLBhopc+QqWl4qPf7wjy70VRA23tQ==
X-Received: by 2002:a05:6a21:7781:b0:253:6b75:babc with SMTP id adf61e73a8af0-2536b75bdf1mr17467774637.46.1757473566397;
        Tue, 09 Sep 2025 20:06:06 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b548a50c49csm1071459a12.15.2025.09.09.20.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 20:06:05 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 0EC6B804B6;
	Wed, 10 Sep 2025 11:10:39 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: tudor.ambarus@linaro.org,
	mmkurbanov@salutedevices.com,
	Takahiro.Kuwano@infineon.com,
	pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 3/3] mtd: spi-nand: macronix: Add randomizer support
Date: Wed, 10 Sep 2025 11:03:01 +0800
Message-Id: <20250910030301.1368372-4-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250910030301.1368372-1-linchengming884@gmail.com>
References: <20250910030301.1368372-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_040609_234294_FBCFFE8E 
X-CRM114-Status: GOOD (  14.16  )
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

Enable randomizer function by specific flowchart to set the default value
of RANDEN to 1.

Randomizer introduces a new DT property "mxic,randopt" to define the
randomizer area per page.

The penalty of randomizer are subpage accesses prohibited and more time
period is needed in program operation and entering deep power-down mode.
i.e., tPROG 320us to 360us (randomizer enabled).

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 89 +++++++++++++++++++++++++++++----
 1 file changed, 79 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index edf63b999..7450ee1d3 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -14,6 +14,10 @@
 #define MACRONIX_ECCSR_BF_LAST_PAGE(eccsr) FIELD_GET(GENMASK(3, 0), eccsr)
 #define MACRONIX_ECCSR_BF_ACCUMULATED_PAGES(eccsr) FIELD_GET(GENMASK(7, 4), eccsr)
 #define MACRONIX_CFG_CONT_READ         BIT(2)
+#define MACRONIX_CFG_ENPGM BIT(0)
+#define MACRONIX_CFG_RANDEN BIT(1)
+#define MACRONIX_CFG_RANDOPT BIT(2)
+#define MACRONIX_FEATURE_ADDR_RANDOMIZER 0x10
 #define MACRONIX_FEATURE_ADDR_READ_RETRY 0x70
 #define MACRONIX_NUM_READ_RETRY_MODES 5
 
@@ -155,6 +159,61 @@ static int macronix_set_read_retry(struct spinand_device *spinand,
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
+static int macronix_set_randomizer(struct spinand_device *spinand)
+{
+	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_1S_1S_0_OP(0);
+	struct nand_device *nand = spinand_to_nand(spinand);
+	struct device_node *dn = nanddev_get_of_node(nand);
+	int randopt, ret;
+	u8 cfg, status;
+
+	ret = spinand_read_reg_op(spinand, MACRONIX_FEATURE_ADDR_RANDOMIZER, &cfg);
+	if (ret)
+		return ret;
+	if (cfg)
+		return 0;
+
+	cfg = MACRONIX_CFG_ENPGM | MACRONIX_CFG_RANDEN;
+	randopt = of_property_read_bool(dn, "mxic,randopt");
+	if (randopt)
+		cfg |= MACRONIX_CFG_RANDOPT;
+
+	ret = spinand_write_reg_op(spinand, MACRONIX_FEATURE_ADDR_RANDOMIZER, cfg);
+	if (ret)
+		return ret;
+
+	ret = spinand_write_enable_op(spinand);
+	if (ret)
+		return ret;
+
+	ret = spi_mem_exec_op(spinand->spimem, &exec_op);
+	if (ret)
+		return ret;
+
+	ret = spinand_wait(spinand,
+			   SPINAND_WRITE_INITIAL_DELAY_US,
+			   SPINAND_WRITE_POLL_DELAY_US,
+			   &status);
+	if (ret)
+		return ret;
+
+	if (status & STATUS_PROG_FAILED)
+		return -EIO;
+
+	ret = spinand_read_reg_op(spinand, MACRONIX_FEATURE_ADDR_RANDOMIZER, &status);
+	if (ret)
+		return ret;
+	if (status != cfg)
+		return -EIO;
+
+	cfg &= ~MACRONIX_CFG_ENPGM;
+	ret = spinand_write_reg_op(spinand, MACRONIX_FEATURE_ADDR_RANDOMIZER, cfg);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct spinand_info macronix_spinand_table[] = {
 	SPINAND_INFO("MX35LF1GE4AB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12),
@@ -213,7 +272,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF2G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x24, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
@@ -225,7 +285,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -236,7 +297,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF4G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
@@ -248,7 +310,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35LF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -259,7 +322,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX31LF1GE4BC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x1e),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -305,7 +369,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xf5, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -317,7 +382,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF4GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb7, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -355,7 +421,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xe4, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -367,7 +434,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
-					macronix_set_read_retry)),
+					macronix_set_read_retry),
+		     SPINAND_RANDOMIZER(macronix_set_randomizer)),
 	SPINAND_INFO("MX35UF2GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa6, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -413,7 +481,8 @@ static const struct spinand_info macronix_spinand_table[] = {
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
