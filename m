Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BCED637DD
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jDNmuhNkhbD7uKFC3kW6qTcIW7s+6DuVDL2E/vdqb4=; b=GuMTCicJKw0zGA
	2+LO+dR90SvjY2P2S7SIXenAtVEfPwfK58AVYgSBUSOjZSdjY6RlomrtJlzg8hOzXzDrmKhGWFimq
	oEKPDy9obAlYPjK3nnaL9+tZJrD9xSnuu7eQ/6osvQVoFRfn/BEo0nYD8/JtdWCvcu6Q5pNvbZvDK
	IHdXp8Nejea2YiuY+Lfso8tfy2Ynf7Hgej1QqrD0WiJxGy0Wl4tnzIYte4z7d61C9J1x896XX+lGz
	yXuq7aOsEDXGHfWFEnoCd0zdgIAl1ua6r20VsDA+Z/A22Ev4a0Ayu9c/Q2rM2887aiKuBLKcvsKvV
	rBVxWtHPQmGF3tj5hwpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwLW-00000002na3-32Fl;
	Fri, 15 Nov 2024 13:26:46 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwLQ-00000002nSt-33BJ
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 13:26:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 208AB2000D;
	Fri, 15 Nov 2024 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731677196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BQvszEaafaOGtmCwU5uw9CwjZ8MoXUS0hbG2Xve76Qg=;
	b=FCtTBDlGQ2miJsQholvB/jA87euFnNj4WPdoQVt3wrc9rmDPmIZZ9/h3ZvsY0RSVGa4Bso
	PNlvZ1m7hgZqIv+xXqnZNuZkxhM7Rx/RCSDMwmVwBCZevL6i3HyQZnXXUNkQkabGGPE+FY
	TxHU/pz1NjwfQgjuBJWBFKKzxJq1fhhQE2zsYAUekZostNxl65z5DTjeKTU71vzxDnO6rh
	SBpJgQfho3WPfBGoCxnomb5B85KBjHPpby4h8CGTOzzey+D8v7r3yC6GVEKDhVne9iXri1
	QHgfnhfxEAXUPwl6kgPqyExxeA9Xaf9cESjji/peP5BugtYBL7e8w6h2brE7dg==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH v4 04/10] memory: ti-aemif: Create aemif_check_cs_timings()
Date: Fri, 15 Nov 2024 14:26:25 +0100
Message-ID: <20241115132631.264609-5-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
References: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_052641_074359_DDF01122 
X-CRM114-Status: GOOD (  17.21  )
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

aemif_calc_rate() check the validity of a new computed timing against a
'max' value given as input. This isn't convenient if we want to check
the CS timing configuration somewhere else in the code.

Wrap the verification of all the chip select's timing configuration into a
single function to ease its exportation in upcoming patches.
Remove the 'max' input from aemif_calc_rate() as it's no longer used.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/memory/ti-aemif.c | 107 +++++++++++++++++---------------------
 1 file changed, 49 insertions(+), 58 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index aec6d6464efa..5c1c6f95185f 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -132,18 +132,48 @@ struct aemif_device {
 	struct aemif_cs_data cs_data[NUM_CS];
 };
 
+/**
+ * aemif_check_cs_timings - Check the validity of a CS timing configuration.
+ * @timings: timings configuration
+ *
+ * @return: 0 if the timing configuration is valid, negative error number otherwise.
+ */
+static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
+{
+	if (timings->ta > TA_MAX)
+		return -EINVAL;
+
+	if (timings->rhold > RHOLD_MAX)
+		return -EINVAL;
+
+	if (timings->rstrobe > RSTROBE_MAX)
+		return -EINVAL;
+
+	if (timings->rsetup > RSETUP_MAX)
+		return -EINVAL;
+
+	if (timings->whold > WHOLD_MAX)
+		return -EINVAL;
+
+	if (timings->wstrobe > WSTROBE_MAX)
+		return -EINVAL;
+
+	if (timings->wsetup > WSETUP_MAX)
+		return -EINVAL;
+
+	return 0;
+}
+
 /**
  * aemif_calc_rate - calculate timing data.
  * @pdev: platform device to calculate for
  * @wanted: The cycle time needed in nanoseconds.
  * @clk: The input clock rate in kHz.
- * @max: The maximum divider value that can be programmed.
  *
  * On success, returns the calculated timing value minus 1 for easy
  * programming into AEMIF timing registers, else negative errno.
  */
