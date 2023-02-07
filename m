Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23663C05027
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 02:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zQgCf8UY4v8UJa4PeQ2dcehlcgeYqlLB6Oj9QicRk9o=; b=zy3cKz6DydVGS+RvRjUx+SJ0AP
	SfM9gBfjzmc7f65w1jeaX513mDAgBKFGIRtKT44V6FdCWjSPTnRrfz1GhPaMwubXTAGcobmvC1QDC
	L1PBA2H4LCih5SWOHO3gU19TCTlZ1BV6CeIx34ONl3gLSYCN/xVEJYzHeFI/Affs7jpTKQ9eO1A2+
	EfWTug6fdLBCrZlQFUPl5IcSCABj3G7mHzkP6Lbd4XCLmNhD3St3SlS2a2v1mG3avvKgK9E5f8NTU
	0K5HlCuwhy+MigC0zex0wLhT7C4p39GAWMHRBmbLGVwh+EeNkL0ipxgOPIa8zHU1geZR9rx4Vozgi
	3LG+eYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPDKD-00AS58-AE; Tue, 07 Feb 2023 02:03:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPDKB-00AS4E-Mi
	for linux-mtd@bombadil.infradead.org; Tue, 07 Feb 2023 02:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YX1zBRfC33D3rDRElKAdT20jJS5RQeSlv0JzqWYnjho=; b=XiNd2/wEjf9r2Pgyh1gM2kMi7j
	09D9imgnRT/bH+Gkts1xSDmNqqssBg1nX3i2EcLZPp61JhyqxQCxiDV8ShDeO5YnfC3wElmg0m98h
	nuTb7Wjsk8emyj3Xs0IwEDOV1xLNIyOuTG4/nblK9eRgwFKkojOEauioaF9IH3+0yC2dQMm3pNTTZ
	LbweZl+uI2dV+Ba68Hm+r2EPgENmBHpBSpv2Hw145YmzfCZ7zk69OV8w2Vn00WNF7CZbvUArh8dMx
	uYWj02qV8FcFUK2AQn1sI6/99wKvbDfQIhIZPihrjwo+NX7F1Rh61PcloW/YDi5E6Dnq5Ob0ldIJ2
	Fxiw1wPw==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pPCzo-006k3y-25
	for linux-mtd@lists.infradead.org;
	Tue, 07 Feb 2023 01:42:15 +0000
Received: by mail-pj1-x104a.google.com with SMTP id a20-20020a17090ad81400b0022c3185ebbeso5300833pjv.3
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 17:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YX1zBRfC33D3rDRElKAdT20jJS5RQeSlv0JzqWYnjho=;
        b=UGmq1xHhmv8QgalRGnvex5vaBwzzKCS6zloJhLFOA04JYhf7s2xljRYpy9kTAoNsHa
         iBC98QSDMciwj7mZAoPpI2usajIcl1gF62f5Z4nG2GjxXwW1tEOTSt3uCwYi8iyDdG37
         BQfwQH+F5b5B8hHp73/BToUo9eBPbPtsoJG7VHsq9ww2xJmU91i6mybd4OadC8hcmn4L
         z/JS/fusQ1z+bJZfl9x8ljB4BFuvxFXBUNKd3sGG9GJYtq6qpJhSHd3ZvicyZg0osOk+
         QxgZAlVpjyrodYVEXosDI3FM0qnhjaVmzWT6ld85NejZtUeLAUKpBMz5nIKrGLcp4W86
         p/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YX1zBRfC33D3rDRElKAdT20jJS5RQeSlv0JzqWYnjho=;
        b=QvsVGf4YZsF6ldxpuNEzJgdzQkIU85MqIcZRjS3kCLarm4Q/6sTM552NQyJ4tbIvIT
         S9J2YmOqt49aCXYU2ihIol3SyMcbcobXluEcDaxVAU+DWEj7gvpuBMInw0sEvpMiUAc1
         fyFgNetOE5cXj+lT+8/+yf0myzJMkgDB4TQno/Gai+IdorWV1Ok/wqBNb61D6q5V2WbP
         tUHMdaHNg7//lfx25cR13kFVSVc9+b+9VTWDnmMp5hmQhEG0daWz1+W0AH00JFs4diP+
         Mm20yCpV0P5zeHGumES/1LbjMaKH/v6DQngCF/MhDmKZjjbUEfZPovVANiZs1LE7LrJE
         Raow==
X-Gm-Message-State: AO0yUKX9YQkuMvLs+9ghD20pNhxbLlW2ui2VMXErhrYhti6WfoAfDfQL
	RETPxgPR+xzogYLPmrV9nSXal/W3EumGQt8=
X-Google-Smtp-Source: AK7set8Gcli9J3BzSmSCx9wcmgEyp38uzEhI1HIWAsHDVULR2jB9pwdeXZpjU2A6RPq1Ak9f9gnun0I1Kq/a1mU=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ae1:aba6:f21c:4a94])
 (user=saravanak job=sendgmr) by 2002:a17:90a:1d4e:b0:230:ae97:c349 with SMTP
 id u14-20020a17090a1d4e00b00230ae97c349mr441075pju.8.1675734163194; Mon, 06
 Feb 2023 17:42:43 -0800 (PST)
Date: Mon,  6 Feb 2023 17:42:04 -0800
In-Reply-To: <20230207014207.1678715-1-saravanak@google.com>
Message-Id: <20230207014207.1678715-13-saravanak@google.com>
Mime-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Subject: [PATCH v3 12/12] mtd: mtdpart: Don't create platform device that'll
 never probe
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
X-CRM114-CacheID: sfid-20230207_014209_040208_D4DDDD0A 
X-CRM114-Status: GOOD (  15.98  )
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

These "nvmem-cells" platform devices never get probed because there's no
platform driver for it and it's never used anywhere else. So it's a
waste of memory. These devices also cause fw_devlink to block nvmem
consumers of "nvmem-cells" partition from probing because the supplier
device never probes.

So stop creating platform devices for nvmem-cells partitions to avoid
wasting memory and to avoid blocking probing of consumers.

Reported-by: Maxim Kiselev <bigunclemax@gmail.com>
Fixes: bcdf0315a61a ("mtd: call of_platform_populate() for MTD partitions")
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/mtd/mtdpart.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index d442fa94c872..85f5ee6f06fc 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -577,6 +577,7 @@ static int mtd_part_of_parse(struct mtd_info *master,
 {
 	struct mtd_part_parser *parser;
 	struct device_node *np;
+	struct device_node *child;
 	struct property *prop;
 	struct device *dev;
 	const char *compat;
@@ -594,6 +595,15 @@ static int mtd_part_of_parse(struct mtd_info *master,
 	else
 		np = of_get_child_by_name(np, "partitions");
 
+	/*
+	 * Don't create devices that are added to a bus but will never get
+	 * probed. That'll cause fw_devlink to block probing of consumers of
+	 * this partition until the partition device is probed.
+	 */
+	for_each_child_of_node(np, child)
+		if (of_device_is_compatible(child, "nvmem-cells"))
+			of_node_set_flag(child, OF_POPULATED);
+
 	of_property_for_each_string(np, "compatible", prop, compat) {
 		parser = mtd_part_get_compatible_parser(compat);
 		if (!parser)
-- 
2.39.1.519.gcb327c4b5f-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
