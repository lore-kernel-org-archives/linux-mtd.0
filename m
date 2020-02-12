Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646EBC35242
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:47:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C0AA20724
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kozyHM4D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAoEyqxe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C0AA20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKafxbuqTcF5fbFswWXY1PPid5odsBsM7oLZ41twuS4=; b=kozyHM4DaNHohs
	WDtPTXWC/TwcnCh/DBYd7vHuyOVueTvKvo7PBcyLcbg8Lnz3hgAEyORjPBzNs/Hc7Uo1knBq13M5s
	hhzrdOPiWBu7wKmx4aLNMrUw2kOZAq9RVhUxLq7feVUUSDKXwApMLPXXQ2AZuYH1oC3bkCu7UbIlS
	ndekVt9QYaDnY/OQCa/YQSWKpEuhZ8S9web5kXHbNvaG9w7DdLFIS4CUjMzP4ZJAOK/15VlWI2rE4
	uVEvh4Rdko/YfkOkOqF1D48UFClxIZrUG1E77F4YrFx94PVsfOjikl5OmnTSD6JAVDorfWzNdmUUF
	cPXQHfPrI6T2o4r4O/dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1gBX-0007dn-RX; Wed, 12 Feb 2020 00:47:23 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1g4t-0008Ns-Bx; Wed, 12 Feb 2020 00:40:34 +0000
Received: by mail-lf1-x144.google.com with SMTP id 203so248974lfa.12;
 Tue, 11 Feb 2020 16:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HTf58YpqwaY9/ZfsDIcfANNUH88w2zXw+jSn3ywd04g=;
 b=dAoEyqxeOjz7A2KEREadDZ6VqZVRMhPyaTDrRZZW+C4fdJOBFYiwcabV31xKiYs8bs
 mD9PWUrXqqx+/EQndIe89NMR2DuQUpfkDvTc41UXohGgHD2WxHOLebxME02T0EJtVuXH
 GMgf9JRWjf8ZUjhbow6HqVrrIh9gPsTKmIhprve6OB9y5PBjyLKHQ+2i6K7h7M3H1RJ1
 qTxRPYWYbmLnsz14c6lefULFIeaC15ufIop7jj1xvILyxanpeE8APDDXMfZirs59IHsI
 hb3tVfXPr39bHqvSOFoBkktCHplzqz796hsWSbczDlQTOMbLKv9zKJHGPSrtAA9JUsk1
 HCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HTf58YpqwaY9/ZfsDIcfANNUH88w2zXw+jSn3ywd04g=;
 b=HpJJ7adZZZrTeK3AgPZNheiU1vXaquANykKbdUvd4lB135TgK25jjvbF8XXtDp7gK8
 9IbPzVqHIiKkrKF4CHnP1X+Xr9k+M2veaOqo8WGq4sp4UPjBRjiG19ZzNggdMIzjUyxE
 Pq5LmV99gm+r3iSGetj0BdkXDSUlraBqcTdFlmRTYLJ9eIybovat+z5ixuwvIehwSooq
 MCpLFPGKjDU4atUkg/HCH+KP3/hTA9IMhC4MX7r7F0kTZvcnseR+txtmqw4CPihKMUdV
 jkNVxTjtz7syr/TkUiNtP4Y5Y0iYd9ZUHb/Kb3PI4T8gOhMiBuC0iqe9TYMJ83y2ihpS
 DNSw==
X-Gm-Message-State: APjAAAUBplAMqIoF14AxepMjZogLl/zTcx0+3ZcXPMF500rgkJsd6xBd
 zBPsQ2Gt+opNiJFGfn6jQ9g=
