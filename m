Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331B1C4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 13:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t46uJX3U+dVLOlrY2anOSIn5g77znAiI0ttd72sw0D4=; b=dLfjq6hRxcBjqB
	KA9mBGk4bxgnpYWsO7HowsZVS4lR0arg4H/a+XqpRw3V99y5P3dRtlW8vNjlLTB9zWn+v8wjSNbAR
	b3GRScx0N024YJOqLMgu4+55Jhh/UoQxa4AYdlajC+FNs55lNUfYzGBVDCwZGCZkC9+lpslYuhiXw
	yd07B9fSgUCUY8BDXqRbirfArjTjNrtVHt6u7YHi6bMDvoYufTA/ztbdO+/xsEA6Q9qmQ4WWumBnk
	wjwqzoI/WGxd7jhJaL1r8gO0dpInQCq6mkKyUP6nLXYT57KNnMBjkgw4xCLmyo2hV1uBxaOxoymNa
	dHJznQXri/5JSJXVEVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16W9-00Ghsh-SG; Fri, 02 Dec 2022 13:55:53 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16W3-00GhoP-EW
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2022 13:55:48 +0000
Received: by mail-qt1-x82e.google.com with SMTP id x28so4028186qtv.13
        for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2022 05:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFCBGy/PHSqulvVt1jN7WYpo1L/uAw3+z6frKWBhRoc=;
        b=L5WmemJAO6bGk5YpyHsWgaHHqP8pQGgrhBueew2H9B5Ebuoy8da3D/W/R9F+NDZeiX
         Q1nKwO1vdtSB39YyxX5uuG4BhSutxQgLJdXYdyePxV0pyf4UhHyqMgoW1B0Ph526ZURO
         ZyN/xnkiLF/TdMISWsj0uIMog1cQZ2X8xFhoY/bMFrwZIiWp2PpOxFCeaVTUZQDWjgf6
         hJoP5YJ7c5Ao7nWD4+KTTGOhPe6ujxfIa41ZWwy5a8saDxUfKYxcjbPs78f8LQuM7ysn
         q/l9orAO4UjDMjYUCDLg8DxBEUnuhlFkvcmuJ8QPapS7rT18UKjNVZyOp+eYQ4fTQzsy
         t7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFCBGy/PHSqulvVt1jN7WYpo1L/uAw3+z6frKWBhRoc=;
        b=zbEIB6xlqDoLuQtM5tRHcVvE4WOMfjqVoYdznDJUbpfE+IHjlt59kxm625gi5abr5o
         w/lkku2j6IGe9YHGFu/nF36z6TT1mMuNczbAkUsmWI94ZsZByCl9hUbrhJA12ga5lngv
         zYRxrj57Tv62svjQ+VORXikcBOoUPWivSWKPJjVbfa1Y3eFtsx3xg6aVHr/aPVI3c4Z5
         0TFmSh/lZ0jrOUl0sT3M671cHjSS3M/dR23RgMXDFhd1SSBudOUy+qUWFrn9hZBMYY+I
         K5nwAB4saTkbItaczu/+L56yLSvNedm9o6qzmsfufqOiZywHIloo6ZznBAb8sflQh+da
         e2RQ==
X-Gm-Message-State: ANoB5pmwL375xi0cgMmXDwbRlpmFga6wmKuJAvw3AYXk61Sijs8cyvWx
	ba3t/O1xsV+/kcckXMde0yM3mA==
X-Google-Smtp-Source: AA0mqf6RbbADM2P3deLJnaVHTUgFXtpfJumgU78/FLtKT5oqsLxeyyOlmZY8ImRuVkI9x6MEslqLdA==
X-Received: by 2002:a05:622a:590e:b0:3a4:fcde:733d with SMTP id ga14-20020a05622a590e00b003a4fcde733dmr67306718qtb.269.1669989344644;
        Fri, 02 Dec 2022 05:55:44 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id x1-20020ac84d41000000b0039a610a04b1sm4122237qtv.37.2022.12.02.05.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 05:55:44 -0800 (PST)
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
Subject: [PATCH v4 1/3] mtd: spi-nor: Extend SFDP 4byte address instruction lookup table with new octal modes as per JEDEC JESD216F
Date: Fri,  2 Dec 2022 08:55:37 -0500
Message-Id: <20221202135539.271936-2-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202135539.271936-1-nathan.morrison@timesys.com>
References: <20221202135539.271936-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_055547_511715_1E2F4CEB 
X-CRM114-Status: UNSURE (   9.28  )
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

This adds the new bit fields for
reading: 1S-1S-8S, 1S-8S-8S, 1D-8D-8D
programming: 1S-1S-8S, 1S-8S-8S

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/sfdp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 2257f1b4c2e2..e4e87815ba94 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -953,11 +953,16 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 		{ SNOR_HWCAPS_READ_1_1_1_DTR,	BIT(13) },
 		{ SNOR_HWCAPS_READ_1_2_2_DTR,	BIT(14) },
 		{ SNOR_HWCAPS_READ_1_4_4_DTR,	BIT(15) },
+		{ SNOR_HWCAPS_READ_1_1_8,       BIT(20) },
+		{ SNOR_HWCAPS_READ_1_8_8,       BIT(21) },
+		{ SNOR_HWCAPS_READ_1_8_8_DTR,   BIT(22) },
 	};
 	static const struct sfdp_4bait programs[] = {
 		{ SNOR_HWCAPS_PP,		BIT(6) },
 		{ SNOR_HWCAPS_PP_1_1_4,		BIT(7) },
 		{ SNOR_HWCAPS_PP_1_4_4,		BIT(8) },
+		{ SNOR_HWCAPS_PP_1_1_8,         BIT(23) },
+		{ SNOR_HWCAPS_PP_1_8_8,         BIT(24) },
 	};
 	static const struct sfdp_4bait erases[SNOR_ERASE_TYPE_MAX] = {
 		{ 0u /* not used */,		BIT(9) },
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
