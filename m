Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A044C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NxXaL4utFWKmK9doSG+V/1LN7hxsGscf8JMwaQqHuk=; b=13pOMmKSTA3/De
	LMn1QsQjowy2J51axH2VjwVIGvrasMmXAhLEmbcyfHGIR2TQyOhrqwjZaodc6cQBYS+b9YIv7EOo5
	TBTRN5wnBvO8MuwDNHctwJeQYoH5IulbsyYOlKpwnZiio451kosaC6v8lt8QPLIrFCPodw5EMe6KP
	urxqLaYgGNOaNVzxN2HQ5MOGvTzF27H+X9Mwcyu/JXHqUaUSfU3mwRKqS8JQR5eNQy694614e3Jpc
	dkkmklZR7q/jnnMyaJ6PZCWeh1VBTDjuxddORAQqN9Oh9bXNC4Iin5xUZTY4QzbpGT95eIq6kiPAU
	cdBodP9/bF9JWmHBKXYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7gh-008cxj-Ga; Wed, 20 Apr 2022 10:35:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7fo-008cKc-84
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 10:35:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650450900; x=1681986900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CgU0M9Ctm66tAtz7ZrqfIj4aDO8PJLE7JPM+0GAyffk=;
 b=jeKx6QrrWKZS1S17pJQB3J6I9Xved143wqexzE/cfOWDR51WbQzYBepj
 zlCClAzvfWuQIb1J0if2KGzAGu5p2UeyE+coFG8sqPvL31VavT/aUciw6
 0q9uxQwxRkJrHALZ7jcfXsIx9bd0wg/HjGu3w/VRDQVkHBqE+2qpIg8Ai
 NksXN5YfeVFvT8l1s4ILnf8d+Kxy8ze1Wx+Rim9mlpyKcmPzyY2lydV5+
 aHMbGfLGFJk58nCCk/JUo9ygAjjzO3AVl85mqoeQ3bk5RNR8ZgtclOtId
 IrhPFkcWRmzzoKhRrUIDRffYhZjDv8trlgCIVbkA6dusGiLfaigwsJ7Px A==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="170245898"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 03:34:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 03:34:58 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 20 Apr 2022 03:34:56 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Takahiro.Kuwano@infineon.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 11/11] mtd: spi-nor: micron-st: Remove status polling on
 volatile registers write
Date: Wed, 20 Apr 2022 13:34:27 +0300
Message-ID: <20220420103427.47867-12-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420103427.47867-1-tudor.ambarus@microchip.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_033500_370735_D0083868 
X-CRM114-Status: UNSURE (   7.76  )
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

Writing volatile registers are instant according to Micron and do not
need any status polling. Remove status polling on volatile registers write.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/micron-st.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 61db4896e327..a96f74e0f568 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -58,9 +58,6 @@ static int micron_st_nor_octal_dtr_en(struct spi_nor *nor)
 	op = (struct spi_mem_op)
 		MICRON_ST_NOR_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR1V, 1, buf);
 	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
-	if (ret)
-		return ret;
-	ret = spi_nor_wait_till_ready(nor);
 	if (ret)
 		return ret;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