X-Google-Smtp-Source: APXvYqwwX3ih/dlP/s6h+fr2ICYq2BrPHs02sfYs8lBXyp00LNq1eN3hIoCLnQCndwzdhNiBZFV+jA==
X-Received: by 2002:a19:748:: with SMTP id 69mr5238603lfh.40.1581468029430;
 Tue, 11 Feb 2020 16:40:29 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl
 (109241122244.gdansk.vectranet.pl. [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 16:40:28 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH 13/14] mtd: rawnand: ams-delta: Make the driver custom I/O
 ready
Date: Wed, 12 Feb 2020 01:39:28 +0100
Message-Id: <20200212003929.6682-14-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_164031_461923_3E06C84A 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In order to be merged with "gpio-nand", the driver must support custom
(non-GPIO) I/O accessors.

Allow platforms to omit data GPIO port as well as NWE pin info from
device setup.  For the driver to still work on such platform, custom
I/O accessors as well as a custom probe function which initialises the
driver private structure with those accessors must be added to the
driver.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index a68b7006ed69..9e659984bf59 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -43,6 +43,9 @@ struct ams_delta_nand {
 	bool			data_in;
 	unsigned int		tRP;
 	unsigned int		tWP;
+	u8			(*io_read)(struct ams_delta_nand *this);
+	void			(*io_write)(struct ams_delta_nand *this,
+					    u8 byte);
 };
 
 static void ams_delta_write_commit(struct ams_delta_nand *priv)
@@ -116,18 +119,18 @@ static void ams_delta_write_buf(struct ams_delta_nand *priv, const u8 *buf,
 		ams_delta_dir_output(priv, buf[i++]);
 
 	while (i < len)
-		ams_delta_io_write(priv, buf[i++]);
+		priv->io_write(priv, buf[i++]);
 }
 
 static void ams_delta_read_buf(struct ams_delta_nand *priv, u8 *buf, int len)
 {
 	int i;
 
-	if (!priv->data_in)
+	if (priv->data_gpiods && !priv->data_in)
 		ams_delta_dir_input(priv);
 
 	for (i = 0; i < len; i++)
-		buf[i] = ams_delta_io_read(priv);
+		buf[i] = priv->io_read(priv);
 }
 
 static void ams_delta_ctrl_cs(struct ams_delta_nand *priv, bool assert)
@@ -289,7 +292,8 @@ static int ams_delta_init(struct platform_device *pdev)
 		return err;
 	}
 
-	priv->gpiod_nwe = devm_gpiod_get(&pdev->dev, "nwe", GPIOD_OUT_LOW);
+	priv->gpiod_nwe = devm_gpiod_get_optional(&pdev->dev, "nwe",
+						  GPIOD_OUT_LOW);
 	if (IS_ERR(priv->gpiod_nwe)) {
 		err = PTR_ERR(priv->gpiod_nwe);
 		dev_err(&pdev->dev, "NWE GPIO request failed (%d)\n", err);
@@ -311,13 +315,24 @@ static int ams_delta_init(struct platform_device *pdev)
 	}
 
 	/* Request array of data pins, initialize them as input */
-	priv->data_gpiods = devm_gpiod_get_array(&pdev->dev, "data", GPIOD_IN);
+	priv->data_gpiods = devm_gpiod_get_array_optional(&pdev->dev, "data",
+							  GPIOD_IN);
 	if (IS_ERR(priv->data_gpiods)) {
 		err = PTR_ERR(priv->data_gpiods);
 		dev_err(&pdev->dev, "data GPIO request failed: %d\n", err);
 		return err;
 	}
-	priv->data_in = true;
+	if (priv->data_gpiods) {
+		if (!priv->gpiod_nwe) {
+			dev_err(&pdev->dev,
+				"mandatory NWE pin not provided by platform\n");
+			return -ENODEV;
+		}
+
+		priv->io_read = ams_delta_io_read;
+		priv->io_write = ams_delta_io_write;
+		priv->data_in = true;
+	}
 
 	if (pdev->id_entry)
 		probe = (void *) pdev->id_entry->driver_data;
@@ -328,6 +343,11 @@ static int ams_delta_init(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (!priv->io_read || !priv->io_write) {
+		dev_err(&pdev->dev, "incomplete device configuration\n");
+		return -ENODEV;
+	}
+
 	/* Initialize the NAND controller object embedded in ams_delta_nand. */
 	priv->base.ops = &ams_delta_ops;
 	nand_controller_init(&priv->base);
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
