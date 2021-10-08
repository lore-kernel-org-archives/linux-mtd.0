Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6CFC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:00:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11E0610A5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B11E0610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRWLWyaMPZZDgO57Z8a8NAx4zMVhol+C8YAvGD4J/8M=; b=zAIHxIBoIvepoV
	Y9epMCQvL4FOsiK7c3xUXlaIWjX+eG+IL1z8OTeDBiuSgqqt+F7uP5JmXe0YhgikoD5MTi1bQOgrf
	fuElAHiuEedzNQuG6NrfIOhG1eKjtQmO7l78Rki19bj7plxXf6biLCNuWYBibQqk2VndydyjbR3KD
	Zgl7ZRLbDOh8Fkab3ELGJ64uZM+heAS6eW8jzVQLTppoze7N6wTGNFFtWKO/pxm30g7Xo+aeWWSLQ
	wlPhXcwdFkfeTO192C43u5AvFG+IShBtSFgiSC9EWTbDamKSItOrDWcjCPkHbYVO3rgJFLDXjip3P
	KMiHpfpva4BOsOTRxWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNNj-00GKjx-Ub; Thu, 07 Oct 2021 06:59:56 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNNA-00GKad-7j
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 06:59:21 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so4401867pjb.0
 for <linux-mtd@lists.infradead.org>; Wed, 06 Oct 2021 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+bCtoRaNuYhOGmAmYcUTLxud+XTNt33Ltrm0LqSha7o=;
 b=h3zgMjIhZQ/AlPjqjewv+2sGIAbrzNixrDtkaIrSc83xnhTC2R5L1ks+0mhIAV15lT
 yjMLuGHpg7Hq5GGn0KequRo5DmbLA8TzFlGF8u4atpkM9Hf6eDxw/NgHgYvdFIqDcASB
 rD3cXOLDH2XccUmmazx90pII454P/j9HbM1+6svCA4KYMrkxoYi5vH4PmKb/kTSGm3p2
 JlsV+5A1u1qsgfr03NlnDjGySc9qh8/hDa3UGCD35CiY4IXZYL/oRucBoBtAb2NEpl4I
 NcN223BQRWvsmVRsfpQpk8syZXjgKoVaAXI9j3BgrzpjXwj8V7JFCEjvfxYLIykk3MZ+
 38JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+bCtoRaNuYhOGmAmYcUTLxud+XTNt33Ltrm0LqSha7o=;
 b=DrMrnbmcST4Ozet4sqzXv5A11Qi0Oci/+e4Wgl8mPC7Zd/lWP8wTjKtmMx36aB5eCe
 kbDVwt1UYMiuGLgfXDQkReD6hPdsioSyBDcNrNrqWi4eygRx/Zvc5xoBaPYhaXpT75VQ
 BJ8I27SmZypSQRTZSQiKEN9GPcpFgMYslis1gbMf5HmbGl5q9NsEzXRexSyqWQnWdMe+
 IG549Dsh0czweykXFASdM3NRZg8gc0pzrEVmVcDEPecHi17339C2NqdMwnaFTxqROlOD
 flHxIMC3y7G4QdlFCmRAUYsGYGQ7mRw/u40ydMpj2aw6Fz7PaeNT40agyotqFa0UbOB8
 XBdA==
X-Gm-Message-State: AOAM533WsOOGEjSp41P4MxhGnWAFRAbwgwXM8A2HJI0K5GrtHVlFtjl0
 fjEtO/UxvcCcsBFwfD33WhXuHMjyf4NHS86P
X-Google-Smtp-Source: ABdhPJzwI756j+PXNQYEtrog2gC1q6i5W/t+pS0VGRo2j5Sm+hulUkDlunstjFmyzZh34exIZhogyg==
X-Received: by 2002:a17:90a:b382:: with SMTP id
 e2mr2940558pjr.119.1633589958728; 
 Wed, 06 Oct 2021 23:59:18 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.googlemail.com with ESMTPSA id u12sm7137844pjr.2.2021.10.06.23.59.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Oct 2021 23:59:18 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH 2/4] mtd: spinand: Add continuous read exit command
Date: Fri,  8 Oct 2021 14:57:57 +0800
Message-Id: <1633676279-29708-3-git-send-email-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633676279-29708-1-git-send-email-zhengxunli.mxic@gmail.com>
References: <1633676279-29708-1-git-send-email-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_235920_302261_1168B346 
X-CRM114-Status: GOOD (  12.83  )
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

Add a continuous read exit command to terminate continuous read
operation.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 10 ++++++++++
 include/linux/mtd/spinand.h |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index bcdd438..0d9632f 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -431,6 +431,16 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 	return 0;
 }
 
+static int spinand_continuous_read_exit(struct spinand_device *spinand)
+{
+	struct spi_mem_op op = SPINAND_EXIT_CONT_READ;
+
+	if (!(spinand->flags & SPINAND_HAS_CONT_READ_BIT))
+		return 0;
+
+	return spi_mem_exec_op(spinand->spimem, &op);
+}
+
 static int spinand_write_to_cache_op(struct spinand_device *spinand,
 				     const struct nand_page_io_req *req)
 {
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 04be10e..e044aba 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -122,6 +122,12 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 4))
 
+#define SPINAND_EXIT_CONT_READ						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x63, 1),				\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
 #define SPINAND_PROG_EXEC_OP(addr)					\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x10, 1),				\
 		   SPI_MEM_OP_ADDR(3, addr, 1),				\
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
