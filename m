Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA78EC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Mar 2022 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRine8LUPyYuu3mXA3Po4yep2ih1DK/DGFn9URXbCFY=; b=pJYJrQMfZzjXCB
	DD+cCP5LQsrfBpwGncI9N9qfcOHLsNvGgZqjJY2AgCSoSClCfFKAk5UMSCLhdD8dxNZAR2YVlWRPY
	ITmhbBCeeIDUWfyPv9pZ1EBOGXHXYGCJ8Z/7UNOct6iycKsDRuFvjx34/kb1Unx3RG83l6lva9V/n
	FF+xny9/1lZC60wfCSgjD7myHnnZPTAkDETm0tkZzP7Yv9ng2n1uShZNWyrOfvWBH8N0j+8TDC2EE
	W90covT/aZ2YCJqZdvyBkiVVI5ENTbq3rD2kIvqPqxDSGKz+kL0/YyIKBN/odnRac9vRS9k8xQxQL
	7+wfuHgMkAd7RaUvreZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSaFM-00FRul-FE; Fri, 11 Mar 2022 08:03:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSaDw-00FRPi-3W
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2022 08:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646985728; x=1678521728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=03Y0LGNSh4nHd8tHQEheP0sJeffhKkrpkBLfPUYzZUE=;
 b=TBaFL99T+zZxwa/N1M6inRF3R8LCJ9Cc0iskRL4eeRTeHJ2c27AJa9vD
 Q9C5FKT/BlupAYVk6NjKgfrluDHzuRVmQL05GGZDsKKUpC0s9ziDHN0Ia
 78mKLX/RPTmZEZHbkHcU1ZNa1x5UDsFv91Nazvxa4UxaYFsT0pDQHQjC4
 g+5eTFDDVrqUPWPAGfuW7rsXwBkkZPBJlSh/Zil6Tm3djuK6jfPN6F8nz
 AL9RD2ffToQsCNNuh/ul374s6OZFj01eajfVVY3Aqfz9RnM2n1SQXHeHD
 ympTqaFahOVMOMwMjoVh8RDulYmLVsRZ1PlHhcPsj2HmFg07Qki7ioRzZ A==;
X-IronPort-AV: E=Sophos;i="5.90,173,1643698800"; d="scan'208";a="156090485"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Mar 2022 01:02:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 11 Mar 2022 01:02:02 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 11 Mar 2022 01:01:59 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <broonie@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <nicolas.ferre@microchip.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH v2 3/6] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from
 BFPT
Date: Fri, 11 Mar 2022 10:01:44 +0200
Message-ID: <20220311080147.453483-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311080147.453483-1-tudor.ambarus@microchip.com>
References: <20220311080147.453483-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_000208_213160_A03CCEB3 
X-CRM114-Status: UNSURE (   8.42  )
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

Parse BFPT in order to retrieve the byte order in 8D-8D-8D mode.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index f5432cbd3daf..e049851a57a7 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -579,6 +579,7 @@ int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor, bool enable)
 #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
 #define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
 #define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
+#define BFPT_DWORD18_BYTE_ORDER_SWAPPED		BIT(31)
 
 /**
  * spi_nor_parse_bfpt() - read and parse the Basic Flash Parameter Table.
@@ -832,6 +833,9 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return -EOPNOTSUPP;
 	}
 
+	if (bfpt.dwords[BFPT_DWORD(18)] & BFPT_DWORD18_BYTE_ORDER_SWAPPED)
+		nor->flags |= SNOR_F_DTR_SWAB16;
+
 	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
