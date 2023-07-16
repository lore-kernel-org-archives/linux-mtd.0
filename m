Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC0CEB64DD
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfMRcI6YyR0Om2qto73sAwbt98/isfvANCqHGH9BUNg=; b=f+3yjfrm/imzlu
	q3yhpUpVcvQ70r9aOzCrksMc4+TTTG+dkIquwCIeZQOSnhY7mjaEIiNHjQ5uzEm3UVXIVvWNDz1O8
	wF1xpixrhg04IMdRQWgYgs0L1MdgixIPpATbmN4v3bpqPcRy1cAsvPWuLmW84dbJsXLOl2Bc449SY
	7bCYkS/pQDSLuKvUrhX0vHtG8HoSB/NtO3R0O9lrL5BMg3AX3jNGjVj/RkA4cF7yriBgYilBfg9kN
	Ojgx0+R0KqPZcG1OhJpVhYnjwMxr+HJY1yg29ebTa2VvuUcA1DPPOLv7kuAz0iykPXY/pBwDH+hiG
	ZuGpflz01eRy1pFZPa3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL31B-00ByyG-2b;
	Sun, 16 Jul 2023 14:46:37 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL30v-00Byjs-1j;
	Sun, 16 Jul 2023 14:46:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F116AC0005;
	Sun, 16 Jul 2023 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689518779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3SWgOLInqmVbEY8Qveknydd35Qsegexl/SidsCbK9Zo=;
	b=ffFJeQxHZWmFo0AirTkV03vaUKqL+Bml/PIKxsT1qG8XEf5Z8h3G01S6Str1cwX0ybDlsp
	fVCT3xHuu1vfv85TyZ/vSivzNSI/NRBDHpTAoG0hglxSVvcPdvmYMHfihLZ0ootQ+HfEbw
	DCXomRuvaNstchrR6pPie2153mM2ZiT5ghl/5+eWE/Xlocp/zSF7EeRatHfAomPZP/YB4R
	D+v0Y6NUJsonvpugipzbVAgI54dF+pGnjdMB57H0WEvmvQZM/fvzwZvme3mdj4SeJdde6R
	ZMLA+r2pvs9GZ37r7AaeK7YE1lt7MebteBG/e0V5VwhRIsDvt2jEu4Yxjc5uNA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 5/8] mtd: rawnand: qcom: Fix wrong indentation
Date: Sun, 16 Jul 2023 16:46:09 +0200
Message-Id: <20230716144612.32132-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-1-miquel.raynal@bootlin.com>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_074621_725232_45A00060 
X-CRM114-Status: GOOD (  10.53  )
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

The main "for" loop in qcom_read_status_exec() does guard the following
to if's which are badly indented. Fix the indentation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 554cca3801da..3adc40ef5cf6 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2722,12 +2722,12 @@ static int qcom_read_status_exec(struct nand_chip *chip,
 	for (i = 0; i < num_cw; i++) {
 		flash_status = le32_to_cpu(nandc->reg_read_buf[i]);
 
-	if (flash_status & FS_MPU_ERR)
-		host->status &= ~NAND_STATUS_WP;
+		if (flash_status & FS_MPU_ERR)
+			host->status &= ~NAND_STATUS_WP;
 
-	if (flash_status & FS_OP_ERR ||
-	 (i == (num_cw - 1) && (flash_status & FS_DEVICE_STS_ERR)))
-		host->status |= NAND_STATUS_FAIL;
+		if (flash_status & FS_OP_ERR ||
+		    (i == (num_cw - 1) && (flash_status & FS_DEVICE_STS_ERR)))
+			host->status |= NAND_STATUS_FAIL;
 	}
 
 	flash_status = host->status;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
