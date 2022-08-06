Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B878C48BE4
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Aug 2022 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/m9MmT7h7abc9XTIpethR9WK8lC2GtXRKBlIpfiViek=; b=F0KXhZ72hLNqO7
	8qip44LJvcKrqzlb2L4aanngT7b68uYF3waiCsxLEGLYJMUHXAJlz8yD2gFvKNZfMuLtJrp2icqtu
	8S6PeXO8gP1LwlhI2k9+boRJgZ3waehHxP0ZObjPcfdh32qn32j5ctIWVeBL+4B7zA36I9leRT85X
	KBJgCtsbyAlzjsL7Y4vy2RItgEO2bUmfaP6xHAgs2H58u5KN9hQNMfCyNYVRUFgVO6qf2ct7T20Mn
	Eb8f8LXX8KzpIgyF4SWDnurcZc4D090T0335AZdA6lA7SDFsP6nyVaWgzI5lYxEtkZt8cTqVHL088
	wLpBttTxGXnYSBUbVgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPK-004nMM-PY; Sat, 06 Aug 2022 06:35:34 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPF-004n7a-KI
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2022 06:35:31 +0000
Received: by mail-pg1-x531.google.com with SMTP id s206so4358505pgs.3
        for <linux-mtd@lists.infradead.org>; Fri, 05 Aug 2022 23:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=UawiKQ7Z88aCESyY8UdMohdPR6wJoJgEBtIWtUPCe0w=;
        b=n5KtPk2xTiIDpC4eyetQWsm5LPhgCmy1IDEDeJKV5QJkavbMcQ1UVkkYYzRK6ddRPL
         WSZjvKHefIxNybx220JKIwkIpjQ28v8D38I8yqCiT/uTvdcXb5EjrDw9++egqJIbhp3O
         zyGl1r+LTMJXx9Rz1UFjcXj2Yxm+1jtqpCZSr5GOw4h3rg5C712A+/kumwHXhR+5E7cm
         Xj2j/QACwY/LmcsJg/gGzeS+QYHWq1PeZGweO6vfsHlJuyOhg7krTm74cJX4pb3GxDOL
         7WdrNVgmviAxT0GkhAjXPK+BzqnZCJcBZwCia6mqIjp2hWrOzq3L44tSYPDzYHvMcS8x
         cxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=UawiKQ7Z88aCESyY8UdMohdPR6wJoJgEBtIWtUPCe0w=;
        b=UUXVBL/m0ubZMpMCrihwPn6DVa0AKnx3AsmX0Gobnk64QuKzJtSdKR7Z9kEIVLiX+d
         pR/MxnW3QJo8fyrd/pGkd7kboIg1A/74cZyOBb2c4IWogIdovJAIK1CxcazwCnc2EghO
         dMm+7grwN1atdjKdOocMbYCAX+H44xz4WnAHredNimRzPHabKPucHBMtDjwbNkAfBspA
         5f10TYzNWEi0UNSzwaRuKWAkocQyJhadtexfwAdT77+snuysikSVVNqscFPnDP54qDUt
         6uThiUuowOSXFxeR1FZQCF4g67sLIr6puT75VzWFdOjBUMnaylR8JsiHI1YilGpTE032
         Jycw==
X-Gm-Message-State: ACgBeo0Cz4oznHX3iDKZeXwsFEnouoY0J9hl40RpgjNrNkZmeU29G02Y
	E4gu/jWV9wy89ypyqcxJdLAMINFiB6j1fg==
X-Google-Smtp-Source: AA6agR6pvAPO9sl12Ux7z2XqBqeA69awxS+GDI+QLCq6n6m7zikVefAwqV/96/b+NnhLIgMXEQpgng==
X-Received: by 2002:a62:5f06:0:b0:52e:f3a3:ffee with SMTP id t6-20020a625f06000000b0052ef3a3ffeemr923270pfb.79.1659767728645;
        Fri, 05 Aug 2022 23:35:28 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a18-20020a63e852000000b0041b67615584sm2418452pgk.68.2022.08.05.23.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:35:28 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 3/8] mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device
Date: Sat,  6 Aug 2022 15:34:21 +0900
Message-Id: <5e4fd3a945851282986f19041caab4f1058c28a4.1659764848.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_233529_691876_1B3EE258 
X-CRM114-Status: GOOD (  15.04  )
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

SCCR map for multi-chip devices contains the number of additional dice in
the device and register offset values for each additional dice.

spi_nor_parse_sccr_mc() is added to determine the number of dice and
volatile register offset for each die. The volatile register offset table
may already be allocated and contains offset value for die-0 via SCCR map
parse. So, we should use devm_krealloc() to expand the table with
preserving die-0 offset.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 64 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 3d612dc4c63c..8ef3b11fae49 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -26,6 +26,11 @@
 					 * Status, Control and Configuration
 					 * Register Map.
 					 */
+#define SFDP_SCCR_MAP_MC_ID	0xff88	/*
+					 * Status, Control and Configuration
+					 * Register Map Offsets for Multi-Chip
+					 * SPI Memory Devices.
+					 */
 
 #define SFDP_SIGNATURE		0x50444653U
 
@@ -1242,6 +1247,61 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 	return ret;
 }
 
+/**
+ * spi_nor_parse_sccr_mc() - Parse the Status, Control and Configuration
+ *                           Register Map Offsets for Multi-Chip SPI Memory
+ *                           Devices.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @sccr_mc_header:	pointer to the 'struct sfdp_parameter_header' describing
+ *			the SCCR Map offsets table length and version.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
+				 const struct sfdp_parameter_header *sccr_mc_header)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+	u32 *dwords, addr;
+	size_t len;
+	int ret;
+	u8 i;
+
+	len = sccr_mc_header->length * sizeof(*dwords);
+	dwords = kmalloc(len, GFP_KERNEL);
+	if (!dwords)
+		return -ENOMEM;
+
+	addr = SFDP_PARAM_HEADER_PTP(sccr_mc_header);
+	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
+	if (ret)
+		goto out;
+
+	le32_to_cpu_array(dwords, sccr_mc_header->length);
+
+	/*
+	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
+	 * additional die. Hence, length = 2 * (number of additional dice).
+	 */
+	params->num_of_dice += sccr_mc_header->length / 2;
+
+	/* Address offset for volatile registers of additional dice */
+	params->vreg_offset =
+			devm_krealloc(nor->dev, params->vreg_offset,
+				      params->num_of_dice * sizeof(*dwords),
+				      GFP_KERNEL);
+	if (!params->vreg_offset) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	for (i = 1; i < params->num_of_dice; i++)
+		params->vreg_offset[i] = dwords[(i - 1) * 2];
+
+out:
+	kfree(dwords);
+	return ret;
+}
+
 /**
  * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
  * after SFDP has been parsed. Called only for flashes that define JESD216 SFDP
@@ -1424,6 +1484,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 			err = spi_nor_parse_sccr(nor, param_header);
 			break;
 
+		case SFDP_SCCR_MAP_MC_ID:
+			err = spi_nor_parse_sccr_mc(nor, param_header);
+			break;
+
 		default:
 			break;
 		}
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
