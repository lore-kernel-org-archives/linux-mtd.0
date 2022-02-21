Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A93DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 09:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EN/g9RnMhcxZ1CcUjj3GZN/q0seELw3hkg0uTx9yHkg=; b=C5UFVmUev1u/9V
	vnfQ1i4ZQQYBrIPcRiyspI88XcBQILqWC/CjCJLFTSbhpyhThMnhE0uu9MNcEVq0i1nlskrzAgf/O
	I8WeMuCyaSNTmDBZZ9Adj1F44qvH+gG7e99pz5ZYoty/tk14ReAJgEUdMLVBeasD6LabfJau5A9QY
	nDpuGGXCmMr+F3Aqxp1gsXcZs+o+7tcxRFsWBIo72QH5w+64dIpbE/kQZpErGHLe/YF3p3a0bsE+T
	oPhofgzU3tEBvzGedU8u3HH2JbOhdL2qQ1z6tu/IBTp3HDRN7sua6v64uJS+EKZAEuJytUs2BvQls
	k2VM6w3fHXvrkI5n4SPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM5Lw-004ga4-Vi; Mon, 21 Feb 2022 09:51:33 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4RP-004QrX-8J
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 08:53:16 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D92182244E;
 Mon, 21 Feb 2022 09:53:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645433585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUHjRq3B/3JjsHlcHc+UiOV+3YaaqpA1vvTF3QO9238=;
 b=vdfH/OvhQyTtwC7He9ScJnyd+hVKg502zpZwWK34kxIcgMP0SxIGP8BhTIgvCVWWLJCHHe
 oQUV7aizVde26VPe6G697TxbT5s7W70idQTy+ege+PTyAYPzNPiobRAUdNvLGnVgqp1cV1
 1rbI8OCpMMoPn1Y5g62uo7PChgcULbg=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 32/32] mtd: spi-nor: renumber flags
Date: Mon, 21 Feb 2022 09:52:36 +0100
Message-Id: <20220221085236.1452024-33-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221085236.1452024-1-michael@walle.cc>
References: <20220221085236.1452024-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_005307_553045_281ACD01 
X-CRM114-Status: UNSURE (   8.89  )
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

As we have deleted some flag, lets renumber them so there are no holes.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2130a96e2044..b7fd760e3b47 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -12,20 +12,20 @@
 #define SPI_NOR_MAX_ID_LEN	6
 
 enum spi_nor_option_flags {
-	SNOR_F_HAS_SR_TB	= BIT(1),
-	SNOR_F_NO_OP_CHIP_ERASE	= BIT(2),
-	SNOR_F_BROKEN_RESET	= BIT(5),
-	SNOR_F_4B_OPCODES	= BIT(6),
-	SNOR_F_HAS_4BAIT	= BIT(7),
-	SNOR_F_HAS_LOCK		= BIT(8),
-	SNOR_F_HAS_16BIT_SR	= BIT(9),
-	SNOR_F_NO_READ_CR	= BIT(10),
-	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
-	SNOR_F_HAS_4BIT_BP      = BIT(12),
-	SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
-	SNOR_F_IO_MODE_EN_VOLATILE = BIT(14),
-	SNOR_F_SOFT_RESET	= BIT(15),
-	SNOR_F_SWP_IS_VOLATILE	= BIT(16),
+	SNOR_F_HAS_SR_TB	= BIT(0),
+	SNOR_F_NO_OP_CHIP_ERASE	= BIT(1),
+	SNOR_F_BROKEN_RESET	= BIT(2),
+	SNOR_F_4B_OPCODES	= BIT(3),
+	SNOR_F_HAS_4BAIT	= BIT(4),
+	SNOR_F_HAS_LOCK		= BIT(5),
+	SNOR_F_HAS_16BIT_SR	= BIT(6),
+	SNOR_F_NO_READ_CR	= BIT(7),
+	SNOR_F_HAS_SR_TB_BIT6	= BIT(8),
+	SNOR_F_HAS_4BIT_BP      = BIT(9),
+	SNOR_F_HAS_SR_BP3_BIT6  = BIT(10),
+	SNOR_F_IO_MODE_EN_VOLATILE = BIT(11),
+	SNOR_F_SOFT_RESET	= BIT(12),
+	SNOR_F_SWP_IS_VOLATILE	= BIT(13),
 };
 
 struct spi_nor_read_command {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
