Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759DDC54FB3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 May 2025 17:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sbMlzn/KX4QETqFBbb8rdbE/XyCIHo+Bd2vk4qG6tKc=; b=yykI4RHAKgTYDo
	LHCgWcsiTcZya2TtDGzQyXpc69QakUcPiB/V6pCWYR+2bh2zULtCj+UA7CBrpGr8cOCM6SBOfAvy3
	0gICSiQBtLHA0zVTCp3myTKVZdkgOUa0gD9FBOv323RDcTcnPLaV09RSLoCWkHZ86O0BjFQHTlvxe
	VXsohc14ZvEj5zdz4FALZhgAsfUKU7OHRYQThDkx2QjTADAQqpNd5JTrIW+6wys6sU+8SesBrJ4xQ
	oNzgCP/l2IRfZ1RWx8Ol9wpwiCCQa6uvYa+hdX9xiRdaqRfupFzh1IXLKfMi52Zq+CAsd8teP0gln
	j+QY7pI7ltTv84VFHOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKhCN-0000000GITs-0S0l;
	Thu, 29 May 2025 17:37:47 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKhAh-0000000GIKC-3tOU
	for linux-mtd@lists.infradead.org;
	Thu, 29 May 2025 17:36:05 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6049431b409so1928686a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 29 May 2025 10:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748540162; x=1749144962; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+A71to2hM6tQB6kJBFVVEwobIWwE5T+2BzX0UTpMXkU=;
        b=b2JDNsRQhvuAfs+9nO5ivJaex1/FPwxuu1s7EJP2s5mfMNMeA/h0sM2zNxgOCtZRGJ
         XBPUpNkCLMOyNZjYsz7V/sMt1Ui41RrJihDJfnkr2K2RKvHG8aRROYDtNfdEwevmxD8i
         l6bbRApXHmifkM9d7m2NU2DRjNwn7ajb8tl0Bx5sFyKCnbBcpLN+ykpK8X9HHmt/9H1X
         fuHfvJCVcx3oejAlfiF1G61ChnEr2OmeHiYKJm+ctOcPvgP2bduB2c63pKCDB/VooqM7
         k3yzw33DhCH+LBsX5KgFYzLsHLx0stOYGUG1SLrSbZQSG2xkFUu9dbTpFaUrTnzLtTE2
         xDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748540162; x=1749144962;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+A71to2hM6tQB6kJBFVVEwobIWwE5T+2BzX0UTpMXkU=;
        b=LQRtZP2lxilHUy/RA5sE51P1ROd/9TiCBnYzBu3yaYwLA3Mhio2TONxOE1bAAet5Wj
         N5gNJzcyFZHQW6dMNV+skkqogQrArTj6Yprb2/cuZY3ffVfYraX9pXL1G4QKQL2AEotJ
         ZlN9aaalryRytY1qW1MUiTdoPaSzC91pIi8l8HJhJnQZRwIJsNUl45aeyUzxe39RRpTO
         aKhZ56g/zAP00SAlx15PBsWPkwOL1GHOKzkSQ40qr+yDWPvrxjG+2kuNHAJJNn7al41a
         fO4i2MIhckfeqiIB1wXd40Tij9SjfuLwxNpQ2mN60WIvzreJ3KdawnyxXi21ghyA+iKH
         0mEA==
X-Forwarded-Encrypted: i=1; AJvYcCWA+VAcEESbmIir2NXE1ALkYEUW5CynESOPu3c8hcNo+a9pWQfPo745P6cSwYGQVp2okc01AoNsYp4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Qe7M4bf+30wGdCqd7g9G3cQcObrmE090RXHi4bxEPy6FYVWW
	Z80iuYEngWWwxPWZi/DTT4jlEylm4PfnC6V3ykJK94Smfidt5TE9sUGW
X-Gm-Gg: ASbGncvLcCJXjkGUnhpRa7W6rLZU4rzwlRMPs8hJh8xrb1syxsvXeNOUKdmbgn8s7Pf
	s9LyuQtXevdQv05s1ee3HA1LLsVd17zh92AhAOCfYdih06/ghz1Obj0bEgHsXrfcDMpKNJjmU42
	KquDsWlYOcpbjCKfCF0/sKssF3mR14oWOT1ypVxyU9r7ZPppG1dI7B09NIjRL3czMz24LB+Cb1Z
	f3FFed+iyRfLTS6EVwoSgTyjD0fv0pQXXS94fkBUMYxu/tRl2YZT6GtLxZYSo0909XuizgoGy2s
	FvpkxSiujkUlInDR/T4MOXDsJDsXj066sc63yqGu8IEyuhzCRffFeE4jGmPVlBVovpJwRku/60E
	5IT4X7Gh4mdbwXQo=
X-Google-Smtp-Source: AGHT+IH//RBmm/8B7tXeJxyKxnZbF4nmP5r2kdAJ1HrNz2e0Po4vQ+YILnUKQo3DQtFXYndTTNZ3dA==
X-Received: by 2002:a17:907:3d90:b0:ad8:9b24:9d16 with SMTP id a640c23a62f3a-adb32245bd9mr34324366b.6.1748540162157;
        Thu, 29 May 2025 10:36:02 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ada6ad6ab2csm173992866b.184.2025.05.29.10.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:36:01 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 29 May 2025 19:35:44 +0200
