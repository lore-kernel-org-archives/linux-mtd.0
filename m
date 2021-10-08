Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38DCC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:01:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A8566101B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A8566101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVPTpFqq05BnbA7q5hdfqT7CiRlPsymnjOWoDSOD2SI=; b=bGEhIwYSirQUaR
	PKjO8nKrIfiaI2K3849ZVCrfhMlsThUMt2a/w7U4R1JvTgT+8146/tfmjt2dB0YFV/bC2t/1PJeG5
	5UY/DiyYXtwS83dmhppCgwaq/R1hoXGMfUgfRVv/ofnasfYqZmQIIJfuYLlVCqjRqfex5pSUIE92q
	J13UfKmw4lAUjF2xXhCHVIyXRIUi8xlVHJnKpuwh2VK8scJDtOOfZv3YLTUoYpM5arDtyfmgg6hSu
	rTbZ4sc/t3vn8UL/faWnjippyurdnpU6qr48Y441xjKjMEHuS011sKBcSRjOiK3ghiAwtejcdVMgU
	b8bM/hAnMPDcV8yRFHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNOZ-00GL1z-P6; Thu, 07 Oct 2021 07:00:47 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNNF-00GKc3-5U
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 06:59:26 +0000
Received: by mail-pj1-x102d.google.com with SMTP id on6so4073551pjb.5
 for <linux-mtd@lists.infradead.org>; Wed, 06 Oct 2021 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4/TVR6gmOUuyYwhORDUD5veKft5xvF+3erzuqMvpL7g=;
 b=qj57APgCNEfY322d4izcGzoa/4R8rFiSSUlhbj4GQMeTBU1ZrYJOyR0jG2fdk1rwsp
 h9ap3qMSjsJYyLy0KPqJnTun5lLn/oBw4zYSaZq+LUZ3b6TXd7OL6LLUwoiqLsiM6AS/
 JcPhLFEAnp7xjdGQ+VweTPxF0oZJZ8SyNw5XRMv5phh4lWTzluF6daZjNcJuNKTlfJCx
 PKQMS2pLU1fDP9nN8G+aYrufReead3PKR0N5eVvHWCstunyElIs+ppOAJfb5xULFk//7
 sm8hZ/PkV/sKxMVKRTBxk+rXL6/a2NICqYMlmNRVLhdHU51MvAbZr2cwU1KLenUZD7WA
 /bsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4/TVR6gmOUuyYwhORDUD5veKft5xvF+3erzuqMvpL7g=;
 b=sKRXTd5twxi4yKg0ocywQ+JsxIF9sg01g9pASFwqks/H6MRhEspFc/Uuz6LH5ZE79i
 ZyM8FXRH+RQWIDeGSwlvactNuabJrTJ8f1DEPDmoJ9mTKfLc2v4y6wa6v5iFlBxsfI8M
 YRVucXc5i9zb7m2HGqJXAJn60J8AHH71Z8dX+02fNo4U71F+5uj5SRvvwx5GNMamXXYQ
 mpqSzEObd7ZLZNrkP9YQPNdPD81kHAW9zsSUW9xM2iwAvV5nQxU0UwuncnnuSEYhbTeG
 EI2Viu6ZM5DMPwVV0ebxBgWJA9c7UdM3I3slbAD0GA4A1+U5W7J6zfgRAwPBwBHMNG0G
 s6TA==
X-Gm-Message-State: AOAM530hY9j7HYG3PrN/myUtH5VvQUsIgRq3tYUrn7s8Hu7FLGqpAs9l
 HPY2ApjTgrcvgOZJudPpXV9AlQ3QVKPdieAQ
X-Google-Smtp-Source: ABdhPJzmERW0ANWzmHThI8p3au6Yr76nnjljeNAx/PcMWfXo63eFppKD9T05RGBP/46J5uU9kLj1GA==
X-Received: by 2002:a17:902:8543:b029:12d:461f:a6a8 with SMTP id
 d3-20020a1709028543b029012d461fa6a8mr2299370plo.1.1633589963814; 
 Wed, 06 Oct 2021 23:59:23 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.googlemail.com with ESMTPSA id u12sm7137844pjr.2.2021.10.06.23.59.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Oct 2021 23:59:23 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH 4/4] mtd: spinand: macronix: Add support for Macronix
 MX31LF2GE4BC SPI NAND flash
Date: Fri,  8 Oct 2021 14:57:59 +0800
Message-Id: <1633676279-29708-5-git-send-email-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633676279-29708-1-git-send-email-zhengxunli.mxic@gmail.com>
References: <1633676279-29708-1-git-send-email-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_235925_239534_108361CD 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Macronix MX31LF2GE4BC are 3V, 2Gbit serial SLC NAND flash device.

MX"31", means SPI NAND
MX31"LF", LF means 3V
MX31LF"2G", 2G means 2Gbits
MX31LF2G"E4", E4 means internal ECC and Quad I/O(x4)

Validated via normal(default) and QUAD mode by read, erase, read back,
on Xilinx Zynq PicoZed FPGA board which included Macronix
SPI Host(drivers/spi/spi-mxic.c).

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
 drivers/mtd/nand/spi/macronix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3f31f13..43cfd85 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -176,6 +176,17 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX31LF2GE4BC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x2e),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+
 	SPINAND_INFO("MX31UF1GE4BC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x9e),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
