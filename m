Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41034C636D3
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 01:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TIYcY0HEo0L362qbjNmopbXLMfxCTGxHgyX2l326Av0=; b=f2XQczUVtmWrZFk92DAHXSAlTy
	JuKFKymhF3BQmloiffa74/sqlT6Vt+o768XzZyjCuS2ypsDFrpby5gRxQrw48sFnEN8zpL9YZDfYl
	QBpiPl1KaI9zfPAe2cvPrSwyPIkju8cR0PPpg2P5VUyhMBUPfSG1vjojELIIfvoHXmoe2yEfpZJf9
	dGukWbEYGu0gXmXfgQb3TzlmxAN6E3NFwQSKVhdPV9y//JnOM0sbc60KKmzNOZlXjoPQzaBDRL6Dk
	syem2ap8qcTTPaxHBBUUpd0fxtborqBqPRrzipj46aCYLLDTc2Ewbf9WY5nA1+aZKmAebvIrKHfMy
	XCtsW7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPD0J-00ANfM-1T; Tue, 07 Feb 2023 01:42:39 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPD0A-00ANZq-Ph
	for linux-mtd@lists.infradead.org; Tue, 07 Feb 2023 01:42:32 +0000
Received: by mail-pj1-x1049.google.com with SMTP id gn18-20020a17090ac79200b0022bef1f49c9so251892pjb.0
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 17:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGHkdwcUfLjfQ2SnsdEOolH8s6ejvGtumPkNayiDgT8=;
        b=cmJIPfjh2AT7clgu/AcVdJaljQV0PRWLl0KlermC6ZkWT+Ktm1K8V1Irljae7Bq8Fd
         GbMsUz601iHCeLXt4v0Rnf+ruid/MJUPH3GyDn0qe5TYc01L/zU3AL0CiSXNq1mNWjTP
         qE08lD8A69+o55t4ttKFQVGkWdLDRR8RChew8VuR1jgPsH29lSPfBKrH1qLMmzlD69Rx
         RerElbokUWXmYixLrXoTaVym2o+myHxz/3QHu0Xwx3AQe5+HEcLgMIGCNNDKIwLCqPXY
         y2wwvn6c/RMBhyRh+SXPpusHhU9Q8LtVjjKcpVYhLKb5nc+g+TuZKIzFEEnmrOG2qcUI
         9knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGHkdwcUfLjfQ2SnsdEOolH8s6ejvGtumPkNayiDgT8=;
        b=GlHNu3eqTNzbNzj1i1+DUHLuYA8b//6W+tSJPvU8Zmv1ceHIZMEvBgzLWdloujaWf0
         /cVLNhTKwyIQ/8UWrzz3fDyLT51X3+A010mUTAnyLu2fQJmqDt+haKPD8Y5vXf5QTQ2Z
         Wyc5JFMjqtYREy+O3UJo1uwb7bbuATYs/TyCAnefT80XiLxOyzIiJ9A63V1deG73EbNY
         qPsnIAGk0Pfn/YJUg5P1gNUihKQtphMQ+V7datWk+WN03BPiTg4CUyN6TPkT4KQa5ZKC
         5oSeJUbiHJCQLzHVKAWxUTp0g8HW65CCr9pmBwD3XIBVp/kuTgZBlw3WLTw7mCVX0W1I
         MDjg==
X-Gm-Message-State: AO0yUKXCssx/3ot5h3lMimXgcicqml+ysHQpsd5l8S5ly9OSr/9xUYpj
	Ml6p+Tm1BV36mTUW1IUqIkkXHsLiBfdYpbc=
X-Google-Smtp-Source: AK7set+tPnBqk0Wq06gNiBk48vsYJFP2q19C+ua9C9YCIEMT4/WAsanOpJamvGVlOlVgWMjXunH03PJr6mwa1NE=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ae1:aba6:f21c:4a94])
 (user=saravanak job=sendgmr) by 2002:a17:90a:55c7:b0:230:9d6c:5e96 with SMTP
 id o7-20020a17090a55c700b002309d6c5e96mr425362pjm.100.1675734149506; Mon, 06
 Feb 2023 17:42:29 -0800 (PST)
Date: Mon,  6 Feb 2023 17:41:59 -0800
In-Reply-To: <20230207014207.1678715-1-saravanak@google.com>
Message-Id: <20230207014207.1678715-8-saravanak@google.com>
Mime-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Subject: [PATCH v3 07/12] driver core: fw_devlink: Consolidate device link
 flag computation
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
X-CRM114-CacheID: sfid-20230206_174230_859002_CD750503 
X-CRM114-Status: GOOD (  20.25  )
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

Consolidate the code that computes the flags to be used when creating a
device link from a fwnode link.

