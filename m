Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE0DC64EC4
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 01:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+3qO1UTQpdgGDpjpr5SM8nRAS+SdC4CYMxj6ivwa9sY=; b=VID9J/G2toi5geRgaZJvItH6eD
	QVm/eFzzd7i/1/1AEqk6/Da1rHbRG18odKGDMH+vPxcJyYs3IQjNUssqTSe/quzunRtk0UngItiEX
	KiyGP0T5MNXto/X3t5EIG/+1TBNLhPE3cOKXj/fYb7208ugIQhDZacWv8Zmp8UGhjr3TgyrTH6CYX
	dzLc9B1VQXxqIxYKUzuU+unYVFNS43ab61GbnxMZ1i4TmIucV2GOibARalaB+ZOaemwjtAyFxMwpw
	5AH5LGxGvlubc24FGSXolTQvKG+U2I4X5JH8bVwut865akMuQefTJK3eyF+LYeAzHFXlIVt+RzwmT
	nUKmuXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPD03-00ANWL-Hl; Tue, 07 Feb 2023 01:42:23 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPCzy-00ANTP-EB
	for linux-mtd@lists.infradead.org; Tue, 07 Feb 2023 01:42:19 +0000
Received: by mail-pj1-x104a.google.com with SMTP id e11-20020a17090a77cb00b0022925dd66d3so9580856pjs.4
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 17:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rF935xJruDmZakfcqYl07qySBy4v0tdY/SRPeseRpYs=;
        b=nVLihGug+gPNpky+kL8lZ+ojXplNGe2YAeogfY96aFh2Qm/Qk1O3o22nE2SbLQGizJ
         IQUGcIv0V1RiPC3mFC95Ns51BBCdycBZmzZp1eBZeHMb3hEEexERUn9/qygKgFkVNpb0
         Diq/OdiPdmE0e1Mvqy6mPGaGFUAI0qc+AzilSeGTt20pgttfB2UI6oxiuR9XlQq9Felm
         iClxVp1dKr/FoyJc+rxT9XgQscF8UCsnjjVVGve0zIcTwL+GUrEfoISySe93O475VMth
         fWwpZNaXC0o8y1s1tvJPiWtm14hX9OdBngkkg5kHlfY9ArsLQ75uwryzy35mTFf3XSiq
         xXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rF935xJruDmZakfcqYl07qySBy4v0tdY/SRPeseRpYs=;
        b=W9vEZjQ8DkyTcDA2g7z6CukvJj9u5hMk8L2JY2p1v+gKu9ocBqsTfdrV8pHTApsocr
         ynag2MZUDtGPe0XPNimnjiii2Xh9oNeXmFTfC2zz8xt9StNqk8NTWJWm5WjbsSNsJLUK
         jznHHPrd8ncHwzFomf45du+W73B1hRu1Os/y8iVpKVz/9RfaMxnvwHmZOA216HXTp7wk
         ykhwWMTzLmpm8B3ixOGDv3iMbeKTzx4n+1IgXGZgaHmhOj3KXR2uCv7+l8r+rG8IeMzg
         WcNaQNkYbEa8jkyWjVN5TMMCr4R7iqSHl5rkOiV4gNAWNBxSPndRCI6LUD+UwCszCDsc
         OnfQ==
X-Gm-Message-State: AO0yUKX/u0+pLEI7t8T5githjklpTSSts1YyjOVuxVfY1k8tyw9dowbK
	9WE1l1AgLZKAKjwQHDMihjpDfkp7tCweZ7Q=
X-Google-Smtp-Source: AK7set9i7jgE6FpR3noUhzo8MnwFszLcteNew7Oyn7nbowkMqjNTsdQ07Wf9bCz+hy9cTEgusCXLrQQHzICPoq0=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ae1:aba6:f21c:4a94])
 (user=saravanak job=sendgmr) by 2002:a63:7114:0:b0:476:f69c:2304 with SMTP id
 m20-20020a637114000000b00476f69c2304mr169807pgc.77.1675734135795; Mon, 06 Feb
 2023 17:42:15 -0800 (PST)
Date: Mon,  6 Feb 2023 17:41:54 -0800
In-Reply-To: <20230207014207.1678715-1-saravanak@google.com>
Message-Id: <20230207014207.1678715-3-saravanak@google.com>
Mime-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Subject: [PATCH v3 02/12] driver core: fw_devlink: Improve check for fwnode
 with no device/driver
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
X-CRM114-CacheID: sfid-20230206_174218_495770_18BE1EB5 
X-CRM114-Status: GOOD (  18.32  )
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

fw_devlink shouldn't defer the probe of a device to wait on a supplier
that'll never have a struct device or will never be probed by a driver.
We currently check if a supplier falls into this category, but don't
check its ancestors. We need to check the ancestors too because if the
ancestor will never probe, then the supplier will never probe either.

Signed-off-by: Saravana Kannan <saravanak@google.com>
Tested-by: Colin Foster <colin.foster@in-advantage.com>
Tested-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/core.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 001e1914858d..368bfd96b511 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1867,6 +1867,35 @@ static int fw_devlink_relax_cycle(struct device *con, void *sup)
 	return ret;
 }
 
+static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
+{
+	struct device *dev;
+	bool ret;
+
+	if (!(fwnode->flags & FWNODE_FLAG_INITIALIZED))
+		return false;
+
+	dev = get_dev_from_fwnode(fwnode);
+	ret = !dev || dev->links.status == DL_DEV_NO_DRIVER;
+	put_device(dev);
+
+	return ret;
+}
+
+static bool fwnode_ancestor_init_without_drv(struct fwnode_handle *fwnode)
+{
+	struct fwnode_handle *parent;
+
+	fwnode_for_each_parent_node(fwnode, parent) {
+		if (fwnode_init_without_drv(parent)) {
+			fwnode_handle_put(parent);
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /**
  * fw_devlink_create_devlink - Create a device link from a consumer to fwnode
  * @con: consumer device for the device link
@@ -1948,9 +1977,16 @@ static int fw_devlink_create_devlink(struct device *con,
 		goto out;
 	}
 
-	/* Supplier that's already initialized without a struct device. */
-	if (sup_handle->flags & FWNODE_FLAG_INITIALIZED)
+	/*
+	 * Supplier or supplier's ancestor already initialized without a struct
+	 * device or being probed by a driver.
+	 */
+	if (fwnode_init_without_drv(sup_handle) ||
+	    fwnode_ancestor_init_without_drv(sup_handle)) {
+		dev_dbg(con, "Not linking %pfwP - Might never probe\n",
+			sup_handle);
 		return -EINVAL;
+	}
 
 	/*
 	 * DL_FLAG_SYNC_STATE_ONLY doesn't block probing and supports
-- 
2.39.1.519.gcb327c4b5f-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