-static int aemif_calc_rate(struct platform_device *pdev, int wanted,
-			   unsigned long clk, int max)
+static int aemif_calc_rate(struct platform_device *pdev, int wanted, unsigned long clk)
 {
 	int result;
 
@@ -156,10 +186,6 @@ static int aemif_calc_rate(struct platform_device *pdev, int wanted,
 	if (result < 0)
 		result = 0;
 
-	/* ... But configuring tighter timings is not an option. */
-	else if (result > max)
-		result = -EINVAL;
-
 	return result;
 }
 
@@ -249,7 +275,6 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
 	struct aemif_device *aemif = platform_get_drvdata(pdev);
 	unsigned long clk_rate = aemif->clk_rate;
 	struct aemif_cs_data *data;
-	int ret;
 	u32 cs;
 	u32 val;
 
@@ -275,68 +300,34 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
 	aemif_get_hw_params(pdev, aemif->num_cs++);
 
 	/* override the values from device node */
-	if (!of_property_read_u32(np, "ti,cs-min-turnaround-ns", &val)) {
-		ret = aemif_calc_rate(pdev, val, clk_rate, TA_MAX);
-		if (ret < 0)
-			return ret;
-
-		data->timings.ta = ret;
-	}
+	if (!of_property_read_u32(np, "ti,cs-min-turnaround-ns", &val))
+		data->timings.ta = aemif_calc_rate(pdev, val, clk_rate);
 
-	if (!of_property_read_u32(np, "ti,cs-read-hold-ns", &val)) {
-		ret = aemif_calc_rate(pdev, val, clk_rate, RHOLD_MAX);
-		if (ret < 0)
-			return ret;
-
-		data->timings.rhold = ret;
-	}
+	if (!of_property_read_u32(np, "ti,cs-read-hold-ns", &val))
+		data->timings.rhold = aemif_calc_rate(pdev, val, clk_rate);
 
-	if (!of_property_read_u32(np, "ti,cs-read-strobe-ns", &val)) {
-		ret = aemif_calc_rate(pdev, val, clk_rate, RSTROBE_MAX);
-		if (ret < 0)
-			return ret;
+	if (!of_property_read_u32(np, "ti,cs-read-strobe-ns", &val))
+		data->timings.rstrobe = aemif_calc_rate(pdev, val, clk_rate);
 
-		data->timings.rstrobe = ret;
-	}
+	if (!of_property_read_u32(np, "ti,cs-read-setup-ns", &val))
+		data->timings.rsetup = aemif_calc_rate(pdev, val, clk_rate);
 
-	if (!of_property_read_u32(np, "ti,cs-read-setup-ns", &val)) {
-		ret = aemif_calc_rate(pdev, val, clk_rate, RSETUP_MAX);
-		if (ret < 0)
-			return ret;
+	if (!of_property_read_u32(np, "ti,cs-write-hold-ns", &val))
+		data->timings.whold = aemif_calc_rate(pdev, val, clk_rate);
 
-		data->timings.rsetup = ret;
-	}
+	if (!of_property_read_u32(np, "ti,cs-write-strobe-ns", &val))
+		data->timings.wstrobe = aemif_calc_rate(pdev, val, clk_rate);
 
-	if (!of_property_read_u32(np, "ti,cs-write-hold-ns", &val)) {
-		ret = aemif_calc_rate(pdev, val, clk_rate, WHOLD_MAX);
-		if (ret < 0)
-			return ret;
-
-		data->timings.whold = ret;
-	}
-
-	if (!of_property_read_u32(np, "ti,cs-write-strobe-ns", &val)) {
-		ret = aemif_calc_rate(pdev, val, clk_rate, WSTROBE_MAX);
-		if (ret < 0)
-			return ret;
-
-		data->timings.wstrobe = ret;
-	}
-
-	if (!of_property_read_u32(np, "ti,cs-write-setup-ns", &val)) {
-		ret = aemif_calc_rate(pdev, val, clk_rate, WSETUP_MAX);
-		if (ret < 0)
-			return ret;
-
-		data->timings.wsetup = ret;
-	}
+	if (!of_property_read_u32(np, "ti,cs-write-setup-ns", &val))
+		data->timings.wsetup = aemif_calc_rate(pdev, val, clk_rate);
 
 	if (!of_property_read_u32(np, "ti,cs-bus-width", &val))
 		if (val == 16)
 			data->asize = 1;
 	data->enable_ew = of_property_read_bool(np, "ti,cs-extended-wait-mode");
 	data->enable_ss = of_property_read_bool(np, "ti,cs-select-strobe-mode");
-	return 0;
+
+	return aemif_check_cs_timings(&data->timings);
 }
 
 static const struct of_device_id aemif_of_match[] = {
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
