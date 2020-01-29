Return-Path: <SRS0=VDEF=3S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3638CC2D0DB
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2020 20:37:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0957820702
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2020 20:37:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i6LnqtX3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="USIxJxVF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0957820702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OS0Vf/PVHYokZgPBsHCk2kJTTi/x+TZIT5usoZu9DCE=; b=i6LnqtX3KgD+3O
	JXkPkMJ5tioP2ZB5UHT7qW3xXMHXePIa1K8L4S65QRXjmjiempNCG4lml9hX+WzXwVM+sm9x/kQYV
	3fRYiOhBZX3WQMZIa1+Y9T3YD5+99D928VoL8OaOYGwOQn0R4rpnTcdPvw+RhnQWThEejvMPQsaAs
	ZFmtP2sA8iSPLfec2QzClr/ZsWklhoi80TNaBaJ7IZJpYXzSURNRs5alsVItJ5oHkr8hPdgnur4d0
	Jkyk1r2+H0/l+zieMx1CWbmfLA25lheHy9ZHwkpb5oSm25DAuO9fc/5hS5RDMx0WwY+fT7ie126rT
	6QSU5MhwtX4U7hS/QiBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwu5o-0003Ar-54; Wed, 29 Jan 2020 20:37:44 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwu5l-0003AR-CK
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2020 20:37:42 +0000
Received: by mail-lj1-x242.google.com with SMTP id w1so857100ljh.5
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2020 12:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m3RECKwntzDqTHrGIrCHwsGgp0L7QbNk7gHMMiY5RtE=;
 b=USIxJxVFKX1+ZpD0oTocIrWB1W76/DCKGYPtm/KvxdnKauUCuf0L4+ySKsg5ATjF2W
 w+5U23tUVcjiMu7UKeYfOvqc3a2u50xQBIH+I7iVtOybL4ZsvlKIBZDvbyP8pmwACwPZ
 WCoSiZXC1kBbTdTTrPuEftphbN1tD9m4rb2ZlCxOpJLzKVESqT7A3Il1/RXSmlOB3qn7
 Egw6ODW03HbEEAJXZUj1YSGiHtnvn9wdDJvGEqA0cV73km3VNIZq7OZLGD6JT9qbrFTb
 wyj8Jw3PITwoHqUPQ/orU4Mqo3SIYyVW4rqAm8xjk+sp/QGYCj6c/Zmn2rrWhhajsSnr
 +aCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=m3RECKwntzDqTHrGIrCHwsGgp0L7QbNk7gHMMiY5RtE=;
 b=CGPCGoGAbHcHAE73K+B3vxtX3Dk/a5OOmxOnSCvRBEgmpGnSM/WLWfZb68m8WKDXoP
 ip6cpTq8rYzmocysRecEPcRygzzwcjnOVYDFEjJRDFALa5RiPqx8eSL9C6Ldls78WDyM
 z7SWDcbvjpdn7s1xloD7QsoBITSNueefeSjVIG2E8WElNgfdL4YksB1MXZNHbUGTDhEV
 r9lLEC3lFRd9HMyKSIgp3m82dqiIQYbahYJW8Q2dXlKFS9pN0nRInR65r90TfUXjqK8Q
 m+H4wccdl+fWLEpQ3i+zFpD7S9nYKLhpMu38b91LV5+WvnriSCchwQlyaSXsBBtgsB5B
 cpGg==
X-Gm-Message-State: APjAAAVArabMe3NWcxqUuxAmC0gDT1O97sJwagTH94aPsqSP8m8Jr643
 aNtxnv/H7MYhzRJqPAs4u5jxuw==
X-Google-Smtp-Source: APXvYqwhORU76VvjLUC+yTOz8SGQVtxKNIOYoGaI62yNo4K+SfZx0OZ3R0qCdjMP+K9UczsMt8wvYw==
X-Received: by 2002:a2e:6815:: with SMTP id c21mr555951lja.10.1580330259633;
 Wed, 29 Jan 2020 12:37:39 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:2b4:78de:120:879a:3c09:8a9d])
 by smtp.gmail.com with ESMTPSA id g25sm1532600ljn.107.2020.01.29.12.37.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Jan 2020 12:37:38 -0800 (PST)
Subject: [PATCH RFT 1/2] mtd: hyperbus: move direct mapping setup to AM654
 HBMC driver
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <114b97fe-c800-7ff7-ce6a-b38085f44adc@cogentembedded.com>
Date: Wed, 29 Jan 2020 23:37:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_123741_421672_1076B447 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Hyperbus core expects that HyperFlash is always directly mapped for
both read and write, but in reality this may not always be the case, e.g.
Renesas RPC-IF has read only direct mapping. Move the code setting up the
direct mapping from the Hyperbus core to thh TI AM554 HBMC driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/mtd/hyperbus/hbmc-am654.c    |   12 ++++++++++++
 drivers/mtd/hyperbus/hyperbus-core.c |   11 -----------
 2 files changed, 12 insertions(+), 11 deletions(-)

Index: linux/drivers/mtd/hyperbus/hbmc-am654.c
===================================================================
--- linux.orig/drivers/mtd/hyperbus/hbmc-am654.c
+++ linux/drivers/mtd/hyperbus/hbmc-am654.c
@@ -11,6 +11,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mux/consumer.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
@@ -57,8 +58,10 @@ static const struct hyperbus_ops am654_h
 
 static int am654_hbmc_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct am654_hbmc_priv *priv;
+	struct resource res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -67,6 +70,10 @@ static int am654_hbmc_probe(struct platf
 
 	platform_set_drvdata(pdev, priv);
 
+	ret = of_address_to_resource(np, 0, &res);
+	if (ret)
+		return ret;
+
 	if (of_property_read_bool(dev->of_node, "mux-controls")) {
 		struct mux_control *control = devm_mux_control_get(dev, NULL);
 
@@ -88,6 +95,11 @@ static int am654_hbmc_probe(struct platf
 		goto disable_pm;
 	}
 
+	priv->hbdev.map.size = resource_size(&res);
+	priv->hbdev.map.virt = devm_ioremap_resource(dev, &res);
+	if (IS_ERR(priv->hbdev.map.virt))
+		return PTR_ERR(priv->hbdev.map.virt);
+
 	priv->ctlr.dev = dev;
 	priv->ctlr.ops = &am654_hbmc_ops;
 	priv->hbdev.ctlr = &priv->ctlr;
Index: linux/drivers/mtd/hyperbus/hyperbus-core.c
===================================================================
--- linux.orig/drivers/mtd/hyperbus/hyperbus-core.c
+++ linux/drivers/mtd/hyperbus/hyperbus-core.c
@@ -10,7 +10,6 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/types.h>
 
 static struct hyperbus_device *map_to_hbdev(struct map_info *map)
@@ -62,7 +61,6 @@ int hyperbus_register_device(struct hype
 	struct hyperbus_ctlr *ctlr;
 	struct device_node *np;
 	struct map_info *map;
-	struct resource res;
 	struct device *dev;
 	int ret;
 
@@ -78,17 +76,8 @@ int hyperbus_register_device(struct hype
 
 	hbdev->memtype = HYPERFLASH;
 
-	ret = of_address_to_resource(np, 0, &res);
-	if (ret)
-		return ret;
-
 	dev = ctlr->dev;
 	map = &hbdev->map;
-	map->size = resource_size(&res);
-	map->virt = devm_ioremap_resource(dev, &res);
-	if (IS_ERR(map->virt))
-		return PTR_ERR(map->virt);
-
 	map->name = dev_name(dev);
 	map->bankwidth = 2;
 	map->device_node = np;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
