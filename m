Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A17C2FC14
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 12:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IJa36p0bcEYBi7wZM87eaUlsFjh3OW0cbyhSRFQ9ajE=; b=091Ky0aJVteksB
	Krz9s6GN83rYpVRen+qLW5N4Is8e2LDrOCHMYGoPdI4VKMLU10OUWmiBAdiK751j6EXnCK7ee522a
	D3WX6myT923awnvwILOcGozSGVpwxv/uwsyumMp9RhJWpjftYhAvqJIN06OHxa6qHgSOl7NaHicZd
	0iUAkNF3t9nQWNAtrVm4473aoITNKi1Cidr8vxETL1GmOk2JhLhX63Bzreb75JXn7XtSHKHhpI7gr
	/SpfKpapcZ73m74o3etcSrvKZlQAIoIbE4noK0lpq7L0GeNB1rLJ7VX1cgjss10Q8IEtnRl2eqouZ
	NRWkqc71dKigkHVXiLKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcPD-006P7Q-1S;
	Thu, 17 Aug 2023 12:47:15 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcPA-006P77-0P
	for linux-mtd@lists.infradead.org;
	Thu, 17 Aug 2023 12:47:13 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-790a590237aso317964439f.3
        for <linux-mtd@lists.infradead.org>; Thu, 17 Aug 2023 05:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692276430; x=1692881230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jk/x1WgPO/AlMa1TTiVO596GRM+JBKXZoRvmU4Nx+SQ=;
        b=q5ZI/jzS1YDFzzHjNHY4qdZ5/p5A7NA0HOFUM7zornF4rCxZ/fyV5MfQrozc/v/odd
         /jKLtQ88oeyUSXMn8Smx6x/2+s1NISGVDv76WNsH7Y16oo8o8wiuT5Y+qGBiajxpAqYA
         rNKxrr9yN1LaqbynUkFNFpPeWsLwVc9U3KWZDMJpAskF+IYL065KS2xC/UxT2aq+lkKJ
         nEOPhfFAp69Z+gR2/haCvaEY057U6q2LKUd2Q179UyzyjJkDWKImyA6zZ62C3D8cbxX0
         21zXqlZ02MxY4KOrmXP6O9nPfvhhj/nQX+HrcOQXFTncZpDBEwD9wa0ZLmZ9m4QGIfpN
         wpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692276430; x=1692881230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jk/x1WgPO/AlMa1TTiVO596GRM+JBKXZoRvmU4Nx+SQ=;
        b=bcp9Hcf/AfCOErRAkPbZNCJEZkwxdNHcy/cewsObC+fC4pAliUTebQVd+VQcVDREzA
         pKnHsQ7fXXaqkHsDr1UKZKQeb0oApI4W0PYY6+XkGLemuyYCFKxz7aE3wWkO6tXsYYox
         ij+jel0h2hfminDiPK3559P1+Rze7EXjvWXHVFtFJ93WtCBfP3I+Jlrz7mZSe5GnG+Hn
         rWrjUdqUbNR5VpsxjzxnZfBIax38/8yHC0NVaHSWkGlnhKNlslwpnDiulGOD/kRWbOPn
         8wmibHyBdVRwZdjB8apRl68pG5QFJnkhjBBu49vBGTeBPF9Vu6UYjfNbM7/MgEH30b4A
         aaBQ==
X-Gm-Message-State: AOJu0Yy8SfP1YIaPVZgfDqJ0M/oTr+hds4adCPGZMILNPxmtOLggizW/
	M5OIyom4AgGdpB15NiCfdyblcZxreJS0AA==
X-Google-Smtp-Source: AGHT+IFyMdjNuba+cK+Tk0k2tfQFtaprGC7v/D47Z+GX9417vdcqElKKValjw/t+I7StSEJHzhmsCg==
X-Received: by 2002:a5e:c206:0:b0:787:953:514b with SMTP id v6-20020a5ec206000000b007870953514bmr6339586iop.3.1692276429771;
        Thu, 17 Aug 2023 05:47:09 -0700 (PDT)
Received: from sun-virtual-machine.localdomain ([103.149.144.245])
        by smtp.gmail.com with ESMTPSA id s18-20020a02cc92000000b0043167542399sm150505jap.99.2023.08.17.05.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 05:47:09 -0700 (PDT)
From: SSunk <ssunkkan@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SSunk <ssunkkan@gmail.com>
Subject: [PATCH] Add support for more XMC series
Date: Thu, 17 Aug 2023 20:46:55 +0800
Message-Id: <20230817124655.13023-1-ssunkkan@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_054712_188764_B582F57F 
X-CRM114-Status: UNSURE (   8.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add XMC XM25QH128C/XM25QH256C/XM25QU256C/XM25QH512C/XM25QU512C
and set the parse_sfdp flag.

Signed-off-by: Kankan Sun <ssunkkan@gmail.com>
---
 drivers/mtd/spi-nor/xmc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index 051411e86339..b2374187ec4f 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -16,6 +16,22 @@ static const struct flash_info xmc_nor_parts[] = {
 	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	{ "XM25QH128C", INFO(0x204018, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XM25QH256C", INFO(0x204019, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "XM25QU256C", INFO(0x204119, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "XM25QH512C", INFO(0x204020, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "XM25QU512C", INFO(0x204120, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+
 };
 
 const struct spi_nor_manufacturer spi_nor_xmc = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