Fixes: 2de9d8e0d2fe ("driver core: fw_devlink: Improve handling of cyclic dependencies")
Signed-off-by: Saravana Kannan <saravanak@google.com>
Tested-by: Colin Foster <colin.foster@in-advantage.com>
Tested-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/core.c    | 28 +++++++++++++++-------------
 include/linux/fwnode.h |  1 -
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4869b6fdfeaf..e4b60436a4a4 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1727,8 +1727,11 @@ static int __init fw_devlink_strict_setup(char *arg)
 }
 early_param("fw_devlink.strict", fw_devlink_strict_setup);
 
-u32 fw_devlink_get_flags(void)
+static inline u32 fw_devlink_get_flags(u8 fwlink_flags)
 {
+	if (fwlink_flags & FWLINK_FLAG_CYCLE)
+		return FW_DEVLINK_FLAGS_PERMISSIVE | DL_FLAG_CYCLE;
+
 	return fw_devlink_flags;
 }
 
@@ -1938,7 +1941,7 @@ static bool fwnode_ancestor_init_without_drv(struct fwnode_handle *fwnode)
  * fw_devlink_create_devlink - Create a device link from a consumer to fwnode
  * @con: consumer device for the device link
  * @sup_handle: fwnode handle of supplier
- * @flags: devlink flags
+ * @link: fwnode link that's being converted to a device link
  *
  * This function will try to create a device link between the consumer device
  * @con and the supplier device represented by @sup_handle.
@@ -1955,10 +1958,17 @@ static bool fwnode_ancestor_init_without_drv(struct fwnode_handle *fwnode)
  *  possible to do that in the future
  */
 static int fw_devlink_create_devlink(struct device *con,
-				     struct fwnode_handle *sup_handle, u32 flags)
+				     struct fwnode_handle *sup_handle,
+				     struct fwnode_link *link)
 {
 	struct device *sup_dev;
 	int ret = 0;
+	u32 flags;
+
+	if (con->fwnode == link->consumer)
+		flags = fw_devlink_get_flags(link->flags);
+	else
+		flags = FW_DEVLINK_FLAGS_PERMISSIVE;
 
 	/*
 	 * In some cases, a device P might also be a supplier to its child node
@@ -2091,7 +2101,6 @@ static void __fw_devlink_link_to_consumers(struct device *dev)
 	struct fwnode_link *link, *tmp;
 
 	list_for_each_entry_safe(link, tmp, &fwnode->consumers, s_hook) {
-		u32 dl_flags = fw_devlink_get_flags();
 		struct device *con_dev;
 		bool own_link = true;
 		int ret;
@@ -2121,14 +2130,13 @@ static void __fw_devlink_link_to_consumers(struct device *dev)
 				con_dev = NULL;
 			} else {
 				own_link = false;
-				dl_flags = FW_DEVLINK_FLAGS_PERMISSIVE;
 			}
 		}
 
 		if (!con_dev)
 			continue;
 
-		ret = fw_devlink_create_devlink(con_dev, fwnode, dl_flags);
+		ret = fw_devlink_create_devlink(con_dev, fwnode, link);
 		put_device(con_dev);
 		if (!own_link || ret == -EAGAIN)
 			continue;
@@ -2169,19 +2177,13 @@ static void __fw_devlink_link_to_suppliers(struct device *dev,
 	bool own_link = (dev->fwnode == fwnode);
 	struct fwnode_link *link, *tmp;
 	struct fwnode_handle *child = NULL;
-	u32 dl_flags;
-
-	if (own_link)
-		dl_flags = fw_devlink_get_flags();
-	else
-		dl_flags = FW_DEVLINK_FLAGS_PERMISSIVE;
 
 	list_for_each_entry_safe(link, tmp, &fwnode->suppliers, c_hook) {
 		int ret;
 		struct device *sup_dev;
 		struct fwnode_handle *sup = link->supplier;
 
-		ret = fw_devlink_create_devlink(dev, sup, dl_flags);
+		ret = fw_devlink_create_devlink(dev, sup, link);
 		if (!own_link || ret == -EAGAIN)
 			continue;
 
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index fdf2ee0285b7..5700451b300f 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -207,7 +207,6 @@ static inline void fwnode_dev_initialized(struct fwnode_handle *fwnode,
 		fwnode->flags &= ~FWNODE_FLAG_INITIALIZED;
 }
 
-extern u32 fw_devlink_get_flags(void);
 extern bool fw_devlink_is_strict(void);
 int fwnode_link_add(struct fwnode_handle *con, struct fwnode_handle *sup);
 void fwnode_links_purge(struct fwnode_handle *fwnode);
-- 
2.39.1.519.gcb327c4b5f-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
