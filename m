Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D2DC636D3
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 01:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=g0YYIhsYpnOPTOcCEJinUeuZp0olto+M7Hg0HfkmqI8=; b=g1ZE8Js7iVDxZBUnu8oZQbJnoJ
	HjFXxgb2T2DLEZsRZq2DmQ0GTC+tfdsvH2c6QTcrXfd3o2LyTTClMtxMbnmQ3WaWa5Rmpn9iNK3lA
	wxJKMBM4iSp/FDg70/oCA9rXJq37d4pKk6bXVwiTf4V3L79IRbBOPmOOoZvk70avBwm1JVVs5QxVR
	yuJf/+SUhVDnebkQCMGQRVf9/f3xlduWJ9XecCNn14BeYdwysvscyyE0q2cOMtR9iG84y8whmCpfn
	PByIbdkJIOkRJOCgiyfVDhapqlH89uFk1/KJ9zB0dCkwOVBztuXvf35kllRBiTSp2pb1rUSIrzpNb
	2MtS9LmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPD0C-00ANbC-31; Tue, 07 Feb 2023 01:42:32 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPD04-00ANV3-1A
	for linux-mtd@lists.infradead.org; Tue, 07 Feb 2023 01:42:25 +0000
Received: by mail-pl1-x649.google.com with SMTP id i3-20020a170902cf0300b00198bc9ba4edso7378775plg.21
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 17:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ORUuC30mhLyGGOfOGNQGmV2Hk9NLu8NgqlPyUePgVtw=;
        b=W3ks5YEw7SKIgSIZBtQHBL9lJVPSdYZt5YLLOMNiqg39kU3nN1EI6XuA+B32uaPZGb
         v5zyhRmRRHO+O/PDHZr10O4cRAMqIo+F89AcNblg/s/+76O4QIK+2qBAbUZrxge36Zai
         oUQ3lkDhN+g7lBRIxR1KVI98eol03ANv+ysGxNp9Jy33gMZ7+KWT14YWjTKmLM4h0Sde
         uDNF/Fk2U8cuXtdVSlDGUvhsCS+fTpqnyi3ghq5nNuitlb38EuGaeD8xzBpXE/R4GDSO
         N9LcyuvRftt3ULpiqwLSIoYSZ3EjoLNyWNXZS4LCua4bI5CqUx3cJx+UrAWXqFnajwKW
         grxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORUuC30mhLyGGOfOGNQGmV2Hk9NLu8NgqlPyUePgVtw=;
        b=NTa4/OxrtEg9Z0UozZwBo6hstX4g2kEWCbXFXToLogc9n5oZHjicv6D3+regNbya4T
         TFAaxXMv2xv0aTC2CeWLn/xeaX4v/a9O0cPPScnmj/i8/DJ07OPfzUiOpO1WBI2+Wm9h
         11qX0ZHsa/fyMi5pcI4YPymbE1nlSKsgqXuJpq4r94wg3Qu8IQpkwyUTUgqpBDNUw8V2
         jA13s4wGnfiBKlH5GSinMfk8zuxLMtsQ9LMhhVj2f/kjgmvZnZFLxvZJsentOTUodOkA
         ODGDrTtrXBJTgL0PxYMKR7LYv0rfhtMsfX7PepnxSFXNYOsquYWaubc8d1j0WH2aL5Kr
         VI3Q==
X-Gm-Message-State: AO0yUKWpXV1gkLGtjAQQl4k2aEgvHnsivOSTL1hdhnKmYAjFyULu9N7A
	h7up5azziqpwDT8KqSSn5JERU1z+rFKShkA=
X-Google-Smtp-Source: AK7set8txtYYhJ0J+28pL4WUJBO9Kkr3uP9QQWYQBMNjYhLp0mg9chNGGE1J5xNq3IdUI/epAkGwDw5ZAcogFH0=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ae1:aba6:f21c:4a94])
 (user=saravanak job=sendgmr) by 2002:a17:90a:3f8f:b0:230:792d:7519 with SMTP
 id m15-20020a17090a3f8f00b00230792d7519mr425744pjc.22.1675734141281; Mon, 06
 Feb 2023 17:42:21 -0800 (PST)
Date: Mon,  6 Feb 2023 17:41:56 -0800
In-Reply-To: <20230207014207.1678715-1-saravanak@google.com>
Message-Id: <20230207014207.1678715-5-saravanak@google.com>
Mime-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Subject: [PATCH v3 04/12] gpiolib: Clear the gpio_device's fwnode initialized
 flag before adding
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	"=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?=" <rafal@milecki.pl>
Cc: Abel Vesa <abel.vesa@linaro.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	John Stultz <jstultz@google.com>, Doug Anderson <dianders@chromium.org>, 
	Guenter Roeck <linux@roeck-us.net>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Maxim Kiselev <bigunclemax@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>, 
	Luca Weiss <luca.weiss@fairphone.com>, Colin Foster <colin.foster@in-advantage.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Jean-Philippe Brucker <jpb@kernel.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-acpi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_174224_100128_EA0F2364 
X-CRM114-Status: GOOD (  14.05  )
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

Registering an irqdomain sets the flag for the fwnode. But having the
flag set when a device is added is interpreted by fw_devlink to mean the
device has already been initialized and will never probe. This prevents
fw_devlink from creating device links with the gpio_device as a
supplier. So, clear the flag before adding the device.

Signed-off-by: Saravana Kannan <saravanak@google.com>
Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
Tested-by: Colin Foster <colin.foster@in-advantage.com>
Tested-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/gpio/gpiolib.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 939c776b9488..bdb9493857eb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -578,6 +578,13 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 {
 	int ret;
 
+	/*
+	 * If fwnode doesn't belong to another device, it's safe to clear its
+	 * initialized flag.
+	 */
+	if (gdev->dev.fwnode && !gdev->dev.fwnode->dev)
+		fwnode_dev_initialized(gdev->dev.fwnode, false);
+
 	ret = gcdev_register(gdev, gpio_devt);
 	if (ret)
 		return ret;
-- 
2.39.1.519.gcb327c4b5f-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
