Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44374C531D0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2026 16:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rrv57YKRhCk8MbGidwMqISo26jo8LrhPNZexSvSFJ6Q=; b=mBuEkH6F/xmZYc
	dBwty7cHAikUzgf8X2Q0jmeaA4D8gAicfsEGbTAszmQNj0ol7WWa10trD53TBXaJ8gBghZduY818f
	2r/xkQXVRKLerUChNaleeJOosv9W7Q46T8VaBrki8g0rPWsOFfVjI/GdwzcSu6SOT4+dyYFmUloSx
	fFeh/ayQt2VMduyFzAa7N0SxYflONqBM0dZd6xTpZ1JUx1PiBiZzmihf01wbkD6qQWH6V6zuS3sIB
	39lCKh/lSjbc7t2Pd2rpqdk8kGFtWutR1qQD6iD6D9cFvyXA4TdVguAe8tEypAlR/SQbbI46Nhop7
	QeMO++4haoO66zTIBQvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOFf-00000003Lqe-1eFB;
	Mon, 27 Jul 2026 16:32:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOFa-00000003Lpp-1plD
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jul 2026 16:32:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49557167508so28465445e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 27 Jul 2026 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169940; x=1785774740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjStuC+Z5BSoMlb9btbKypwZnxjerVTTywVtGN/OSE0=;
        b=jPkBDQ7qZxShxTcfEiMwVs/Bvj0BEXlOuCVRKm6YN+teZ2S8GU+NSslbaa2jMAlfze
         SVqe5msiocHu6C6mAqPBbbFsMGT/6TD5afvQjD2aOTIZijo5+J7GiXIV0+aT8BzdPaLO
         1M4uwQ+GC6gC+tLIne8ewTUNCRoHjm5DCNhG7ldXxT8H2rLPKPv23IX+aQBRhQVXP2Wb
         TLbTGJN1ilZkWugfQughwIbNN4Ekf2TURBBiiq576JHJsWnKiluVaZDp/7ifRnTUe6hu
         VOENgGRkJa03B7WtDJeYP/aZhmfx9pGQrsR2JzlTw6+OhSOTxzOJ/ys/FMSAPFFErdsv
         HeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169940; x=1785774740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjStuC+Z5BSoMlb9btbKypwZnxjerVTTywVtGN/OSE0=;
        b=qPrVtixIAb56MFNPaNoI87phgXdrqYZJW/QV/YCFT8/p8S4UGezhy5IspJ6mawNxO+
         rUsAboBSALR9FEzq0cQZ2BrEUSaMxJyjOWvD81za1DN/w7fqroGtNp8UkcemFRL6dPTL
         4sqyJWx2nMbmf4a2N+Jnat/itmlzcaXNclnxWKqBEWr91ntbPtjvcxhlqxWUBl56IHjE
         XAkkt/rrhybV9AaviJdrApgQItIkpVaoV296Z8LNHZYAANN3osDfuWFIMf7gAFwOcAFd
         iqWsEekXjfmjCHkQ0aa+keNObHs2Z0CfciBmg/ZhGrit3ZA9AAQGOjrXO0xQz+HUD4ZE
         FrPA==
X-Forwarded-Encrypted: i=1; AHgh+Rpk8WFxFP0vNxGKXcLqt682rVD7TTeCZm1UXoecnDr6l6DIrOxlB3B4sslqa07gTn7N9hgVt3gmroI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw21gLZYGrwPv3tvdr1TWQsz/yqhr0dRov+PQyCvr18xBWOlHPZ
	xVSiJpisVS2glVd9C6OHthtz4K/BOyuOlAxFnfwchfBGmQ4g55KtBajM
X-Gm-Gg: AR+sD13XJ4tuMhod1r9C0FvBuyQHSbpun9XoYYqmogjx70Gxq1OSK3iqNNGP5YD81pn
	BbfedABN0r5AZ/0TGEHyQIlYENFrgZMsrIXCUXHCnucfyomsYzxWqdC7uX1tC4LGzzet/JcCn7l
	Go2V4OTqOyo7bkRkMK8jBOWWuBN+I20YLyGynkDM89c2Fq4Os9zhoSqWRFE+pv8w+Ayuxpw/jA9
	uwuc9tlrY48ZYS1CYwR6x5v+nBp9woCoDixZGxhr2cZ9HRNyQTgAKALChs+wZK9Hvm4p0PLHB8b
	lqm1uYv9BB1OVZAI30DT6sOP82m5ltT+kr2debqFDxoiwttnCBpMVuOjBfUmoBSlayjdEqt5NGs
	7Xr6SPLLdxThQ8YtywTahzAqPMAGjAkAkOSNByL5dzK2tJgIq9nrlQpq5gw7WdlF8ce49d8+iDS
	aCOkK9mZWm8VbA494Fs3e7aJh6ej+Zb5GUTxp53l2hxsUw/9Ps+gxL24a0OpgaBnQ9