Subject: [PATCH] spi: spi-qpic-snand: remove 'qpic_snand_op' structure
MIME-Version: 1.0
Message-Id: <20250529-qpic-snand-remove-qpic_snand_op-v1-1-6e42b772d748@gmail.com>
X-B4-Tracking: v=1; b=H4sIAO+aOGgC/x2NQQqAIBAAvxJ7bqEsi/pKRJRutYfUFCSI/p54n
 DnMvBDIMwUYixc8RQ5sTYK6LECdqzkIWScGUQlZSdHi7VhhMKvR6OmykbJZslmsw37YNO1S6a6
 RkCrO085PPkzz9/09eksLcQAAAA==
X-Change-ID: 20250524-qpic-snand-remove-qpic_snand_op-79bdef5cd635
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_103603_972990_E1D2038D 
X-CRM114-Status: GOOD (  12.94  )
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

The 'qpic_snand_op' structure is used only in the qcom_spi_send_cmdaddr()
function as a type of a local variable. Additionally, the sole purpose of
that variable is to keep some interim values before those gets passed as
arguments for cpu_to_le32() calls.

In order to simplify the code, remove the definition of the structure
along with the local variable, and use the corresponding values directly
as parameters for cpu_to_le32() calls.

No functional changes intended.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 35 +++++++++--------------------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index fd129650434f0129e24d3bdac7e7c4d5542627e6..7b6ad846829d1f2d86883f53faacb7a433a7107c 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -59,12 +59,6 @@
 #define OOB_BUF_SIZE			128
 #define ecceng_to_qspi(eng)		container_of(eng, struct qpic_spi_nand, ecc_eng)
 
-struct qpic_snand_op {
-	u32 cmd_reg;
-	u32 addr1_reg;
-	u32 addr2_reg;
-};
-
 struct snandc_read_status {
 	__le32 snandc_flash;
 	__le32 snandc_buffer;
@@ -1280,7 +1274,6 @@ static int qcom_spi_write_page(struct qcom_nand_controller *snandc,
 static int qcom_spi_send_cmdaddr(struct qcom_nand_controller *snandc,
 				 const struct spi_mem_op *op)
 {
-	struct qpic_snand_op s_op = {};
 	u32 cmd;
 	int ret, opcode;
 
@@ -1288,34 +1281,24 @@ static int qcom_spi_send_cmdaddr(struct qcom_nand_controller *snandc,
 	if (ret < 0)
 		return ret;
 
-	s_op.cmd_reg = cmd;
-	s_op.addr1_reg = op->addr.val;
-	s_op.addr2_reg = 0;
-
 	opcode = op->cmd.opcode;
 
 	switch (opcode) {
 	case SPINAND_WRITE_EN:
 		return 0;
 	case SPINAND_PROGRAM_EXECUTE:
-		s_op.addr1_reg = op->addr.val << 16;
-		s_op.addr2_reg = op->addr.val >> 16 & 0xff;
-		snandc->qspi->addr1 = cpu_to_le32(s_op.addr1_reg);
-		snandc->qspi->addr2 = cpu_to_le32(s_op.addr2_reg);
+		snandc->qspi->addr1 = cpu_to_le32(op->addr.val << 16);
+		snandc->qspi->addr2 = cpu_to_le32(op->addr.val >> 16 & 0xff);
 		snandc->qspi->cmd = cpu_to_le32(cmd);
 		return qcom_spi_program_execute(snandc, op);
 	case SPINAND_READ:
-		s_op.addr1_reg = (op->addr.val << 16);
-		s_op.addr2_reg = op->addr.val >> 16 & 0xff;
-		snandc->qspi->addr1 = cpu_to_le32(s_op.addr1_reg);
-		snandc->qspi->addr2 = cpu_to_le32(s_op.addr2_reg);
+		snandc->qspi->addr1 = cpu_to_le32(op->addr.val << 16);
+		snandc->qspi->addr2 = cpu_to_le32(op->addr.val >> 16 & 0xff);
 		snandc->qspi->cmd = cpu_to_le32(cmd);
 		return 0;
 	case SPINAND_ERASE:
-		s_op.addr2_reg = (op->addr.val >> 16) & 0xffff;
-		s_op.addr1_reg = op->addr.val;
-		snandc->qspi->addr1 = cpu_to_le32(s_op.addr1_reg << 16);
-		snandc->qspi->addr2 = cpu_to_le32(s_op.addr2_reg);
+		snandc->qspi->addr1 = cpu_to_le32(op->addr.val << 16);
+		snandc->qspi->addr2 = cpu_to_le32(op->addr.val >> 16 & 0xffff);
 		snandc->qspi->cmd = cpu_to_le32(cmd);
 		return qcom_spi_block_erase(snandc);
 	default:
@@ -1327,10 +1310,10 @@ static int qcom_spi_send_cmdaddr(struct qcom_nand_controller *snandc,
 	qcom_clear_read_regs(snandc);
 	qcom_clear_bam_transaction(snandc);
 
-	snandc->regs->cmd = cpu_to_le32(s_op.cmd_reg);
+	snandc->regs->cmd = cpu_to_le32(cmd);
 	snandc->regs->exec = cpu_to_le32(1);
-	snandc->regs->addr0 = cpu_to_le32(s_op.addr1_reg);
-	snandc->regs->addr1 = cpu_to_le32(s_op.addr2_reg);
+	snandc->regs->addr0 = cpu_to_le32(op->addr.val);
+	snandc->regs->addr1 = cpu_to_le32(0);
 
 	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 3, NAND_BAM_NEXT_SGL);
 	qcom_write_reg_dma(snandc, &snandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);

---
base-commit: 589561cb455189154a7110a39d9fcc39965f3104
change-id: 20250524-qpic-snand-remove-qpic_snand_op-79bdef5cd635

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
