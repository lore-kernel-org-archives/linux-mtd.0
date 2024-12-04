Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC399E77177
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2024 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbwyDtjQfZFVYNWcEC0hbE/R2SSCB9fCfQ5qTQpCKXQ=; b=TFYVKix0cr4Gmp
	Cxad9vf2Sg+//+nqz2pldQ7TaS4XUOsiYNfdoIgMTUgBoSGN3c7ledeEDp4c1zu0IukGWMaAF2y73
	ShWXSO76E8z4taEmsKMjPmhjoGb1F4k8JfLr1Czbwom6h5TQn55AKnsYr4fl5tDJhSRc1tPTKKlVx
	qWUGOkA4Tj2/mV4FjlA/VzlP/YcRY/sC7J6a3BpO9BXjXKWStvqklwGO4ye81vF0PWUOae1Ao6cnv
	5TaasCWb6HFBnZCVdtXjZL93WG4PbmRAYsOCtxek0AjAqbogipBq50G2l37VPEylnONtCW5ReGuxH
	8AX2KYiL9XfEVMnG+jrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlxm-0000000C6J1-0OVa;
	Wed, 04 Dec 2024 09:46:30 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlut-0000000C5aq-2se7
	for linux-mtd@lists.infradead.org;
	Wed, 04 Dec 2024 09:43:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0A516000D;
	Wed,  4 Dec 2024 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733305405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLNmuyNTbzPAZ139Ma4EX78v29Ja1psgE6Q61skRI0g=;
	b=LW/hS81rrWVrxHLeqjPvjzr2pklCxlxGHd0UCipicJDkS/2hDINzkNeb9SFfjiPTk0T/kq
	kn6CO8dcyNI+e3xGMEnYYzVSJEUQtIMABi0aZWVQo7s05bxyjp1qMp0W2oKBu+XByBc8yO
	jJH4dY89VlN9qfJAiu+5o1qL9+EIT35ogDijhBMAfkEtX0SYA3zqSSUGPy/xtJDtWJ4dL1
	ss+PF7gth4LbOWTjPjf8d4MDQBExaMkH+7FsuJp23ypX539/svrb017aOEMDC3gn+nuXb0
	1xhi+8PKUFq1q9It/EnaesdY49wU9ZYENXzoSe2yHP+aXsC57a3i9RnqsBCnog==
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
Subject: [PATCH v5 4/9] memory: ti-aemif: Create aemif_check_cs_timings()
Date: Wed,  4 Dec 2024 10:43:14 +0100
Message-ID: <20241204094319.1050826-5-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
References: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_014331_984436_4687A085 
X-CRM114-Status: GOOD (  19.83  )
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

aemif_calc_rate() checks the validity of a new computed timing against a
'max' value given as input. This isn't convenient if we want to check
the CS timing configuration somewhere else in the code.

Wrap the verification of all the chip select's timing configuration into a
single function to ease its exportation in upcoming patches.
Remove the validity check from aemif_calc_rate(). Also remove the no
longer used 'max' input and change the return type to u32.
Remove the check of the aemif_calc_rate()'s return value during
device-tree parsing as aemif_calc_rate() can't fail anymore.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/memory/ti-aemif.c | 111 ++++++++++++++++++--------------------
 1 file changed, 51 insertions(+), 60 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index 1d1b30112af5..ec770a2668e7 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -133,18 +133,48 @@ struct aemif_device {
 	struct aemif_cs_data cs_data[NUM_CS];
 };
 
+/**
+ * aemif_check_cs_timings() - Check the validity of a CS timing configuration.
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
- * On success, returns the calculated timing value minus 1 for easy
- * programming into AEMIF timing registers, else negative errno.
+ * @return: the calculated timing value minus 1 for easy
+ * programming into AEMIF timing registers.
  */
-static int aemif_calc_rate(struct platform_device *pdev, int wanted,
-			   unsigned long clk, int max)
+static u32 aemif_calc_rate(struct platform_device *pdev, int wanted, unsigned long clk)
 {
 	int result;
 
@@ -157,10 +187,6 @@ static int aemif_calc_rate(struct platform_device *pdev, int wanted,
 	if (result < 0)
 		result = 0;
 
-	/* ... But configuring tighter timings is not an option. */
-	else if (result > max)
-		result = -EINVAL;
-
 	return result;
 }
 
@@ -250,7 +276,6 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
 	struct aemif_device *aemif = platform_get_drvdata(pdev);
 	unsigned long clk_rate = aemif->clk_rate;
 	struct aemif_cs_data *data;
-	int ret;
 	u32 cs;
 	u32 val;
 
@@ -276,68 +301,34 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
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