X-Received: by 2002:a05:600c:5253:b0:495:636b:e519 with SMTP id 5b1f17b1804b1-496b56ff142mr126651835e9.21.1785169939939;
        Mon, 27 Jul 2026 09:32:19 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (public-gprs192625.centertel.pl. [46.134.91.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44a91ebsm4458925e9.3.2026.07.27.09.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:32:19 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Stanislaw Pal <kuncy7@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] spi: spi-qpic-snand: write the feature value before executing SET_FEATURE
Date: Mon, 27 Jul 2026 18:32:16 +0200
Message-ID: <20260727163216.109938-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093222_495222_0A85A6DA 
X-CRM114-Status: GOOD (  17.15  )
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

qcom_spi_send_cmdaddr() programs NAND_FLASH_CMD/NAND_EXEC_CMD and submits
the descriptors, which makes the controller execute the command
immediately. For SPINAND_SET_FEATURE the value to be written is only
placed into NAND_FLASH_FEATURES afterwards, by qcom_spi_io_op(), in a
second submission - so the chip is programmed with whatever that register
happened to hold from a previous operation, and the intended value is only
applied by the *next* SET_FEATURE.

Measured on a TP-Link Archer AX55 v1 (IPQ5018, ESMT F50L1G41LB): writing
0x40 to the configuration register (0xb0) leaves the chip at 0x00, and the
subsequent write of 0x00 leaves it at 0x40 - every write lands one
operation late.

This stayed unnoticed until v6.18 added SPI-NAND OTP support together
with OTP entries for ESMT chips. spinand_otp_rw() enables OTP mode,
reads, and disables it again, and mtd_otp_nvmem_add() does this during
MTD registration. With the off-by-one, the "disable" write actually
applies the previously requested value, so CFG_OTP_ENABLE ends up set:
the chip stays in OTP mode, every subsequent array read returns the OTP
area instead of the array (UBI reports an empty device) and all writes
fail with -EIO because the OTP area is write protected. On this board
that makes the whole flash unusable and the device unbootable.

Write the feature value into NAND_FLASH_FEATURES as part of the same
transaction, before NAND_EXEC_CMD. While at it, copy only the bytes the
operation actually carries - the previous code dereferenced a 4-byte
pointer on a one-byte buffer (spinand->scratchbuf).

With this patch the flash contents read back bit-identical to a
known-good dump of the same board taken under the vendor firmware
(md5-verified across partitions), and writes work.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1358,6 +1358,22 @@
 	snandc->regs->addr0 = cpu_to_le32(op->addr.val);
 	snandc->regs->addr1 = cpu_to_le32(0);
 
+	/*
+	 * The feature value has to reach NAND_FLASH_FEATURES before the
+	 * command is executed, otherwise the controller programs the chip
+	 * with whatever the register happened to hold from a previous
+	 * operation.
+	 */
+	if (opcode == SPINAND_SET_FEATURE) {
+		u32 ftr = 0;
+
+		memcpy(&ftr, op->data.buf.out,
+		       min_t(size_t, op->data.nbytes, sizeof(ftr)));
+		snandc->regs->flash_feature = cpu_to_le32(ftr);
+		qcom_write_reg_dma(snandc, &snandc->regs->flash_feature,
+				   NAND_FLASH_FEATURES, 1, NAND_BAM_NEXT_SGL);
+	}
+
 	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 3, NAND_BAM_NEXT_SGL);
 	qcom_write_reg_dma(snandc, &snandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
@@ -1395,10 +1411,8 @@
 		copy_ftr = true;
 		break;
 	case SPINAND_SET_FEATURE:
-		snandc->regs->flash_feature = cpu_to_le32(*(u32 *)op->data.buf.out);
-		qcom_write_reg_dma(snandc, &snandc->regs->flash_feature,
-				   NAND_FLASH_FEATURES, 1, NAND_BAM_NEXT_SGL);
-		break;
+		/* fully handled by qcom_spi_send_cmdaddr() */
+		return 0;
 	case SPINAND_PROGRAM_EXECUTE:
 	case SPINAND_WRITE_EN:
 	case SPINAND_RESET:

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
