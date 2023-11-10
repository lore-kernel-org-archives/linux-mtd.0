Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B297AC4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Nov 2023 01:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MuvaMjdaVl6iv+bB1XxVViT8tTThvF5qHTW7fhCLK5U=; b=1vp3qassCaZNYq
	4D+sP78u8mkszBLqU2jicwfNfsCa0mB9famxDmGDny014B99Am0Pl/93J5ACgyK4XgGM/MpMyQDEW
	Dw4dKYdPJjcmAYFkHHhHEumScm4OXoHlVJqKF5XQuXKAxtpwKXYetogShxmPzXLx1I+5+H6VBfTJk
	HZ9eKtXBO1P2dMSqc6e/fFM96pkx9D6BcKHjd5jt6gsA/Xss+kaHtjPyPual+zT67swuMFp6H8CsH
	HUZbsm/K7J0vKIC7Iba4UlXQyb0MQNkSuaS22DJdLj3OWwcqY8JO5SXlzMhjPZsSWzVhGv3ALL7hF
	cKi3yXH1UK5wjl16uB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1GCh-007Zf8-1j;
	Fri, 10 Nov 2023 01:20:59 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1GCe-007ZeR-27
	for linux-mtd@lists.infradead.org;
	Fri, 10 Nov 2023 01:20:57 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-59b5484fbe6so18348667b3.1
        for <linux-mtd@lists.infradead.org>; Thu, 09 Nov 2023 17:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699579255; x=1700184055; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p19gz0pvmUr9WwyXQ4dXMb3io5xq3Mq3immW42vKGSA=;
        b=bo8VWGXO3kDh1DnZRyrJSfMQwfEUVgmQn1AuG4gqSAEgxpX8onp5PFXHGKMxYm5OG7
         UBBOuenJfFILfQGTGE5nCmhhmvbb0urgpPUYPCHj2zuqDXOiiytgPMguYsTjiO6kVmhs
         tVJErupqo89pgjRuEuW5MXxOBhMPLuAyzBamk/kCn9YqJVisbEncV/NrcUcN4zfgJICf
         qXSSw5OEYMMFQ2f+lAHTskNNkaiYtJPAhjbrMS7DFqjWF6fDv/zkJgbVuVKl6AogGcYB
         2A3I3iMQtSVb6ClZR3eLwCCPHUzcRxyijQ69zOlcsvKmUdTp+Jj9mmd6KyJGt9AmyhaJ
         OzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699579255; x=1700184055;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p19gz0pvmUr9WwyXQ4dXMb3io5xq3Mq3immW42vKGSA=;
        b=MXdwchGVrzrVeqJLAurI3qbthPpCVddoCb7jY6nvWE5TxumCwAeH/CU1VorH7h+ZjA
         /zaV3hHsqCypUFLT/KN69dNsXRtXf05YToZcNovpQhAmwd/qApVOYIYGzFU3FC16moAR
         uTzQwrrKbfosLGvka1mLNJGSY+Yyh6Z5DOlamuZ8O5LWGethTXXotu4WLhPHwNS1Fjo3
         1ab1KJ8Zekc62dZ3iDKL/M+eFJtPy9UJjIcBkrhr/QZpgTM9GlscbCe/tt2FKOq8wGxX
         DWpZ4l5IJC4vcaKuH+yjc3X5eWmRaK+pFGL69bCOm79zqsukRX2t7XEBptjbuKuaOKy9
         /0Pg==
X-Gm-Message-State: AOJu0YxnXSlJfDn7OlVUBXgDeHQ00J02mz7FWknSS6VHMMT22FmINffs
	kgy6XOomlUkl/PezKGQ0mt/S/RWKhqs=
X-Google-Smtp-Source: AGHT+IHJ0r4yAOvNGpXC1FRzlIGK+8eo0klC+sVwn144QTgG7FDLhPZstcqrP9RPGfCoGih15HQ/WA==
X-Received: by 2002:a81:8382:0:b0:5b3:60c2:57ab with SMTP id t124-20020a818382000000b005b360c257abmr7002967ywf.19.1699579255088;
        Thu, 09 Nov 2023 17:20:55 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id u17-20020a056a00125100b0069102aa1918sm11253492pfi.48.2023.11.09.17.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 17:20:54 -0800 (PST)
From: JaimeLiao <jaimeliao.tw@gmail.com>
X-Google-Original-From: JaimeLiao <jaimeliao@mxic.com.tw>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com,
	angyanyu13@gmail.com
Subject: [PATCH v4 1/4] mtd: spinand: Add support continuous read mode
Date: Fri, 10 Nov 2023 09:20:32 +0800
Message-Id: <20231110012035.11313-2-jaimeliao@mxic.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231110012035.11313-1-jaimeliao@mxic.com.tw>
References: <20231110012035.11313-1-jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_172056_695146_3E38F011 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

The patch supports setting the "CONT" bit of the configuration
register and create spinand_continuous_read_enable/disable functions.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 11 +++++++++++
 include/linux/mtd/spinand.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 849ccfedbc72..cfc295f5e31b 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -193,6 +193,17 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
 
+static int spinand_continuous_read_enable(struct spinand_device *spinand)
+{
+	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE,
+			       CFG_CONT_READ_ENABLE);
+}
+
+static int spinand_continuous_read_disable(struct spinand_device *spinand)
+{
+	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE, 0);
+}
+
 static int spinand_ecc_enable(struct spinand_device *spinand,
 			      bool enable)
 {
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index badb4c1ac079..bb9288ffd898 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -154,6 +154,7 @@
 #define REG_CFG			0xb0
 #define CFG_OTP_ENABLE		BIT(6)
 #define CFG_ECC_ENABLE		BIT(4)
+#define CFG_CONT_READ_ENABLE	BIT(2)
 #define CFG_QUAD_ENABLE		BIT(0)
 
 /* status register */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
