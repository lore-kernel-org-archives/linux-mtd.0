Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366F0E77173
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 11:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aoeO6DNCD+Oa1QhmlBHJ4skb4PqbKuUoxOqJfy25MsU=; b=ykRdp2Qpp08gEh
	bhuT936BMDTmums9ua4lkd9KVShrbBIddmEPiz5dw9Ns41gurwUbRdFCg1ABmSjeumcuU18BI9G5E
	fRtO7rwjDANB1AI7jT7fIL6Z+lW7Ws1GlemIyZEP+qXNUS/QR1Mlu1gn2cslMjVUxXaInBp37XNAm
	k+Ln3nWsgmmIE2oiIJnlbPxZTQDfvaz5g3Wge6CYZ9quFty6mkfsV1atWpxiAiEB17Bs5L2MQqnGk
	Kl0fkbY2CJLfP9RwNxDOIWWCyjDxLrncQgVFLqGAnrjsSkI4ri8rn/fxE3C9uHE8h5vCbpA5ZPYYp
	RD1gdv4nQ4FRigY1LeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWoN-00000001UdA-3VIi;
	Fri, 06 Dec 2024 11:47:55 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWoK-00000001Ucg-1pYM
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 11:47:53 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7fd1ef74512so1076343a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2024 03:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733485670; x=1734090470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5GXGfJjef9O3MRVsHV9jJu62w0yNDz0tS8u6uRY+38=;
        b=y8bDjUkvn9AKz8TOGgdJKlAOLQ3sf9szS9F5Zsir49io/BTOQqa9TLgvQNzNqnBxqs
         o+AOUo7ngDSxN39NuQwzLSHSmd9zzYDakImilknzih7WKnnM45z/zt3mUKMkEmu6aD+1
         AmN/okT1GDo8REWUnk1QaaceplWUvR/WvDQEzsnyJ4GJvyO21RL6wpvuM6nOy/BNtPpm
         namwNaw6hONO27eIcf6ehJVAQXpZ44+4/S4qsx4A7C/SBcBT2zRa/nY2EMqHpK7OGyK1
         tN69jCjPeNwNf/AZI1yuZm1L2neXMTx5xfS6VHmNJg29dJdB7p0G7LHm2m0VvmGjQMp2
         QZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733485670; x=1734090470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5GXGfJjef9O3MRVsHV9jJu62w0yNDz0tS8u6uRY+38=;
        b=NbOTKg+Qz2xXDySXKJxmUrHrOP2/AkWK5DQFgKdzbTINaEoyQNpikUHcPZ/r9AdOAb
         DHZCpmSS13w4MfwHW8TTDu/MYvhEDOnUpi1APNSP7+iYgmIBeXrMLrT9bGuC/Tu2v0VO
         oDJX14gie/tQXW0XcFiJ9kZcjTCD9cdZxUnapEBniQEja/TZWpbANgHUcicZ4dO+UOXP
         rdxv9aDUpWQxSaprtgm9XJD0bwQwmGFPfb4RrgJ+Q8PGFSgQmGCpJ18j9zXzczFPYUKD
         tyU9BngAqE5OauRUyA1EGpVRKw+OW7VUtYym+oU3tt3nvBfQqNSpp6ZbdaUEf6VRSe1M
         5ISg==
X-Gm-Message-State: AOJu0Yx/RhBPCodxebyFbf0pWh5nGT3m4ua96/Ct1vm3zUzsDK+tsMwi
	0YlsITlnFAk20wi4U27vS09jVjGsZEHR7U3lA4oZgzdL+iYF5+zsyMbWRTEEsgNCL0t4G3ntJhz
	0AjN2iw==
X-Gm-Gg: ASbGncs6dIkt32E+HYO6OQGhuaWurqpMK2/5CBKP7JowhKDfgH9EW6p78duxlrsEOwE
	uS2VcJ4iYv984lW0UIXvNE/5YoK0cHa92BiBVhAtf04/eME+5K70OmsaaSwpqbUwXmfI5oMx4p8
	fwMJThD/iDeavmc9Hlbgw6laEkb5sXdXnCjgPZ6djJIt0BmHVM0wJDQ9+UzLm5Q4KjHYspvifka
	wr5+CX29L+JCBoVL0RlHdkdUdJUDHNi/2jn9c8HXgNhHCPzUz1+MTLfN5LmqJAwtlvIe3xck4bt
	2fqZUI9GPV5cbRet9Qw6wX7W6nmRu8XSosaO
X-Google-Smtp-Source: AGHT+IGCr5r240TDZbG7//8CnuqBr6CfJC1Qwzefia5g2j1M+wyC1Ktm4ed8bxnMWtu7JFGXqujQag==
X-Received: by 2002:a17:90b:1a8e:b0:2ee:bbe0:98c6 with SMTP id 98e67ed59e1d1-2ef6965469cmr3605527a91.8.1733485670337;
        Fri, 06 Dec 2024 03:47:50 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef7a08bd4asm8986a91.27.2024.12.06.03.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:47:49 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] mtd: hyperbus: hbmc-am654: fix an OF node reference leak
Date: Fri,  6 Dec 2024 20:47:40 +0900
Message-Id: <20241206114740.781053-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_034752_649742_7EC03C26 
X-CRM114-Status: GOOD (  10.61  )
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
 drivers/mtd/hyperbus/hbmc-am654.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
index 217f4e69233f..3e206bb34287 100644
--- a/drivers/mtd/hyperbus/hbmc-am654.c
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -174,18 +174,18 @@ static int am654_hbmc_probe(struct platform_device *pdev)
 	priv->hbdev.np = of_get_next_child(np, NULL);
 	ret = of_address_to_resource(priv->hbdev.np, 0, &res);
 	if (ret)
-		return ret;
+		goto put_node;
 
 	if (of_property_read_bool(dev->of_node, "mux-controls")) {
 		struct mux_control *control = devm_mux_control_get(dev, NULL);
 
 		if (IS_ERR(control))
-			return PTR_ERR(control);
+			goto put_node;
 
 		ret = mux_control_select(control, 1);
 		if (ret) {
 			dev_err(dev, "Failed to select HBMC mux\n");
-			return ret;
+			goto put_node;
 		}
 		priv->mux_ctrl = control;
 	}
@@ -193,7 +193,7 @@ static int am654_hbmc_probe(struct platform_device *pdev)
 	priv->hbdev.map.size = resource_size(&res);
 	priv->hbdev.map.virt = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(priv->hbdev.map.virt))
-		return PTR_ERR(priv->hbdev.map.virt);
+		goto disable_mux;
 
 	priv->ctlr.dev = dev;
 	priv->ctlr.ops = &am654_hbmc_ops;
@@ -226,6 +226,8 @@ static int am654_hbmc_probe(struct platform_device *pdev)
 disable_mux:
 	if (priv->mux_ctrl)
 		mux_control_deselect(priv->mux_ctrl);
+put_node:
+	of_node_put(priv->hbdev.np);
 	return ret;
 }
 
@@ -241,6 +243,7 @@ static void am654_hbmc_remove(struct platform_device *pdev)
 
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
