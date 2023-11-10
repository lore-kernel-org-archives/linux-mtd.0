Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7219C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Nov 2023 01:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XThMUGp8IB2j8bMSZPV8xRqdn1agD2bFEXpscP9O64E=; b=eH79sAQUA2GOjv
	/HWZYBAK7xOLx3VX/sMbbIYOyztSiiPzkpNmQmqvZ9nf8ZYPkmPM56LsCDxdThtyTbqzEzLXQmlac
	k9G3m9tQ6QL76LPnAJsZtlemRdxi70ZJvr5itc3PelJSlb/26OH4Y6ILlPojzlEAvt9UKyX3OBIIg
	K3QYA1UrgczWTOyH17LcS1OiE6DM8HO+XhvisF8j0TuDNV0l8qyUTADGPT5R1iNsfMNR0ow5kxzJw
	kyY4v8XCnRTL0UmTAYpMjnlI0E7bP0edXQJ0dPGnGNw/geKbWJDB1U6KuWIUex3liDCD1Cxa4tkvk
	K+L5ogSKHDbWKcx+oANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1GCk-007ZgF-0f;
	Fri, 10 Nov 2023 01:21:02 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1GCh-007Zf2-1n
	for linux-mtd@lists.infradead.org;
	Fri, 10 Nov 2023 01:21:00 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d9ad67058fcso1685415276.1
        for <linux-mtd@lists.infradead.org>; Thu, 09 Nov 2023 17:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699579258; x=1700184058; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ypE+Qzvt1gTVx9DZDy2dJJ+msX4RkhEYGySvFwz3Rtk=;
        b=molRyp2M4m6GgOjW1IUSycRIz7tgjc+D3U//gTEfIN7+cprYGFn99yybfA3FUOIgqo
         kIVRBBZbCEHARMcNcS3VyOFUuceOTxDP4Zn5hxWOGJy7AYyjl/JNN0sGZBEJjiV7URHt
         VzF68FzT5XDPqiMaIaR3gd0oaEqae37+zq27ZwokQwZEQapW+b9jgMIvU1FQ1BOHTgaZ
         mffmFuWvl6z5wEr6cbyquNYswZAP7AS1ujFGgYCszriHuNrcQk1DFgAB4AMKFEUHuDU4
         2qP4MDTDqE/aSmpKPFRfsfeGweLVWhzER6HYiawWnwLTba4fu7jqkQ25TRDc+9/zr7Le
         ZQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699579258; x=1700184058;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypE+Qzvt1gTVx9DZDy2dJJ+msX4RkhEYGySvFwz3Rtk=;
        b=O+p/Lejo3fd3ibrqT9OHfuXtyykz249Kt0WZxFv6ffrWMrlMkh0ncr/gmi6wpFKiFU
         Bjwglt3DKQZr7e3hcRngAqoR3uaukcAne5MO5YcBMAZuvW9jHbmDDhxaNpln9XvV6Hhj
         c6Q/g63x04JFdKSpAjDl1uwvIxrlTS2amSv2yOUFQ7kNyjqhLks0wdDIKYbOXaI+c5NE
         KpKonn2dEnJBTSUmvBYz8GJD8Ld7+bd9wVdjgrDfKebiImAQS0XT1xF+hKwYTH+RoUPQ
         we5EF6MqzxnC/U5KJC7QyDGjfO1Xy++BNlyoO4HObZJnHiHaT19/2dXUlAwYTZYhm3X3
         vMoA==
X-Gm-Message-State: AOJu0Yxh7wWK2BhWdqlJfn6cTAJKEPNjKnPccOnNIt8Ks6XQwttCpcq/
	9ZGXMPB436Bf8dglUINUbx32qujBB9g=
X-Google-Smtp-Source: AGHT+IF9/0WhMH7Rj7FanzOkqLu+z82oSRPcWQ2/4sCWKHAbE+OC3MFig+kWkVpWLnPbYZMQv3Liog==
X-Received: by 2002:a25:e083:0:b0:d9a:fd15:82a3 with SMTP id x125-20020a25e083000000b00d9afd1582a3mr6273933ybg.24.1699579257747;
        Thu, 09 Nov 2023 17:20:57 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id u17-20020a056a00125100b0069102aa1918sm11253492pfi.48.2023.11.09.17.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 17:20:57 -0800 (PST)
From: JaimeLiao <jaimeliao.tw@gmail.com>
X-Google-Original-From: JaimeLiao <jaimeliao@mxic.com.tw>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com,
	angyanyu13@gmail.com
Subject: [PATCH v4 2/4] mtd: spinand: Add continuous read state
Date: Fri, 10 Nov 2023 09:20:33 +0800
Message-Id: <20231110012035.11313-3-jaimeliao@mxic.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231110012035.11313-1-jaimeliao@mxic.com.tw>
References: <20231110012035.11313-1-jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_172059_596400_6662DFCF 
X-CRM114-Status: GOOD (  10.88  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add continuous read state and initialize state to
default false.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 8 ++++++++
 include/linux/mtd/spinand.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index cfc295f5e31b..33ad401d3a34 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -193,6 +193,11 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
 
+static void spinand_init_continuous_read(struct spinand_device *spinand)
+{
+	spinand->use_continuous_read = false;
+}
+
 static int spinand_continuous_read_enable(struct spinand_device *spinand)
 {
 	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE,
@@ -1307,6 +1312,9 @@ static int spinand_init(struct spinand_device *spinand)
 		goto err_cleanup_ecc_engine;
 	}
 
+	/* Init continuous read */
+	spinand_init_continuous_read(spinand);
+
 	return 0;
 
 err_cleanup_ecc_engine:
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index bb9288ffd898..263420b2338e 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -422,6 +422,7 @@ struct spinand_dirmap {
  *		because the spi-mem interface explicitly requests that buffers
  *		passed in spi_mem_op be DMA-able, so we can't based the bufs on
  *		the stack
+ * @use_continuous_read: record the continuous read status
  * @manufacturer: SPI NAND manufacturer information
  * @priv: manufacturer private data
  */
@@ -450,6 +451,7 @@ struct spinand_device {
 	u8 *databuf;
 	u8 *oobbuf;
 	u8 *scratchbuf;
+	bool use_continuous_read;
 	const struct spinand_manufacturer *manufacturer;
 	void *priv;
 };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
