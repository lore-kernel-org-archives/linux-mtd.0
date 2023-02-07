Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90F0C05027
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 02:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dZkz/txzxp/N5lRhaHVElpLSL/32LK1Fk1jO/MZh8qA=; b=nDUL5lesES7zYfY9kYIz8f8Qau
	Kk8LHmVyZ2npgpAq+Q2DeigTLhfUqPJ9hvWCubueJawgszE4VGj1SXdPrXc2vuPZXScyxk59m7zr7
	97VcHIIvBr7UugwUFi7N632dQdR6jmPvI3gMaoUT4sxrIv9gmM/zs3/qIx7CqeLkLFkvztGxm3uZX
	aMHTXvNh8ajKzPFNi26Orp94pGqjg1FUdtnnCCb3gAnSW6k2KFYDeXHtMmf8oogG4YVEdRcfYRlP3
	1DE4a9CqNC5p7AM3Po8zFlcxVKlx32I4JtDf2EhJOqiv0Cn32j/tCVJEqUV59/3+EfIoqxIxiCvir
	jIiQPsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPDJb-00ARqC-Qx; Tue, 07 Feb 2023 02:02:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPDJa-00ARpx-GW
	for linux-mtd@bombadil.infradead.org; Tue, 07 Feb 2023 02:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qO7SA/IWYPEhdvQ3bg5afBtNBnjngejmFoW2WqOrddI=; b=UkgloHHkQalqpljPpE2+VJVwey
	0+za0u+dtm3J9wapKThHD6itA1w5rA4EOE2EgQQTaDfwF5xPnBmOf+ETLlYoviri2O/R6jL39kGa1
	UiAGRU9bOR7qZbVveDuGceB1j/PV/+hboQjheu8vhOKwgYqtLH3SXBLI6t64iZ+3d23giY07Gn7tK
	zXHwUwUcQiLomSTYrYzRHmt5SwMGN8g/Twe9MsCpwIEur+SbMMxpVpXE69ZG26MfKEc/2DNtXEpvf
	zvOxiJjbsOoY2RhLvzz/X9AidbP2zRwVaynY2QMbyCH3fvrene2lNA/V9rPUL6EjfSeGqmXHeMQcU
	vmshD2Kw==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pPCzl-006k3a-0r
	for linux-mtd@lists.infradead.org;
	Tue, 07 Feb 2023 01:42:07 +0000
Received: by mail-pf1-x449.google.com with SMTP id k14-20020aa7972e000000b00593a8232ac3so7377517pfg.22
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 17:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qO7SA/IWYPEhdvQ3bg5afBtNBnjngejmFoW2WqOrddI=;
        b=GazeBruttlU5oTI33IWVV1tAUn4JRdRTAmGz0onik+n6U1T5h3g5Eqk7gGdOGMDK/b
         pISWVmhqDorcgwiUsTtbwUhwsXkQBy9FbOADGd10qeFLJKcjSWm9FlwkrDf0YSZnQ9+5
         MlI9mebazN/CBNgen9ENy7akZji0sNSLpJDHAKCcuu7sotue0FW2RA5Bj0NTsc48DOU1
         BJ2j+WUhTu8DoyxWUtbwaehDC8ppns7BWt2T/8qAizu6/ITBGfNfqXYJKkF1ZM6CyRxn
         ZcscZDUsMpAZKiRckNDj1rDjE8L096aAxpbX+tYBH1Uk2VlibG8o8TaOGQfpibf5qmCu
         A4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qO7SA/IWYPEhdvQ3bg5afBtNBnjngejmFoW2WqOrddI=;
        b=AeAyVfgJoD0c4o+isUNuGxU7d/EMAby9UKakYrBFmdISTIVgHDvWlGa2tjshTKwvpR
         t+4yhLuNGdBWzebIaJglB9JFCfGQjQwiUSJil8fgnGS/Pvp2vGRhdRipipaRETvqWcuS
         t+VJqFkEDMZUe6Dp9FoMWdt+ermRveauqlP8UilXkTqCAnZLogLHd51htKz+5uQA2cXN
         T3OA73IJ/ip7qY0gJCruMQ8Gz8ccRzWY8i9qSPbqUSzRre7M8eO9b21Pp1Tit9RugmJH
         aSbgDjciPyKsrnFo26sfleGlJoOF1oXkHismyfeNGLCs6mLJRDqhyscBLnZLwsAdFlDj
         APnw==
X-Gm-Message-State: AO0yUKVkgORoSZcTNeZusbZ4m5UtOY5RfvOduQZXZTSRv1lZo8h5hhGx
	IRFDtgFGdiNPRLIg3KyZP8BXvp1zbfDUJUg=
X-Google-Smtp-Source: AK7set8CF2GrP/NVxAgKrUj8AGlYPMKVoXXaqrQpeXZ8O8WzceQ78vPHdt/Q5BozlBJGRB5LWE1p0PTeySIpdfY=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ae1:aba6:f21c:4a94])
 (user=saravanak job=sendgmr) by 2002:a63:7304:0:b0:4da:d745:98dd with SMTP id
 o4-20020a637304000000b004dad74598ddmr170930pgc.62.1675734160457; Mon, 06 Feb
 2023 17:42:40 -0800 (PST)
Date: Mon,  6 Feb 2023 17:42:03 -0800
In-Reply-To: <20230207014207.1678715-1-saravanak@google.com>
Message-Id: <20230207014207.1678715-12-saravanak@google.com>
Mime-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Subject: [PATCH v3 11/12] firmware: arm_scmi: Set fwnode for the scmi_device
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
X-CRM114-CacheID: sfid-20230207_014205_607163_B89EDE78 
X-CRM114-Status: GOOD (  12.45  )
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

This allows fw_devlink to track and enforce supplier-consumer
dependencies for scmi_device.

Signed-off-by: Saravana Kannan <saravanak@google.com>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Tested-by: Colin Foster <colin.foster@in-advantage.com>
Tested-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 35bb70724d44..cc2eba067575 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/device.h>
+#include <linux/of.h>
 
 #include "common.h"
 
@@ -191,7 +192,7 @@ scmi_device_create(struct device_node *np, struct device *parent, int protocol,
 	scmi_dev->id = id;
 	scmi_dev->protocol_id = protocol;
 	scmi_dev->dev.parent = parent;
-	scmi_dev->dev.of_node = np;
+	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
 	scmi_dev->dev.bus = &scmi_bus_type;
 	scmi_dev->dev.release = scmi_device_release;
 	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
-- 
2.39.1.519.gcb327c4b5f-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
