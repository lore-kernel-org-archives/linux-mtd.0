Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BE2E7717B
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 13:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SjTIWR7S3bxqP+rJp07C5Kg3mN2qPK1KSjw/+46bdPo=; b=Pj/UmMz32EEs9b
	5pKSB4vHXCi1s9Nes9V19V+G19l0Wca4qtTZ1U4l7nCJaLpQRhT8DhsFMDxF3/lJuWsB0tCchv7vc
	CeaMvLbL9dmIv+PoG2KkpFwANkpnZBHRLJNL3i9GBX4zqu3cBk8jsIb8yPr8a3oE70+kTGv78UsgL
	OSHuDQ1ie86YY7G2ldvRUpc9DR1LMePubQtqbfh7SG2lxI9GLh2yhtBeF4FTJfmyJS/Ck8GnjBRiK
	HF+GjaVrK4MqAeqgddiVUop1rX8U0mZMBEGDoK6kWVoyKtZUcIq0omcmw0tSdvI+2rqHmklQiefV1
	CG920i34Ftf2MH+D4zkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYXE-00000001jw7-229h;
	Fri, 06 Dec 2024 13:38:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYXA-00000001jvg-4BfX
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 13:38:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7252fba4de1so2331282b3a.0
        for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2024 05:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733492296; x=1734097096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tenRm6uUzjaB/af8Lhu48JVMWtn9Odqd+hHSIJQuGAM=;
        b=KuyK+GlItCOFliwKSwGNjTpzC1VdnpUAVaqrwTwbg0OGSmqAYXWodAvYgs71aMDCzF
         kTQ/0nvz5RROEJfbpcuW1oMg9tW8F/JeOI1DJpU2iNjc7Y/AHUwTeGteWpnXmAbsSt//
         wQds9xR3sFj/JqhwFLcHzrxwNdlEN2phJzUYrQaLhqxUlVCVrSMstsEG7WCdkCAwRQ5j
         nSU832wlI5VlXOHce53A20WzFXN07XrueMFKjpe8G0fs2cqAtMPiseJVwNPZZGQKx5Wk
         yUu3l2uQcaWd3iefzZDKl8ZaQhbh9C/6Zd7ZYa85a2s/Tu/tKMMLkthu1B2g4bfVKaAR
         YkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733492296; x=1734097096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tenRm6uUzjaB/af8Lhu48JVMWtn9Odqd+hHSIJQuGAM=;
        b=T4kw8orjtSX7jZ6TKNOzy8B9bw+6IZEib/V8623eeIMf3dU6b+ZDAqmVMoZbilR5g/
         +DqqriU2Ouv+ofPwXPiKqIoa2SDQec/YuKgdQd8HYRQEGtDygCa8vflCLvdbJLyPUjSV
         O7T7djNVrLsiuJ6oR7NEsll2Bz6Kq8cmQVBCmnV3gLV+UkvxFPR70g0CTnjKsRPsbwwt
         FQDvI4I3LW5d8skigw+uCEOanQfsRpvSNv0harYxNmhdjffWNsK8zy+C1dG5CGXmADuC
         0TNfr68Q7AwwKxs6Ku+1X0c2rsI74zm2rZgoDkzQZk1ODh16/rzqlnPvHkV2oxnKdOdB
         qPyQ==
X-Gm-Message-State: AOJu0YxckEnyDcN4qA6yL8Rb3cvBQlJ2hIRJMkKsorcsUmpel3V1LWyX
	a/SGtzlXrWu5ccVB8WsO0C9gsVPrqqqLWwlQ2KTWbFafvALZSjjbA9BIgyR5vss=
