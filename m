Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93F4C7EE2E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 10:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRQvqTLd194CjSuaGEWHnE9atI9ia4YeGYs0U69lysQ=; b=ijQEMFDPqug+kq
	xoDfJPwN21TsCWrkkbl9KK0Qe0hGR0jPByKLNXTydzaee4wEm/VwzRzUMBBG4rFGosFi3xDptz6Ks
	PTsLbWe+u5IlPYMWdKXjsvFfsoQahFdSrfVJWDlPWqVWGL82ROZM3UmMlaXlqNu7PnzpJluFD4Omf
	dw9pik9dQUYYIekHwJp2jqItUC39TmE9kjRtT56k0OOi2Rb1+N+tWndCFWso4MPvOqFxCRYpRTmgJ
	ztGbRrflqqfSe2yM6krrkSZXzyu0M5kf2k8rbTzVU1P4LUoTsQS7cRn3K5xMSBaktDXvdDSEf7aqr
	mePDg58gAUdTo6BqupjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ePv-003QQ8-2K;
	Mon, 12 Jun 2023 10:04:55 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ePs-003QN1-2N
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 10:04:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-655fce0f354so3202581b3a.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 03:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686564290; x=1689156290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIdqwYpzL1QaRaSdpLZGSSIvl0YyUrYTEGKQLlB53OU=;
        b=QHhnhBN5BL/TFOplJDdoAvHPprjIJrEx37sVtSFyyvb4Caqar71iFxxrzrKWibntmG
         5TneJ5aBSqCr0Dk5X9vlt5TA6TBBemxsBSqAqAApwS/ebok3tszz8eL3WiSCMxrk3IIp
         Nm+m7Ci08X3Cu6FHw02M0P6IhzZ0J2g7u/bt9cnfYBh22k5c5miQpeHJgpzeG+3cZZxV
         DergBaRsQ/CmNKmPmvRVoDHdnZJAOfrtuOJIcDVP7AmFymd1G09izUbCwP7UuCytj/L6
         tSVOXhiF5jMHwut1luXZaPfpls3ZVywtK/auALTn9YLMRlehNMdUoYqrPxh3rPpfpZSt
         BwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564290; x=1689156290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIdqwYpzL1QaRaSdpLZGSSIvl0YyUrYTEGKQLlB53OU=;
        b=KtT9MonFBMACH4ZzsCRNM8SSLwmysU5KHp11XN8sdmw/WIFReSzlfbq1TJGzgW6/kn
         gq9w8QDbFEGzEXrOAyPkVKYxLfFKBMu+PmBo5A+0VY9eaBkQ11Oh1W5UmY+M/Ur9YVQg
         BRl7a9z0haJ6g+a2LdViJVdiwugOBHR9VLgdU1epPjcrgTM+CRuA5NYg4Djkj7yp1LFY
         4w4m9XFeD3EXYEuvppmTa08ukQTORoeyPfmxx3R/5bnfhSUR3xFs9Knq5wZVw4o1fqEa
         BC39tkPNMPVZP46AMHdjLM0YAG1MyxIYZRK5h6w7jXKarFp3EaJnip8PBJKitJnjrwSb
         2yiQ==
X-Gm-Message-State: AC+VfDyXRAn7U/oo7VB03P+2s5mXQ2rjhPcIr02r9GrqyXC6wh1zUQiZ
	5MlGPVQAVHRI8fGd59tW2477U3jMbTA=
X-Google-Smtp-Source: ACHHUZ4HjahSJOuue3fwh3dJLkjzvk1f2oHspq7AuDZBNPUoWpk33XpunB308vbXtKOrP2jQfNKtrw==
X-Received: by 2002:a05:6a20:c18c:b0:111:2a64:83e7 with SMTP id bg12-20020a056a20c18c00b001112a6483e7mr8369956pzb.22.1686564290088;
        Mon, 12 Jun 2023 03:04:50 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79211000000b00662610cf7a8sm6723376pfo.172.2023.06.12.03.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 03:04:49 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 5/5] mtd: spi-nor: spansion: Add S28HS02GT ID and fixups
Date: Mon, 12 Jun 2023 19:04:09 +0900
Message-Id: <78847f3e368651b13d00e0b37864b74d8736cc57.1686557139.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_030452_781364_7F0BCC1F 
X-CRM114-Status: GOOD (  13.31  )
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

Infineon S28HS02GT is 2Gb, multi-chip package, Octal SPI Flash. This patch
adds ID table, fix params->n_dice value, and replace params->ready() with
MCP version.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 8b8512402639..88dc849a63b3 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -720,6 +720,10 @@ static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 	 */
 	nor->params->rdsr_addr_nbytes = 4;
 
+	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
+	if (nor->params->size == SZ_256M)
+		nor->params->n_dice = 2;
+
 	return cypress_nor_get_page_size(nor);
 }
 
@@ -738,8 +742,15 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 
 static void s28hx_t_late_init(struct spi_nor *nor)
 {
-	nor->params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
+
 	cypress_nor_ecc_init(nor);
+
+	/* Replace ready() with multi die version */
+	if (params->n_dice)
+		params->ready = cypress_nor_sr_ready_and_clear;
 }
 
 static const struct spi_nor_fixups s28hx_t_fixups = {
@@ -913,6 +924,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		MFR_FLAGS(USE_CLPEF)
 		.fixups = &s28hx_t_fixups,
 	},
+	{ "s28hs02gt",   INFO(0x345b1c,      0, 256 * 1024, 1024)
+		PARSE_SFDP
+		MFR_FLAGS(USE_CLPEF)
+		.fixups = &s28hx_t_fixups,
+	},
 };
 
 /**
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
