Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DED8C43217
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 19:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPSd0z84ROVJoJInpCge7U0hB2LfXgebLbXDfKgFw/4=; b=FyB5u3+jJgEofR
	OhtgyE8HASM3/xflVfN2KIudXh7fHaJvDnA8durT8US493H4ZMANyaYyoNSBOaa89KMF5T6bGYWjd
	nliFqbmlpVpfvyJ3OmnvsuzRtKeVqI0aJr54a2hqafbdGWrmOI+28D4SShCioQdZtsW2PLUAAMeBi
	YKwnRT2AgHW9Fhj3PxzQtg4g0a5dVPGmZBlu5BnS9QQIzR4/CYTPnuEAkrv1QEhoen/56p+4e+ijP
	KUZqugo3O/oAVIsyXl19edld7SAe68NawoiH33o5TeyUOseCdGzKj8sT4VvW3H/t/U72TFyQ3p95e
	fHWvfoIHP+MHa8M+m6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pJo-00ALlj-Nn; Thu, 01 Dec 2022 19:34:00 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pGH-00AHLO-0t
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 19:30:22 +0000
Received: by mail-qt1-x82e.google.com with SMTP id fz10so2203896qtb.3
        for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2022 11:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=di9LveXhpEtODK6vNhn4RUvUpuP2viTSwK389nw6d5U=;
        b=Q9R68ZQ7HsrNWZEFMqiSQNq+RhKlxioliytl4uSs8OlRH24UleTMhx3H85j/7lcXqM
         s+7u7FdqM5fQjce9x4HP7ATNv4ze+cyTxfSGX/lGMHauhqq49M+7UhIV9d4Ymh2LZSAZ
         r5iStg9r2b07FXwWJbwX6t6zicVto3KWcfIZ4WzgLyCRs8/aQs83Fuo3KxqnAYLxYeVg
         pMn04vczvmtdI1cvbJGVZuq0aXuqmP3K3PwSyGQXYKFDuPJfyn2Od6HPPwDJJnvGAt0G
         RmeaiUIgR52l9eoiSvtwEbG93oGncnNi+jJ32MPuMWxnUEdXsIILvOMxxiqsU5SHXyma
         aGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=di9LveXhpEtODK6vNhn4RUvUpuP2viTSwK389nw6d5U=;
        b=daY9xHiIID/7spRhYqg3RMvb6kTu8I53l2M1/L6et7L0SpTlvUJxxoJjc4zLw4mQX4
         xu6GmEJVenojJTmIi8Me1ePRLFWp9yJ6lwQZ9B81BJ+9JRBzm9vm1C1OoN2j46FQybhj
         fxWIof0gSnfkYFsyUov2VhIuSj0j1lPxiE7HTpbdzCnCwYpUggIIrQkWC/oRVSRtBKO8
         sxgeoH9u0bV9c9E3k/o5K68oeTRyOP/JXDrKYoVSbJ70/gKJUaoIJLENAV54VvK7E9JO
         z0AvbjKxrSySRZNzBZ7lzpoDpdIyJBaYn936FDTMAZ8KoF8V9ZxxYv+jAn5Y81DTQ16i
         7ljg==
X-Gm-Message-State: ANoB5pnXMzHpWBDPKPecWtQWgekQgJUa0/Fx66+XrFYlQeatkNnRxwkQ
	sLdZ7XAgg+3QZTKc0NV2b+q0vQ==
X-Google-Smtp-Source: AA0mqf5tB+RxE9OAiByRmXtLN4xavVPvLWFvTlSoTPkoewYIP+0S6OosgBcpShtrG9E7jwA3NowV6Q==
X-Received: by 2002:a05:620a:3720:b0:6fa:faad:2008 with SMTP id de32-20020a05620a372000b006fafaad2008mr44641719qkb.668.1669923018899;
        Thu, 01 Dec 2022 11:30:18 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id h19-20020ac85153000000b003a6328ee7acsm2977748qtn.87.2022.12.01.11.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:30:18 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] mtd: spi-nor: Add additional octal-mode flags to be checked during SFDP
Date: Thu,  1 Dec 2022 14:30:05 -0500
Message-Id: <20221201193007.261690-3-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201193007.261690-1-nathan.morrison@timesys.com>
References: <20221201193007.261690-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_113021_080492_764D5E53 
X-CRM114-Status: GOOD (  13.93  )
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

This adds some support for searching a chips SFDP table for:

read commands: 1S-8S-8S
program commands: 1S-1S-8S, 1S-8S-8S

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/core.c | 7 +++++++
 drivers/mtd/spi-nor/core.h | 5 +++--
 drivers/mtd/spi-nor/sfdp.c | 8 ++++++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bee8fc4c9f07..4c1a877e736f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2359,6 +2359,13 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 					  SNOR_PROTO_1_1_8);
 	}
 
+	if (no_sfdp_flags & SPI_NOR_OCTAL_READ_1_8_8) {
+		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_8_8;
+		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_8_8],
+					  0, 16, SPINOR_OP_READ_1_8_8,
+					  SNOR_PROTO_1_8_8);
+	}
+
 	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 85b0cf254e97..7bc1cde049b7 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -514,8 +514,9 @@ struct flash_info {
 #define SPI_NOR_DUAL_READ		BIT(3)
 #define SPI_NOR_QUAD_READ		BIT(4)
 #define SPI_NOR_OCTAL_READ		BIT(5)
-#define SPI_NOR_OCTAL_DTR_READ		BIT(6)
-#define SPI_NOR_OCTAL_DTR_PP		BIT(7)
+#define SPI_NOR_OCTAL_READ_1_8_8	BIT(6)
+#define SPI_NOR_OCTAL_DTR_READ		BIT(7)
+#define SPI_NOR_OCTAL_DTR_PP		BIT(8)
 
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index e4e87815ba94..e1b7547bf81e 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1089,6 +1089,14 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_4_4],
 					SPINOR_OP_PP_1_4_4_4B,
 					SNOR_PROTO_1_4_4);
+	if (pp_hwcaps & SNOR_HWCAPS_PP_1_1_8)
+		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_1_8],
+					SPINOR_OP_PP_1_1_8_4B,
+					SNOR_PROTO_1_1_8);
+	if (pp_hwcaps & SNOR_HWCAPS_PP_1_8_8)
+		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_8_8],
+					SPINOR_OP_PP_1_8_8_4B,
+					SNOR_PROTO_1_8_8);
 
 	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
 		if (erase_mask & BIT(i))
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