X-Gm-Gg: ASbGnctaslalMaFkuUgHp/YvT8SmFrQ8OQapXYsVUdLcnrv6PLoIEEYSCqEQCHnpBIZ
	T4A/uLuwu/vRAfyTLAyUQ1Z9C/bvhUBPVR/UNiq5JFgLfxEn1C3u1VDt7+N/vxFWMgj7H/JTU7T
	nZy29t59B86FUVZx14DJnHA6SA4hcXYd9V8akB06li7RrGdFOMSiWbIWXpP34PEZ+0CNQxhtnx+
	8MXDob2mIgxnJch5Q++u/X5BI2fhmJhNc5LgKXITzYTuX7bMAr4zwh6JumMAUYFKZqlE7g0hQ==
X-Google-Smtp-Source: AGHT+IGV6oCg4Sr8Xt94txvw3NtAGh57CU+uFcsJV4AMQB/JPa/GooP38if5l7A7uDgPP5yxwCerFA==
X-Received: by 2002:a17:90b:1d02:b0:2ee:8430:b847 with SMTP id 98e67ed59e1d1-2ef6955d4bemr5008815a91.6.1733492295884;
        Fri, 06 Dec 2024 05:38:15 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:75b0:95e4:30f9:a33f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef67d6ea84sm1711381a91.47.2024.12.06.05.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 05:38:15 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2] mtd: hyperbus: hbmc-am654: fix an OF node reference leak
Date: Fri,  6 Dec 2024 22:38:09 +0900
Message-Id: <20241206133809.1074606-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_053817_247997_C3F00D28 
X-CRM114-Status: GOOD (  12.48  )
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

In am654_hbmc_platform_driver, .remove() and the error path of .probe()
do not decrement the refcount of an OF node obtained by
  of_get_next_child(). Fix this by adding of_node_put() calls.

Fixes: aca31ce96814 ("mtd: hyperbus: hbmc-am654: Fix direct mapping setup flash access")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in V2:
- Properly set the return values.
---
 drivers/mtd/hyperbus/hbmc-am654.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
index 217f4e69233f..edad2ab0f2fa 100644
--- a/drivers/mtd/hyperbus/hbmc-am654.c
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -174,26 +174,30 @@ static int am654_hbmc_probe(struct platform_device *pdev)
 	priv->hbdev.np = of_get_next_child(np, NULL);
 	ret = of_address_to_resource(priv->hbdev.np, 0, &res);
 	if (ret)
-		return ret;
+		goto put_node;
 
 	if (of_property_read_bool(dev->of_node, "mux-controls")) {
 		struct mux_control *control = devm_mux_control_get(dev, NULL);
 
-		if (IS_ERR(control))
-			return PTR_ERR(control);
+		if (IS_ERR(control)) {
+			ret = PTR_ERR(control);
+			goto put_node;
+		}
 
 		ret = mux_control_select(control, 1);
 		if (ret) {
 			dev_err(dev, "Failed to select HBMC mux\n");
-			return ret;
+			goto put_node;
 		}
 		priv->mux_ctrl = control;
 	}
 
 	priv->hbdev.map.size = resource_size(&res);
 	priv->hbdev.map.virt = devm_ioremap_resource(dev, &res);
-	if (IS_ERR(priv->hbdev.map.virt))
-		return PTR_ERR(priv->hbdev.map.virt);
+	if (IS_ERR(priv->hbdev.map.virt)) {
+		ret = PTR_ERR(priv->hbdev.map.virt);
+		goto disable_mux;
+	}
 
 	priv->ctlr.dev = dev;
 	priv->ctlr.ops = &am654_hbmc_ops;
@@ -226,6 +230,8 @@ static int am654_hbmc_probe(struct platform_device *pdev)
 disable_mux:
 	if (priv->mux_ctrl)
 		mux_control_deselect(priv->mux_ctrl);
+put_node:
+	of_node_put(priv->hbdev.np);
 	return ret;
 }
 
@@ -241,6 +247,7 @@ static void am654_hbmc_remove(struct platform_device *pdev)
 
 	if (dev_priv->rx_chan)
 		dma_release_channel(dev_priv->rx_chan);
+	of_node_put(priv->hbdev.np);
 }
 
 static const struct of_device_id am654_hbmc_dt_ids[] = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
