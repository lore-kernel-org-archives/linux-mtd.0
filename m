Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C9CC433E6
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:55:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9ABC2075A
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9ABC2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t6rm6vnCSTGuM1EOkm+kZVepl+8mdcvFc4FEagcKVdo=; b=D9N0La2CNIDimGK+ON8Ty6SVh0
	tEa7Skn/C2B0uOtQf/O+7866CbFsP5306Ts3oMVb0KIDkvMVocS+oGTf6ksO41mbNAUBjNUwBcHkG
	r0Ba7lEwte/I+W8yAC59ZB+JR64Jhu8Ct4ZJwF7UKV4OYij1uFTJXqMRPTIsbsN2tpZMEhnHWstc4
	oXdlY890phQyCfZ9IBpCyEUHmMPz43OQeCMVmGg1MVARh9PyEd6QqaJeuEv/QV+aWyjWSJuimqk77
	W6YA9ov5o/ik6GOcGfCUR24sWcxvHg03zgQPASvQ1AhW5GD1FS1MG0LC6VrnO3mLaSZnnJxzJesZW
	r9qWQDBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2B82-0003fW-3j; Wed, 20 Jan 2021 10:54:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2B7z-0003ek-SI
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 10:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611140060; x=1642676060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aliZpbXwdSq+2UfP/Nh/YrgrrUiKC+TOU0haLUWsHKo=;
 b=VDX5GrMNM0RH7m+VpjfaxE9TLRAweGi1HsitA9wLc3Ay/Z3L6rGdieG7
 F6Lf2AoKGrWTAx6DLSzKTwaP1D6t65utzcVyfhCUAqaVfD7owynSYP/1o
 +oWtDhuG3E4VPbr4ZazuIQynGz4l5sUgWFohFjx+17XIbuVLkqhZJViKV
 rG6aQDVY6x0ALiKTp9NXiGhVgwJwrbWVe7o9j1mL2WzJK/SfrUQD5B0S0
 1Na/VV7COTz7Eq8XDXW5/35pcRLSo+1J9z9xuibFMuiifLcohNsGKydPM
 hCvO7mQM+fwA2Bv96NrfdGUGR4r7sLYxdzHotAiE8pf7qJ1hYpU3TbnZc g==;
IronPort-SDR: zPF+Ww2LBpu5GtsWbdiVG/lOvuTT6VGcNqZDC1RahCeTu2Z2VwfPORFaskoKlfZDZ802WFJKQH
 67GSpyzGnH/Eh9+DGLfEqyVlOYX78cjD85jz+lLTMcAbCmWXgFanY0QFZfwlLrAb/wdo3u23Pt
 t0Xnp3UizDOFISqU+jq68ZXqRAY8opVcV23TYkrm9utUjMvnMGIH4pk6iVBXhAybnXPMFUG1d3
 yYTFy2Nyylqmf/KnQibPLm+PfAYuL9lnuNbwiZk3jwI/GK66lvks6eNwb1H6VF11Gybp+//1IE
 qLk=
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="106088527"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jan 2021 03:54:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 20 Jan 2021 03:54:17 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 20 Jan 2021 03:54:15 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>
Subject: [PATCH 1/2] mtd: spi-nor: Add Global Block Unlock command
Date: Wed, 20 Jan 2021 12:54:10 +0200
Message-ID: <20210120105411.254890-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_055420_270421_F3C58098 
X-CRM114-Status: GOOD (  13.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Kavyasree.Kotagiri@microchip.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Global Block Unlock command has different names depending
on the manufacturer, but always the same command value: 0x98.
Macronix's MX25U12835F names it Gang Block Unlock, Winbound's
W25Q128FV names it Global Block Unlock and Microchip's
SST26VF064B names it Global Block Protection Unlock.

Used in the Individual Block Protection mode, which is mutual
exclusive with the Block Protection mode (BP0-3).

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c  | 35 +++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.h  |  1 +
 include/linux/mtd/spi-nor.h |  1 +
 3 files changed, 37 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 20df44b753da..cb275608cb7f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -853,6 +853,41 @@ int spi_nor_wait_till_ready(struct spi_nor *nor)
 						    DEFAULT_READY_WAIT_JIFFIES);
 }
 
+/**
+ * spi_nor_global_block_unlock() - Unlock Global Block Protection.
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_global_block_unlock(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_GBULK, 1),
+				   SPI_MEM_OP_NO_ADDR,
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_NO_DATA);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_GBULK,
+						       NULL, 0);
+	}
+
+	if (ret) {
+		dev_dbg(nor->dev, "error %d on Global Block Unlock\n", ret);
+		return ret;
+	}
+
+	return spi_nor_wait_till_ready(nor);
+}
+
 /**
  * spi_nor_write_sr() - Write the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index d631ee299de3..eb26796db026 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -434,6 +434,7 @@ int spi_nor_write_disable(struct spi_nor *nor);
 int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
 int spi_nor_write_ear(struct spi_nor *nor, u8 ear);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
+int spi_nor_global_block_unlock(struct spi_nor *nor);
 int spi_nor_lock_and_prep(struct spi_nor *nor);
 void spi_nor_unlock_and_unprep(struct spi_nor *nor);
 int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index d13958de6d8a..a0d572855444 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -53,6 +53,7 @@
 #define SPINOR_OP_WREAR		0xc5	/* Write Extended Address Register */
 #define SPINOR_OP_SRSTEN	0x66	/* Software Reset Enable */
 #define SPINOR_OP_SRST		0x99	/* Software Reset */
+#define SPINOR_OP_GBULK		0x98    /* Global Block Unlock */
 
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
 #define SPINOR_OP_READ_4B	0x13	/* Read data bytes (low frequency) */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
