Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C445C48BE5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 08:50:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27CDC6115B
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 08:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27CDC6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQqq8/P2Zf1mrqpeJD2ijU35myQH9jGjxtnz6IUCXF8=; b=1OCmyv8OYw0xQb
	9gtqS8xzS8TLocTkxkz/MuE6qWcTh1ke3f9bEum9C6RmSB2bBmZ9vz89gRjbl28f7GdIhfy0drAzO
	5lQiS6ZYlFSe/9zLUzaoQqynprBQfb5g7whjOBJWrpkdSmEz1KfoV9GYJ+p+0N1HMgUOzKCEsH8Vz
	0Mdp+31D7/H59z3kduieGi8m4cYj2k/+gs+u8zwelcKvCyCAlbldgEPG5hpUUBi1rD0hHToreCuag
	qMyOTv2DXFQ6H9g72yxN0CzWTOD962sRH/mROJF4iehtYsjMpiJAoA696wxqMQ27vn+PuXNnzNEQy
	XYa1PKy9rFUuZ4oW/1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltRFV-005RJo-RW; Wed, 16 Jun 2021 08:50:13 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltREz-005RE2-Uo
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 08:49:44 +0000
Received: by mail-oi1-x232.google.com with SMTP id c13so1722750oib.13
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jun 2021 01:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6t9z+8g9VYoKkGO+X+p7zMaJ+xGsaNtlDaja1yl3gWM=;
 b=g2JCZoL5uBhXUdxrHuT36ZX6dVjQm08z7SvtA+N1oCLkj8xW+qctyQYNxLGeIK54Zc
 Wpt9laUu+ukB+qgnnPnTSQjRDIBWFpNLD7Tlra5G+rSXh3LoM5A31TJgJTi6hrF1/jah
 83+XOvkv+msJYWy9c7KEiwluYaR6OGyeYzGNAyVHH7UVFQ/w8vsAAWusMHJVo7uA7gC+
 nt5pViR0Hzt6SWeaH+AhjhXFGT0lmiTB7tlOkNrMlV3rTaOVmkVjBP17VtKvYRs63pCp
 2+3WlBdbOi5Z5gP9TsLQLyWKoWZ4Qyg+E1Z2QJgNS0anM5TG3WxgfgNsi6DAt3KGnPgR
 J6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6t9z+8g9VYoKkGO+X+p7zMaJ+xGsaNtlDaja1yl3gWM=;
 b=JZ9NI0yZW5DGr+wwTsEEY0Zx7zSaOFL17HGJcLQ0d7K+2ZMutCDJ9Ka1NCP9rmudMm
 T3pSFQqZH4fpqxGRuNL/VgfzzJtUn5xqcofnIrcUxO+J1Jh+73tLd7DyrRaYjD8SyWzD
 5HUx3c5UQV+8R4sAYgSVgIZOvFmq0cEvb+rm7sguigPPEEgyougJozQ9POvjmkSJBn4l
 0kuBJ4uqcP7+VODN+CVmIYMB+YKYoKZazz9H7Dv+LwvjMqzDYS2u335hngUQZaWiiKxf
 gXd33xxD81nq0InTSm4IFjBuErOddnDSK+2kQgUASfRGXLQUltegrx0SX3MLR0tcQwNH
 4Cfw==
X-Gm-Message-State: AOAM531oqzQ7/Z/DDTSUmM87HsBjH1w32rALqTn+j17oSkIQfOlvlL88
 jrkIFgJTa2kf/luJkIXe6wWQM85uKn4=
X-Google-Smtp-Source: ABdhPJzU1eZvMZBpd9r/irPk/xkZV2r5hh3yNX+d1vbXCroSBm10hK4gxkjtSWANJ7fb17Jun6mvSw==
X-Received: by 2002:aca:b443:: with SMTP id d64mr2339179oif.68.1623833380825; 
 Wed, 16 Jun 2021 01:49:40 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id e15sm325272oow.38.2021.06.16.01.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:49:40 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v6 2/3] mtd: spi-nor: spansion: Add support for volatile QE bit
Date: Wed, 16 Jun 2021 17:44:54 +0900
Message-Id: <26c05c5f3169f66bb389c825cac1a36dc68008da.1623831222.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623831222.git.Takahiro.Kuwano@infineon.com>
References: <cover.1623831222.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_014942_035462_2D75CAA3 
X-CRM114-Status: GOOD (  15.17  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Some of Spansion/Cypress chips support volatile version of configuration
registers and it is recommended to update volatile registers in the field
application due to a risk of the non-volatile registers corruption by
power interrupt.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v6:
  - Remove multi die package support

Changes in v5:
  - No change
  
Changes in v4:
  - No change
  
Changes in v3:
  - Add multi-die package parts support

 drivers/mtd/spi-nor/spansion.c | 57 ++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 2dd692a7ff24..73ed587c5ee4 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -161,6 +161,63 @@ static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr,
 					    reg_val);
 }
 
+/**
+ * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @reg_dummy:	number of dummy cycles for register read
+ *
+ * It is recommended to update volatile registers in the field application due
+ * to a risk of the non-volatile registers corruption by power interrupt. This
+ * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
+ * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
+ * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
+ * also set during Flash power-up. This function supports multi-die package
+ * parts that require to set the Quad Enable bit in each die.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
+{
+	u32 reg_addr = SPINOR_REG_CYPRESS_CFR1V;
+	u8 cfr1v, cfr1v_written;
+	int ret;
+
+	ret = spansion_read_any_reg(nor, reg_addr, nor->addr_width, reg_dummy,
+				    &cfr1v);
+	if (ret)
+		return ret;
+
+	if (cfr1v & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
+		return 0;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	/* Update the Quad Enable bit. */
+	cfr1v |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
+
+	ret = spansion_write_any_reg(nor, reg_addr, nor->addr_width, cfr1v);
+
+	if (ret)
+		return ret;
+
+	cfr1v_written = cfr1v;
+
+	/* Read back and check it. */
+	ret = spansion_read_any_reg(nor, reg_addr, nor->addr_width, reg_dummy,
+				    &cfr1v);
+	if (ret)
+		return ret;
+
+	if (cfr1v != cfr1v_written) {
+		dev_err(nor->dev, "CFR1: Read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 /**
  * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
