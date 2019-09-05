Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2443BC43331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:19:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFCE82082E
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BMomRVGm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+cZWsZu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFCE82082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cjoVQ38UaKo6aeT5JFTs6YtIoig+lak31ZeiJeVA4ow=; b=BMomRVGmnZZ+tXb5i4EvmWfEM4
	bzqNDRs4HFgb8yfQ9WS8KKoUzcth8g3Brxad525sxfewYKSsHJpzLzdrLe8KoYHTva6UbZ71ggG8m
	Y08zMghIYAR5K+yCAFuTlYeMPeQ7u3cOxaI4IKHBVPbsGsBbNL4J/PixmPIU7MyAoU8NfXXACeVYe
	jhTCaq2cLb7aw0g5f7KwKADSA58Ro8p3wbsumpq25RTdkVZ1cZTDSZBgGbytLGdzqEULLfdZN3rHK
	7pL1D1ShyBkXJ83V/KUuYNkkJxqC9Fslalv+/iRGhqkcaIjlBxWMrfNNHYLtDgEgi1wcn5FFULdXK
	EFigl6Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uTG-0001tA-31; Thu, 05 Sep 2019 16:18:54 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uSU-0000rM-Jy
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:08 +0000
Received: by mail-pf1-x444.google.com with SMTP id q5so2049678pfg.13
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oxweDnammrNyIt2aaQLCe6r9vThCpXKTK19Q9yGm1E4=;
 b=B+cZWsZuXFEQB01N9qcY/nKk7nFveM0bQSkHouQZ+2v8KRCDItQu12g91o55OqiDIl
 SQnnn5r6vvZTn3KSmZR9+5rl9wxcTUw4H96aAEmGDnjJxx3uKAFfio+dNp5I+wQr3Vwe
 gbXWR4hTOwsV+tXvAEB+6kyHio5Z54rthgV5q6RE89zhMs4lr/LJm01282eHycMXzU0z
 U9a2VMJKcYvCVPouURNHnaM7gNG9pAlCnZKkh1Y0vrCEBkYcoJQ5dlKEJOS6mj8Rfcf/
 3BOqGGxylR2E7voPViPNnWEY2QFJ0exUKtekqdkZckIcT8g6oOqpENw3lQbrUEfCQSqK
 d4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oxweDnammrNyIt2aaQLCe6r9vThCpXKTK19Q9yGm1E4=;
 b=DYi/gWo/kevNjlcfXde3qV4EJg1Me6XtWdx8sKyfeRFhfAcIkFAtYKF6KIVAj6d/ea
 PWTTmrahF08bGu8dWoMzAMLvMQmTmNGGN001HXybjtGWLJDmaWWTQjvh8C0XpOwU5MAZ
 zdNuuI+mKNfDuw51aHlqbd9y+ZbJDhvJ6PPi3bjmzppY0wPcxNbM8zuLo6aV8RaJe5iF
 lV8zvuv3psVdRklC8fmOcE4asktkFzutBOAddrMeUNPkE7Yi7j4oNg5BM9V4rh1iaju/
 NG+96zqtMHqIChOP/RxZM8K34a6d6x+Czpvtb67Kt6MBfgXY8XLT8Fa+s4+H0sleuoD0
 WMKw==
X-Gm-Message-State: APjAAAVFJmuXJMxRc3qwt17FjxYLd8My0KCl0DTthmEB0yOTc35irNJQ
 gtuxD5SczVESXx0F2HWsM0uf/w==
X-Google-Smtp-Source: APXvYqztrUm14X1kqPalVQhtzDPhMyl9ZuipQZ2gB9IH4meo0O8XJPRIpaw1CUbOHUi6IeHE59j1dQ==
X-Received: by 2002:a17:90a:303:: with SMTP id 3mr4750663pje.124.1567700285921; 
 Thu, 05 Sep 2019 09:18:05 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:05 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 04/18] usb: dwc3: Allow disabling of metastability
 workaround
Date: Thu,  5 Sep 2019 10:17:45 -0600
Message-Id: <20190905161759.28036-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091806_688984_EFBFADAF 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Roger Quadros <rogerq@ti.com>

commit 42bf02ec6e420e541af9a47437d0bdf961ca2972 upstream

Some platforms (e.g. TI's DRA7 USB2 instance) have more trouble
with the metastability workaround as it supports only
a High-Speed PHY and the PHY can enter into an Erratic state [1]
when the controller is set in SuperSpeed mode as part of
the metastability workaround.

This causes upto 2 seconds delay in enumeration on DRA7's USB2
instance in gadget mode.

If these platforms can be better off without the workaround,
provide a device tree property to suggest that so the workaround
is avoided.

[1] Device mode enumeration trace showing PHY Erratic Error.
     irq/90-dwc3-969   [000] d...    52.323145: dwc3_event: event (00000901): Erratic Error [U0]
     irq/90-dwc3-969   [000] d...    52.560646: dwc3_event: event (00000901): Erratic Error [U0]
     irq/90-dwc3-969   [000] d...    52.798144: dwc3_event: event (00000901): Erratic Error [U0]

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 drivers/usb/dwc3/core.c                        | 3 +++
 drivers/usb/dwc3/core.h                        | 3 +++
 drivers/usb/dwc3/gadget.c                      | 6 ++++--
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 52fb41046b34..44e8bab159ad 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -47,6 +47,8 @@ Optional properties:
 			from P0 to P1/P2/P3 without delay.
  - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate check
 			during HS transmit.
+ - snps,dis_metastability_quirk: when set, disable metastability workaround.
+			CAUTION: use only if you are absolutely sure of it.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
 			utmi_l1_suspend_n, false when asserts utmi_sleep_n
  - snps,hird-threshold: HIRD threshold
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 945330ea8d5c..9b093978bd24 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1115,6 +1115,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
 				 &dwc->fladj);
 
+	dwc->dis_metastability_quirk = device_property_read_bool(dev,
+				"snps,dis_metastability_quirk");
+
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index abd1142c9e4d..40bf0e0768d9 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -869,6 +869,7 @@ struct dwc3_scratchpad_array {
  * 	1	- -3.5dB de-emphasis
  * 	2	- No de-emphasis
  * 	3	- Reserved
+ * @dis_metastability_quirk: set to disable metastability quirk.
  * @imod_interval: set the interrupt moderation interval in 250ns
  *                 increments or 0 to disable.
  */
@@ -1025,6 +1026,8 @@ struct dwc3 {
 	unsigned		tx_de_emphasis_quirk:1;
 	unsigned		tx_de_emphasis:2;
 
+	unsigned		dis_metastability_quirk:1;
+
 	u16			imod_interval;
 };
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 1b99d44e52b9..5916340c4162 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2034,7 +2034,8 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 	 * STAR#9000525659: Clock Domain Crossing on DCTL in
 	 * USB 2.0 Mode
 	 */
-	if (dwc->revision < DWC3_REVISION_220A) {
+	if (dwc->revision < DWC3_REVISION_220A &&
+	    !dwc->dis_metastability_quirk) {
 		reg |= DWC3_DCFG_SUPERSPEED;
 	} else {
 		switch (speed) {
@@ -3265,7 +3266,8 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	 * is less than super speed because we don't have means, yet, to tell
 	 * composite.c that we are USB 2.0 + LPM ECN.
 	 */
-	if (dwc->revision < DWC3_REVISION_220A)
+	if (dwc->revision < DWC3_REVISION_220A &&
+	    !dwc->dis_metastability_quirk)
 		dev_info(dwc->dev, "changing max_speed on rev %08x\n",
 				dwc->revision);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
