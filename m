Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39242C61DA4
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 02:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=X+v6+sxovyoh0/1dSuE/l9/I/zE/uaHfGB5xEz+K75M=; b=pQ3+F3vd9su1fZwZCP4aeqQbvO
	YOAdyEgr7bHhh4SKb3xg5dlij+efbcxUouXOZt12xN+NP5PJ30y2R8xx/tJq8+fh9d7M8Wa7c+MWX
	R1kpvTJxM0HyCWmHXjbKBfR8awT+4xJUGB36ISztJy4yiDFLbzO9Fkml1P67OYlk2zQIEMSzZV03e
	iHh5H3YdQh2gPjJkeb4PwpN9ZXF/MIyMJwhV6AauGb40euiXbKOTj7FrGeNZXqyceKT36LQu8a4h8
	cfbC2+EtfQxzFl+fJSH8As0GFEQApH+CmnqH69zm4+Wk6KEUJP1iaBsmaw1fs1QyDU4jP38fHaBmf
	juskT3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPDJl-00ARsk-L5; Tue, 07 Feb 2023 02:02:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPDJk-00ARrv-Mc
	for linux-mtd@bombadil.infradead.org; Tue, 07 Feb 2023 02:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6A/x+0p8PMNq+UMi21kh87Q0g2/Jiu6oRRXgMmXymQw=; b=CJ4VSBhC+uWea6F86v2D2ggj7Z
	qdsB9zGZDtyTQDNECQD/DABfRtSFAcsPqonfKuvYncpDnQthntv1FKBqVtV2QvM1r5LCxZah2kVRJ
	xD2Jq8a51nIy/IFthWpxzBzHv/HzEGaVCXmvehbhtRzbiM8Ht+t0MpQ6HpWWpCa7pC7suU4uzRlps
	O/8SUYr7dQLV+74EG2aaOqcDd7rkXDCvbfrId7/zqxlvkyAvuY+5LBr9RE8JFTJGkjnlmXvhsoNjU
	xjplVehWJZZhP7ww83iExtFnjm8itCLJNawIvRtPx7wGcc5wexGHNvnQ7KWE2u+b6IAHnk/TtrHf/
	of/HAgxA==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pPCzm-006k3L-1A
	for linux-mtd@lists.infradead.org;
	Tue, 07 Feb 2023 01:42:08 +0000
Received: by mail-yb1-xb49.google.com with SMTP id i17-20020a25be91000000b0082663f3eecbso13134523ybk.2
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 17:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6A/x+0p8PMNq+UMi21kh87Q0g2/Jiu6oRRXgMmXymQw=;
        b=L5SU9yrkdCoQISM+/wTwNBtt9so41vGiUxcF1ahsAlqhPaBFdZ9BDHj5PmwJYCl3t5
         yHWeuyzyFi1Vdpek1s61VTHHj+vCMUwdpIlXNVlAwD+q2ZgHmHT68Mgoisp0fKBP+9Ye
         AKuV+3jXCiNI4TvL5bTaYwjcjvjt6nHSeRli1b16m+nWjdvaQpCaLUzxcHWRE8E5TnS1
         d0NPJtXNewRsKNlQC1Z7BIw/LVmY8gig4kKT1UdBbSEKM0EGx8tI2Hg9ZraY7mst5nHt
         8sz2cJJNBzpaUhYmCNVGrSD9LOhg+ouviu7qdeJhnsPY9u5+SlS77RJ9No7k5rq3weF9
         /HxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6A/x+0p8PMNq+UMi21kh87Q0g2/Jiu6oRRXgMmXymQw=;
        b=t0KZ2UCqMbO66kewdtgCh5Wc+q200AXxqiwt6ttSPe37KlbQvrtAQ/BeQuVaF4f5O3
         5q5fpYaGNA2EkjhDgswii8lgSgDm1ueL7ZfyTPukTEOBvx/JqZrQA2reV4nd604X2OwK
         ikQ3GbqY7D9SlaJDJdpvByPC0Ldz6NPWNZEOLlNCz/5SXnl0z+d0V2ea95kJUrYL/BZf
         cIKzbgpAxl/VHlX0+dlizle2OUARYqoaisUWSH9v6ksNs8leIo7PQZcCeh98YHcOSR/T
         DN3TbH+vW6EMu4B7Hfi4XicXc8+gL99OjtWHdVQAwiKAuKdOE+ePlms4brHfCHFNTVLl
         d1Pg==
X-Gm-Message-State: AO0yUKW0954tltrcOMvjn4aCRL6/PPCm3Ez1PVxCzuDn7dJZI/8CRQNU
	v3WWpwXkskKi/zY4veqgYS1//XhAOWo+2yU=
X-Google-Smtp-Source: AK7set+GZlE4Povwj1RwyeX6tO9l13sdnFTxa+J8n89nUczFeQdItr8brE7AhM3WB/T2LWQ/yln8wcGWuiwenUI=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ae1:aba6:f21c:4a94])
 (user=saravanak job=sendgmr) by 2002:a81:6146:0:b0:526:a392:c07e with SMTP id
 v67-20020a816146000000b00526a392c07emr128848ywb.106.1675734157775; Mon, 06
 Feb 2023 17:42:37 -0800 (PST)
Date: Mon,  6 Feb 2023 17:42:02 -0800
In-Reply-To: <20230207014207.1678715-1-saravanak@google.com>
Message-Id: <20230207014207.1678715-11-saravanak@google.com>
Mime-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Subject: [PATCH v3 10/12] irqchip/irq-imx-gpcv2: Mark fwnode device as not initialized
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
X-CRM114-CacheID: sfid-20230207_014206_790076_7B4B5856 
X-CRM114-Status: GOOD (  18.55  )
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

Since this device is only partially initialized by the irqchip driver,
we need to mark the fwnode device as not initialized. This is to let
fw_devlink know that the device will be completely initialized at a
later point. That way, fw_devlink will continue to defer the probe of
the power domain consumers till the power domain driver successfully
binds to the struct device and completes the initialization of the
device.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/irqchip/irq-imx-gpcv2.c | 1 +
 drivers/soc/imx/gpcv2.c         | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index b9c22f764b4d..8a0e82067924 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -283,6 +283,7 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	 * later the GPC power domain driver will not be skipped.
 	 */
 	of_node_clear_flag(node, OF_POPULATED);
+	fwnode_dev_initialized(domain->fwnode, false);
 	return 0;
 }
 
diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c
index 7a47d14fde44..4b3300b090a8 100644
--- a/drivers/soc/imx/gpcv2.c
+++ b/drivers/soc/imx/gpcv2.c
@@ -1518,7 +1518,7 @@ static int imx_gpcv2_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx_pgc_power_down;
 
 		pd_pdev->dev.parent = dev;
-		pd_pdev->dev.of_node = np;
+		device_set_node(&pd_pdev->dev, of_fwnode_handle(np));
 
 		ret = platform_device_add(pd_pdev);
 		if (ret) {
-- 
2.39.1.519.gcb327c4b5f-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
