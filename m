Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FCBC433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 22:13:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD95622288
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 22:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD95622288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dQKLRsnA4ZuKW0toy1kUNHpbkrqHHy8MIwICxROTI8I=; b=iQJ07GxQCm38RMFcnkx/hh/1IZ
	HycqCqdA7CQXNnHqj350yYdYobNDn45wlyq6Qf7RqkvILh0joTF00w4QxLHmomCVF+EBW6F3+bAfQ
	P/lElcAlijbsdrBFCexex+5HzRaQRxXoPxuzUW52YO1xE8jUiiADZrWiqL8TrRsrwrCUsx9BgCnUR
	YQ+BOBW2sC8YxOHXUEjJCnyjvugx0HAYYKCtWwyPJ9WM/7Zkc/fM096dIHYdYHOXX4MZEG+YXEG8t
	TN7Q5lydSPUau3NMCvgFe8U6H3Ws6SKObAblq9c/cFaVWdTpC5PMC+fUDqKrn4N3ZN6b7Iajgyh8C
	uvNy5iMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmlE5-0002IX-Ro; Tue, 08 Dec 2020 22:12:53 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmlE3-0002IE-AW
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 22:12:52 +0000
Received: by mail-qt1-x843.google.com with SMTP id 7so13166829qtp.1
 for <linux-mtd@lists.infradead.org>; Tue, 08 Dec 2020 14:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ScyxoivQ5p7CVZv7RTbksbq6DTpHoZgKHZPCi8Pz30o=;
 b=KDrak4YY5GIgIMOQqWk3hRAI737dgv3TZ6+w+hcb2ceLFzCAc+GHfR8B1c7lNjDVcs
 1z92V/pKHDxDBfTEmm6IutZqk5YI1u1jkWFWl7sPz/VcNbxeGdVJFMEagk8A6t6b4Kc7
 3bJLJo6U2fFU/JjsPpPAZfVHtqthv+H9Fq46T1WJqIefrnMfbT1EM5LvjyjiUYR9hC2H
 G/mpi6i5Wzen/6VlEODB7ggpPRufo+t6EodHkSagswgKACzrZpHnLwEVLI3wKvga+DEg
 +ttMmQBEh2NOFzqKYJ28WzVk3zGndWAN/LSnd0cf4A0sFyjmv0arrlvssDMD5jDr39BL
 uLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ScyxoivQ5p7CVZv7RTbksbq6DTpHoZgKHZPCi8Pz30o=;
 b=hgrzFYzM22cggPUSi9aR0/FxIf2HEsUb6AiKKhk1DkOSq10rwKNEztB0PX3S6LqeMa
 yDSWqzj+iuHr0LS4MkO3zd+Q0zQWQwrxhjtNjACJWqauqfoCZQu/xawCXg7Ty8QKIubS
 wKQ2BrXrsE0tI0QlBKsWSv0r5wf3zj/eL0BZxd0PJpKjEnF9uxkJPAn3N/g08iy1l1ON
 +z89YaNZaE2ut5ovjaoLr31ESorWwZZhvNGctRADOrUMscaLKcLFBsRgU39OMp+Id/5h
 +RrWOWvCN0WtM9o/r8bdYu8+EWgZ2xEkmaN5dadlUPBgpPHYR5baW/UGnxLf0DTpeo62
 /X+A==
X-Gm-Message-State: AOAM532Zg1PnpbO7q/TL7fjpGi9462iNx3ayotQJ74L6VAB+1n8z2JBK
 lKnqkujISjTLfe3D4VMXcpAkSe6TmfJp9w==
X-Google-Smtp-Source: ABdhPJzxBXoXQyrEIIfA8qLCELKrWiM+WIPuR2ZgOkvXqRO2F1Rv6mwzVJQpSduGrwqNp84TyS2UXA==
X-Received: by 2002:ac8:4986:: with SMTP id f6mr167857qtq.43.1607465568455;
 Tue, 08 Dec 2020 14:12:48 -0800 (PST)
Received: from localhost.localdomain ([177.194.79.136])
 by smtp.gmail.com with ESMTPSA id q20sm27475qkj.49.2020.12.08.14.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 14:12:47 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [PATCH] mtd: rawnand: gpmi: Use a single line for of_device_id
Date: Tue,  8 Dec 2020 19:12:43 -0300
Message-Id: <20201208221243.3255-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_171251_410275_4EE8C1E2 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The .compatible and .data pairs can be stored in a single line, which
makes the code more concise.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 02bb98fa83d7..159b0223feaf 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2465,22 +2465,12 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 }
 
 static const struct of_device_id gpmi_nand_id_table[] = {
-	{
-		.compatible = "fsl,imx23-gpmi-nand",
-		.data = &gpmi_devdata_imx23,
-	}, {
-		.compatible = "fsl,imx28-gpmi-nand",
-		.data = &gpmi_devdata_imx28,
-	}, {
-		.compatible = "fsl,imx6q-gpmi-nand",
-		.data = &gpmi_devdata_imx6q,
-	}, {
-		.compatible = "fsl,imx6sx-gpmi-nand",
-		.data = &gpmi_devdata_imx6sx,
-	}, {
-		.compatible = "fsl,imx7d-gpmi-nand",
-		.data = &gpmi_devdata_imx7d,
-	}, {}
+	{ .compatible = "fsl,imx23-gpmi-nand", .data = &gpmi_devdata_imx23, },
+	{ .compatible = "fsl,imx28-gpmi-nand", .data = &gpmi_devdata_imx28, },
+	{ .compatible = "fsl,imx6q-gpmi-nand", .data = &gpmi_devdata_imx6q, },
+	{ .compatible = "fsl,imx6sx-gpmi-nand", .data = &gpmi_devdata_imx6sx, },
+	{ .compatible = "fsl,imx7d-gpmi-nand", .data = &gpmi_devdata_imx7d,},
+	{}
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
