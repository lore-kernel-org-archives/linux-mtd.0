Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD539C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 05:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0rPhsz+6jzqiYagabaccARwYS2UwKAg6Ne092nYv5I=; b=Xy5S53+Fmnlkf/
	BQXWMUbh87B+dv9dd0cMmVynF5n5gAHsIamdUsOFRAGcVPqSVCGUEu9FI15vmdYkYUeVlYL0R6qUe
	Rv0tLGM0WH+/2d5GUhPbxWi/0mVirk97r76jW/wbFMwJR8SFCShGSgksrwCPvqDVbLepP7TFl6+Mw
	m3t1LNyChir/R7mGjTCqmS7Z8wHAMa5HMrYzlhLnmKNvVddDZqF8dv/5QejSZ9FrbSBnWAhyVt+OV
	4OwnFJgQ7q7/yVhcZAe5grQS/9ftXi1SvuOkLK48/FT0oS4RsjXkkXuxWvrbYyO+ysbILyOzmyu7W
	WK210DAy85wC5s8vg63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngK8v-00Fhv9-4H; Mon, 18 Apr 2022 05:41:45 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngK8r-00FhuF-1U
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 05:41:42 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so16410763pjn.3
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2022 22:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7I7uDRrPR8VHkwn/mNcVo1+lBhcbYIKhBuJLPR1wI6k=;
 b=WIgc57hAIRYeex4K4yzqbjThP7dXy0/JIHveKVnHC1eqUQ8wKKQI56zbxpNHiwZzD1
 tnZPskWL9XpxJSUmcz8OwMiFWyQejywcI1G25NrVwB1nS9GMN5aDWXuTImh2wiqZpCZB
 hODCc7lseBqnZU0whPXVaRMt8TRPMpUchsBgqtAC/N9iwKET42kss5ajz0jz4ChmQUjQ
 iXvwlG4EWRvNBJ+uNej6JGXLmQVayl4ghldo3n9GoyPd+0Utq1yBnK7B4gX3zeHS1Guo
 VAUXeds+wkZfQvYG7C6UWSS2KyUwWBI+ValjabI0PEvJb/GqlPxBBxFeyAHNzBrWZph2
 I2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7I7uDRrPR8VHkwn/mNcVo1+lBhcbYIKhBuJLPR1wI6k=;
 b=t3qLWD06m0PQEorEuebWblGS/t8nq2/KLqi6t/VYAuy8HjqAyIJxAulDweRtoz9jmd
 YJmt/TYhyuoX2vMU1ki9CBWGza163ChkADw8OsbtSp8PoDdYc2Pu/mi58e4LZOeYQnBa
 6IC+r2zEdoL5KaJ1SYmrQYd68/FE5oUajfjxyPSHRJCufbXBES2ttW0DaHVkkVDbVmYu
 5OTD0rZF8g0aI0eaLn7qVuj6G+JMZwZTT2xzkoLqieAqBaQCjQGt9aoiP3M/cTY1sWyh
 2IxH2hTULNtccPQftHu2HulXfEcq/7FW6UNhXTdozGQJmsG1W5iUuN33Vzf6Q99egKxg
 MzYw==
X-Gm-Message-State: AOAM530DZFAHtz8m6BHl9GtfNvMopZcwoGypEvthLPh+3JovMQMPIQB2
 41bqy91aniZepfdcS86CmTGv0YYizwQ=
X-Google-Smtp-Source: ABdhPJzopcwtrVJ0Dx5JI6zHBjLqJryQkzUYpz9QqaUPq9SrRBlGlWYyyr7CPi/FfT5Z0tQRB0eEbA==
X-Received: by 2002:a17:90b:3b8c:b0:1c6:eb72:24b4 with SMTP id
 pc12-20020a17090b3b8c00b001c6eb7224b4mr11248539pjb.171.1650260499876; 
 Sun, 17 Apr 2022 22:41:39 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 f12-20020a056a001acc00b004fb37ecc6b2sm10810873pfv.29.2022.04.17.22.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 22:41:39 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v11 1/3] mtd: spi-nor: spansion: Add support for volatile QE
 bit
Date: Mon, 18 Apr 2022 14:41:14 +0900
Message-Id: <92241a7f523474d477a17437c8b6c926b29da4ab.1650259501.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_224141_134255_C3A6A92D 
X-CRM114-Status: GOOD (  17.28  )
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

Some of Infineon chips support volatile version of configuration registers
and it is recommended to update volatile registers in the field application
due to a risk of the non-volatile registers corruption by power interrupt.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v11:
  - Rebase on top of Tudor's series
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
  
Changes in v10:
  - Remove dependencies on other series
  
Changes in v9:
  - Rename function per mwalle's series
  
Changes in v8:
  - Use spi_nor_read/write_reg() functions
  - Use nor->bouncebuf instead of a variable on stack
  
Changes in v7:
  - Add missing macro definitions in v6
  
Changes in v6:
  - Remove multi die package support

Changes in v5:
  - No change
  
Changes in v4:
  - No change
  
Changes in v3:
  - Add multi-die package parts support

 drivers/mtd/spi-nor/spansion.c | 60 ++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 952db7af6932..6bcd25180af4 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -14,6 +14,8 @@
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
+#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
 #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
 #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
@@ -117,6 +119,64 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
+ *                                      register.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * It is recommended to update volatile registers in the field application due
+ * to a risk of the non-volatile registers corruption by power interrupt. This
+ * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
+ * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
+ * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
+ * also set during Flash power-up.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	u32 reg_addr = SPINOR_REG_CYPRESS_CFR1V;
+	u8 cfr1v_written;
+	int ret;
+
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width, reg_addr,
+					  nor->bouncebuf);
+	ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_width, reg_addr, 1,
+					  nor->bouncebuf);
+	ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_1_1_1);
+	if (ret)
+		return ret;
+
+	cfr1v_written = nor->bouncebuf[0];
+
+	/* Read back and check it. */
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width, reg_addr,
+					  nor->bouncebuf);
+	ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] != cfr1v_written) {
+		dev_err(nor->dev, "CFR1: Read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 /**
  * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
