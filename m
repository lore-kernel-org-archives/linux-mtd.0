Return-Path: <SRS0=50Qk=S6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04F1C43218
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Apr 2019 18:09:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 943632067C
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Apr 2019 18:09:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="myMvzgb1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cliCmWri"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 943632067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pM3FHcrMbx+Iamnyt/wMrBUBsXnm/wk7lh+tKt9RDck=; b=myMvzgb1rpRoJ68ZrWNX0zlNhf
	zCGe+NxjH4Grf8/TP2bzaUgTXR+oyEtKjtlQ/QnDRSvIDTd7YAdpXX8ihimgWPabV0q5RsrSGA81i
	5kXdQXjOmAdG1MfP4sBQqJTIdnY8dYxPu4XW4POzWOpR71UwfPtcA8oJgtBZ1SUw1p5Q/N01jT8C/
	Gmt8h7wkiyXrIJiqcJ4Q/quGJL2U4QO+2QURQam/HaTqkbwGvJEhZT0Ud/n9ldHgKNf9P79/09GNG
	AzD49+zZSoOXxIeHa/RZlHNaddM4z7xTLI3VZxXUBEYg7j+WNLzeVQDnbtwQdmy7qxuw+LQpmB+GH
	V6XB7/qA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKoFG-0004r2-T5; Sun, 28 Apr 2019 18:09:46 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKoFB-0004is-Ov
 for linux-mtd@lists.infradead.org; Sun, 28 Apr 2019 18:09:44 +0000
Received: by mail-pf1-x441.google.com with SMTP id t21so4215587pfh.2
 for <linux-mtd@lists.infradead.org>; Sun, 28 Apr 2019 11:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BvubvJYb+FM7vShur/HONzMPhp7VVdC41h6xYnez19Q=;
 b=cliCmWriOH8BtZerv3/PhzAYBgAHmAn/BrP/6O6H+pa35eUYh2i5OzyIRqQsk5eo5Z
 P695cS5aoldg7gH2IB4/TVZ2EE5BQnE5UIsP3kFI4du5gnfw1ie8ZBkz70nEO9OyTmTv
 zpFrWgo9zForFBTLCynBx7TQsKvB+aStTgjaKALxhQDnVhnYABmLlW3YNGhIcVlQB28h
 hnvkBC6SInKUzdjOL06dj41rIthKqG1Pm0Zn6qKTlq5bcfAH2xdPt9/PfumM9C3iUbNL
 Hfw792S27EGV0sNVP7J83DWZLgWeHIdQ45gVN7SPF62aiW8tHRDzs7TAAIgRsVGf7c+3
 F7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BvubvJYb+FM7vShur/HONzMPhp7VVdC41h6xYnez19Q=;
 b=bXf5LRAH/v/EyLAW35zlwGklxqxFuv8AePhEZQ4K5itkIMgils0D8SyQ6qKkg0oSpY
 JAofX7QKRYjPRCR9FxV56iRkTCtfwBHIW7FFSeuuR/UcIokRjN+oWv35KO3Hy8WXKFdF
 5OjJq3NvVq2CFl3qc/13UCN3jVoIlQN4umwyfVEZBaRLeBzXwbdDFoMyhM8tDbQuLCMJ
 6YdOT3tQjBdUEGl/YwqC07Yvm+SPlnYmNuY/er7BI41P1yXOdetmmudbjmYO1P1Gari3
 GN8kz7DvVVZvXlBOO3iXIL9pav6q5Z+uGbe+y0VsTNf6QrqbGYm4IpvwAobTEe2bRNKP
 krqg==
X-Gm-Message-State: APjAAAWS4l5IwVgqxFa75K4KUj+PUfCRhKzDDEvO8KNPWuzlQteN8GBd
 iz0hNPhbDCAz+zd/2FJcXOnsxw==
X-Google-Smtp-Source: APXvYqxd7cVuYNl2H0/5QdgaiNhQRkrPL2bmDL+SM8n7GtSp+XzhH/ei7GN3FQudzAjiRD0XEDH60Q==
X-Received: by 2002:a65:5046:: with SMTP id k6mr21256885pgo.325.1556474980663; 
 Sun, 28 Apr 2019 11:09:40 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id l2sm36177136pgl.2.2019.04.28.11.09.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 28 Apr 2019 11:09:40 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, bbrezillon@kernel.org, richard@nod.at
Subject: [PATCH v2 1/3] mtd: spi-nor: add support for is25wp256
Date: Sun, 28 Apr 2019 23:39:14 +0530
Message-Id: <1556474956-27786-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556474956-27786-1-git-send-email-sagar.kadam@sifive.com>
References: <1556474956-27786-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_110942_245046_349A76A3 
X-CRM114-Status: GOOD (  14.37  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: palmer@sifive.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Update spi_nor_id tablet for is25wp256 (32MB)device from ISSI,
present on HiFive Unleashed dev board (Rev: A00).

Set method to enable quad mode for ISSI device in flash parameters
table.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 10 +++++++++-
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fae1474..c5408ed 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1834,6 +1834,10 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES)
+	},
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
@@ -3650,6 +3654,10 @@ static int spi_nor_init_params(struct spi_nor *nor,
 		case SNOR_MFR_MACRONIX:
 			params->quad_enable = macronix_quad_enable;
 			break;
+		case SNOR_MFR_ISSI:
+			params->quad_enable = macronix_quad_enable;
+			break;
+
 
 		case SNOR_MFR_ST:
 		case SNOR_MFR_MICRON:
@@ -4127,7 +4135,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (nor->addr_width) {
+	if (nor->addr_width && JEDEC_MFR(info) != SNOR_MFR_ISSI) {
 		/* already configured from SFDP */
 	} else if (info->addr_width) {
 		nor->addr_width = info->addr_width;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3d360b..ff13297 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -19,6 +19,7 @@
 #define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
 #define SNOR_MFR_GIGADEVICE	0xc8
 #define SNOR_MFR_INTEL		CFI_MFR_INTEL
+#define SNOR_MFR_ISSI		0x9d		/* ISSI */
 #define SNOR_MFR_ST		CFI_MFR_ST	/* ST Micro */
 #define SNOR_MFR_MICRON		CFI_MFR_MICRON	/* Micron */
 #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
