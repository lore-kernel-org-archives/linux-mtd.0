Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202C1C636D3
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 01:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/TMgX/nE7Ujf/P1B/M3BHf1pGl+CrTcsSJ10A1+t4Jg=; b=z6Xbr0RDaIo/X+hHadD2sMgzQK
	1VwItmM3Xx1+EWYC2bEsGvYJALRz1J5XKh6mpXxnj/vJ4PSXxCHXO7y9ZRASQ5u+zQlrwVEyGm6II
	xLELi3DaN+fTTR6YSWEDZZdodMy6opkcxUDu6dlysTWz7a3bjKKdiiNUlYI0Lb58kfqOU0n+x7OBq
	f11yOEyHUeVH7TwRPLKpVlDbdIkr6XW7Jn1I5TIrM4tggsFk7BoBLTEQwhUyUxcKONxMvBLg2+udX
	hqwa/Mdveqp11V+DLZAMbIQwoYff38g/xwVU5UNUAuUHlnRtouLBSiM1O9SABg97OKt4VQfC+HGhx
	O1PFJIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPD09-00ANZZ-LR; Tue, 07 Feb 2023 01:42:29 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPD02-00ANUG-1J
	for linux-mtd@lists.infradead.org; Tue, 07 Feb 2023 01:42:23 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4c8e781bc0aso134022237b3.22
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 17:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJLrTZtGB/wtRgZ8auzL1/mCtthfh1jmvZ+jyYODrHo=;
        b=KxHeBd9/qrt/W/MW4sUpZIYo6+yTTh5TEOdC00+aZnQdBS23CNq8lQ/3ly9Ie7C0jx
         AjoC98Qjw2BjtA+6HokTZ2K8U6tXQihfm5h+hLPeDCF4PTWsWCDJ/JKmZiN9nTWt8Shh
         Ps3mn6yubOQoZo/oaLlFALgQc/euTcI9CK8eH/0m+jNzUowjJcD18GLh/uIuCpLexd7Z
         orKSAUPqQwHVZJ9xvZl95RcQbB5RMKJL/RxwOhlVemuGVd3JmPzazJDUpXkyWRMFu6XQ
         tonVupUP0/OJgnHzIKGNW5KmQA8ou+8EsSVWRj8S2uoKjGzS2cH4h7TZD39JXwkbCIxy
         BAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJLrTZtGB/wtRgZ8auzL1/mCtthfh1jmvZ+jyYODrHo=;
        b=e7C5XcxxThQn/zipjKJyuU5lP9r/vjTaEvPCsVto+2iDcfdSgyQc5T/wNLhGvoabni
         kDJf0hPfhyfMLNVl6RWqFCMNcO/BtxsJjNeWFcr2letHy6nQDLcUASO73GCPu4cUVcDq
         tKr4120HIl2QbAeCO4wSANSb7ls5LU/HeBQyhqPo4lf2tH7tFJ0SUhHKhcQeeh2qiZhC
         0zMQtNhWfuhtYHfQoodJxlXABizCiCoWVu39HhFayx+uFTKapccPYzWeINVEgFdJKB03
         ZTL2cYNZiG5Uu9M0OVBA9CLsI0lBLI8VfHnKYKYJccMgbuFNy6Mo1c3+fIhIWF7OhxUv
         GLPQ==
X-Gm-Message-State: AO0yUKUOYLx8/XcHF+D56OA69gGAtebI1WhU6tPw+S8ecGayAmhh87Ds
	AtLnS+XCuLnd7DRJ50gEtuOqHxDDVK7ONCY=
X-Google-Smtp-Source: AK7set9IZk0AFyhStprHcWsDyLohlpZMk4+IUUW+9YYC1cuPIrl5oy+DIc0aaHggVeZTHlKuTRQOg8YA5KQoVnA=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ae1:aba6:f21c:4a94])
 (user=saravanak job=sendgmr) by 2002:a25:d2cc:0:b0:855:fdcb:4465 with SMTP id
 j195-20020a25d2cc000000b00855fdcb4465mr31ybg.6.1675734138499; Mon, 06 Feb
 2023 17:42:18 -0800 (PST)
Date: Mon,  6 Feb 2023 17:41:55 -0800
In-Reply-To: <20230207014207.1678715-1-saravanak@google.com>
Message-Id: <20230207014207.1678715-4-saravanak@google.com>
Mime-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Subject: [PATCH v3 03/12] soc: renesas: Move away from using OF_POPULATED for fw_devlink
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
X-CRM114-CacheID: sfid-20230206_174222_096878_4C9DBD28 
X-CRM114-Status: GOOD (  15.92  )
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

The OF_POPULATED flag was set to let fw_devlink know that the device
tree node will not have a struct device created for it. This information
is used by fw_devlink to avoid deferring the probe of consumers of this
device tree node.

Let's use fwnode_dev_initialized() instead because it achieves the same
effect without using OF specific flags. This allows more generic code to
be written in driver core.

Signed-off-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/rcar-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index b0a80de34c98..eed47696e825 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -437,7 +437,7 @@ static int __init rcar_sysc_pd_init(void)
 
 	error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
 	if (!error)
-		of_node_set_flag(np, OF_POPULATED);
+		fwnode_dev_initialized(of_fwnode_handle(np), true);
 
 out_put:
 	of_node_put(np);
-- 
2.39.1.519.gcb327c4b5f-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
