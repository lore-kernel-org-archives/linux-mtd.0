Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49287C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 09:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFnQcfiw4AXtHwOWUnY3Yg7159TOeu8Difrm9H/v6mk=; b=EegFT/a3ZyHbsW
	6kXRkHH5ZUPTqlnm5fOZ4xs1jBfU715cHF349BIbk33WBhypaFCB+1VSq/l8I/AAxcnV7T5D/AtLG
	a20vRw1QeVmfThJiDNkBUzfDSWqWKbn9NKIw/tgwHcHCX59J2ud248fHb3P4jWwEs+h2vNrNFfXGn
	EusZ3WhUD5L7Xv+ZkBUrdRomwgeJmaRirUYedNhfwfON7V+g6l5Tiib9FSJYlkdPuaXKmWBnA6p7j
	SeUpmcM+01BCbvvyNN1pGk952kBe4vlD3JVD0u3507gi7BtDJP6rDCEYLzzaJAD4s2lGf3BAqJxtD
	KOyf1OPb/HZfsH8nS3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHj0e-00Gpbj-6t; Wed, 09 Feb 2022 09:11:32 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHj0O-00GpWv-Ua
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 09:11:18 +0000
Received: by mail-pf1-x436.google.com with SMTP id n23so3239475pfo.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Feb 2022 01:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vYQ3qmBsUBBWukYgWOX47J3VTcS049l1JBTLYJxad4Q=;
 b=G2ygqhna6VCaUJUJsT6n/YpBTFX8V3ZvUQTyqr9uG366AqgtvX0mbsceNwHncBGk0g
 JND66Vr+LBWmGCiCnCEOKttrVorQZflLQPIzdOrkBlkAuOR+3pQyIxU1cB/0eekAeQHg
 fV3oM2n0Gsr4UTbjUimagrtxUUQ4TiIAiAViN66UwZqjAcxc1ZvIDoF7Oty8XOu9dV+q
 QnRb6autKEsj2/wM7nk5csNlulptvUFOLD2nVmZ1mSQFFIgGfnrbsj+DQTbaXmuZZJ6+
 n1fl0uJ1ssDZBUmnPS8BN/C6q+CahRJWQxyyohiO5pQzAlVes68bGa5xyLW7rffLCgE+
 6ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vYQ3qmBsUBBWukYgWOX47J3VTcS049l1JBTLYJxad4Q=;
 b=n1wLKZCq0OdefACHhD4y7kOCsiZQHV91/HWkym+lJJz23e20PwKsCTdpK0mQ9VRBEq
 7UYublLoMNwvs9hdXUAJqRsJL7DzWKCU8dzqnT2XnURJj8YwKxF3nRYl1W24OCeo248Q
 9xhRDhccreVU/w+usg8DuYjfhoMcqGsabl5g+6z61nffnw5bGOodnQSiwHHDYaVCCfMF
 F63vqMp9LJ9NVtFgpTlAuj1z6xBNLfeIfKnB/C3Y5lbEtU08wI0WPAvyH9nTFB1PyHUX
 Y59IqCRZdVHv88XwSylBJg+3StFNKQM/oGdHY7xJ1frIjH7myyPPEB37NOFFbbUlZso5
 qfGQ==
X-Gm-Message-State: AOAM530jJFZoG9MMe9Hv9sw6XhhOhqnWcduuFdBSx0ojm6ocCpzF2YH8
 V6NE/NHV/Lbc3sjhiw4RPv4=
X-Google-Smtp-Source: ABdhPJzf1+/SHv4u2Fcabaa6UVKI9mlMb9LOAM6PXAHrKOpyIvcL4LHIDMRNp9nuRcH7m4D/2XRfgQ==
X-Received: by 2002:a05:6a00:218b:: with SMTP id
 h11mr1231424pfi.29.1644397876241; 
 Wed, 09 Feb 2022 01:11:16 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.googlemail.com with ESMTPSA id v2sm5270643pjt.55.2022.02.09.01.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 01:11:15 -0800 (PST)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v2 1/4] mtd: spinand: Add support continuous read mode
Date: Wed,  9 Feb 2022 17:10:19 +0800
Message-Id: <20220209091022.30155-2-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220209091022.30155-1-zhengxunli.mxic@gmail.com>
References: <20220209091022.30155-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_011117_015910_265CAFBA 
X-CRM114-Status: GOOD (  10.77  )
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
register and adding a continuous read mode flag for identification.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 11 +++++++++++
 include/linux/mtd/spinand.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 2c8685f1f2fa..dc2e1dc1dbee 100644
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
index 6988956b8492..04be10ec8fb0 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -154,6 +154,7 @@
 #define REG_CFG			0xb0
 #define CFG_OTP_ENABLE		BIT(6)
 #define CFG_ECC_ENABLE		BIT(4)
+#define CFG_CONT_READ_ENABLE	BIT(2)
 #define CFG_QUAD_ENABLE		BIT(0)
 
 /* status register */
@@ -307,6 +308,7 @@ struct spinand_ecc_info {
 
 #define SPINAND_HAS_QE_BIT		BIT(0)
 #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
+#define SPINAND_HAS_CONT_READ_BIT	BIT(2)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
